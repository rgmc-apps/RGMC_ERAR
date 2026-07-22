page 50310 "RGMC Item API v2"
{
    PageType = API;
    APIPublisher = 'rgmc';
    APIGroup = 'rgmccustom';
    APIVersion = 'v2.0';
    EntityName = 'item';
    EntitySetName = 'items';
    Caption = 'RGMC Item API v2';

    SourceTable = Item;
    ODataKeyFields = SystemId;

    DelayedInsert = true;
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
            field(number; Rec."No.")
            {
                Caption = 'number';
                Editable = false;
            }
            field(description; Rec.Description)
            {
                Caption = 'description';
                Editable = false;
            }
            field(description2; Rec."Description 2")
            {
                Caption = 'description2';
                Editable = false;
            }
            field(itemCategoryCode; Rec."Item Category Code")
            {
                Caption = 'itemCategoryCode';
                Editable = false;
            }
            field(familyCode; Rec."LSC Item Family Code")
            {
                Caption = 'familyCode';
                Editable = false;
            }
            field(baseUnitOfMeasure; Rec."Base Unit of Measure")
            {
                Caption = 'baseUnitOfMeasure';
                Editable = false;
            }
            field(unitPrice; Rec."Unit Price")
            {
                Caption = 'unitPrice';
                Editable = false;
            }
            field(unitCost; Rec."Unit Cost")
            {
                Caption = 'unitCost';
                Editable = false;
            }
            field(blocked; Rec.Blocked)
            {
                Caption = 'blocked';
                Editable = false;
            }
            field(lastModifiedDateTime; Rec.SystemModifiedAt)
            {
                Caption = 'lastModifiedDateTime';
                Editable = false;
            }
        }
    }

    trigger OnOpenPage()
    begin
        // Item in LS Central carries dozens of extension columns from LSC and other apps.
        // Limiting the SELECT to only the fields this page exposes cuts data transfer
        // substantially on every GET request.
        Rec.SetLoadFields(
            SystemId, "No.", Description, "Description 2",
            "Item Category Code", "LSC Item Family Code",
            "Base Unit of Measure", "Unit Price", "Unit Cost",
            Blocked, SystemModifiedAt
        );
    end;
}
