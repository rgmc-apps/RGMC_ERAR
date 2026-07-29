page 50333 "RGMC Sales Hdr Archive API v2"
{
    PageType = API;
    APIPublisher = 'rgmc';
    APIGroup = 'rgmccustom';
    APIVersion = 'v2.0';
    EntityName = 'salesHeaderArchive';
    EntitySetName = 'salesHeaderArchives';
    Caption = 'RGMC Sales Hdr Archive API v2';

    SourceTable = "Sales Header Archive";
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
            field(documentType; Rec."Document Type")
            {
                Caption = 'documentType';
                Editable = false;
            }
            field(no; Rec."No.")
            {
                Caption = 'no';
                Editable = false;
            }
            field(docNoOccurrence; Rec."Doc. No. Occurrence")
            {
                Caption = 'docNoOccurrence';
                Editable = false;
            }
            field(versionNo; Rec."Version No.")
            {
                Caption = 'versionNo';
                Editable = false;
            }
            field(sellToCustomerNo; Rec."Sell-to Customer No.")
            {
                Caption = 'sellToCustomerNo';
            }
            field(sellToCustomerName; Rec."Sell-to Customer Name")
            {
                Caption = 'sellToCustomerName';
                Editable = false;
            }
            field(sellToContactNo; Rec."Sell-to Contact No.")
            {
                Caption = 'sellToContactNo';
            }
            field(postingDate; Rec."Posting Date")
            {
                Caption = 'postingDate';
            }
            field(documentDate; Rec."Document Date")
            {
                Caption = 'documentDate';
            }
            field(orderDate; Rec."Order Date")
            {
                Caption = 'orderDate';
            }
            field(status; Rec.Status)
            {
                Caption = 'status';
                Editable = false;
            }
            field(salespersonCode; Rec."Salesperson Code")
            {
                Caption = 'salespersonCode';
            }
            field(currencyCode; Rec."Currency Code")
            {
                Caption = 'currencyCode';
            }
            field(externalDocumentNo; Rec."External Document No.")
            {
                Caption = 'externalDocumentNo';
            }
            field(locationCode; Rec."Location Code")
            {
                Caption = 'locationCode';
            }
            field(shortcutDimension1Code; Rec."Shortcut Dimension 1 Code")
            {
                Caption = 'shortcutDimension1Code';
            }
            field(shortcutDimension2Code; Rec."Shortcut Dimension 2 Code")
            {
                Caption = 'shortcutDimension2Code';
            }
            field(archivedBy; Rec."Archived By")
            {
                Caption = 'archivedBy';
                Editable = false;
            }
            field(dateArchived; Rec."Date Archived")
            {
                Caption = 'dateArchived';
                Editable = false;
            }
            field(timeArchived; Rec."Time Archived")
            {
                Caption = 'timeArchived';
                Editable = false;
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
            part(salesLineArchives; "RGMC Sales Line Archive API v2")
            {
                Caption = 'salesLineArchives';
                EntityName = 'salesLineArchive';
                EntitySetName = 'salesLineArchives';
                SubPageLink = "Document Type" = field("Document Type"),
                              "Document No." = field("No."),
                              "Doc. No. Occurrence" = field("Doc. No. Occurrence"),
                              "Version No." = field("Version No.");
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
        Rec.TestField("Sell-to Customer No.");
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
