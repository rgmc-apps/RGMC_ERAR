page 50305 "RGMC AI Branch Names API v2"
{
    PageType = API;
    Caption = 'RGMC AI Lookup Branch Names API v2';
    APIPublisher = 'rgmc';
    APIGroup = 'rgmccustom';
    APIVersion = 'v2.0';
    EntityName = 'aiLookupBranchName';
    EntitySetName = 'aiLookupBranchNames';
    SourceTable = "RGMC AI Lookup Branch Name";
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
                field(shipToCode; Rec."Ship-to Code")
                {
                    Caption = 'shipToCode';
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
