tableextension 50459 "RGMC Company" extends Company
{
    fields
    {
        field(50459; "Food Consignment Visible"; Boolean)
        {
            Caption = 'Food Consignment Visible';
            DataClassification = CustomerContent;
            InitValue = false;
        }
    }
}
