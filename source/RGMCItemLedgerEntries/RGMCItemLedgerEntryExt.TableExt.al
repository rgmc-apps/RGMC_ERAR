tableextension 50456 "RGMC Item Ledger Entry Ext" extends "Item Ledger Entry"
{
    fields
    {
        // "Warranty Date" and "Originally Ordered No." are already defined by Base Application.
        // Fields below are genuinely absent from Table 32 in this BC27+LSC installation.
        field(50456; "Transfer Type"; Code[10])
        {
            Caption = 'Transfer Type';
            DataClassification = CustomerContent;
        }
        field(50457; "Batch No."; Code[50])
        {
            Caption = 'Batch No.';
            DataClassification = CustomerContent;
        }
        field(50458; "Offer No."; Code[20])
        {
            Caption = 'Offer No.';
            DataClassification = CustomerContent;
        }
        field(50459; "Promotion No."; Code[20])
        {
            Caption = 'Promotion No.';
            DataClassification = CustomerContent;
        }
        field(50460; "Statement No."; Code[20])
        {
            Caption = 'Statement No.';
            DataClassification = CustomerContent;
        }
        field(50461; "BI Timestamp"; DateTime)
        {
            Caption = 'BI Timestamp';
            DataClassification = CustomerContent;
        }
        field(50462; "RGMC Company"; Code[30])
        {
            Caption = 'RGMC Company';
            DataClassification = CustomerContent;
        }
    }
}
