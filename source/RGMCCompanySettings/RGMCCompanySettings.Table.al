table 50301 "RGMC Company Settings"
{
    Caption = 'RGMC Company Settings';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Company Name"; Code[30])
        {
            Caption = 'Company Name';
            DataClassification = CustomerContent;
        }
        field(2; "Consignment App Visible"; Boolean)
        {
            Caption = 'Consignment App Visible';
            DataClassification = CustomerContent;
        }
    }

    keys
    {
        key(PK; "Company Name")
        {
            Clustered = true;
        }
    }
}
