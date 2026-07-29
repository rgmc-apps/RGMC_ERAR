page 50324 "RGMC Trans Pmt Entry API v2"
{
    PageType = API;
    APIPublisher = 'rgmc';
    APIGroup = 'rgmccustom';
    APIVersion = 'v2.0';
    EntityName = 'transPaymentEntry';
    EntitySetName = 'transPaymentEntries';
    Caption = 'RGMC Trans Pmt Entry API v2';

    SourceTable = "LSC Trans. Payment Entry";
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
            field(tenderType; Rec."Tender Type")
            {
                Caption = 'tenderType';
            }
            field(amountTendered; Rec."Amount Tendered")
            {
                Caption = 'amountTendered';
            }
            field(currencyCode; Rec."Currency Code")
            {
                Caption = 'currencyCode';
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
        Rec.TestField("Tender Type");
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
