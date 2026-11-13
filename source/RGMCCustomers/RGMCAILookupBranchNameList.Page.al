page 50499 "RGMC AI Lookup Branch Names"
{
    Caption = 'AI Lookup Branch Names';
    PageType = ListPart;
    SourceTable = "RGMC AI Lookup Branch Name";

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                ShowCaption = false;
                field("Code"; Rec."Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies a short identifier for this AI lookup branch name entry.';
                }
                field("Name"; Rec."Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the branch name as it appears on uploaded purchase order documents, used to match the PO to this ship-to address.';
                }
            }
        }
    }
}
