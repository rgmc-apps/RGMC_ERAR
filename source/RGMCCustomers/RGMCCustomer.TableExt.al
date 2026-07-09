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
    }
}
