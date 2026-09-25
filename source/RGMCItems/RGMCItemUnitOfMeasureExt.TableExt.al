tableextension 50459 "RGMC Item Unit Of Measure" extends "Item Unit of Measure"
{
    // Item Unit of Measure has no Description of its own; look it up from the
    // standard Unit of Measure table by Code so the API can expose a readable label.
    fields
    {
        field(50350; Description; Text[50])
        {
            Caption = 'Description';
            FieldClass = FlowField;
            CalcFormula = lookup("Unit of Measure".Description where(Code = field(Code)));
            Editable = false;
        }
    }
}
