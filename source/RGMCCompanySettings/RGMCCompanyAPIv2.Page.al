page 50492 "RGMC Company API v2"
{
    PageType = API;
    Caption = 'RGMC Company API v2';
    APIPublisher = 'rgmc';
    APIGroup = 'rgmccustom';
    APIVersion = 'v2.0';
    EntityName = 'company';
    EntitySetName = 'companies';
    SourceTable = Company;
    ODataKeyFields = SystemId;
    DelayedInsert = true;
    InsertAllowed = false;
    ModifyAllowed = true;
    DeleteAllowed = false;

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field(id; Rec.SystemId)
                {
                    Caption = 'id', Locked = true;
                    Editable = false;
                }
                field(name; Rec.Name)
                {
                    Caption = 'name', Locked = true;
                    Editable = false;
                }
                field(displayName; Rec."Display Name")
                {
                    Caption = 'displayName', Locked = true;
                    Editable = false;
                }
                field(evaluationCompany; Rec."Evaluation Company")
                {
                    Caption = 'evaluationCompany', Locked = true;
                    Editable = false;
                }
                field(consignmentAppVisible; ConsignmentAppVisible)
                {
                    Caption = 'consignmentAppVisible', Locked = true;
                }
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

    trigger OnModifyRecord(): Boolean
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
        exit(false);
    end;

    var
        ConsignmentAppVisible: Boolean;
}
