page 50316 "RGMC Sales Order Lines API v2"
{
    PageType = API;
    APIPublisher = 'rgmc';
    APIGroup = 'rgmccustom';
    APIVersion = 'v2.0';
    EntityName = 'salesOrderLine';
    EntitySetName = 'salesOrderLines';
    Caption = 'RGMC Sales Order Lines API v2';

    SourceTable = "Sales Line";
    SourceTableView = where("Document Type" = const("Order"));
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
            field(quantityShipped; Rec."Quantity Shipped")
            {
                Caption = 'quantityShipped';
                Editable = false;
            }
            field(quantityInvoiced; Rec."Quantity Invoiced")
            {
                Caption = 'quantityInvoiced';
                Editable = false;
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
            field(shipmentDate; Rec."Shipment Date")
            {
                Caption = 'shipmentDate';
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
        Rec."Document Type" := Rec."Document Type"::Order;
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
        if Rec."Quantity Shipped" <> 0 then
            Error('Line %1 on Sales Order %2 cannot be deleted because %3 units have already been shipped.',
                  Rec."Line No.", Rec."Document No.", Rec."Quantity Shipped");
        exit(true);
    end;
}
