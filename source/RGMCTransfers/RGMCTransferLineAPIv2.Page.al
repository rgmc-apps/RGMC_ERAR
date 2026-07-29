page 50328 "RGMC Transfer Line API v2"
{
    PageType = API;
    APIPublisher = 'rgmc';
    APIGroup = 'rgmccustom';
    APIVersion = 'v2.0';
    EntityName = 'transferLine';
    EntitySetName = 'transferLines';
    Caption = 'RGMC Transfer Line API v2';

    SourceTable = "Transfer Line";
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
            field(documentNo; Rec."Document No.")
            {
                Caption = 'documentNo';
                Editable = false;
            }
            field(lineNo; Rec."Line No.")
            {
                Caption = 'lineNo';
                Editable = false;
            }
            field(itemNo; Rec."Item No.")
            {
                Caption = 'itemNo';
            }
            field(description; Rec.Description)
            {
                Caption = 'description';
            }
            field(description2; Rec."Description 2")
            {
                Caption = 'description2';
            }
            field(variantCode; Rec."Variant Code")
            {
                Caption = 'variantCode';
            }
            field(unitOfMeasureCode; Rec."Unit of Measure Code")
            {
                Caption = 'unitOfMeasureCode';
            }
            field(qtyPerUnitOfMeasure; Rec."Qty. per Unit of Measure")
            {
                Caption = 'qtyPerUnitOfMeasure';
                Editable = false;
            }
            field(quantity; Rec.Quantity)
            {
                Caption = 'quantity';
            }
            field(qtyToShip; Rec."Qty. to Ship")
            {
                Caption = 'qtyToShip';
            }
            field(quantityShipped; Rec."Quantity Shipped")
            {
                Caption = 'quantityShipped';
                Editable = false;
            }
            field(qtyToReceive; Rec."Qty. to Receive")
            {
                Caption = 'qtyToReceive';
            }
            field(quantityReceived; Rec."Quantity Received")
            {
                Caption = 'quantityReceived';
                Editable = false;
            }
            field(outstandingQuantity; Rec."Outstanding Quantity")
            {
                Caption = 'outstandingQuantity';
                Editable = false;
            }
            field(shipmentDate; Rec."Shipment Date")
            {
                Caption = 'shipmentDate';
            }
            field(receiptDate; Rec."Receipt Date")
            {
                Caption = 'receiptDate';
            }
            field(transferFromCode; Rec."Transfer-from Code")
            {
                Caption = 'transferFromCode';
                Editable = false;
            }
            field(transferToCode; Rec."Transfer-to Code")
            {
                Caption = 'transferToCode';
                Editable = false;
            }
            field(inTransitCode; Rec."In-Transit Code")
            {
                Caption = 'inTransitCode';
                Editable = false;
            }
            field(shortcutDimension1Code; Rec."Shortcut Dimension 1 Code")
            {
                Caption = 'shortcutDimension1Code';
            }
            field(shortcutDimension2Code; Rec."Shortcut Dimension 2 Code")
            {
                Caption = 'shortcutDimension2Code';
            }
            field(companyName; CurrentCompanyName)
            {
                Caption = 'companyName';
                Editable = false;
            }
            field(lastModifiedDateTime; Rec.SystemModifiedAt)
            {
                Caption = 'lastModifiedDateTime';
                Editable = false;
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        CurrentCompanyName := CompanyName();
    end;

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        Rec.TestField("Document No.");
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

    var
        CurrentCompanyName: Text[30];
}
