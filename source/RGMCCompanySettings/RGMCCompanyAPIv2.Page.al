page 50492 "RGMC Company Settings API"
{
    PageType = API;
    Caption = 'RGMC Company Settings API';
    APIPublisher = 'rgmc';
    APIGroup = 'rgmccustom';
    APIVersion = 'v2.0';
    EntityName = 'companySetting';
    EntitySetName = 'companySettings';
    SourceTable = "RGMC Company Settings";
    ODataKeyFields = "Company Name";
    DelayedInsert = true;
    InsertAllowed = false;
    ModifyAllowed = true;
    DeleteAllowed = false;
    InherentPermissions = X;

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
                field(companyName; Rec."Company Name")
                {
                    Caption = 'companyName', Locked = true;
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
                field(businessProfileId; Rec."Business Profile Id")
                {
                    Caption = 'businessProfileId', Locked = true;
                    Editable = false;
                }
                field(consignmentAppVisible; Rec."Consignment App Visible")
                {
                    Caption = 'consignmentAppVisible', Locked = true;
                }
            }
        }
    }

    trigger OnOpenPage()
    var
        Company: Record Company;
        CompanySettings: Record "RGMC Company Settings";
    begin
        Company.SetLoadFields(Name, "Display Name", "Evaluation Company", "Business Profile Id");
        if Company.FindSet() then
            repeat
                if not CompanySettings.Get(Company.Name) then begin
                    CompanySettings.Init();
                    CompanySettings."Company Name" := Company.Name;
                    CompanySettings."Display Name" := Company."Display Name";
                    CompanySettings."Evaluation Company" := Company."Evaluation Company";
                    CompanySettings."Business Profile Id" := Company."Business Profile Id";
                    CompanySettings."Consignment App Visible" := false;
                    CompanySettings.Insert(true);
                end else begin
                    // Only write if something actually changed — avoids a write lock on every GET
                    if (CompanySettings."Display Name" <> Company."Display Name") or
                       (CompanySettings."Evaluation Company" <> Company."Evaluation Company") or
                       (CompanySettings."Business Profile Id" <> Company."Business Profile Id")
                    then begin
                        CompanySettings."Display Name" := Company."Display Name";
                        CompanySettings."Evaluation Company" := Company."Evaluation Company";
                        CompanySettings."Business Profile Id" := Company."Business Profile Id";
                        CompanySettings.Modify(true);
                    end;
                end;
            until Company.Next() = 0;
    end;
}
