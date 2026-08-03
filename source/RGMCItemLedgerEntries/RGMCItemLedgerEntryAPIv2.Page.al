page 50339 "RGMC Item Ledger Entry API v2"
{
    PageType = API;
    APIPublisher = 'rgmc';
    APIGroup = 'rgmccustom';
    APIVersion = 'v2.0';
    EntityName = 'itemLedgerEntry';
    EntitySetName = 'itemLedgerEntries';
    Caption = 'RGMC Item Ledger Entry API v2';

    SourceTable = "Item Ledger Entry";
    SourceTableTemporary = true;
    ODataKeyFields = SystemId;

    DelayedInsert = true;
    InsertAllowed = true;
    ModifyAllowed = true;
    DeleteAllowed = true;

    layout
    {
        area(Content)
        {
            // ── Identity & posting ───────────────────────────────────────────────
            field(id; Rec.SystemId)
            {
                Caption = 'id';
                Editable = false;
            }
            field(entryNo; Rec."Entry No.")
            {
                Caption = 'entryNo';
                Editable = false;
            }
            field(itemNo; Rec."Item No.")
            {
                Caption = 'itemNo';
            }
            field(postingDate; Rec."Posting Date")
            {
                Caption = 'postingDate';
            }
            field(documentDate; Rec."Document Date")
            {
                Caption = 'documentDate';
            }
            field(entryType; Rec."Entry Type")
            {
                Caption = 'entryType';
            }
            field(sourceType; Rec."Source Type")
            {
                Caption = 'sourceType';
            }
            field(sourceNo; Rec."Source No.")
            {
                Caption = 'sourceNo';
            }
            field(documentNo; Rec."Document No.")
            {
                Caption = 'documentNo';
            }
            field(documentType; Rec."Document Type")
            {
                Caption = 'documentType';
            }
            field(documentLineNo; Rec."Document Line No.")
            {
                Caption = 'documentLineNo';
                Editable = false;
            }
            field(externalDocumentNo; Rec."External Document No.")
            {
                Caption = 'externalDocumentNo';
            }
            field(noSeries; Rec."No. Series")
            {
                Caption = 'noSeries';
                Editable = false;
            }
            field(description; Rec.Description)
            {
                Caption = 'description';
            }

            // ── Item & location ──────────────────────────────────────────────────
            field(locationCode; Rec."Location Code")
            {
                Caption = 'locationCode';
            }
            field(variantCode; Rec."Variant Code")
            {
                Caption = 'variantCode';
            }
            field(itemCategoryCode; Rec."Item Category Code")
            {
                Caption = 'itemCategoryCode';
            }
            field(nonstock; Rec.Nonstock)
            {
                Caption = 'nonstock';
            }
            field(purchasingCode; Rec."Purchasing Code")
            {
                Caption = 'purchasingCode';
            }

            // ── Tracking (serial / lot / batch / expiry) ─────────────────────────
            field(serialNo; Rec."Serial No.")
            {
                Caption = 'serialNo';
            }
            field(lotNo; Rec."Lot No.")
            {
                Caption = 'lotNo';
            }
            field(batchNo; Rec."Batch No.")
            {
                Caption = 'batchNo';
            }
            field(expirationDate; Rec."Expiration Date")
            {
                Caption = 'expirationDate';
            }
            field(itemTracking; Rec."Item Tracking")
            {
                Caption = 'itemTracking';
            }
            field(warrantyDate; Rec."Warranty Date")
            {
                Caption = 'warrantyDate';
            }

            // ── Quantities ───────────────────────────────────────────────────────
            field(quantity; Rec.Quantity)
            {
                Caption = 'quantity';
            }
            field(invoicedQuantity; Rec."Invoiced Quantity")
            {
                Caption = 'invoicedQuantity';
            }
            field(remainingQuantity; Rec."Remaining Quantity")
            {
                Caption = 'remainingQuantity';
            }
            field(shippedQtyNotReturned; Rec."Shipped Qty. Not Returned")
            {
                Caption = 'shippedQtyNotReturned';
            }
            field(unitOfMeasureCode; Rec."Unit of Measure Code")
            {
                Caption = 'unitOfMeasureCode';
            }
            field(qtyPerUnitOfMeasure; Rec."Qty. per Unit of Measure")
            {
                Caption = 'qtyPerUnitOfMeasure';
                Editable = false;
            }

            // ── Status flags ─────────────────────────────────────────────────────
            field(open; Rec.Open)
            {
                Caption = 'open';
            }
            field(positive; Rec.Positive)
            {
                Caption = 'positive';
                Editable = false;
            }
            field(correction; Rec.Correction)
            {
                Caption = 'correction';
            }
            field(completelyInvoiced; Rec."Completely Invoiced")
            {
                Caption = 'completelyInvoiced';
            }
            field(dropShipment; Rec."Drop Shipment")
            {
                Caption = 'dropShipment';
            }
            field(assembleToOrder; Rec."Assemble to Order")
            {
                Caption = 'assembleToOrder';
            }
            field(lastInvoiceDate; Rec."Last Invoice Date")
            {
                Caption = 'lastInvoiceDate';
            }

            // ── Order / application ──────────────────────────────────────────────
            field(orderType; Rec."Order Type")
            {
                Caption = 'orderType';
            }
            field(orderNo; Rec."Order No.")
            {
                Caption = 'orderNo';
            }
            field(orderLineNo; Rec."Order Line No.")
            {
                Caption = 'orderLineNo';
            }
            field(returnReasonCode; Rec."Return Reason Code")
            {
                Caption = 'returnReasonCode';
            }
            field(appliedEntryToAdjust; Rec."Applied Entry to Adjust")
            {
                Caption = 'appliedEntryToAdjust';
            }
            field(appliesToEntry; Rec."Applies-to Entry")
            {
                Caption = 'appliesToEntry';
            }
            field(transferType; Rec."Transfer Type")
            {
                Caption = 'transferType';
            }
            field(originallyOrderedNo; Rec."Originally Ordered No.")
            {
                Caption = 'originallyOrderedNo';
            }
            field(originallyOrderedVariantCode; Rec."Originally Ordered Variant Code")
            {
                Caption = 'originallyOrderedVariantCode';
            }
            field(derivedFromBlanketOrder; Rec."Derived From Blanket Order")
            {
                Caption = 'derivedFromBlanketOrder';
            }
            field(prodOrderCompLineNo; Rec."Prod. Order Comp. Line No.")
            {
                Caption = 'prodOrderCompLineNo';
            }

            // ── Jobs ─────────────────────────────────────────────────────────────
            field(jobNo; Rec."Job No.")
            {
                Caption = 'jobNo';
            }
            field(jobTaskNo; Rec."Job Task No.")
            {
                Caption = 'jobTaskNo';
            }
            field(jobPurchase; Rec."Job Purchase")
            {
                Caption = 'jobPurchase';
            }

            // ── Dimensions ───────────────────────────────────────────────────────
            field(globalDimension1Code; Rec."Global Dimension 1 Code")
            {
                Caption = 'globalDimension1Code';
            }
            field(globalDimension2Code; Rec."Global Dimension 2 Code")
            {
                Caption = 'globalDimension2Code';
            }
            field(dimensionSetId; Rec."Dimension Set ID")
            {
                Caption = 'dimensionSetId';
                Editable = false;
            }

            // ── Intrastat ────────────────────────────────────────────────────────
            field(transactionType; Rec."Transaction Type")
            {
                Caption = 'transactionType';
            }
            field(transportMethod; Rec."Transport Method")
            {
                Caption = 'transportMethod';
            }
            field(transactionSpecification; Rec."Transaction Specification")
            {
                Caption = 'transactionSpecification';
            }
            field(entryExitPoint; Rec."Entry/Exit Point")
            {
                Caption = 'entryExitPoint';
            }
            field(countryRegionCode; Rec."Country/Region Code")
            {
                Caption = 'countryRegionCode';
            }
            field(intrastatArea; Rec.Area)
            {
                Caption = 'intrastatArea';
            }

            // ── LSC retail fields ────────────────────────────────────────────────
            field(offerNo; Rec."Offer No.")
            {
                Caption = 'offerNo';
            }
            field(promotionNo; Rec."Promotion No.")
            {
                Caption = 'promotionNo';
            }
            field(statementNo; Rec."Statement No.")
            {
                Caption = 'statementNo';
            }
            field(biTimestamp; Rec."BI Timestamp")
            {
                Caption = 'biTimestamp';
            }
            field(outOfStockSubstitution; Rec."Out-of-Stock Substitution")
            {
                Caption = 'outOfStockSubstitution';
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

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    var
        ILERecord: Record "Item Ledger Entry";
    begin
        Rec.TestField("Item No.");
        Rec.TestField("RGMC Company");
        ILERecord.ChangeCompany(Rec."RGMC Company");
        ILERecord.TransferFields(Rec);
        ILERecord.Insert(true);
        Rec."Entry No." := ILERecord."Entry No.";
        exit(true);
    end;

    trigger OnModifyRecord(): Boolean
    var
        ILERecord: Record "Item Ledger Entry";
    begin
        Rec.TestField("RGMC Company");
        ILERecord.ChangeCompany(Rec."RGMC Company");
        if ILERecord.Get(Rec."Entry No.") then begin
            ILERecord.TransferFields(Rec);
            ILERecord.Modify(true);
        end;
        exit(true);
    end;

    trigger OnDeleteRecord(): Boolean
    var
        ILERecord: Record "Item Ledger Entry";
    begin
        Rec.TestField("RGMC Company");
        ILERecord.ChangeCompany(Rec."RGMC Company");
        if ILERecord.Get(Rec."Entry No.") then
            ILERecord.Delete(true);
        exit(true);
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
        ILESource: Record "Item Ledger Entry";
        EffectiveLimit: Integer;
        Position: Integer;
        InsertCount: Integer;
    begin
        EffectiveLimit := pLimit;
        if EffectiveLimit <= 0 then
            EffectiveLimit := 2147483647;

        ILESource.ChangeCompany(pCompany);
        ILESource.SetLoadFields(
            SystemId, "Entry No.", "Item No.", "Posting Date", "Document Date",
            "Entry Type", "Source Type", "Source No.", "Document No.", "Document Type",
            "Document Line No.", "External Document No.", "No. Series", Description,
            "Location Code", "Variant Code", "Item Category Code", Nonstock, "Purchasing Code",
            "Serial No.", "Lot No.", "Batch No.", "Expiration Date", "Item Tracking", "Warranty Date",
            Quantity, "Invoiced Quantity", "Remaining Quantity", "Shipped Qty. Not Returned",
            "Unit of Measure Code", "Qty. per Unit of Measure",
            Open, Positive, Correction, "Completely Invoiced", "Drop Shipment",
            "Assemble to Order", "Last Invoice Date",
            "Order Type", "Order No.", "Order Line No.",
            "Return Reason Code", "Applied Entry to Adjust", "Applies-to Entry",
            "Transfer Type", "Originally Ordered No.", "Originally Ordered Variant Code",
            "Derived From Blanket Order", "Prod. Order Comp. Line No.",
            "Job No.", "Job Task No.", "Job Purchase",
            "Global Dimension 1 Code", "Global Dimension 2 Code", "Dimension Set ID",
            "Transaction Type", "Transport Method", "Transaction Specification",
            "Entry/Exit Point", "Country/Region Code", Area,
            "Offer No.", "Promotion No.", "Statement No.", "BI Timestamp",
            "Out-of-Stock Substitution",
            SystemModifiedAt
        );
        if (FilterStart <> 0DT) and (FilterEnd <> 0DT) then
            ILESource.SetRange(SystemModifiedAt, FilterStart, FilterEnd)
        else if FilterStart <> 0DT then
            ILESource.SetFilter(SystemModifiedAt, '>=%1', FilterStart)
        else if FilterEnd <> 0DT then
            ILESource.SetFilter(SystemModifiedAt, '<=%1', FilterEnd);

        Position := 0;
        InsertCount := 0;
        if ILESource.FindSet() then
            repeat
                Position += 1;
                if Position > pOffset then begin
                    Rec.Init();
                    Rec.TransferFields(ILESource);
                    Rec."RGMC Company" := CopyStr(pCompany, 1, 30);
                    Rec."RGMC Limit" := pLimit;
                    Rec."RGMC Offset" := pOffset;
                    Rec.SystemId := CreateGuid();
                    if Rec.Insert() then;
                    InsertCount += 1;
                end;
            until (ILESource.Next() = 0) or (InsertCount >= EffectiveLimit);
    end;
}
