pageextension 50490 "RGMC Companies" extends Companies
{
    layout
    {
        addlast(Control1)
        {
            field(ConsignmentAppVisible; ConsignmentAppVisible)
            {
                Caption = 'Consignment App Visible';
                ApplicationArea = All;
                ToolTip = 'Specifies whether this company is visible in the Consignment App.';

                trigger OnValidate()
                var
                    CompanySettings: Record "RGMC Company Settings";
                begin
                    if not CompanySettings.Get(Rec.Name) then begin
                        CompanySettings.Init();
                        CompanySettings."Company Name" := Rec.Name;
                        CompanySettings.Insert(true);
                    end;
                    CompanySettings."Consignment App Visible" := ConsignmentAppVisible;
                    CompanySettings.Modify(true);
                end;
            }
        }
    }

    trigger OnAfterGetRecord()
    var
        CompanySettings: Record "RGMC Company Settings";
    begin
        if CompanySettings.Get(Rec.Name) then
            ConsignmentAppVisible := CompanySettings."Consignment App Visible"
        else
            ConsignmentAppVisible := false;
    end;

    var
        ConsignmentAppVisible: Boolean;
}
