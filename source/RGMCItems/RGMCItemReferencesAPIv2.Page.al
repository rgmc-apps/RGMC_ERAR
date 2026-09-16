page 50347 "RGMC Item References API v2"
{
    PageType = API;
    APIPublisher = 'rgmc';
    APIGroup = 'rgmccustom';
    APIVersion = 'v2.0';
    EntityName = 'itemReference';
    EntitySetName = 'itemReferences';
    Caption = 'RGMC Item References API v2';
    SourceTable = "Item Reference";
    ODataKeyFields = SystemId;
    InsertAllowed = false;
    ModifyAllowed = false;
    DeleteAllowed = false;

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
                field(itemNo; Rec."Item No.")
                {
                    Caption = 'itemNo';
                }
                field(referenceNo; Rec."Reference No.")
                {
                    Caption = 'referenceNo';
                }
                field(referenceType; Rec."Reference Type")
                {
                    Caption = 'referenceType';
                }
                field(referenceTypeNo; Rec."Reference Type No.")
                {
                    Caption = 'referenceTypeNo';
                }
                field(unitOfMeasure; Rec."Unit of Measure")
                {
                    Caption = 'unitOfMeasure';
                }
                field(description; Rec.Description)
                {
                    Caption = 'description';
                }
            }
        }
    }
}
