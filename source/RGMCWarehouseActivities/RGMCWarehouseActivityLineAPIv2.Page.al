page 50352 "RGMC Whse Activity Line API v2"
{
    PageType = API;
    APIPublisher = 'rgmc';
    APIGroup = 'rgmccustom';
    APIVersion = 'v2.0';
    EntityName = 'warehouseActivityLine';
    EntitySetName = 'warehouseActivityLines';
    Caption = 'RGMC Warehouse Activity Line API v2.0';

    SourceTable = "Warehouse Activity Line";
    ODataKeyFields = SystemId;
    DelayedInsert = true;

    InsertAllowed = true;
    ModifyAllowed = true;
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
            field(documentNo; Rec."No.")
            {
                Caption = 'documentNo';
                Editable = false;
            }
            field(activityType; Rec."Activity Type")
            {
                Caption = 'activityType';
                Editable = false;
            }
            field(lineNo; Rec."Line No.")
            {
                Caption = 'lineNo';
                Editable = false;
            }
            field(sourceType; Rec."Source Type")
            {
                Caption = 'sourceType';
                Editable = false;
            }
            field(sourceSubtype; Rec."Source Subtype")
            {
                Caption = 'sourceSubtype';
                Editable = false;
            }
            field(sourceNo; Rec."Source No.")
            {
                Caption = 'sourceNo';
                Editable = false;
            }
            field(sourceLineNo; Rec."Source Line No.")
            {
                Caption = 'sourceLineNo';
                Editable = false;
            }
            field(sourceDocument; Rec."Source Document")
            {
                Caption = 'sourceDocument';
                Editable = false;
            }
            field(locationCode; Rec."Location Code")
            {
                Caption = 'locationCode';
            }
            field(binCode; Rec."Bin Code")
            {
                Caption = 'binCode';
            }
            field(zoneCode; Rec."Zone Code")
            {
                Caption = 'zoneCode';
            }
            field(itemNo; Rec."Item No.")
            {
                Caption = 'itemNo';
            }
            field(variantCode; Rec."Variant Code")
            {
                Caption = 'variantCode';
            }
            field(unitOfMeasureCode; Rec."Unit of Measure Code")
            {
                Caption = 'unitOfMeasureCode';
            }
            field(description; Rec.Description)
            {
                Caption = 'description';
            }
            field(description2; Rec."Description 2")
            {
                Caption = 'description2';
            }
            field(quantity; Rec.Quantity)
            {
                Caption = 'quantity';
            }
            field(qtyOutstanding; Rec."Qty. Outstanding")
            {
                Caption = 'qtyOutstanding';
                Editable = false;
            }
            field(qtyToHandle; Rec."Qty. to Handle")
            {
                Caption = 'qtyToHandle';
            }
            field(qtyHandled; Rec."Qty. Handled")
            {
                Caption = 'qtyHandled';
                Editable = false;
            }
            field(actionType; Rec."Action Type")
            {
                Caption = 'actionType';
            }
            field(dueDate; Rec."Due Date")
            {
                Caption = 'dueDate';
            }
            field(binTypeCode; Rec."Bin Type Code")
            {
                Caption = 'binTypeCode';
                Editable = false;
            }
            field(lotNo; Rec."Lot No.")
            {
                Caption = 'lotNo';
            }
            field(serialNo; Rec."Serial No.")
            {
                Caption = 'serialNo';
            }
            field(packageNo; Rec."Package No.")
            {
                Caption = 'packageNo';
            }
            field(whseDocumentType; Rec."Whse. Document Type")
            {
                Caption = 'whseDocumentType';
                Editable = false;
            }
            field(whseDocumentNo; Rec."Whse. Document No.")
            {
                Caption = 'whseDocumentNo';
                Editable = false;
            }
            field(whseDocumentLineNo; Rec."Whse. Document Line No.")
            {
                Caption = 'whseDocumentLineNo';
                Editable = false;
            }
        }
    }

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        Rec.TestField("Activity Type");
        Rec.TestField("No.");
        Rec.TestField("Item No.");
        exit(true);
    end;

    trigger OnModifyRecord(): Boolean
    begin
        exit(true);
    end;

    trigger OnDeleteRecord(): Boolean
    begin
        exit(true);
    end;
}
