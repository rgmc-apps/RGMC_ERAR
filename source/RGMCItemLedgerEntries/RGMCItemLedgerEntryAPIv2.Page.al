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
            field(productGroupCode; Rec."Product Group Code")
            {
                Caption = 'productGroupCode';
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
            field(crossReferenceNo; Rec."Cross-Reference No.")
            {
                Caption = 'crossReferenceNo';
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
            field(area; Rec.Area)
            {
                Caption = 'area';
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
            SystemId, "Entry No.", "Item No.", "Posting Date", "Document Date",
            "Entry Type", "Source Type", "Source No.", "Document No.", "Document Type",
            "Document Line No.", "External Document No.", "No. Series", Description,
            "Location Code", "Variant Code", "Item Category Code", Nonstock,
            "Product Group Code", "Purchasing Code",
            "Serial No.", "Lot No.", "Batch No.", "Expiration Date", "Item Tracking", "Warranty Date",
            Quantity, "Invoiced Quantity", "Remaining Quantity", "Shipped Qty. Not Returned",
            "Unit of Measure Code", "Qty. per Unit of Measure",
            Open, Positive, Correction, "Completely Invoiced", "Drop Shipment",
            "Assemble to Order", "Last Invoice Date", "Cross-Reference No.",
            "Order Type", "Order No.", "Order Line No.",
            "Return Reason Code", "Applied Entry to Adjust", "Applies-to Entry",
            "Transfer Type", "Originally Ordered No.",
            "Job No.", "Job Task No.", "Job Purchase",
            "Global Dimension 1 Code", "Global Dimension 2 Code", "Dimension Set ID",
            "Transaction Type", "Transport Method", "Transaction Specification",
            "Entry/Exit Point", "Country/Region Code", Area,
            "Offer No.", "Promotion No.", "Statement No.", "BI Timestamp",
            "Out-of-Stock Substitution",
            SystemModifiedAt
        );
    end;

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        Rec.TestField("Item No.");
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
