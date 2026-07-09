page 50314 "RGMC SRO Lines API v2"
{
    PageType = API;
    APIPublisher = 'rgmc';
    APIGroup = 'rgmccustom';
    APIVersion = 'v2.0';
    EntityName = 'salesReturnOrderLine';
    EntitySetName = 'salesReturnOrderLines';
    Caption = 'RGMC SRO Lines API v2';

    SourceTable = "Sales Line";
    SourceTableView = where("Document Type" = const("Return Order"));
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
            field(lineType; Rec.Type)
            {
                Caption = 'lineType';
            }
            field(number; Rec."No.")
            {
                Caption = 'number';
            }
            field(description; Rec.Description)
            {
                Caption = 'description';
            }
            field(description2; Rec."Description 2")
            {
                Caption = 'description2';
            }
            field(unitOfMeasureCode; Rec."Unit of Measure Code")
            {
                Caption = 'unitOfMeasureCode';
            }
            field(quantity; Rec.Quantity)
            {
                Caption = 'quantity';
            }
            field(returnQtyToReceive; Rec."Return Qty. to Receive")
            {
                Caption = 'returnQtyToReceive';
            }
            field(returnQtyReceived; Rec."Return Qty. Received")
            {
                Caption = 'returnQtyReceived';
                Editable = false;
            }
            field(qtyToInvoice; Rec."Qty. to Invoice")
            {
                Caption = 'qtyToInvoice';
            }
            field(outstandingQuantity; Rec."Outstanding Quantity")
            {
                Caption = 'outstandingQuantity';
                Editable = false;
            }
            field(unitPrice; Rec."Unit Price")
            {
                Caption = 'unitPrice';
            }
            field(unitCostLcy; Rec."Unit Cost (LCY)")
            {
                Caption = 'unitCostLcy';
                Editable = false;
            }
            field(lineDiscountPercent; Rec."Line Discount %")
            {
                Caption = 'lineDiscountPercent';
            }
            field(lineDiscountAmount; Rec."Line Discount Amount")
            {
                Caption = 'lineDiscountAmount';
                Editable = false;
            }
            field(lineAmount; Rec."Line Amount")
            {
                Caption = 'lineAmount';
            }
            field(vatPercent; Rec."VAT %")
            {
                Caption = 'vatPercent';
                Editable = false;
            }
            field(returnReasonCode; Rec."Return Reason Code")
            {
                Caption = 'returnReasonCode';
            }
            field(locationCode; Rec."Location Code")
            {
                Caption = 'locationCode';
            }
            field(shortcutDimension1Code; Rec."Shortcut Dimension 1 Code")
            {
                Caption = 'shortcutDimension1Code';
            }
            field(shortcutDimension2Code; Rec."Shortcut Dimension 2 Code")
            {
                Caption = 'shortcutDimension2Code';
            }
        }
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Document Type" := Rec."Document Type"::"Return Order";
    end;

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        Rec.TestField(Type);
        Rec.TestField("No.");
        if Rec.Quantity <= 0 then
            Error('Quantity on line %1 must be greater than zero.', Rec."Line No.");
        exit(true);
    end;

    trigger OnModifyRecord(): Boolean
    begin
        exit(true);
    end;

    trigger OnDeleteRecord(): Boolean
    begin
        if Rec."Return Qty. Received" <> 0 then
            Error('Line %1 on Return Order %2 cannot be deleted because %3 units have already been received.',
                  Rec."Line No.", Rec."Document No.", Rec."Return Qty. Received");
        exit(true);
    end;
}
