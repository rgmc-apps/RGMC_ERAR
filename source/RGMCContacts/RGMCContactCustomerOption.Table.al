table 50347 "RGMC Contact Customer Tag"
{
    Caption = 'RGMC Contact Customer Tag';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Contact No."; Code[20])
        {
            Caption = 'Contact No.';
            DataClassification = CustomerContent;
            TableRelation = Contact."No.";
        }
        field(2; "Customer No."; Code[20])
        {
            Caption = 'Customer No.';
            DataClassification = CustomerContent;
            TableRelation = Customer."No.";
        }
    }

    keys
    {
        key(PK; "Contact No.", "Customer No.") { Clustered = true; }
    }
}
