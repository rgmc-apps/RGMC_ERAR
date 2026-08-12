tableextension 50453 "RGMC Price List Line Ext" extends "Price List Line"
{
    fields
    {
        field(50401; "Effective Date"; Code[10])
        {
            Caption = 'Effective Date';
            FieldClass = FlowFilter;
        }
        field(50402; "RGMC Company"; Code[30])
        {
            Caption = 'RGMC Company';
            DataClassification = CustomerContent;
        }
        // GET filter parameters for lastModifiedDateTime
        field(50403; "RGMC Modified From"; Date)
        {
            Caption = 'RGMC Modified From';
            DataClassification = CustomerContent;
        }
        field(50404; "RGMC Modified To"; Date)
        {
            Caption = 'RGMC Modified To';
            DataClassification = CustomerContent;
        }
        field(50405; "RGMC Modified As Of Date"; Date)
        {
            Caption = 'RGMC Modified As Of Date';
            DataClassification = CustomerContent;
        }
        field(50406; "RGMC Modified Month"; Integer)
        {
            Caption = 'RGMC Modified Month';
            DataClassification = CustomerContent;
        }
        field(50407; "RGMC Modified Year"; Integer)
        {
            Caption = 'RGMC Modified Year';
            DataClassification = CustomerContent;
        }
        field(50408; "RGMC Limit"; Integer)
        {
            Caption = 'RGMC Limit';
            DataClassification = CustomerContent;
        }
        field(50409; "RGMC Offset"; Integer)
        {
            Caption = 'RGMC Offset';
            DataClassification = CustomerContent;
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
