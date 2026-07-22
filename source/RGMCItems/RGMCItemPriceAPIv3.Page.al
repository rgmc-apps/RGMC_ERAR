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
            field(limit; Rec."Limit")
            {
                Caption = 'limit';
                Editable = false;
            }
            field(offset; Rec."Offset")
            {
                Caption = 'offset';
                Editable = false;
            }
        }
    }

    trigger OnOpenPage()
    var
        PriceListLine: Record "Price List Line";
        PrevLine: Record "Price List Line";
        FilterDate: Date;
        HasPrev: Boolean;
        FamilyFilter: Code[20];
        FamilyItemFilter: Text;
        ProductNoFilter: Text;
        Item: Record Item;
        TempItem: Record Item temporary;
        RequestedLimit: Integer;
        EffectiveLimit: Integer;
        EffectiveOffset: Integer;
        Position: Integer;
        InsertCount: Integer;
    begin
        // Read onDate from consumer's $filter=onDate eq 2026-07-13; default to WorkDate
        if Rec.GetFilter("On Date") <> '' then
            FilterDate := Rec.GetRangeMin("On Date");
        if FilterDate = 0D then
            FilterDate := WorkDate();

        if Rec.GetFilter("Family Code") <> '' then
            FamilyFilter := Rec.GetRangeMin("Family Code");

        // Read limit/offset — RequestedLimit=0 means "no limit" and is echoed back as-is
        RequestedLimit := 0;
        if Rec.GetFilter("Limit") <> '' then
            RequestedLimit := Rec.GetRangeMin("Limit");
        EffectiveLimit := RequestedLimit;
        if EffectiveLimit <= 0 then
            EffectiveLimit := 2147483647;

        EffectiveOffset := 0;
        if Rec.GetFilter("Offset") <> '' then
            EffectiveOffset := Rec.GetRangeMin("Offset");

        // Single Item query that both populates TempItem and (when family-filtered)
        // derives the product-no pipe string used to narrow PriceListLine at SQL level.
        //
        // Previously the family path issued two separate Item reads: one with
        // SetRange("LSC Item Family Code") to collect item nos, then a second with
        // SetFilter("No.", <pipe-string>) to load TempItem. Now one query does both —
        // SQL sees a simple equality predicate on "LSC Item Family Code" which it can
        // satisfy with an index seek, rather than the large IN-list that the old
        // pipe-string approach produced.
        //
        // SetLoadFields keeps the SELECT narrow — Item in LS Central carries many
        // extension columns; fetching all of them multiplies data transfer unnecessarily.
        Item.SetLoadFields(
            "No.", "LSC Item Family Code", SystemId, Description, "Description 2",
            "Base Unit of Measure", "Unit Price", "Unit Cost",
            "Item Category Code", Blocked, SystemModifiedAt
        );
        if FamilyFilter <> '' then begin
            Item.SetRange("LSC Item Family Code", FamilyFilter);
            if not Item.FindSet() then
                exit; // No items in this family — nothing to return
            repeat
                TempItem := Item;
                TempItem.Insert();
                if FamilyItemFilter = '' then
                    FamilyItemFilter := Item."No."
                else
                    FamilyItemFilter += '|' + Item."No.";
            until Item.Next() = 0;
        end else begin
            // Product No. range filter — supports parallel range fetching from the bc-api.
            // The consumer sends $filter=productNo ge 'A' and productNo lt 'M' (OData range).
            // BC translates this to an AL filter on Rec."Product No." before OnOpenPage runs.
            // We forward it to both Item and PriceListLine so SQL does a range scan on the
            // ("Product No.", "Starting Date") index instead of a full table scan.
            ProductNoFilter := Rec.GetFilter("Product No.");
            if ProductNoFilter <> '' then
                Item.SetFilter("No.", ProductNoFilter);
            if not Item.FindSet() then
                exit; // No items match — skip the entire PriceListLine scan
            repeat
                TempItem := Item;
                TempItem.Insert();
            until Item.Next() = 0;
        end;

        // Single pass sorted by (Product No., Starting Date) ASC.
        // SQL filter is intentionally minimal — only the Starting Date range — because
        // adding Status or Ending Date WHERE clauses disrupts the ("Product No.", "Starting Date")
        // index and forces a worse query plan that times out on large tables.
        // IC and Ending Date are checked in AL after each row is fetched (free — both
        // fields are already included in SetLoadFields below).
        // SetLoadFields limits the SELECT to only the columns we use — Price List Line in
        // LS Central is very wide; without this, BC fetches all columns for every row,
        // enough data transfer to hit the 30-second cloud query timeout on large tables.
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

        // Position counts every product that would be returned (before offset/limit).
        // InsertCount counts records actually inserted into Rec.
        // The loop exits early once InsertCount reaches EffectiveLimit — avoids scanning
        // the remainder of PriceListLine when the requested page is already complete.
        HasPrev := false;
        Position := 0;
        InsertCount := 0;
        if PriceListLine.FindSet() then
            repeat
                // Skip IC inter-company lines and expired lines (Ending Date already loaded — no extra cost).
                if (StrPos(PriceListLine."Price List Code", 'IC') = 0) and
                   ((PriceListLine."Ending Date" = 0D) or (PriceListLine."Ending Date" >= FilterDate))
                then begin
                    if HasPrev and (PrevLine."Product No." <> PriceListLine."Product No.") then begin
                        Position += 1;
                        if Position > EffectiveOffset then begin
                            InsertCount += 1;
                            InsertPriceLine(PrevLine, InsertCount, FilterDate, TempItem, RequestedLimit, EffectiveOffset);
                        end;
                    end;
                    PrevLine := PriceListLine;
                    HasPrev := true;
                end;
            until (PriceListLine.Next() = 0) or (InsertCount >= EffectiveLimit);

        // Flush the last product (skipped when the limit was already reached in the loop)
        if HasPrev and (InsertCount < EffectiveLimit) then begin
            Position += 1;
            if Position > EffectiveOffset then begin
                InsertCount += 1;
                InsertPriceLine(PrevLine, InsertCount, FilterDate, TempItem, RequestedLimit, EffectiveOffset);
            end;
        end;
    end;

    local procedure InsertPriceLine(SourceLine: Record "Price List Line"; EntryNo: Integer; FilterDate: Date; var TempItem: Record Item; EchoLimit: Integer; EchoOffset: Integer)
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
        if TempItem.Get(SourceLine."Product No.") then begin
            Rec."Family Code" := TempItem."LSC Item Family Code";
            Rec."Item Id" := TempItem.SystemId;
            Rec."Description" := TempItem.Description;
            Rec."Description 2" := TempItem."Description 2";
            Rec."Base Unit of Measure" := TempItem."Base Unit of Measure";
            Rec."Item Unit Price" := TempItem."Unit Price";
            Rec."Unit Cost" := TempItem."Unit Cost";
            Rec."Item Category Code" := TempItem."Item Category Code";
            Rec."Blocked" := TempItem.Blocked;
            Rec."Item Last Modified At" := TempItem.SystemModifiedAt;
        end;
        Rec."Limit" := EchoLimit;
        Rec."Offset" := EchoOffset;
        Rec.Insert(false);
    end;

}
