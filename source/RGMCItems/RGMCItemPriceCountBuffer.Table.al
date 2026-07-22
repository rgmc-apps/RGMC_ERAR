table 50303 "RGMC Item Price Count Buffer"
{
    Caption = 'RGMC Item Price Count Buffer';
    DataClassification = CustomerContent;
    TableType = Temporary;

    fields
    {
        field(1; "Entry No."; Integer)
        {
            Caption = 'Entry No.';
            DataClassification = CustomerContent;
        }
        field(2; "Total Count"; Integer)
        {
            Caption = 'Total Count';
            DataClassification = CustomerContent;
        }
        field(3; "On Date"; Date)
        {
            Caption = 'On Date';
            DataClassification = CustomerContent;
        }
        field(4; "Family Code"; Code[20])
        {
            Caption = 'Family Code';
            DataClassification = CustomerContent;
        }
        field(5; "Product No."; Code[20])
        {
            Caption = 'Product No.';
            DataClassification = CustomerContent;
        }
    }

    keys
    {
        key(PK; "Entry No.") { Clustered = true; }
    }
}
