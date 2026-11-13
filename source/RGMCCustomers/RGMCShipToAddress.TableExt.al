tableextension 50458 "RGMC Ship-to Address" extends "Ship-to Address"
{
    fields
    {
        field(50458; "Lookup Code"; Text[100])
        {
            Caption = 'Lookup Code';
            DataClassification = CustomerContent;
        }
        field(50459; "Legacy Code"; Text[100])
        {
            Caption = 'Legacy Code';
            DataClassification = CustomerContent;
        }
        field(50460; "AI Lookup Branch Name"; Text[100])
        {
            Caption = 'AI Lookup Branch Name';
            DataClassification = CustomerContent;
            ToolTip = 'Specifies the branch name as it appears on uploaded purchase order documents, used to match the PO to this ship-to address.';
        }
    }
}
