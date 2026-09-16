table 50346 "RGMC PO Bulk Job"
{
    Caption = 'RGMC PO Bulk Job';
    DataClassification = CustomerContent;
    TableType = Temporary;

    fields
    {
        field(1; "Entry No."; Integer)
        {
            Caption = 'Entry No.';
            DataClassification = CustomerContent;
        }
        field(2; "Import Id"; Guid)
        {
            Caption = 'Import Id';
            DataClassification = CustomerContent;
        }
        field(3; "Processed Count"; Integer)
        {
            Caption = 'Processed Count';
            DataClassification = CustomerContent;
        }
        field(4; "Error Count"; Integer)
        {
            Caption = 'Error Count';
            DataClassification = CustomerContent;
        }
        field(5; "Error Summary"; Text[2048])
        {
            Caption = 'Error Summary';
            DataClassification = CustomerContent;
        }
    }

    keys
    {
        key(PK; "Entry No.") { Clustered = true; }
    }
}
