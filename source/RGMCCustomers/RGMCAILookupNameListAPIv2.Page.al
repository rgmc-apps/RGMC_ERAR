page 50302 "RGMC AI Lookup Names API v2"
{
    PageType = API;
    Caption = 'RGMC AI Lookup Names API v2';
    APIPublisher = 'rgmc';
    APIGroup = 'rgmccustom';
    APIVersion = 'v2.0';
    EntityName = 'aiLookupName';
    EntitySetName = 'aiLookupNames';
    SourceTable = "RGMC AI Lookup Name List";
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
            }
        }
    }
}
