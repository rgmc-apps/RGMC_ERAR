page 50301 "RGMC Cutoff Card"
{
    Caption = 'Cutoff Card';
    PageType = Card;
    SourceTable = "RGMC Cutoff List";
    ApplicationArea = All;

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';

                field("Cutoff ID"; Rec."Cutoff ID")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Specifies the unique identifier of the cutoff period.';
                }
                field("Start Date"; Rec."Start Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the start date of the cutoff period.';
                }
                field("End Date"; Rec."End Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the end date of the cutoff period.';
                }
                field(Active; Rec.Active)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies whether this cutoff period is currently active for inventory purposes.';
                }
            }
        }
        area(FactBoxes)
        {
            systempart(Control1; Notes) { ApplicationArea = Notes; }
            systempart(Control2; Links) { ApplicationArea = RecordLinks; }
        }
    }

    actions
    {
        area(Processing)
        {
            action(SetActive)
            {
                Caption = 'Set Active';
                Image = Approve;
                ApplicationArea = All;
                ToolTip = 'Mark this cutoff period as active.';

                trigger OnAction()
                begin
                    Rec.Validate(Active, true);
                    Rec.Modify(true);
                end;
            }
            action(SetInactive)
            {
                Caption = 'Set Inactive';
                Image = Cancel;
                ApplicationArea = All;
                ToolTip = 'Mark this cutoff period as inactive.';

                trigger OnAction()
                begin
                    Rec.Validate(Active, false);
                    Rec.Modify(true);
                end;
            }
        }
        area(Promoted)
        {
            group(Category_Process)
            {
                Caption = 'Process';

                actionref(SetActive_Promoted; SetActive) { }
                actionref(SetInactive_Promoted; SetInactive) { }
            }
        }
    }
}
