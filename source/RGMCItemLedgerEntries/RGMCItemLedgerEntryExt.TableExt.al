tableextension 50456 "RGMC Item Ledger Entry Ext" extends "Item Ledger Entry"
{
    fields
    {
        field(50456; "Transfer Type"; Code[10])
        {
            Caption = 'Transfer Type';
            DataClassification = CustomerContent;
        }
        field(50457; "Warranty Date"; Date)
        {
            Caption = 'Warranty Date';
            DataClassification = CustomerContent;
        }
        field(50458; "Originally Ordered No."; Code[20])
        {
            Caption = 'Originally Ordered No.';
            DataClassification = CustomerContent;
        }
    }
}
