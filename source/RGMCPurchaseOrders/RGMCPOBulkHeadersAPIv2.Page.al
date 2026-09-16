page 50344 "RGMC PO Bulk Headers API v2"
{
    PageType = API;
    APIPublisher = 'rgmc';
    APIGroup = 'rgmccustom';
    APIVersion = 'v2.0';
    EntityName = 'purchaseOrderBulkHeader';
    EntitySetName = 'purchaseOrderBulkHeaders';
    Caption = 'RGMC PO Bulk Headers API v2';

    SourceTable = "RGMC PO Bulk Header";
    ODataKeyFields = SystemId;
    DelayedInsert = true;

    InsertAllowed = true;
    ModifyAllowed = false;
    DeleteAllowed = true;

    layout
    {
        area(Content)
        {
            field(id; Rec.SystemId)
            {
                Caption = 'id';
                Editable = false;
            }
            field(importId; Rec."Import Id")
            {
                Caption = 'importId';
                Editable = false;
            }
            field(status; Rec.Status)
            {
                Caption = 'status';
                Editable = false;
            }
            field(documentNo; Rec."Document No.")
            {
                Caption = 'documentNo';
                Editable = false;
            }
            field(buyFromVendorNo; Rec."Buy-from Vendor No.")
            {
                Caption = 'buyFromVendorNo';
            }
            field(vendorInvoiceNo; Rec."Vendor Invoice No.")
            {
                Caption = 'vendorInvoiceNo';
            }
            field(vendorOrderNo; Rec."Vendor Order No.")
            {
                Caption = 'vendorOrderNo';
            }
            field(postingDate; Rec."Posting Date")
            {
                Caption = 'postingDate';
            }
            field(documentDate; Rec."Document Date")
            {
                Caption = 'documentDate';
            }
            field(orderDate; Rec."Order Date")
            {
                Caption = 'orderDate';
            }
            field(expectedReceiptDate; Rec."Expected Receipt Date")
            {
                Caption = 'expectedReceiptDate';
            }
            field(currencyCode; Rec."Currency Code")
            {
                Caption = 'currencyCode';
            }
            field(locationCode; Rec."Location Code")
            {
                Caption = 'locationCode';
            }
            field(purchaserCode; Rec."Purchaser Code")
            {
                Caption = 'purchaserCode';
            }
            field(shortcutDimension1Code; Rec."Shortcut Dimension 1 Code")
            {
                Caption = 'shortcutDimension1Code';
            }
            field(shortcutDimension2Code; Rec."Shortcut Dimension 2 Code")
            {
                Caption = 'shortcutDimension2Code';
            }
            field(errorMessage; Rec."Error Message")
            {
                Caption = 'errorMessage';
                Editable = false;
            }
            field(createdAt; Rec."Created At")
            {
                Caption = 'createdAt';
                Editable = false;
            }
        }
    }

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        Rec."Import Id" := CreateGuid();
        Rec.Status := Rec.Status::Pending;
        Rec."Created At" := CurrentDateTime();
        exit(true);
    end;
}
