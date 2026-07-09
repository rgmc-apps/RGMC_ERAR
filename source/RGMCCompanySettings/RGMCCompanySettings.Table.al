table 50301 "RGMC Company Settings"
{
    Caption = 'RGMC Company Settings';
    DataPerCompany = false;
    DataClassification = CustomerContent;
    InherentPermissions = RIMD;
    InherentEntitlements = RIMD;

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
        field(3; "Display Name"; Text[250])
        {
            Caption = 'Display Name';
            DataClassification = CustomerContent;
        }
        field(4; "Evaluation Company"; Boolean)
        {
            Caption = 'Evaluation Company';
            DataClassification = CustomerContent;
        }
        field(5; "Business Profile Id"; Text[250])
        {
            Caption = 'Business Profile Id';
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
