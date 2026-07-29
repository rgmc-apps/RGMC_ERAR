page 50326 "RGMC Store API v2"
{
    PageType = API;
    APIPublisher = 'rgmc';
    APIGroup = 'rgmccustom';
    APIVersion = 'v2.0';
    EntityName = 'store';
    EntitySetName = 'stores';
    Caption = 'RGMC Store API v2';

    SourceTable = "LSC Store";
    ODataKeyFields = SystemId;

    DelayedInsert = true;
    InsertAllowed = true;
    ModifyAllowed = true;
    DeleteAllowed = true;

    layout
    {
        area(Content)
        {
            field(id; Rec.SystemId)
            {
                Caption = 'id';
                Editable = false;
            }
            field(no; Rec."No.")
            {
                Caption = 'no';
            }
            field(name; Rec.Name)
            {
                Caption = 'name';
            }
            field(address; Rec.Address)
            {
                Caption = 'address';
            }
            field(address2; Rec."Address 2")
            {
                Caption = 'address2';
            }
            field(city; Rec.City)
            {
                Caption = 'city';
            }
            field(county; Rec.County)
            {
                Caption = 'county';
            }
            field(postCode; Rec."Post Code")
            {
                Caption = 'postCode';
            }
            field(phoneNo; Rec."Phone No.")
            {
                Caption = 'phoneNo';
            }
            field(email; Rec."E-Mail")
            {
                Caption = 'email';
            }
            field(currencyCode; Rec."Currency Code")
            {
                Caption = 'currencyCode';
            }
            field(locationCode; Rec."Location Code")
            {
                Caption = 'locationCode';
            }
            field(responsibilityCenter; Rec."Responsibility Center")
            {
                Caption = 'responsibilityCenter';
            }
            field(companyName; CurrentCompanyName)
            {
                Caption = 'companyName';
                Editable = false;
            }
            field(lastModifiedDateTime; Rec.SystemModifiedAt)
            {
                Caption = 'lastModifiedDateTime';
                Editable = false;
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        CurrentCompanyName := CompanyName();
    end;

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        Rec.TestField("No.");
        Rec.TestField(Name);
        exit(true);
    end;

    trigger OnModifyRecord(): Boolean
    begin
        exit(true);
    end;

    trigger OnDeleteRecord(): Boolean
    begin
        exit(true);
    end;

    var
        CurrentCompanyName: Text[30];
}
