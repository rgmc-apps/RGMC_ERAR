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
        FilterDate: Date;
        HasPrev: Boolean;
        FamilyFilter: Code[20];
        FamilyItemFilter: Text;
        ProductNoFilter: Text;
        Item: Record Item;
        TotalCount: Integer;
    begin
        if Rec.GetFilter("On Date") <> '' then
            FilterDate := Rec.GetRangeMin("On Date");
        if FilterDate = 0D then
            FilterDate := WorkDate();

        if Rec.GetFilter("Family Code") <> '' then
            FamilyFilter := Rec.GetRangeMin("Family Code");

        // Build product filter: family path builds a pipe-string for PriceListLine;
        // productNo path forwards the OData filter expression directly.
        if FamilyFilter <> '' then begin
            Item.SetLoadFields("No.", "LSC Item Family Code");
            Item.SetRange("LSC Item Family Code", FamilyFilter);
            if not Item.FindSet() then
                exit;
            repeat
                if FamilyItemFilter = '' then
                    FamilyItemFilter := Item."No."
                else
                    FamilyItemFilter += '|' + Item."No.";
            until Item.Next() = 0;
        end else
            ProductNoFilter := Rec.GetFilter("Product No.");

        PriceListLine.SetLoadFields("Product No.", "Price List Code", "Starting Date", "Ending Date");
        PriceListLine.SetCurrentKey("Product No.", "Starting Date");
        PriceListLine.SetFilter("Starting Date", '<=%1', FilterDate);
        if FamilyItemFilter <> '' then
            PriceListLine.SetFilter("Product No.", FamilyItemFilter)
        else if ProductNoFilter <> '' then
            PriceListLine.SetFilter("Product No.", ProductNoFilter);

        // Same single sorted-pass logic as itemPrices — count distinct products
        // with an effective non-IC, non-expired price on or before FilterDate.
        HasPrev := false;
        TotalCount := 0;
        if PriceListLine.FindSet() then
            repeat
                if (StrPos(PriceListLine."Price List Code", 'IC') = 0) and
                   ((PriceListLine."Ending Date" = 0D) or (PriceListLine."Ending Date" >= FilterDate))
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
