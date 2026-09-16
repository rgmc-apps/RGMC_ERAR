table 50344 "RGMC PO Bulk Header"
{
    Caption = 'RGMC PO Bulk Header';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Import Id"; Guid)
        {
            Caption = 'Import Id';
            DataClassification = CustomerContent;
        }
        field(2; Status; Option)
        {
            Caption = 'Status';
            DataClassification = CustomerContent;
            OptionCaption = ' ,Pending,Success,Error';
            OptionMembers = " ",Pending,Success,Error;
        }
        field(3; "Document No."; Code[20])
        {
            Caption = 'Document No.';
            DataClassification = CustomerContent;
        }
        field(4; "Buy-from Vendor No."; Code[20])
        {
            Caption = 'Buy-from Vendor No.';
            DataClassification = CustomerContent;
        }
        field(5; "Vendor Invoice No."; Text[35])
        {
            Caption = 'Vendor Invoice No.';
            DataClassification = CustomerContent;
        }
        field(6; "Vendor Order No."; Text[35])
        {
            Caption = 'Vendor Order No.';
            DataClassification = CustomerContent;
        }
        field(7; "Posting Date"; Date)
        {
            Caption = 'Posting Date';
            DataClassification = CustomerContent;
        }
        field(8; "Document Date"; Date)
        {
            Caption = 'Document Date';
            DataClassification = CustomerContent;
        }
        field(9; "Order Date"; Date)
        {
            Caption = 'Order Date';
            DataClassification = CustomerContent;
        }
        field(10; "Expected Receipt Date"; Date)
        {
            Caption = 'Expected Receipt Date';
            DataClassification = CustomerContent;
        }
        field(11; "Currency Code"; Code[10])
        {
            Caption = 'Currency Code';
            DataClassification = CustomerContent;
        }
        field(12; "Location Code"; Code[10])
        {
            Caption = 'Location Code';
            DataClassification = CustomerContent;
        }
        field(13; "Purchaser Code"; Code[20])
        {
            Caption = 'Purchaser Code';
            DataClassification = CustomerContent;
        }
        field(14; "Shortcut Dimension 1 Code"; Code[20])
        {
            Caption = 'Shortcut Dimension 1 Code';
            DataClassification = CustomerContent;
        }
        field(15; "Shortcut Dimension 2 Code"; Code[20])
        {
            Caption = 'Shortcut Dimension 2 Code';
            DataClassification = CustomerContent;
        }
        field(16; "Error Message"; Text[2048])
        {
            Caption = 'Error Message';
            DataClassification = CustomerContent;
        }
        field(17; "Created At"; DateTime)
        {
            Caption = 'Created At';
            DataClassification = CustomerContent;
        }
    }

    keys
    {
        key(PK; "Import Id") { Clustered = true; }
        key(Status; Status) { }
    }
}
