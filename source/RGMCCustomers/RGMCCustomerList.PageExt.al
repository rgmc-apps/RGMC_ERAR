pageextension 50493 "RGMC Customer List" extends "Customer List"
{
    layout
    {
        addlast(Control1)
        {
            field("Brand Code"; Rec."Brand Code")
            {
                Caption = 'Brand Code';
                ApplicationArea = All;
                ToolTip = 'Specifies the brand code synced from the Brand dimension value assigned to this customer.';
            }
        }
    }

    actions
    {
        addlast(processing)
        {
            action(PopulateBrandCodes)
            {
                Caption = 'Populate Brand Codes';
                ApplicationArea = All;
                Image = Refresh;
                ToolTip = 'Copies the Brand dimension value into the Brand Code field for all customers.';

                trigger OnAction()
                var
                    Customer: Record Customer;
                    DefaultDim: Record "Default Dimension";
                begin
                    if not Confirm('This will overwrite Brand Codes for all customers. Continue?') then
                        exit;
                    if Customer.FindSet(true) then
                        repeat
                            if DefaultDim.Get(DATABASE::Customer, Customer."No.", 'BRAND') then
                                Customer."Brand Code" := DefaultDim."Dimension Value Code"
                            else
                                Customer."Brand Code" := '';
                            Customer.Modify(true);
                        until Customer.Next() = 0;
                    Message('Brand codes populated.');
                end;
            }
        }
    }
}
