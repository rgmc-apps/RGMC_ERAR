table 50302 "RGMC Item Price Buffer"
{
    Caption = 'RGMC Item Price Buffer';
    DataClassification = CustomerContent;
    TableType = Temporary;

    fields
    {
        field(1; "Entry No."; Integer)
        {
            Caption = 'Entry No.';
            DataClassification = CustomerContent;
        }
        field(2; "Price List Code"; Code[20])
        {
            Caption = 'Price List Code';
            DataClassification = CustomerContent;
        }
        field(3; "Product No."; Code[20])
        {
            Caption = 'Product No.';
            DataClassification = CustomerContent;
        }
        field(4; "Starting Date"; Date)
        {
            Caption = 'Starting Date';
            DataClassification = CustomerContent;
        }
        field(5; "Ending Date"; Date)
        {
            Caption = 'Ending Date';
            DataClassification = CustomerContent;
        }
        field(6; "Unit Price"; Decimal)
        {
            Caption = 'Unit Price';
            DataClassification = CustomerContent;
        }
        field(7; "Unit Price Inc VAT"; Decimal)
        {
            Caption = 'Unit Price Inc VAT';
            DataClassification = CustomerContent;
        }
        field(8; "Assign-to No."; Code[20])
        {
            Caption = 'Assign-to No.';
            DataClassification = CustomerContent;
        }
        field(9; "Currency Code"; Code[10])
        {
            Caption = 'Currency Code';
            DataClassification = CustomerContent;
        }
        field(10; "Unit of Measure Code"; Code[10])
        {
            Caption = 'Unit of Measure Code';
            DataClassification = CustomerContent;
        }
        field(11; "Minimum Quantity"; Decimal)
        {
            Caption = 'Minimum Quantity';
            DataClassification = CustomerContent;
        }
        field(12; "On Date"; Date)
        {
            Caption = 'On Date';
            DataClassification = CustomerContent;
        }
        field(13; "Family Code"; Code[20])
        {
            Caption = 'Family Code';
            DataClassification = CustomerContent;
        }
        field(14; "Item Id"; Guid)
        {
            Caption = 'Item Id';
            DataClassification = CustomerContent;
        }
        field(15; "Description"; Text[100])
        {
            Caption = 'Description';
            DataClassification = CustomerContent;
        }
        field(16; "Description 2"; Text[50])
        {
            Caption = 'Description 2';
            DataClassification = CustomerContent;
        }
        field(17; "Base Unit of Measure"; Code[10])
        {
            Caption = 'Base Unit of Measure';
            DataClassification = CustomerContent;
        }
        field(18; "Item Unit Price"; Decimal)
        {
            Caption = 'Item Unit Price';
            DataClassification = CustomerContent;
        }
        field(19; "Unit Cost"; Decimal)
        {
            Caption = 'Unit Cost';
            DataClassification = CustomerContent;
        }
        field(20; "Item Category Code"; Code[20])
        {
            Caption = 'Item Category Code';
            DataClassification = CustomerContent;
        }
        field(21; "Blocked"; Boolean)
        {
            Caption = 'Blocked';
            DataClassification = CustomerContent;
        }
        field(22; "Item Last Modified At"; DateTime)
        {
            Caption = 'Item Last Modified At';
            DataClassification = CustomerContent;
        }
        field(23; "Limit"; Integer)
        {
            Caption = 'Limit';
            DataClassification = CustomerContent;
        }
        field(24; "Offset"; Integer)
        {
            Caption = 'Offset';
            DataClassification = CustomerContent;
        }
    }

    keys
    {
        key(PK; "Entry No.") { Clustered = true; }
        key(ProductNo; "Product No.") { }
    }
}
