page 50343 "RGMC Purchase Order Lines v2"
{
    PageType = API;
    APIPublisher = 'rgmc';
    APIGroup = 'rgmccustom';
    APIVersion = 'v2.0';
    EntityName = 'purchaseOrderLine';
    EntitySetName = 'purchaseOrderLines';
    Caption = 'RGMC Purchase Order Lines v2';

    SourceTable = "Purchase Line";
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
            // ── Identity ─────────────────────────────────────────────────────────
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

            // ── Item ─────────────────────────────────────────────────────────────
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
            field(variantCode; Rec."Variant Code")
            {
                Caption = 'variantCode';
            }
            field(unitOfMeasureCode; Rec."Unit of Measure Code")
            {
                Caption = 'unitOfMeasureCode';
            }

            // ── Quantities ───────────────────────────────────────────────────────
            field(quantity; Rec.Quantity)
            {
                Caption = 'quantity';
            }
            field(quantityReceived; Rec."Quantity Received")
            {
                Caption = 'quantityReceived';
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

            // ── Pricing ──────────────────────────────────────────────────────────
            field(directUnitCost; Rec."Direct Unit Cost")
            {
                Caption = 'directUnitCost';
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

            // ── Logistics ────────────────────────────────────────────────────────
            field(expectedReceiptDate; Rec."Expected Receipt Date")
            {
                Caption = 'expectedReceiptDate';
            }
            field(locationCode; Rec."Location Code")
            {
                Caption = 'locationCode';
            }
            field(jobNo; Rec."Job No.")
            {
                Caption = 'jobNo';
            }

            // ── Dimensions ───────────────────────────────────────────────────────
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
        if Rec."Quantity Received" <> 0 then
            Error('Line %1 on Purchase Order %2 cannot be deleted because %3 units have already been received.',
                  Rec."Line No.", Rec."Document No.", Rec."Quantity Received");
        exit(true);
    end;
}
