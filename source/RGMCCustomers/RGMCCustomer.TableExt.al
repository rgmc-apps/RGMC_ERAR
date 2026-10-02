tableextension 50450 "RGMC Customer" extends Customer
{
    fields
    {
        field(50450; "Brand Code"; Code[20])
        {
            Caption = 'Brand Code';
            DataClassification = CustomerContent;
            TableRelation = "Dimension Value".Code where("Dimension Code" = const('BRAND'));
        }
        field(50451; "Brand"; Code[20])
        {
            Caption = 'Brand';
            FieldClass = FlowField;
            CalcFormula = lookup("Default Dimension"."Dimension Value Code"
                where("Table ID" = const(18),
                      "Dimension Code" = const('BRAND'),
                      "No." = field("No.")));
            Editable = false;
        }
        field(50452; "Chain"; Boolean)
        {
            Caption = 'Chain';
            DataClassification = CustomerContent;
            InitValue = true;
        }
        // Named distinctly (not "Prod Shelf Life") — that exact name already
        // exists on Customer via a different, already-installed extension
        // (app ID c028b96e-f3ce-449e-8455-0d725060bf26), and BC rejects two
        // apps declaring the same field name on the same table at publish
        // time. This is RGMC's own, independent field.
        field(50453; "RGMC Prod Shelf Life"; Integer)
        {
            Caption = 'RGMC Prod Shelf Life';
            DataClassification = CustomerContent;
            MinValue = 0;
        }
    }
}
