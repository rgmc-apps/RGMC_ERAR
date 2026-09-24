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
        }
    }
}
