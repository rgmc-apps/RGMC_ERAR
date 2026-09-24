page 50350 "RGMC Ship-To Addresses API v2"
{
    PageType = API;
    Caption = 'RGMC Ship-To Addresses API v2';
    APIPublisher = 'rgmc';
    APIGroup = 'rgmccustom';
    APIVersion = 'v2.0';
    EntityName = 'shipToAddress';
    EntitySetName = 'shipToAddresses';
    SourceTable = "Ship-to Address";
    ODataKeyFields = SystemId;
    InsertAllowed = false;
    ModifyAllowed = false;
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
                    Caption = 'id';
                    Editable = false;
                }
                field(customerNumber; Rec."Customer No.")
                {
                    Caption = 'customerNumber';
                }
                field(code; Rec.Code)
                {
                    Caption = 'code';
                }
                field(name; Rec.Name)
                {
                    Caption = 'name';
                }
                field(address; Rec.Address)
                {
                    Caption = 'address';
                }
                field(city; Rec.City)
                {
                    Caption = 'city';
                }
                field(locationCode; Rec."Location Code")
                {
                    Caption = 'locationCode';
                }
                field(shipmentMethodCode; Rec."Shipment Method Code")
                {
                    Caption = 'shipmentMethodCode';
                }
                field(lookupCode; Rec."Lookup Code")
                {
                    Caption = 'lookupCode';
                }
            }
        }
    }
}
