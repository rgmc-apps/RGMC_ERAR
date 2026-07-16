tableextension 50454 "RGMC Price List Line Item Ext" extends "Price List Line"
{
    // Adds Item master-data FlowFields to Price List Line so item attributes are
    // available in BC native pages without a separate Item lookup.
    // Note: Guid (itemId) and DateTime (lastModifiedDateTime) are not supported as
    // FlowField types — those fields are only exposed via the v3 API buffer.
    fields
    {
        field(50410; "Item Description"; Text[100])
        {
            Caption = 'Item Description';
            FieldClass = FlowField;
            CalcFormula = lookup(Item.Description where("No." = field("Product No.")));
            Editable = false;
        }
        field(50411; "Item Description 2"; Text[50])
        {
            Caption = 'Item Description 2';
            FieldClass = FlowField;
            CalcFormula = lookup(Item."Description 2" where("No." = field("Product No.")));
            Editable = false;
        }
        field(50412; "Item Base Unit of Measure"; Code[10])
        {
            Caption = 'Item Base Unit of Measure';
            FieldClass = FlowField;
            CalcFormula = lookup(Item."Base Unit of Measure" where("No." = field("Product No.")));
            Editable = false;
        }
        field(50413; "Item Unit Price"; Decimal)
        {
            Caption = 'Item Unit Price';
            FieldClass = FlowField;
            CalcFormula = lookup(Item."Unit Price" where("No." = field("Product No.")));
            Editable = false;
        }
        field(50414; "Item Unit Cost"; Decimal)
        {
            Caption = 'Item Unit Cost';
            FieldClass = FlowField;
            CalcFormula = lookup(Item."Unit Cost" where("No." = field("Product No.")));
            Editable = false;
        }
        field(50415; "Item Category Code"; Code[20])
        {
            Caption = 'Item Category Code';
            FieldClass = FlowField;
            CalcFormula = lookup(Item."Item Category Code" where("No." = field("Product No.")));
            Editable = false;
        }
        field(50416; "Item Blocked"; Boolean)
        {
            Caption = 'Item Blocked';
            FieldClass = FlowField;
            CalcFormula = lookup(Item.Blocked where("No." = field("Product No.")));
            Editable = false;
        }
        field(50417; "Item Family Code"; Code[20])
        {
            Caption = 'Item Family Code';
            FieldClass = FlowField;
            CalcFormula = lookup(Item."LSC Item Family Code" where("No." = field("Product No.")));
            Editable = false;
        }
    }
}
