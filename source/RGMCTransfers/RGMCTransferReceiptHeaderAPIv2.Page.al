page 50331 "RGMC Tfr Receipt Header API v2"
{
    PageType = API;
    APIPublisher = 'rgmc';
    APIGroup = 'rgmccustom';
    APIVersion = 'v2.0';
    EntityName = 'transferReceiptHeader';
    EntitySetName = 'transferReceiptHeaders';
    Caption = 'RGMC Tfr Receipt Header API v2';

    SourceTable = "Transfer Receipt Header";
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
            field(transferFromCode; Rec."Transfer-from Code")
            {
                Caption = 'transferFromCode';
                Editable = false;
            }
            field(transferFromName; Rec."Transfer-from Name")
            {
                Caption = 'transferFromName';
                Editable = false;
            }
            field(transferToCode; Rec."Transfer-to Code")
            {
                Caption = 'transferToCode';
                Editable = false;
            }
            field(transferToName; Rec."Transfer-to Name")
            {
                Caption = 'transferToName';
                Editable = false;
            }
            field(inTransitCode; Rec."In-Transit Code")
            {
                Caption = 'inTransitCode';
                Editable = false;
            }
            field(postingDate; Rec."Posting Date")
            {
                Caption = 'postingDate';
            }
            field(transferOrderNo; Rec."Transfer Order No.")
            {
                Caption = 'transferOrderNo';
                Editable = false;
            }
            field(externalDocumentNo; Rec."External Document No.")
            {
                Caption = 'externalDocumentNo';
            }
            field(shortcutDimension1Code; Rec."Shortcut Dimension 1 Code")
            {
                Caption = 'shortcutDimension1Code';
            }
            field(shortcutDimension2Code; Rec."Shortcut Dimension 2 Code")
            {
                Caption = 'shortcutDimension2Code';
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
            part(transferReceiptLines; "RGMC Tfr Receipt Line API v2")
            {
                Caption = 'transferReceiptLines';
                EntityName = 'transferReceiptLine';
                EntitySetName = 'transferReceiptLines';
                SubPageLink = "Document No." = field("No.");
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
