page 50306 "RGMC Customer API v2"
{
    PageType = API;
    Caption = 'RGMC Customer API v2';
    APIPublisher = 'rgmc';
    APIGroup = 'rgmccustom';
    APIVersion = 'v2.0';
    EntityName = 'customer';
    EntitySetName = 'customers';
    SourceTable = Customer;
    ODataKeyFields = SystemId;
    DelayedInsert = true;
    InsertAllowed = false;
    ModifyAllowed = true;
    DeleteAllowed = false;
    InherentPermissions = X;

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field(id; Rec.SystemId)
                {
                    Caption = 'id', Locked = true;
                    Editable = false;
                }
                field(customerNo; Rec."No.")
                {
                    Caption = 'customerNo', Locked = true;
                    Editable = false;
                }
                field(name; Rec.Name)
                {
                    Caption = 'name', Locked = true;
                    Editable = false;
                }
                field(email; Rec."E-Mail")
                {
                    Caption = 'email', Locked = true;
                    Editable = false;
                }
                field(phoneNo; Rec."Phone No.")
                {
                    Caption = 'phoneNo', Locked = true;
                    Editable = false;
                }
                field(address; Rec.Address)
                {
                    Caption = 'address', Locked = true;
                    Editable = false;
                }
                field(city; Rec.City)
                {
                    Caption = 'city', Locked = true;
                    Editable = false;
                }
                field(county; Rec.County)
                {
                    Caption = 'county', Locked = true;
                    Editable = false;
                }
                field(postCode; Rec."Post Code")
                {
                    Caption = 'postCode', Locked = true;
                    Editable = false;
                }
                field(countryRegionCode; Rec."Country/Region Code")
                {
                    Caption = 'countryRegionCode', Locked = true;
                    Editable = false;
                }
                field(brandCode; Rec."Brand Code")
                {
                    Caption = 'brandCode', Locked = true;
                }
                field(brand; Rec."Brand")
                {
                    Caption = 'brand', Locked = true;
                    Editable = false;
                }
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        Rec.CalcFields("Brand");
    end;
}
