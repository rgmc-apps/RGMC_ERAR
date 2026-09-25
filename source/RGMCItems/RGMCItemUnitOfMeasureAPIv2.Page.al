page 50353 "RGMC Item Unit Of Measure API v2"
{
    PageType = API;
    APIPublisher = 'rgmc';
    APIGroup = 'rgmccustom';
    APIVersion = 'v2.0';
    EntityName = 'itemUnitOfMeasure';
    EntitySetName = 'itemUnitsOfMeasure';
    Caption = 'RGMC Item Unit Of Measure API v2';

    SourceTable = "Item Unit of Measure";
    ODataKeyFields = SystemId;

    InsertAllowed = false;
    ModifyAllowed = false;
    DeleteAllowed = false;

    layout
    {
        area(Content)
        {
            field(id; Rec.SystemId)
            {
                Caption = 'id';
                Editable = false;
            }
            field(itemNo; Rec."Item No.")
            {
                Caption = 'itemNo';
                Editable = false;
            }
            field(code; Rec.Code)
            {
                Caption = 'code';
                Editable = false;
            }
            field(qtyPerUnitOfMeasure; Rec."Qty. per Unit of Measure")
            {
                Caption = 'qtyPerUnitOfMeasure';
                Editable = false;
            }
            field(description; Rec.Description)
            {
                Caption = 'description';
                Editable = false;
            }
        }
    }

    trigger OnOpenPage()
    begin
        Rec.SetLoadFields("Item No.", Code, "Qty. per Unit of Measure", Description);
    end;
}
