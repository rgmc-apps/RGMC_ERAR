page 50342 "RGMC Purchase Order API v2"
{
    PageType = API;
    APIPublisher = 'rgmc';
    APIGroup = 'rgmccustom';
    APIVersion = 'v2.0';
    EntityName = 'purchaseOrder';
    EntitySetName = 'purchaseOrders';
    Caption = 'RGMC Purchase Order API v2';

    SourceTable = "Purchase Header";
    SourceTableView = where("Document Type" = const("Order"));
    ODataKeyFields = SystemId;

    DelayedInsert = true;
    InsertAllowed = true;
    ModifyAllowed = true;
    DeleteAllowed = true;

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
            field(number; Rec."No.")
            {
                Caption = 'number';
            }
            field(status; Rec.Status)
            {
                Caption = 'status';
                Editable = false;
            }
            field(vendorInvoiceNo; Rec."Vendor Invoice No.")
            {
                Caption = 'vendorInvoiceNo';
            }
            field(vendorOrderNo; Rec."Vendor Order No.")
            {
                Caption = 'vendorOrderNo';
            }

            // ── Vendor (Buy-from) ─────────────────────────────────────────────────
            field(buyFromVendorNo; Rec."Buy-from Vendor No.")
            {
                Caption = 'buyFromVendorNo';
            }
            field(buyFromVendorName; Rec."Buy-from Vendor Name")
            {
                Caption = 'buyFromVendorName';
                Editable = false;
            }
            field(buyFromContactNo; Rec."Buy-from Contact No.")
            {
                Caption = 'buyFromContactNo';
            }

            // ── Pay-to ───────────────────────────────────────────────────────────
            field(payToVendorNo; Rec."Pay-to Vendor No.")
            {
                Caption = 'payToVendorNo';
            }
            field(payToName; Rec."Pay-to Name")
            {
                Caption = 'payToName';
                Editable = false;
            }
            field(payToContactNo; Rec."Pay-to Contact No.")
            {
                Caption = 'payToContactNo';
            }

            // ── Ship-to ──────────────────────────────────────────────────────────
            field(shipToCode; Rec."Ship-to Code")
            {
                Caption = 'shipToCode';
            }
            field(shipToName; Rec."Ship-to Name")
            {
                Caption = 'shipToName';
            }
            field(shipToAddress; Rec."Ship-to Address")
            {
                Caption = 'shipToAddress';
            }
            field(shipToAddress2; Rec."Ship-to Address 2")
            {
                Caption = 'shipToAddress2';
            }
            field(shipToCity; Rec."Ship-to City")
            {
                Caption = 'shipToCity';
            }
            field(shipToPostCode; Rec."Ship-to Post Code")
            {
                Caption = 'shipToPostCode';
            }
            field(shipToCountryRegionCode; Rec."Ship-to Country/Region Code")
            {
                Caption = 'shipToCountryRegionCode';
            }

            // ── Dates ────────────────────────────────────────────────────────────
            field(orderDate; Rec."Order Date")
            {
                Caption = 'orderDate';
            }
            field(documentDate; Rec."Document Date")
            {
                Caption = 'documentDate';
            }
            field(postingDate; Rec."Posting Date")
            {
                Caption = 'postingDate';
            }
            field(expectedReceiptDate; Rec."Expected Receipt Date")
            {
                Caption = 'expectedReceiptDate';
            }

            // ── Financials ───────────────────────────────────────────────────────
            field(currencyCode; Rec."Currency Code")
            {
                Caption = 'currencyCode';
            }

            // ── Logistics ────────────────────────────────────────────────────────
            field(locationCode; Rec."Location Code")
            {
                Caption = 'locationCode';
            }
            field(purchaserCode; Rec."Purchaser Code")
            {
                Caption = 'purchaserCode';
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

            // ── Metadata ─────────────────────────────────────────────────────────
            field(lastModifiedDateTime; Rec.SystemModifiedAt)
            {
                Caption = 'lastModifiedDateTime';
                Editable = false;
            }

            // ── Lines (sub-page) ─────────────────────────────────────────────────
            part(purchaseOrderLines; "RGMC Purchase Order Lines v2")
            {
                Caption = 'Lines';
                EntityName = 'purchaseOrderLine';
                EntitySetName = 'purchaseOrderLines';
                SubPageLink = "Document Type" = const("Order"),
                              "Document No." = field("No.");
            }
        }
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Document Type" := Rec."Document Type"::Order;
    end;

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        Rec.TestField("Buy-from Vendor No.");
        Rec.TestField("Posting Date");
        exit(true);
    end;

    trigger OnModifyRecord(): Boolean
    begin
        if Rec.Status = Rec.Status::Released then
            Error('Purchase Order %1 is Released. Reopen it before making changes.', Rec."No.");
        exit(true);
    end;

    trigger OnDeleteRecord(): Boolean
    begin
        if Rec.Status = Rec.Status::Released then
            Error('Purchase Order %1 cannot be deleted while in Released status.', Rec."No.");
        exit(true);
    end;
}
