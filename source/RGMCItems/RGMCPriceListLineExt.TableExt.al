tableextension 50453 "RGMC Price List Line Ext" extends "Price List Line"
{
    fields
    {
        field(50401; "Effective Date"; Code[10])
        {
            Caption = 'Effective Date';
            FieldClass = FlowFilter;
        }
    }
}
