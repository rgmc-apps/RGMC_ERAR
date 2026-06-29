report 50302 "RGMC Generate Cutoffs"
{
    Caption = 'Generate Cutoffs';
    ProcessingOnly = true;
    UsageCategory = Tasks;
    ApplicationArea = All;

    dataset
    {
        dataitem(Integer; Integer)
        {
            DataItemTableView = sorting(Number) where(Number = filter(1 .. 1));

            trigger OnAfterGetRecord()
            begin
                GenerateCutoffPeriods();
            end;
        }
    }

    requestpage
    {
        layout
        {
            area(Content)
            {
                group(Options)
                {
                    Caption = 'Options';

                    field(StartDateField; StartDate)
                    {
                        ApplicationArea = All;
                        Caption = 'Start Date';
                        ToolTip = 'Specifies the first date of the range to generate cutoff periods for.';
                    }
                    field(EndDateField; EndDate)
                    {
                        ApplicationArea = All;
                        Caption = 'End Date';
                        ToolTip = 'Specifies the last date of the range to generate cutoff periods for.';
                    }
                }
            }
        }

        trigger OnOpenPage()
        begin
            StartDate := CalcDate('<-CM>', Today);
            EndDate := CalcDate('<CM+11M>', Today);
        end;
    }

    trigger OnPreReport()
    begin
        if StartDate = 0D then
            Error('Start Date must be specified.');
        if EndDate = 0D then
            Error('End Date must be specified.');
        if EndDate < StartDate then
            Error('End Date must be equal to or later than Start Date.');
    end;

    var
        StartDate: Date;
        EndDate: Date;

    local procedure GenerateCutoffPeriods()
    var
        CutoffList: Record "RGMC Cutoff List";
        PeriodStart: Date;
        PeriodEnd: Date;
        CreatedCount: Integer;
        SkippedCount: Integer;
    begin
        PeriodStart := CalcDate('<-CM>', StartDate);

        while PeriodStart <= EndDate do begin
            PeriodEnd := CalcDate('<CM>', PeriodStart);

            CutoffList.SetRange("Start Date", PeriodStart);
            CutoffList.SetRange("End Date", PeriodEnd);
            if CutoffList.IsEmpty() then begin
                CutoffList.Init();
                CutoffList."Start Date" := PeriodStart;
                CutoffList."End Date" := PeriodEnd;
                CutoffList.Active := (PeriodStart <= Today) and (Today <= PeriodEnd);
                CutoffList.Insert(true);
                CreatedCount += 1;
            end else
                SkippedCount += 1;

            PeriodStart := CalcDate('<1M>', PeriodStart);
        end;

        Message('%1 cutoff period(s) created. %2 already existed and were skipped.', CreatedCount, SkippedCount);
    end;
}
