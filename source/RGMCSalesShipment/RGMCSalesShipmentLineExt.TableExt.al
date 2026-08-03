tableextension 50457 "RGMC Sales Shipment Line Ext" extends "Sales Shipment Line"
{
    fields
    {
        // Standard BC fields absent from Table 111 in this BC27 installation
        field(50456; "Unit of Measure Cross Ref."; Code[10])
        {
            Caption = 'Unit of Measure Cross Ref.';
            DataClassification = CustomerContent;
        }
        field(50457; "Vendor No."; Code[20])
        {
            Caption = 'Vendor No.';
            DataClassification = CustomerContent;
        }
        field(50458; "Estimated Delivery Date"; Date)
        {
            Caption = 'Estimated Delivery Date';
            DataClassification = CustomerContent;
        }

        // LSC retail / delivery fields absent from Table 111 in this BC27+LSC installation
        field(50459; Sourcing; Code[10])
        {
            Caption = 'Sourcing';
            DataClassification = CustomerContent;
        }
        field(50460; "Deliver from"; Code[20])
        {
            Caption = 'Deliver from';
            DataClassification = CustomerContent;
        }
        field(50461; "Return Policy"; Code[20])
        {
            Caption = 'Return Policy';
            DataClassification = CustomerContent;
        }
        field(50462; "Delivering Method"; Code[20])
        {
            Caption = 'Delivering Method';
            DataClassification = CustomerContent;
        }
        field(50463; "Item Tracking No."; Code[50])
        {
            Caption = 'Item Tracking No.';
            DataClassification = CustomerContent;
        }
        field(50464; "Configuration ID"; Code[20])
        {
            Caption = 'Configuration ID';
            DataClassification = CustomerContent;
        }
        field(50465; "Delivery User ID"; Code[50])
        {
            Caption = 'Delivery User ID';
            DataClassification = CustomerContent;
        }
        field(50466; "Option Value Text"; Text[100])
        {
            Caption = 'Option Value Text';
            DataClassification = CustomerContent;
        }
        field(50467; "SPO Whse Location"; Code[20])
        {
            Caption = 'SPO Whse Location';
            DataClassification = CustomerContent;
        }
        field(50468; "Delivery Date Time"; DateTime)
        {
            Caption = 'Delivery Date Time';
            DataClassification = CustomerContent;
        }
        field(50469; "No later than Date"; Date)
        {
            Caption = 'No later than Date';
            DataClassification = CustomerContent;
        }
        field(50470; "Vendor Delivers to"; Code[20])
        {
            Caption = 'Vendor Delivers to';
            DataClassification = CustomerContent;
        }
        field(50471; "SPO Document Method"; Code[20])
        {
            Caption = 'SPO Document Method';
            DataClassification = CustomerContent;
        }
        field(50472; "Retail Special Order"; Boolean)
        {
            Caption = 'Retail Special Order';
            DataClassification = CustomerContent;
        }
        field(50473; "Store Sales Location"; Code[20])
        {
            Caption = 'Store Sales Location';
            DataClassification = CustomerContent;
        }
        field(50474; "Delivery Reference No"; Code[50])
        {
            Caption = 'Delivery Reference No';
            DataClassification = CustomerContent;
        }
        field(50475; "Delivery Location Code"; Code[20])
        {
            Caption = 'Delivery Location Code';
            DataClassification = CustomerContent;
        }
    }
}
