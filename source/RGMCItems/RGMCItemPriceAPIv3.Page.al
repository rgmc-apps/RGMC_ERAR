page 50318 "RGMC Item Price API v3"
{
    PageType = API;
    APIPublisher = 'rgmc';
    APIGroup = 'rgmccustom';
    APIVersion = 'v3.0';
    EntityName = 'itemPrice';
    EntitySetName = 'itemPrices';
    Caption = 'RGMC Item Price API v3';

    SourceTable = "RGMC Item Price Buffer";
    SourceTableTemporary = true;
    ODataKeyFields = SystemId;

    DelayedInsert = true;
    InsertAllowed = false;
    ModifyAllowed = false;
    DeleteAllowed = false;

    layout
    {
        area(Content)
        {
            field(id; Rec.SystemId)
            {
                Caption = 'id';
                Editable = false;
            }
            field(priceListCode; Rec."Price List Code")
            {
                Caption = 'priceListCode';
                Editable = false;
            }
            field(productNo; Rec."Product No.")
            {
                Caption = 'productNo';
                Editable = false;
            }
            field(startingDate; Rec."Starting Date")
            {
                Caption = 'startingDate';
                Editable = false;
            }
            field(endingDate; Rec."Ending Date")
            {
                Caption = 'endingDate';
                Editable = false;
            }
            field(unitPrice; Rec."Unit Price")
            {
                Caption = 'unitPrice';
                Editable = false;
            }
            field(unitPriceIncVAT; Rec."Unit Price Inc VAT")
            {
                Caption = 'unitPriceIncVAT';
                Editable = false;
            }
            field(assignToNo; Rec."Assign-to No.")
            {
                Caption = 'assignToNo';
                Editable = false;
            }
            field(currencyCode; Rec."Currency Code")
            {
                Caption = 'currencyCode';
                Editable = false;
            }
            field(unitOfMeasureCode; Rec."Unit of Measure Code")
            {
                Caption = 'unitOfMeasureCode';
                Editable = false;
            }
            field(minimumQuantity; Rec."Minimum Quantity")
            {
                Caption = 'minimumQuantity';
                Editable = false;
            }
            field(onDate; Rec."On Date")
            {
                Caption = 'onDate';
                Editable = false;
            }
            field(familyCode; Rec."Family Code")
            {
                Caption = 'familyCode';
                Editable = false;
            }
            field(itemId; Rec."Item Id")
            {
                Caption = 'itemId';
                Editable = false;
            }
            field(description; Rec."Description")
            {
                Caption = 'description';
                Editable = false;
            }
            field(description2; Rec."Description 2")
            {
                Caption = 'description2';
                Editable = false;
            }
            field(baseUnitOfMeasure; Rec."Base Unit of Measure")
            {
                Caption = 'baseUnitOfMeasure';
                Editable = false;
            }
            field(itemUnitPrice; Rec."Item Unit Price")
            {
                Caption = 'itemUnitPrice';
                Editable = false;
            }
            field(unitCost; Rec."Unit Cost")
            {
                Caption = 'unitCost';
                Editable = false;
            }
            field(itemCategoryCode; Rec."Item Category Code")
            {
                Caption = 'itemCategoryCode';
                Editable = false;
            }
            field(blocked; Rec."Blocked")
            {
                Caption = 'blocked';
                Editable = false;
            }
            field(lastModifiedDateTime; Rec."Item Last Modified At")
            {
                Caption = 'lastModifiedDateTime';
                Editable = false;
            }
        }
    }

    trigger OnOpenPage()
    var
        PriceListLine: Record "Price List Line";
        PrevLine: Record "Price List Line";
        FilterDate: Date;
        EntryNo: Integer;
        HasPrev: Boolean;
        FamilyFilter: Code[20];
        FamilyItem: Record Item;
        FamilyItemFilter: Text;
        ProductNoFilter: Text;
    begin
        // Read onDate from consumer's $filter=onDate eq 2026-07-13; default to WorkDate
        if Rec.GetFilter("On Date") <> '' then
            FilterDate := Rec.GetRangeMin("On Date");
        if FilterDate = 0D then
            FilterDate := WorkDate();

        // If a familyCode filter was sent ($filter=familyCode eq 'CODE'), resolve the
        // matching item numbers upfront so we can push a Product No. filter down to SQL.
        // Without this, BC would scan all price lines and then filter the temp buffer —
        // pre-filtering at the PriceListLine level is dramatically faster.
        if Rec.GetFilter("Family Code") <> '' then
            FamilyFilter := Rec.GetRangeMin("Family Code");
        if FamilyFilter <> '' then begin
            FamilyItem.SetRange("LSC Item Family Code", FamilyFilter);
            if FamilyItem.FindSet() then
                repeat
                    if FamilyItemFilter = '' then
                        FamilyItemFilter := FamilyItem."No."
                    else
                        FamilyItemFilter += '|' + FamilyItem."No.";
                until FamilyItem.Next() = 0;
            if FamilyItemFilter = '' then
                exit; // No items belong to this family — nothing to return
        end;

        // Product No. range filter — supports parallel range fetching from the bc-api.
        // The consumer sends $filter=productNo ge 'A' and productNo lt 'M' (OData range).
        // BC translates this to an AL filter on Rec."Product No." before OnOpenPage runs.
        // We copy it to PriceListLine so the SQL engine uses the ("Product No.", "Starting Date")
        // index for a range scan instead of a full table scan — genuine server-side work reduction.
        // FamilyItemFilter takes priority when both are provided (it is already more specific).
        if FamilyItemFilter = '' then
            ProductNoFilter := Rec.GetFilter("Product No.");

        // Single pass sorted by (Product No., Starting Date) ASC.
        // SQL filter is intentionally minimal — only the Starting Date range — because
        // adding Status or Ending Date WHERE clauses disrupts the (Product No., Starting Date)
        // index and forces a worse query plan that times out on large tables.
        // Status, Ending Date, and IC are all checked in AL after each row is fetched.
        // SetLoadFields limits the SELECT to only the columns used in the loop and in
        // InsertPriceLine. Price List Line in LS Central is very wide (many extension
        // fields); without this, BC fetches all columns for every row — on a large
        // table this is enough data transfer to hit the 30-second cloud query timeout.
        PriceListLine.SetLoadFields(
            "Product No.", "Price List Code", "Starting Date", "Ending Date",
            "Unit Price", "LSC Unit Price Including VAT", "Assign-to No.",
            "Currency Code", "Unit of Measure Code", "Minimum Quantity"
        );
        PriceListLine.SetCurrentKey("Product No.", "Starting Date");
        PriceListLine.SetFilter("Starting Date", '<=%1', FilterDate);
        if FamilyItemFilter <> '' then
            PriceListLine.SetFilter("Product No.", FamilyItemFilter)
        else if ProductNoFilter <> '' then
            PriceListLine.SetFilter("Product No.", ProductNoFilter);

        HasPrev := false;
        if PriceListLine.FindSet() then
            repeat
                if StrPos(PriceListLine."Price List Code", 'IC') = 0 then begin
                    if HasPrev and (PrevLine."Product No." <> PriceListLine."Product No.") then begin
                        EntryNo += 1;
                        InsertPriceLine(PrevLine, EntryNo, FilterDate);
                    end;
                    PrevLine := PriceListLine;
                    HasPrev := true;
                end;
            until PriceListLine.Next() = 0;

        // Flush the last product
        if HasPrev then begin
            EntryNo += 1;
            InsertPriceLine(PrevLine, EntryNo, FilterDate);
        end;
    end;

    local procedure InsertPriceLine(SourceLine: Record "Price List Line"; EntryNo: Integer; FilterDate: Date)
    var
        Item: Record Item;
    begin
        Rec.Init();
        Rec."Entry No." := EntryNo;
        Rec."Price List Code" := SourceLine."Price List Code";
        Rec."Product No." := SourceLine."Product No.";
        Rec."Starting Date" := SourceLine."Starting Date";
        Rec."Ending Date" := SourceLine."Ending Date";
        Rec."Unit Price" := SourceLine."Unit Price";
        Rec."Unit Price Inc VAT" := SourceLine."LSC Unit Price Including VAT";
        Rec."Assign-to No." := SourceLine."Assign-to No.";
        Rec."Currency Code" := SourceLine."Currency Code";
        Rec."Unit of Measure Code" := SourceLine."Unit of Measure Code";
        Rec."Minimum Quantity" := SourceLine."Minimum Quantity";
        Rec."On Date" := FilterDate;
        // SetLoadFields limits the SELECT to only the columns we need, which matters
        // for the Item table in LS Central where extensions add many extra fields.
        Item.SetLoadFields(
            "LSC Item Family Code", SystemId, Description, "Description 2",
            "Base Unit of Measure", "Unit Price", "Unit Cost",
            "Item Category Code", Blocked, SystemModifiedAt
        );
        if Item.Get(SourceLine."Product No.") then begin
            Rec."Family Code" := Item."LSC Item Family Code";
            Rec."Item Id" := Item.SystemId;
            Rec."Description" := Item.Description;
            Rec."Description 2" := Item."Description 2";
            Rec."Base Unit of Measure" := Item."Base Unit of Measure";
            Rec."Item Unit Price" := Item."Unit Price";
            Rec."Unit Cost" := Item."Unit Cost";
            Rec."Item Category Code" := Item."Item Category Code";
            Rec."Blocked" := Item.Blocked;
            Rec."Item Last Modified At" := Item.SystemModifiedAt;
        end;
        Rec.Insert(false);
    end;

}
