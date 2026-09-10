page 50347 "RGMC Contact Cust Tag API v2"
{
    PageType = API;
    APIPublisher = 'rgmc';
    APIGroup = 'rgmccustom';
    APIVersion = 'v2.0';
    EntityName = 'customerTag';
    EntitySetName = 'customerTags';
    Caption = 'RGMC Contact Customer Tag API v2';

    SourceTable = "RGMC Contact Customer Tag";
    ODataKeyFields = SystemId;

    DelayedInsert = true;
    InsertAllowed = true;
    ModifyAllowed = false;
    DeleteAllowed = true;

    layout
    {
        area(Content)
        {
            field(id; Rec.SystemId)
            {
                Caption = 'id';
                Editable = false;
            }
            field(contactNo; Rec."Contact No.")
            {
                Caption = 'contactNo';
            }
            field(customerNo; Rec."Customer No.")
            {
                Caption = 'customerNo';
            }
            field(customerName; CustomerName)
            {
                Caption = 'customerName';
                Editable = false;
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
