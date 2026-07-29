page 50322 "RGMC Transaction Header API v2"
{
    PageType = API;
    APIPublisher = 'rgmc';
    APIGroup = 'rgmccustom';
    APIVersion = 'v2.0';
    EntityName = 'transactionHeader';
    EntitySetName = 'transactionHeaders';
    Caption = 'RGMC Transaction Header API v2';

    SourceTable = "LSC Transaction Header";
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
            }
            field(posTerminalNo; Rec."POS Terminal No.")
            {
                Caption = 'posTerminalNo';
            }
            field(transactionNo; Rec."Transaction No.")
            {
                Caption = 'transactionNo';
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
            field(memberCardNo; Rec."Member Card No.")
            {
                Caption = 'memberCardNo';
            }
            field(customerNo; Rec."Customer No.")
            {
                Caption = 'customerNo';
            }
            field(staffId; Rec."Staff ID")
            {
                Caption = 'staffId';
            }
            field(netAmount; Rec."Net Amount")
            {
                Caption = 'netAmount';
            }
            field(grossAmount; Rec."Gross Amount")
            {
                Caption = 'grossAmount';
            }
            field(discountAmount; Rec."Discount Amount")
            {
                Caption = 'discountAmount';
            }
            field(noOfItems; Rec."No. of Items")
            {
                Caption = 'noOfItems';
            }
            field(statementNo; Rec."Statement No.")
            {
                Caption = 'statementNo';
                Editable = false;
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
            part(transactionSalesEntries; "RGMC Trans Sales Entry API v2")
            {
                Caption = 'transactionSalesEntries';
                EntityName = 'transactionSalesEntry';
                EntitySetName = 'transactionSalesEntries';
                SubPageLink = "Store No." = field("Store No."),
                              "POS Terminal No." = field("POS Terminal No."),
                              "Transaction No." = field("Transaction No.");
            }
            part(transPaymentEntries; "RGMC Trans Pmt Entry API v2")
            {
                Caption = 'transPaymentEntries';
                EntityName = 'transPaymentEntry';
                EntitySetName = 'transPaymentEntries';
                SubPageLink = "Store No." = field("Store No."),
                              "POS Terminal No." = field("POS Terminal No."),
                              "Transaction No." = field("Transaction No.");
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
