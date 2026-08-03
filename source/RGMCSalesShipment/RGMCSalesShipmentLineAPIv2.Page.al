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
            field(productGroupCode; Rec."Product Group Code")
            {
                Caption = 'productGroupCode';
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
            field(vatBusPostingGroup; Rec."VAT Bus. Posting Group")
            {
                Caption = 'vatBusPostingGroup';
            }
            field(vatProdPostingGroup; Rec."VAT Prod. Posting Group")
            {
                Caption = 'vatProdPostingGroup';
            }
            field(genBusPostingGroup; Rec."Gen. Bus. Posting Group")
            {
                Caption = 'genBusPostingGroup';
            }
            field(genProdPostingGroup; Rec."Gen. Prod. Posting Group")
            {
                Caption = 'genProdPostingGroup';
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
            field(itemShptEntryNo; Rec."Item Shpt. Entry No.")
            {
                Caption = 'itemShptEntryNo';
                Editable = false;
            }
            field(appliesToItemEntry; Rec."Appl.-to Item Entry")
            {
                Caption = 'appliesToItemEntry';
            }
            field(applFromItemEntry; Rec."Appl.-from Item Entry")
            {
                Caption = 'applFromItemEntry';
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
            field(crossReferenceNo; Rec."Cross-Reference No.")
            {
                Caption = 'crossReferenceNo';
            }
            field(crossReferenceType; Rec."Cross-Reference Type")
            {
                Caption = 'crossReferenceType';
            }
            field(crossReferenceTypeNo; Rec."Cross-Reference Type No.")
            {
                Caption = 'crossReferenceTypeNo';
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
            field(outboundWhseHandlingTime; Rec."Outbound Whse. Handling Time")
            {
                Caption = 'outboundWhseHandlingTime';
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

            // ── Metadata ─────────────────────────────────────────────────────────
            field(companyName; CurrentCompanyName)
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

    trigger OnAfterGetRecord()
    begin
        CurrentCompanyName := CompanyName();
    end;

    trigger OnOpenPage()
    begin
        Rec.SetLoadFields(
            SystemId, "Document No.", "Line No.", Type, "No.", Description, "Description 2",
            "Posting Date", Correction,
            "Sell-to Customer No.", "Bill-to Customer No.", "Customer Price Group",
            "Customer Disc. Group", "Responsibility Center",
            "Location Code", "Bin Code", "Variant Code", "Item Category Code",
            "Product Group Code", Nonstock, "Posting Group", "Purchasing Code",
            Quantity, "Quantity (Base)", "Quantity Invoiced", "Qty. Invoiced (Base)",
            "Qty. Shipped Not Invoiced", "Qty. per Unit of Measure",
            "Unit of Measure", "Unit of Measure Code", "Unit of Measure Cross Ref.",
            "Units per Parcel", "Net Weight", "Gross Weight", "Unit Volume",
            "Unit Cost", "Unit Cost (LCY)", "VAT Base Amount",
            "Allow Line Disc.", "Allow Invoice Disc.", "Item Charge Base Amount",
            "VAT Calculation Type", "VAT Bus. Posting Group", "VAT Prod. Posting Group",
            "Gen. Bus. Posting Group", "Gen. Prod. Posting Group",
            "Tax Liable", "Tax Area Code", "Tax Group Code",
            "Item Shpt. Entry No.", "Appl.-to Item Entry", "Appl.-from Item Entry",
            "Return Reason Code", "Attached to Line No.",
            "Cross-Reference No.", "Cross-Reference Type", "Cross-Reference Type No.",
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
    end;

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        Rec.TestField("Document No.");
        Rec.TestField("No.");
        exit(true);
    end;

    trigger OnModifyRecord(): Boolean
    begin
        exit(true);
    end;

    trigger OnDeleteRecord(): Boolean
    begin
        exit(true);
    end;

    var
        CurrentCompanyName: Text[30];
}
