page 50308 "RGMC Contact API v2"
{
    PageType = API;
    APIPublisher = 'rgmc';
    APIGroup = 'rgmccustom';
    APIVersion = 'v2.0';
    EntityName = 'contact';
    EntitySetName = 'contacts';
    Caption = 'RGMC Contact API v2';

    SourceTable = Contact;
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
            field(number; Rec."No.")
            {
                Caption = 'number';
            }
            field(name; Rec.Name)
            {
                Caption = 'name';
            }
            field(firstName; Rec."First Name")
            {
                Caption = 'firstName';
            }
            field(middleName; Rec."Middle Name")
            {
                Caption = 'middleName';
            }
            field(lastName; Rec.Surname)
            {
                Caption = 'lastName';
            }
            field(searchName; Rec."Search Name")
            {
                Caption = 'searchName';
            }
            field(type; Rec.Type)
            {
                Caption = 'type';
            }
            field(companyNo; Rec."Company No.")
            {
                Caption = 'companyNo';
            }
            field(companyName; Rec."Company Name")
            {
                Caption = 'companyName';
                Editable = false;
            }
            field(jobTitle; Rec."Job Title")
            {
                Caption = 'jobTitle';
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
            field(countryRegionCode; Rec."Country/Region Code")
            {
                Caption = 'countryRegionCode';
            }
            field(phoneNo; Rec."Phone No.")
            {
                Caption = 'phoneNo';
            }
            field(mobilePhoneNo; Rec."Mobile Phone No.")
            {
                Caption = 'mobilePhoneNo';
            }
            field(email; Rec."E-Mail")
            {
                Caption = 'email';
            }
            field(salespersonCode; Rec."Salesperson Code")
            {
                Caption = 'salespersonCode';
            }
            field(registrationNo; Rec."Registration No.")
            {
                Caption = 'registrationNo';
            }
            field(username; Rec.Username)
            {
                Caption = 'username';
            }
            field(passwordHash; Rec."Password Hash")
            {
                Caption = 'passwordHash';
            }
            field(lastModifiedDateTime; Rec.SystemModifiedAt)
            {
                Caption = 'lastModifiedDateTime';
                Editable = false;
            }
            field(picture; Rec.Image)
            {
                Caption = 'picture';
            }
            part(contactBrandTags; "RGMC Contact Brand Tag API v2")
            {
                Caption = 'contactBrandTags';
                EntityName = 'contactBrandTag';
                EntitySetName = 'contactBrandTags';
                SubPageLink = "Contact No." = field("No.");
            }
        }
    }

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        Rec.TestField(Name);
        if Rec.Username = '' then
            Rec.Username := Rec.Name;
        if Rec."Password Hash" = '' then
            Rec."Password Hash" := '$2a$12$EAbkceqhezNLVmx96.3/BO5N1gNcIECWByxEB/anvxEXEIjZtA19i';
        exit(true);
    end;

    trigger OnModifyRecord(): Boolean
    begin
        Rec.TestField(Name);
        if Rec.Username = '' then
            Rec.Username := Rec.Name;
        exit(true);
    end;

    trigger OnDeleteRecord(): Boolean
    begin
        if Rec.Type = Rec.Type::Person then
            if Rec."Company No." <> '' then
                Error('Contact %1 cannot be deleted while linked to company %2.', Rec."No.", Rec."Company No.");
        exit(true);
    end;
}
