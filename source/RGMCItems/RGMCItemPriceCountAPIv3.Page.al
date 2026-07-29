page 50319 "RGMC Item Price Count API v3"
{
    PageType = API;
    APIPublisher = 'rgmc';
    APIGroup = 'rgmccustom';
    APIVersion = 'v3.0';
    EntityName = 'itemPriceCount';
    EntitySetName = 'itemPriceCounts';
    Caption = 'RGMC Item Price Count API v3';

    SourceTable = "RGMC Item Price Count Buffer";
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
            field(totalCount; Rec."Total Count")
            {
                Caption = 'totalCount';
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
            field(productNo; Rec."Product No.")
            {
                Caption = 'productNo';
                Editable = false;
            }
        }
    }

    trigger OnOpenPage()
    var
        PriceListLine: Record "Price List Line";
        PrevLine: Record "Price List Line";
        PriceListHeader: Record "Price List Header";
        FilterDate: Date;
        HasPrev: Boolean;
        FamilyFilter: Code[20];
        FamilyItemFilter: Text;
        PriceListCodeFilter: Text;
        ProductNoFilter: Text;
        Item: Record Item;
        TempItem: Record Item temporary;
        TotalCount: Integer;
    begin
        if Rec.GetFilter("On Date") <> '' then
            FilterDate := Rec.GetRangeMin("On Date");
        if FilterDate = 0D then
            FilterDate := WorkDate();

        if Rec.GetFilter("Family Code") <> '' then
            FamilyFilter := Rec.GetRangeMin("Family Code");

        if FamilyFilter <> '' then begin
            Item.SetLoadFields("No.", "LSC Item Family Code");
            Item.SetRange("LSC Item Family Code", FamilyFilter);
            if not Item.FindSet() then
                exit;
            repeat
                TempItem := Item;
                TempItem.Insert();
            until Item.Next() = 0;

            // Fast path: filter by price list code from tagged headers.
            PriceListHeader.SetLoadFields(Code);
            PriceListHeader.SetRange("Item Family Code", FamilyFilter);
            if PriceListHeader.FindSet() then
                repeat
                    if PriceListCodeFilter = '' then
                        PriceListCodeFilter := PriceListHeader.Code
                    else
                        PriceListCodeFilter += '|' + PriceListHeader.Code;
                until PriceListHeader.Next() = 0;

            // Fallback: no headers tagged — build product-number pipe-string from TempItem.
            if PriceListCodeFilter = '' then
                if TempItem.FindSet() then
                    repeat
                        if FamilyItemFilter = '' then
                            FamilyItemFilter := TempItem."No."
                        else
                            FamilyItemFilter += '|' + TempItem."No.";
                    until TempItem.Next() = 0;
        end else
            ProductNoFilter := Rec.GetFilter("Product No.");

        PriceListLine.SetLoadFields("Product No.", "Price List Code", "Starting Date", "Ending Date");
        PriceListLine.SetCurrentKey("Product No.", "Starting Date");
        PriceListLine.SetFilter("Starting Date", '<=%1', FilterDate);
        if PriceListCodeFilter <> '' then
            PriceListLine.SetFilter("Price List Code", PriceListCodeFilter)
        else if FamilyItemFilter <> '' then
            PriceListLine.SetFilter("Product No.", FamilyItemFilter)
        else if ProductNoFilter <> '' then
            PriceListLine.SetFilter("Product No.", ProductNoFilter);

        HasPrev := false;
        TotalCount := 0;
        if PriceListLine.FindSet() then
            repeat
                if (StrPos(PriceListLine."Price List Code", 'IC') = 0) and
                   ((PriceListLine."Ending Date" = 0D) or (PriceListLine."Ending Date" >= FilterDate)) and
                   ((PriceListCodeFilter = '') or TempItem.Get(PriceListLine."Product No."))
                then begin
                    if HasPrev and (PrevLine."Product No." <> PriceListLine."Product No.") then
                        TotalCount += 1;
                    PrevLine := PriceListLine;
                    HasPrev := true;
                end;
            until PriceListLine.Next() = 0;
        if HasPrev then
            TotalCount += 1;

        Rec.Init();
        Rec."Entry No." := 1;
        Rec."Total Count" := TotalCount;
        Rec."On Date" := FilterDate;
        Rec."Family Code" := FamilyFilter;
        Rec.Insert(false);
    end;

}
