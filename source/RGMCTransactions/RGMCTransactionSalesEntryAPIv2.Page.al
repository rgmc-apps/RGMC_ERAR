page 50323 "RGMC Trans Sales Entry API v2"
{
    PageType = API;
    APIPublisher = 'rgmc';
    APIGroup = 'rgmccustom';
    APIVersion = 'v2.0';
    EntityName = 'transactionSalesEntry';
    EntitySetName = 'transactionSalesEntries';
    Caption = 'RGMC Trans Sales Entry API v2';

    SourceTable = "LSC Trans. Sales Entry";
    ODataKeyFields = SystemId;

    DelayedInsert = true;
    InsertAllowed = true;
    ModifyAllowed = true;
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
            field(storeNo; Rec."Store No.")
            {
                Caption = 'storeNo';
                Editable = false;
            }
            field(posTerminalNo; Rec."POS Terminal No.")
            {
                Caption = 'posTerminalNo';
                Editable = false;
            }
            field(transactionNo; Rec."Transaction No.")
            {
                Caption = 'transactionNo';
                Editable = false;
            }
            field(lineNo; Rec."Line No.")
            {
                Caption = 'lineNo';
                Editable = false;
            }
            field(receiptNo; Rec."Receipt No.")
            {
                Caption = 'receiptNo';
                Editable = false;
            }
            field(transactionDate; Rec."Date")
            {
                Caption = 'transactionDate';
            }
            field(transactionTime; Rec."Time")
            {
                Caption = 'transactionTime';
            }
            field(itemNo; Rec."Item No.")
            {
                Caption = 'itemNo';
            }
            field(barcodeNo; Rec."Barcode No.")
            {
                Caption = 'barcodeNo';
            }
            field(variantCode; Rec."Variant Code")
            {
                Caption = 'variantCode';
            }
            field(unitOfMeasure; Rec."Unit of Measure")
            {
                Caption = 'unitOfMeasure';
            }
            field(quantity; Rec.Quantity)
            {
                Caption = 'quantity';
            }
            field(price; Rec.Price)
            {
                Caption = 'price';
            }
            field(netPrice; Rec."Net Price")
            {
                Caption = 'netPrice';
            }
            field(netAmount; Rec."Net Amount")
            {
                Caption = 'netAmount';
            }
            field(discountAmount; Rec."Discount Amount")
            {
                Caption = 'discountAmount';
            }
            field(discountPercent; Rec."Discount %")
            {
                Caption = 'discountPercent';
            }
            field(costAmount; Rec."Cost Amount")
            {
                Caption = 'costAmount';
            }
            field(staffId; Rec."Staff ID")
            {
                Caption = 'staffId';
            }
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

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        Rec.TestField("Store No.");
        Rec.TestField("POS Terminal No.");
        Rec.TestField("Transaction No.");
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
