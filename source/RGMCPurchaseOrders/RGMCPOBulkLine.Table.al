table 50345 "RGMC PO Bulk Line"
{
    Caption = 'RGMC PO Bulk Line';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Import Id"; Guid)
        {
            Caption = 'Import Id';
            DataClassification = CustomerContent;
            TableRelation = "RGMC PO Bulk Header"."Import Id";
        }
        field(2; "Line No."; Integer)
        {
            Caption = 'Line No.';
            DataClassification = CustomerContent;
        }
        field(3; "Type"; Text[50])
        {
            Caption = 'Type';
            DataClassification = CustomerContent;
        }
        field(4; "No."; Code[20])
        {
            Caption = 'No.';
            DataClassification = CustomerContent;
        }
        field(5; Description; Text[100])
        {
            Caption = 'Description';
            DataClassification = CustomerContent;
        }
        field(6; "Description 2"; Text[50])
        {
            Caption = 'Description 2';
            DataClassification = CustomerContent;
        }
        field(7; "Variant Code"; Code[10])
        {
            Caption = 'Variant Code';
            DataClassification = CustomerContent;
        }
        field(8; "Unit of Measure Code"; Code[10])
        {
            Caption = 'Unit of Measure Code';
            DataClassification = CustomerContent;
        }
        field(9; Quantity; Decimal)
        {
            Caption = 'Quantity';
            DataClassification = CustomerContent;
        }
        field(10; "Direct Unit Cost"; Decimal)
        {
            Caption = 'Direct Unit Cost';
            DataClassification = CustomerContent;
        }
        field(11; "Line Discount %"; Decimal)
        {
            Caption = 'Line Discount %';
            DataClassification = CustomerContent;
        }
        field(12; "Location Code"; Code[10])
        {
            Caption = 'Location Code';
            DataClassification = CustomerContent;
        }
        field(13; "Expected Receipt Date"; Date)
        {
            Caption = 'Expected Receipt Date';
            DataClassification = CustomerContent;
        }
        field(14; "Job No."; Code[20])
        {
            Caption = 'Job No.';
            DataClassification = CustomerContent;
        }
        field(15; "Shortcut Dimension 1 Code"; Code[20])
        {
            Caption = 'Shortcut Dimension 1 Code';
            DataClassification = CustomerContent;
        }
        field(16; "Shortcut Dimension 2 Code"; Code[20])
        {
            Caption = 'Shortcut Dimension 2 Code';
            DataClassification = CustomerContent;
        }
        field(17; "Error Message"; Text[250])
        {
            Caption = 'Error Message';
            DataClassification = CustomerContent;
        }
    }

    keys
    {
        key(PK; "Import Id", "Line No.") { Clustered = true; }
    }
}
