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
        // GET filter parameters for lastModifiedDateTime
        field(50463; "RGMC Modified From"; Date)
        {
            Caption = 'RGMC Modified From';
            DataClassification = CustomerContent;
        }
        field(50464; "RGMC Modified To"; Date)
        {
            Caption = 'RGMC Modified To';
            DataClassification = CustomerContent;
        }
        field(50465; "RGMC Modified As Of Date"; Date)
        {
            Caption = 'RGMC Modified As Of Date';
            DataClassification = CustomerContent;
        }
        field(50466; "RGMC Modified Month"; Integer)
        {
            Caption = 'RGMC Modified Month';
            DataClassification = CustomerContent;
        }
        field(50467; "RGMC Modified Year"; Integer)
        {
            Caption = 'RGMC Modified Year';
            DataClassification = CustomerContent;
        }
        field(50468; "RGMC Limit"; Integer)
        {
            Caption = 'RGMC Limit';
            DataClassification = CustomerContent;
        }
        field(50469; "RGMC Offset"; Integer)
        {
            Caption = 'RGMC Offset';
            DataClassification = CustomerContent;
        }
        field(50470; "Originally Ordered Variant Code"; Code[10])
        {
            Caption = 'Originally Ordered Variant Code';
            DataClassification = CustomerContent;
        }
    }
}
