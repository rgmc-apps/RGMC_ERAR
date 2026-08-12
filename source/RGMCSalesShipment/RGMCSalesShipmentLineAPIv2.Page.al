page 50340 "RGMC Sales Shpt Line API v2"
{
    PageType = API;
    APIPublisher = 'rgmc';
    APIGroup = 'rgmccustom';
    APIVersion = 'v2.0';
    EntityName = 'salesShipmentLine';
    EntitySetName = 'salesShipmentLines';
    Caption = 'RGMC Sales Shpt Line API v2';

    SourceTable = "Sales Shipment Line";
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
            // ── Identity & document ──────────────────────────────────────────────
            field(id; Rec.SystemId)
            {
                Caption = 'id';
                Editable = false;
            }
            field(documentNo; Rec."Document No.")
            {
                Caption = 'documentNo';
                Editable = false;
            }
            field(lineNo; Rec."Line No.")
            {
                Caption = 'lineNo';
                Editable = false;
            }
            field(type; Rec.Type)
            {
                Caption = 'type';
            }
            field(no; Rec."No.")
            {
                Caption = 'no';
            }
            field(description; Rec.Description)
            {
                Caption = 'description';
            }
            field(description2; Rec."Description 2")
            {
                Caption = 'description2';
            }
            field(postingDate; Rec."Posting Date")
            {
                Caption = 'postingDate';
                Editable = false;
            }
            field(correction; Rec.Correction)
            {
                Caption = 'correction';
            }

            // ── Customer ─────────────────────────────────────────────────────────
            field(sellToCustomerNo; Rec."Sell-to Customer No.")
            {
                Caption = 'sellToCustomerNo';
                Editable = false;
            }
            field(billToCustomerNo; Rec."Bill-to Customer No.")
            {
                Caption = 'billToCustomerNo';
                Editable = false;
            }
            field(customerPriceGroup; Rec."Customer Price Group")
            {
                Caption = 'customerPriceGroup';
            }
            field(customerDiscGroup; Rec."Customer Disc. Group")
            {
                Caption = 'customerDiscGroup';
            }
            field(responsibilityCenter; Rec."Responsibility Center")
            {
                Caption = 'responsibilityCenter';
            }

            // ── Item & location ──────────────────────────────────────────────────
            field(locationCode; Rec."Location Code")
            {
                Caption = 'locationCode';
            }
            field(binCode; Rec."Bin Code")
            {
                Caption = 'binCode';
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
            field(postingGroup; Rec."Posting Group")
            {
                Caption = 'postingGroup';
            }
            field(purchasingCode; Rec."Purchasing Code")
            {
                Caption = 'purchasingCode';
            }

            // ── Quantities & UoM ─────────────────────────────────────────────────
            field(quantity; Rec.Quantity)
            {
                Caption = 'quantity';
            }
            field(quantityBase; Rec."Quantity (Base)")
            {
                Caption = 'quantityBase';
                Editable = false;
            }
            field(quantityInvoiced; Rec."Quantity Invoiced")
            {
                Caption = 'quantityInvoiced';
            }
            field(qtyInvoicedBase; Rec."Qty. Invoiced (Base)")
            {
                Caption = 'qtyInvoicedBase';
                Editable = false;
            }
            field(qtyShippedNotInvoiced; Rec."Qty. Shipped Not Invoiced")
            {
                Caption = 'qtyShippedNotInvoiced';
                Editable = false;
            }
            field(qtyPerUnitOfMeasure; Rec."Qty. per Unit of Measure")
            {
                Caption = 'qtyPerUnitOfMeasure';
                Editable = false;
            }
            field(unitOfMeasure; Rec."Unit of Measure")
            {
                Caption = 'unitOfMeasure';
            }
            field(unitOfMeasureCode; Rec."Unit of Measure Code")
            {
                Caption = 'unitOfMeasureCode';
            }
            field(unitOfMeasureCrossRef; Rec."Unit of Measure Cross Ref.")
            {
                Caption = 'unitOfMeasureCrossRef';
            }
            field(unitsPerParcel; Rec."Units per Parcel")
            {
                Caption = 'unitsPerParcel';
            }
            field(netWeight; Rec."Net Weight")
            {
                Caption = 'netWeight';
            }
            field(grossWeight; Rec."Gross Weight")
            {
                Caption = 'grossWeight';
            }
            field(unitVolume; Rec."Unit Volume")
            {
                Caption = 'unitVolume';
            }

            // ── Pricing & discounts ──────────────────────────────────────────────
            field(unitPrice; Rec."Unit Price")
            {
                Caption = 'unitPrice';
            }
            field(unitCost; Rec."Unit Cost")
            {
                Caption = 'unitCost';
            }
            field(unitCostLcy; Rec."Unit Cost (LCY)")
            {
                Caption = 'unitCostLcy';
            }
            field(vatBaseAmount; Rec."VAT Base Amount")
            {
                Caption = 'vatBaseAmount';
            }
            field(allowLineDisc; Rec."Allow Line Disc.")
            {
                Caption = 'allowLineDisc';
            }
            field(lineDiscountPercent; Rec."Line Discount %")
            {
                Caption = 'lineDiscountPercent';
            }
            field(allowInvoiceDisc; Rec."Allow Invoice Disc.")
            {
                Caption = 'allowInvoiceDisc';
            }
            field(itemChargeBaseAmount; Rec."Item Charge Base Amount")
            {
                Caption = 'itemChargeBaseAmount';
            }

            // ── VAT & posting ────────────────────────────────────────────────────
            field(vatCalculationType; Rec."VAT Calculation Type")
            {
                Caption = 'vatCalculationType';
            }
            field(vatPercent; Rec."VAT %")
            {
                Caption = 'vatPercent';
            }
            field(vatBusinessPostingGroup; Rec."VAT Bus. Posting Group")
            {
                Caption = 'vatBusinessPostingGroup';
            }
            field(vatProductPostingGroup; Rec."VAT Prod. Posting Group")
            {
                Caption = 'vatProductPostingGroup';
            }
            field(generalBusinessPostingGroup; Rec."Gen. Bus. Posting Group")
            {
                Caption = 'generalBusinessPostingGroup';
            }
            field(generalProductPostingGroup; Rec."Gen. Prod. Posting Group")
            {
                Caption = 'generalProductPostingGroup';
            }

            // ── Tax (Associates 365) ─────────────────────────────────────────────
            field(taxLiable; Rec."Tax Liable")
            {
                Caption = 'taxLiable';
            }
            field(taxAreaCode; Rec."Tax Area Code")
            {
                Caption = 'taxAreaCode';
            }
            field(taxGroupCode; Rec."Tax Group Code")
            {
                Caption = 'taxGroupCode';
            }

            // ── Item application & cross-reference ───────────────────────────────
            field(itemShipmentEntryNo; Rec."Item Shpt. Entry No.")
            {
                Caption = 'itemShipmentEntryNo';
                Editable = false;
            }
            field(appliesToItemEntry; Rec."Appl.-to Item Entry")
            {
                Caption = 'appliesToItemEntry';
            }
            field(appliesFromItemEntry; Rec."Appl.-from Item Entry")
            {
                Caption = 'appliesFromItemEntry';
            }
            field(returnReasonCode; Rec."Return Reason Code")
            {
                Caption = 'returnReasonCode';
            }
            field(attachedToLineNo; Rec."Attached to Line No.")
            {
                Caption = 'attachedToLineNo';
                Editable = false;
            }

            // ── Order references ─────────────────────────────────────────────────
            field(orderNo; Rec."Order No.")
            {
                Caption = 'orderNo';
                Editable = false;
            }
            field(orderLineNo; Rec."Order Line No.")
            {
                Caption = 'orderLineNo';
                Editable = false;
            }
            field(blanketOrderNo; Rec."Blanket Order No.")
            {
                Caption = 'blanketOrderNo';
                Editable = false;
            }
            field(blanketOrderLineNo; Rec."Blanket Order Line No.")
            {
                Caption = 'blanketOrderLineNo';
                Editable = false;
            }
            field(purchaseOrderNo; Rec."Purchase Order No.")
            {
                Caption = 'purchaseOrderNo';
            }
            field(purchOrderLineNo; Rec."Purch. Order Line No.")
            {
                Caption = 'purchOrderLineNo';
            }
            field(dropShipment; Rec."Drop Shipment")
            {
                Caption = 'dropShipment';
            }
            field(vendorNo; Rec."Vendor No.")
            {
                Caption = 'vendorNo';
            }

            // ── Job ──────────────────────────────────────────────────────────────
            field(jobNo; Rec."Job No.")
            {
                Caption = 'jobNo';
            }
            field(jobTaskNo; Rec."Job Task No.")
            {
                Caption = 'jobTaskNo';
            }
            field(jobContractEntryNo; Rec."Job Contract Entry No.")
            {
                Caption = 'jobContractEntryNo';
                Editable = false;
            }
            field(workTypeCode; Rec."Work Type Code")
            {
                Caption = 'workTypeCode';
            }

            // ── Dimensions ───────────────────────────────────────────────────────
            field(shortcutDimension1Code; Rec."Shortcut Dimension 1 Code")
            {
                Caption = 'shortcutDimension1Code';
            }
            field(shortcutDimension2Code; Rec."Shortcut Dimension 2 Code")
            {
                Caption = 'shortcutDimension2Code';
            }
            field(dimensionSetId; Rec."Dimension Set ID")
            {
                Caption = 'dimensionSetId';
                Editable = false;
            }

            // ── FA / Depreciation ────────────────────────────────────────────────
            field(faPostingDate; Rec."FA Posting Date")
            {
                Caption = 'faPostingDate';
            }
            field(depreciationBookCode; Rec."Depreciation Book Code")
            {
                Caption = 'depreciationBookCode';
            }
            field(deprUntilFaPostingDate; Rec."Depr. until FA Posting Date")
            {
                Caption = 'deprUntilFaPostingDate';
            }
            field(duplicateInDepreciationBook; Rec."Duplicate in Depreciation Book")
            {
                Caption = 'duplicateInDepreciationBook';
            }
            field(useDuplicationList; Rec."Use Duplication List")
            {
                Caption = 'useDuplicationList';
            }

            // ── Dates & shipping ─────────────────────────────────────────────────
            field(shippingTime; Rec."Shipping Time")
            {
                Caption = 'shippingTime';
            }
            field(outboundWarehouseHandlingTime; Rec."Outbound Whse. Handling Time")
            {
                Caption = 'outboundWarehouseHandlingTime';
            }
            field(plannedShipmentDate; Rec."Planned Shipment Date")
            {
                Caption = 'plannedShipmentDate';
            }
            field(plannedDeliveryDate; Rec."Planned Delivery Date")
            {
                Caption = 'plannedDeliveryDate';
            }
            field(requestedDeliveryDate; Rec."Requested Delivery Date")
            {
                Caption = 'requestedDeliveryDate';
            }
            field(promisedDeliveryDate; Rec."Promised Delivery Date")
            {
                Caption = 'promisedDeliveryDate';
            }
            field(estimatedDeliveryDate; Rec."Estimated Delivery Date")
            {
                Caption = 'estimatedDeliveryDate';
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
            field(exitPoint; Rec."Exit Point")
            {
                Caption = 'exitPoint';
            }
            field(intrastatArea; Rec.Area)
            {
                Caption = 'intrastatArea';
            }

            // ── LSC retail / delivery fields ─────────────────────────────────────
            field(sourcing; Rec.Sourcing)
            {
                Caption = 'sourcing';
            }
            field(deliverFrom; Rec."Deliver from")
            {
                Caption = 'deliverFrom';
            }
            field(returnPolicy; Rec."Return Policy")
            {
                Caption = 'returnPolicy';
            }
            field(deliveringMethod; Rec."Delivering Method")
            {
                Caption = 'deliveringMethod';
            }
            field(itemTrackingNo; Rec."Item Tracking No.")
            {
                Caption = 'itemTrackingNo';
            }
            field(configurationId; Rec."Configuration ID")
            {
                Caption = 'configurationId';
            }
            field(deliveryUserId; Rec."Delivery User ID")
            {
                Caption = 'deliveryUserId';
            }
            field(optionValueText; Rec."Option Value Text")
            {
                Caption = 'optionValueText';
            }
            field(spoWhseLocation; Rec."SPO Whse Location")
            {
                Caption = 'spoWhseLocation';
            }
            field(deliveryDateTime; Rec."Delivery Date Time")
            {
                Caption = 'deliveryDateTime';
            }
            field(noLaterThanDate; Rec."No later than Date")
            {
                Caption = 'noLaterThanDate';
            }
            field(vendorDeliversTo; Rec."Vendor Delivers to")
            {
                Caption = 'vendorDeliversTo';
            }
            field(spoDocumentMethod; Rec."SPO Document Method")
            {
                Caption = 'spoDocumentMethod';
            }
            field(retailSpecialOrder; Rec."Retail Special Order")
            {
                Caption = 'retailSpecialOrder';
            }
            field(storeSalesLocation; Rec."Store Sales Location")
            {
                Caption = 'storeSalesLocation';
            }
            field(deliveryReferenceNo; Rec."Delivery Reference No")
            {
                Caption = 'deliveryReferenceNo';
            }
            field(deliveryLocationCode; Rec."Delivery Location Code")
            {
                Caption = 'deliveryLocationCode';
            }
            field(authorizedForCreditCard; Rec."Authorized for Credit Card")
            {
                Caption = 'authorizedForCreditCard';
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
        SSLRecord: Record "Sales Shipment Line";
    begin
        Rec.TestField("Document No.");
        Rec.TestField("No.");
        Rec.TestField("RGMC Company");
        SSLRecord.ChangeCompany(Rec."RGMC Company");
        SSLRecord.TransferFields(Rec);
        SSLRecord.Insert(true);
        exit(true);
    end;

    trigger OnModifyRecord(): Boolean
    var
        SSLRecord: Record "Sales Shipment Line";
    begin
        Rec.TestField("RGMC Company");
        SSLRecord.ChangeCompany(Rec."RGMC Company");
        if SSLRecord.Get(Rec."Document No.", Rec."Line No.") then begin
            SSLRecord.TransferFields(Rec);
            SSLRecord.Modify(true);
        end;
        exit(true);
    end;

    trigger OnDeleteRecord(): Boolean
    var
        SSLRecord: Record "Sales Shipment Line";
    begin
        Rec.TestField("RGMC Company");
        SSLRecord.ChangeCompany(Rec."RGMC Company");
        if SSLRecord.Get(Rec."Document No.", Rec."Line No.") then
            SSLRecord.Delete(true);
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
        SSLSource: Record "Sales Shipment Line";
        EffectiveLimit: Integer;
        Position: Integer;
        InsertCount: Integer;
    begin
        EffectiveLimit := pLimit;
        if EffectiveLimit <= 0 then
            EffectiveLimit := 2147483647;

        SSLSource.ChangeCompany(pCompany);
        SSLSource.SetLoadFields(
            SystemId, "Document No.", "Line No.", Type, "No.", Description, "Description 2",
            "Posting Date", Correction,
            "Sell-to Customer No.", "Bill-to Customer No.", "Customer Price Group",
            "Customer Disc. Group", "Responsibility Center",
            "Location Code", "Bin Code", "Variant Code", "Item Category Code",
            Nonstock, "Posting Group", "Purchasing Code",
            Quantity, "Quantity (Base)", "Quantity Invoiced", "Qty. Invoiced (Base)",
            "Qty. Shipped Not Invoiced", "Qty. per Unit of Measure",
            "Unit of Measure", "Unit of Measure Code", "Unit of Measure Cross Ref.",
            "Units per Parcel", "Net Weight", "Gross Weight", "Unit Volume",
            "Unit Price", "Unit Cost", "Unit Cost (LCY)", "VAT Base Amount",
            "Allow Line Disc.", "Line Discount %", "Allow Invoice Disc.", "Item Charge Base Amount",
            "VAT Calculation Type", "VAT %", "VAT Bus. Posting Group", "VAT Prod. Posting Group",
            "Gen. Bus. Posting Group", "Gen. Prod. Posting Group",
            "Tax Liable", "Tax Area Code", "Tax Group Code",
            "Item Shpt. Entry No.", "Appl.-to Item Entry", "Appl.-from Item Entry",
            "Return Reason Code", "Attached to Line No.",
            "Order No.", "Order Line No.", "Blanket Order No.", "Blanket Order Line No.",
            "Purchase Order No.", "Purch. Order Line No.", "Drop Shipment", "Vendor No.",
            "Job No.", "Job Task No.", "Job Contract Entry No.", "Work Type Code",
            "Shortcut Dimension 1 Code", "Shortcut Dimension 2 Code", "Dimension Set ID",
            "FA Posting Date", "Depreciation Book Code",
            "Depr. until FA Posting Date", "Duplicate in Depreciation Book", "Use Duplication List",
            "Shipping Time", "Outbound Whse. Handling Time",
            "Planned Shipment Date", "Planned Delivery Date", "Requested Delivery Date",
            "Promised Delivery Date", "Estimated Delivery Date",
            "Transaction Type", "Transport Method", "Transaction Specification",
            "Exit Point", Area,
            Sourcing, "Deliver from", "Return Policy", "Delivering Method",
            "Item Tracking No.", "Configuration ID", "Delivery User ID",
            "Option Value Text", "SPO Whse Location", "Delivery Date Time",
            "No later than Date", "Vendor Delivers to", "SPO Document Method",
            "Retail Special Order", "Store Sales Location",
            "Delivery Reference No", "Delivery Location Code", "Authorized for Credit Card",
            SystemModifiedAt
        );
        if (FilterStart <> 0DT) and (FilterEnd <> 0DT) then
            SSLSource.SetRange(SystemModifiedAt, FilterStart, FilterEnd)
        else if FilterStart <> 0DT then
            SSLSource.SetFilter(SystemModifiedAt, '>=%1', FilterStart)
        else if FilterEnd <> 0DT then
            SSLSource.SetFilter(SystemModifiedAt, '<=%1', FilterEnd);

        Position := 0;
        InsertCount := 0;
        if SSLSource.FindSet() then
            repeat
                Position += 1;
                if Position > pOffset then begin
                    Rec.Init();
                    Rec.TransferFields(SSLSource);
                    Rec."RGMC Company" := CopyStr(pCompany, 1, 30);
                    Rec."RGMC Limit" := pLimit;
                    Rec."RGMC Offset" := pOffset;
                    Rec.SystemId := CreateGuid();
                    if Rec.Insert() then;
                    InsertCount += 1;
                end;
            until (SSLSource.Next() = 0) or (InsertCount >= EffectiveLimit);
    end;
}
