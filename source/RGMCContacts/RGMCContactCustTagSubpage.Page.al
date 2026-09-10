page 50348 "RGMC Contact Cust Tag Subpage"
{
    PageType = ListPart;
    Caption = 'Customer Tags';
    SourceTable = "RGMC Contact Customer Tag";
    DelayedInsert = true;
    InsertAllowed = true;
    ModifyAllowed = false;
    DeleteAllowed = true;

    layout
    {
        area(Content)
        {
            repeater(Lines)
            {
                field("Customer No."; Rec."Customer No.")
                {
                    Caption = 'Customer No.';
                    ApplicationArea = All;
                    TableRelation = Customer."No.";

                    trigger OnValidate()
                    var
                        Customer: Record Customer;
                    begin
                        if Customer.Get(Rec."Customer No.") then
                            CustomerName := Customer.Name
                        else
                            CustomerName := '';
                    end;
                }
                field(CustomerName; CustomerName)
                {
                    Caption = 'Customer Name';
                    ApplicationArea = All;
                    Editable = false;
                }
            }
        }
    }

    trigger OnAfterGetRecord()
    var
        Customer: Record Customer;
    begin
        CustomerName := '';
        if Customer.Get(Rec."Customer No.") then
            CustomerName := Customer.Name;
    end;

    var
        CustomerName: Text[100];
}
