pageextension 50496 "RGMC Ship-to Address" extends "Ship-to Address"
{
    layout
    {
        addafter(Name)
        {
            field("Lookup Code"; Rec."Lookup Code")
            {
                Caption = 'Lookup Code';
                ApplicationArea = All;
                ToolTip = 'Specifies the matching customerLookupCode from the CustomerBranch table in the SBIC Cloud SQL database, used to reconcile this ship-to address with SBIC''s own branch records.';
            }
            field("Legacy Code"; Rec."Legacy Code")
            {
                Caption = 'Legacy Code';
                ApplicationArea = All;
                ToolTip = 'Specifies the code used for this ship-to address in the old system.';
            }
            field("AI Lookup Branch Name"; Rec."AI Lookup Branch Name")
            {
                Caption = 'AI Lookup Branch Name';
                ApplicationArea = All;
                ToolTip = 'Specifies the branch name as it appears on uploaded purchase order documents, used to match the PO to this ship-to address.';
            }
        }
    }
}
