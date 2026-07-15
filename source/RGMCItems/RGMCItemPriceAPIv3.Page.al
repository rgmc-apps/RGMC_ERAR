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

        // Single pass sorted by (Product No., Starting Date) ASC:
        // Within each product group, records arrive oldest-first so the last record
        // seen before the product changes is always the highest Starting Date <= onDate.
        PriceListLine.SetCurrentKey("Product No.", "Starting Date");
        PriceListLine.SetFilter("Price List Code", '<>*IC*');
        PriceListLine.SetFilter("Starting Date", '<=%1', FilterDate);
        if FamilyItemFilter <> '' then
            PriceListLine.SetFilter("Product No.", FamilyItemFilter);

        HasPrev := false;
        if PriceListLine.FindSet() then
            repeat
                if HasPrev and (PrevLine."Product No." <> PriceListLine."Product No.") then begin
                    EntryNo += 1;
                    InsertPriceLine(PrevLine, EntryNo, FilterDate);
                end;
                PrevLine := PriceListLine;
                HasPrev := true;
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
        if Item.Get(SourceLine."Product No.") then
            Rec."Family Code" := Item."LSC Item Family Code";
        Rec.Insert(false);
    end;
}
