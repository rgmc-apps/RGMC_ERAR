tableextension 50455 "RGMC Price List Header Ext" extends "Price List Header"
{
    fields
    {
        field(50455; "Item Family Code"; Code[20])
        {
            Caption = 'Item Family Code';
            DataClassification = CustomerContent;
            TableRelation = "LSC Item Family".Code;
            ValidateTableRelation = false;

            trigger OnValidate()
            var
                ItemFamily: Record "LSC Item Family";
            begin
                if ("Item Family Code" = '') or ("Item Family Code" = 'ALL') then
                    exit;
                if not ItemFamily.Get("Item Family Code") then
                    Error('Item Family Code ''%1'' does not exist.', "Item Family Code");
            end;
        }
    }
}
