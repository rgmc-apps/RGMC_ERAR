page 50341 "RGMC Sales Price API v2"
{
    PageType = API;
    APIPublisher = 'rgmc';
    APIGroup = 'rgmccustom';
    APIVersion = 'v2.0';
    EntityName = 'salesPrice';
    EntitySetName = 'salesPrices';
    Caption = 'RGMC Sales Price API v2';

    SourceTable = "Price List Line";
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
            // ── Identity ─────────────────────────────────────────────────────────
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
            field(lineNo; Rec."Line No.")
            {
                Caption = 'lineNo';
                Editable = false;
            }

            // ── Price type & assignment ──────────────────────────────────────────
            field(status; Rec.Status)
            {
                Caption = 'status';
                Editable = false;
            }
            field(priceType; Rec."Price Type")
            {
                Caption = 'priceType';
                Editable = false;
            }
            field(assignToNo; Rec."Assign-to No.")
            {
                Caption = 'assignToNo';
                Editable = false;
            }

            // ── Asset ────────────────────────────────────────────────────────────
            field(assetType; Rec."Asset Type")
            {
                Caption = 'assetType';
                Editable = false;
            }
            field(assetNo; Rec."Asset No.")
            {
                Caption = 'assetNo';
                Editable = false;
            }
            field(variantCode; Rec."Variant Code")
            {
                Caption = 'variantCode';
                Editable = false;
            }
            field(unitOfMeasureCode; Rec."Unit of Measure Code")
            {
                Caption = 'unitOfMeasureCode';
                Editable = false;
            }

            // ── Dates ────────────────────────────────────────────────────────────
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

            // ── Pricing ──────────────────────────────────────────────────────────
            field(currencyCode; Rec."Currency Code")
            {
                Caption = 'currencyCode';
                Editable = false;
            }
            field(minimumQuantity; Rec."Minimum Quantity")
            {
                Caption = 'minimumQuantity';
                Editable = false;
            }
            field(amountType; Rec."Amount Type")
            {
                Caption = 'amountType';
                Editable = false;
            }
            field(unitPrice; Rec."Unit Price")
            {
                Caption = 'unitPrice';
                Editable = false;
            }
            field(unitPriceIncVat; Rec."LSC Unit Price Including VAT")
            {
                Caption = 'unitPriceIncVat';
                Editable = false;
            }
            field(lineDiscountPercent; Rec."Line Discount %")
            {
                Caption = 'lineDiscountPercent';
                Editable = false;
            }
            field(allowLineDisc; Rec."Allow Line Disc.")
            {
                Caption = 'allowLineDisc';
                Editable = false;
            }
            field(allowInvoiceDisc; Rec."Allow Invoice Disc.")
            {
                Caption = 'allowInvoiceDisc';
                Editable = false;
            }
            field(description; Rec.Description)
            {
                Caption = 'description';
                Editable = false;
            }

            // ── Date filter parameters (GET only) ────────────────────────────────
            field(modifiedFrom; Rec."RGMC Modified From")
            {
                Caption = 'modifiedFrom';
            }
            field(modifiedTo; Rec."RGMC Modified To")
            {
                Caption = 'modifiedTo';
            }
            field(modifiedAsOfDate; Rec."RGMC Modified As Of Date")
            {
                Caption = 'modifiedAsOfDate';
            }
            field(modifiedMonth; Rec."RGMC Modified Month")
            {
                Caption = 'modifiedMonth';
            }
            field(modifiedYear; Rec."RGMC Modified Year")
            {
                Caption = 'modifiedYear';
            }

            // ── Pagination parameters (GET only) ─────────────────────────────────
            // When limit > 0, the page loads only from the current execution company
            // (CompanyName()) rather than all companies, enabling per-company paging.
            // limit = 0 (default) keeps the legacy behaviour: all companies are loaded.
            field(limit; Rec."RGMC Limit")
            {
                Caption = 'limit';
            }
            field(offset; Rec."RGMC Offset")
            {
                Caption = 'offset';
            }

            // ── Metadata ─────────────────────────────────────────────────────────
            field(companyName; Rec."RGMC Company")
            {
                Caption = 'companyName';
                Editable = false;
            }
            field(lastModifiedDateTime; Rec.SystemModifiedAt)
            {
                Caption = 'lastModifiedDateTime';
                Editable = false;
            }
        }
    }

    trigger OnOpenPage()
    var
        ModifiedFrom: Date;
        ModifiedTo: Date;
        ModifiedAsOfDate: Date;
        ModifiedMonth: Integer;
        ModifiedYear: Integer;
        RequestedLimit: Integer;
        RequestedOffset: Integer;
        FilterText: Text;
    begin
        FilterText := Rec.GetFilter("RGMC Modified From");
        if FilterText <> '' then
            Evaluate(ModifiedFrom, FilterText);
        Rec.SetRange("RGMC Modified From");

        FilterText := Rec.GetFilter("RGMC Modified To");
        if FilterText <> '' then
            Evaluate(ModifiedTo, FilterText);
        Rec.SetRange("RGMC Modified To");

        FilterText := Rec.GetFilter("RGMC Modified As Of Date");
        if FilterText <> '' then
            Evaluate(ModifiedAsOfDate, FilterText);
        Rec.SetRange("RGMC Modified As Of Date");

        FilterText := Rec.GetFilter("RGMC Modified Month");
        if FilterText <> '' then
            Evaluate(ModifiedMonth, FilterText);
        Rec.SetRange("RGMC Modified Month");

        FilterText := Rec.GetFilter("RGMC Modified Year");
        if FilterText <> '' then
            Evaluate(ModifiedYear, FilterText);
        Rec.SetRange("RGMC Modified Year");

        RequestedLimit := 0;
        if Rec.GetFilter("RGMC Limit") <> '' then
            RequestedLimit := Rec.GetRangeMin("RGMC Limit");
        Rec.SetRange("RGMC Limit");

        RequestedOffset := 0;
        if Rec.GetFilter("RGMC Offset") <> '' then
            RequestedOffset := Rec.GetRangeMin("RGMC Offset");
        Rec.SetRange("RGMC Offset");

        LoadAllCompanies(ModifiedFrom, ModifiedTo, ModifiedAsOfDate, ModifiedMonth, ModifiedYear, RequestedLimit, RequestedOffset);
    end;

    local procedure LoadAllCompanies(ModifiedFrom: Date; ModifiedTo: Date; ModifiedAsOfDate: Date; ModifiedMonth: Integer; ModifiedYear: Integer; RequestedLimit: Integer; RequestedOffset: Integer)
    var
        Company: Record Company;
        FilterStart: DateTime;
        FilterEnd: DateTime;
        CalcStart: Date;
        CalcEnd: Date;
    begin
        if ModifiedFrom <> 0D then
            FilterStart := CreateDateTime(ModifiedFrom, 000000T);

        if ModifiedTo <> 0D then
            FilterEnd := CreateDateTime(ModifiedTo, 235959T);

        if ModifiedAsOfDate <> 0D then
            if (FilterEnd = 0DT) or (CreateDateTime(ModifiedAsOfDate, 235959T) < FilterEnd) then
                FilterEnd := CreateDateTime(ModifiedAsOfDate, 235959T);

        if ModifiedYear <> 0 then begin
            if ModifiedMonth <> 0 then begin
                CalcStart := DMY2Date(1, ModifiedMonth, ModifiedYear);
                CalcEnd := CalcDate('<CM>', CalcStart);
            end else begin
                CalcStart := DMY2Date(1, 1, ModifiedYear);
                CalcEnd := DMY2Date(31, 12, ModifiedYear);
            end;
            if (FilterStart = 0DT) or (CreateDateTime(CalcStart, 000000T) > FilterStart) then
                FilterStart := CreateDateTime(CalcStart, 000000T);
            if (FilterEnd = 0DT) or (CreateDateTime(CalcEnd, 235959T) < FilterEnd) then
                FilterEnd := CreateDateTime(CalcEnd, 235959T);
        end else if ModifiedMonth <> 0 then begin
            CalcStart := DMY2Date(1, ModifiedMonth, Date2DMY(Today(), 3));
            CalcEnd := CalcDate('<CM>', CalcStart);
            if (FilterStart = 0DT) or (CreateDateTime(CalcStart, 000000T) > FilterStart) then
                FilterStart := CreateDateTime(CalcStart, 000000T);
            if (FilterEnd = 0DT) or (CreateDateTime(CalcEnd, 235959T) < FilterEnd) then
                FilterEnd := CreateDateTime(CalcEnd, 235959T);
        end;

        // Paged mode: limit > 0 means the caller handles per-company pagination.
        // Only load from the current execution company to avoid duplicating data
        // when the worker pool iterates companies and calls per company_id.
        if RequestedLimit > 0 then
            LoadCompanyData(CompanyName(), FilterStart, FilterEnd, RequestedLimit, RequestedOffset)
        else begin
            // Legacy mode: load from all companies in one shot (used by the Python
            // "ALL company" path which calls once with company_name=<any> and merges).
            if Company.FindSet() then
                repeat
                    LoadCompanyData(Company.Name, FilterStart, FilterEnd, 0, 0);
                until Company.Next() = 0;
        end;

        if Rec.FindFirst() then;
    end;

    local procedure LoadCompanyData(pCompany: Text[30]; FilterStart: DateTime; FilterEnd: DateTime; pLimit: Integer; pOffset: Integer)
    var
        PLLSource: Record "Price List Line";
        EffectiveLimit: Integer;
        Position: Integer;
        InsertCount: Integer;
    begin
        EffectiveLimit := pLimit;
        if EffectiveLimit <= 0 then
            EffectiveLimit := 2147483647;

        PLLSource.ChangeCompany(pCompany);
        PLLSource.SetLoadFields(
            SystemId, "Price List Code", "Line No.", Status, "Price Type",
            "Assign-to No.", "Asset Type", "Asset No.",
            "Variant Code", "Unit of Measure Code",
            "Starting Date", "Ending Date", "Currency Code", "Minimum Quantity",
            "Amount Type", "Unit Price", "LSC Unit Price Including VAT",
            "Line Discount %", "Allow Line Disc.", "Allow Invoice Disc.",
            Description, SystemModifiedAt
        );
        PLLSource.SetRange("Price Type", "Price Type"::Sale);
        if (FilterStart <> 0DT) and (FilterEnd <> 0DT) then
            PLLSource.SetRange(SystemModifiedAt, FilterStart, FilterEnd)
        else if FilterStart <> 0DT then
            PLLSource.SetFilter(SystemModifiedAt, '>=%1', FilterStart)
        else if FilterEnd <> 0DT then
            PLLSource.SetFilter(SystemModifiedAt, '<=%1', FilterEnd);

        Position := 0;
        InsertCount := 0;
        if PLLSource.FindSet() then
            repeat
                Position += 1;
                if Position > pOffset then begin
                    Rec.Init();
                    Rec.TransferFields(PLLSource);
                    Rec."RGMC Company" := CopyStr(pCompany, 1, 30);
                    Rec."RGMC Limit" := pLimit;
                    Rec."RGMC Offset" := pOffset;
                    Rec.SystemId := CreateGuid();
                    if Rec.Insert() then;
                    InsertCount += 1;
                end;
            until (PLLSource.Next() = 0) or (InsertCount >= EffectiveLimit);
    end;
}
