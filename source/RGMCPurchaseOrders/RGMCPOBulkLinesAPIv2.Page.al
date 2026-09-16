page 50345 "RGMC PO Bulk Lines API v2"
{
    PageType = API;
    APIPublisher = 'rgmc';
    APIGroup = 'rgmccustom';
    APIVersion = 'v2.0';
    EntityName = 'purchaseOrderBulkLine';
    EntitySetName = 'purchaseOrderBulkLines';
    Caption = 'RGMC PO Bulk Lines API v2';

    SourceTable = "RGMC PO Bulk Line";
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
            field(importId; Rec."Import Id")
            {
                Caption = 'importId';
            }
            field(lineNo; Rec."Line No.")
            {
                Caption = 'lineNo';
            }
            field(lineType; Rec."Type")
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
            field(quantity; Rec.Quantity)
            {
                Caption = 'quantity';
            }
            field(directUnitCost; Rec."Direct Unit Cost")
            {
                Caption = 'directUnitCost';
            }
            field(lineDiscountPercent; Rec."Line Discount %")
            {
                Caption = 'lineDiscountPercent';
            }
            field(locationCode; Rec."Location Code")
            {
                Caption = 'locationCode';
            }
            field(expectedReceiptDate; Rec."Expected Receipt Date")
            {
                Caption = 'expectedReceiptDate';
            }
            field(jobNo; Rec."Job No.")
            {
                Caption = 'jobNo';
            }
            field(shortcutDimension1Code; Rec."Shortcut Dimension 1 Code")
            {
                Caption = 'shortcutDimension1Code';
            }
            field(shortcutDimension2Code; Rec."Shortcut Dimension 2 Code")
            {
                Caption = 'shortcutDimension2Code';
            }
            field(errorMessage; Rec."Error Message")
            {
                Caption = 'errorMessage';
                Editable = false;
            }
        }
    }
}
