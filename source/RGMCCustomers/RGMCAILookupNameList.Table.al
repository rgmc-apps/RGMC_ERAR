table 50348 "RGMC AI Lookup Name List"
{
    Caption = 'AI Lookup Name List';
    DataCaptionFields = "Customer No.", "Code", "Name";
    LookupPageID = "RGMC AI Lookup Name List";
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Customer No."; Code[20])
        {
            Caption = 'Customer No.';
            DataClassification = CustomerContent;
            NotBlank = true;
            TableRelation = Customer."No.";
        }
        field(2; "Code"; Code[10])
        {
            Caption = 'Code';
            DataClassification = CustomerContent;
            NotBlank = true;
            ToolTip = 'Specifies a short identifier for this AI lookup name entry.';
        }
        field(3; "Name"; Text[100])
        {
            Caption = 'AI Lookup Name';
            DataClassification = CustomerContent;
            ToolTip = 'Specifies the customer name as it appears on uploaded purchase order documents, used to match the PO to this customer.';
        }
    }

    keys
    {
        key(PK; "Customer No.", "Code") { Clustered = true; }
    }
}
