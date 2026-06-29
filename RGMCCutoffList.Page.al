page 50300 "RGMC Cutoff List"
{
    Caption = 'Cutoff List';
    PageType = List;
    SourceTable = "RGMC Cutoff List";
    ApplicationArea = All;
    UsageCategory = Lists;
    CardPageId = "RGMC Cutoff Card";
    Editable = false;

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("Cutoff ID"; Rec."Cutoff ID")
                {
                    ApplicationArea = All;
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
                    ToolTip = 'Specifies whether this cutoff period is currently active.';
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
            action(GenerateCutoffs)
            {
                Caption = 'Generate Cutoffs';
                Image = CreateBins;
                ApplicationArea = All;
                ToolTip = 'Generate monthly cutoff periods for a specified date range.';

                trigger OnAction()
                begin
                    Report.RunModal(Report::"RGMC Generate Cutoffs");
                    CurrPage.Update(false);
                end;
            }
            separator(Sep1) { }
            action(SetActive)
            {
                Caption = 'Set Active';
                Image = Approve;
                ApplicationArea = All;
                ToolTip = 'Mark the selected cutoff period as active.';

                trigger OnAction()
                begin
                    SetCutoffActive(true);
                end;
            }
            action(SetInactive)
            {
                Caption = 'Set Inactive';
                Image = Cancel;
                ApplicationArea = All;
                ToolTip = 'Mark the selected cutoff period as inactive.';

                trigger OnAction()
                begin
                    SetCutoffActive(false);
                end;
            }
        }
        area(Promoted)
        {
            group(Category_Process)
            {
                Caption = 'Process';

                actionref(GenerateCutoffs_Promoted; GenerateCutoffs) { }
                actionref(SetActive_Promoted; SetActive) { }
                actionref(SetInactive_Promoted; SetInactive) { }
            }
        }
    }

    local procedure SetCutoffActive(NewActive: Boolean)
    begin
        Rec.Validate(Active, NewActive);
        Rec.Modify(true);
        CurrPage.Update(false);
    end;
}
