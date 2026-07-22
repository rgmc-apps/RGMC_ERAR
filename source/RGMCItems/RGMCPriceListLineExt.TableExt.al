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

    keys
    {
        // Backs the SetCurrentKey("Product No.", "Starting Date") range scan in
        // RGMCItemPriceAPIv3. Without a real SQL index here, BC falls back to an
        // in-memory sort of the full table on every API call — which is the primary
        // timeout risk on large Price List Line tables in cloud tenants.
        key(RGMCItemPriceProductDate; "Product No.", "Starting Date") { }
    }
}
