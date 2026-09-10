pageextension 50495 "RGMC Contact Cust Tag Ext" extends "Contact Card"
{
    layout
    {
        addlast(content)
        {
            part(CustomerTags; "RGMC Contact Cust Tag Subpage")
            {
                Caption = 'Customer Tags';
                ApplicationArea = All;
                SubPageLink = "Contact No." = field("No.");
            }
        }
    }
}
