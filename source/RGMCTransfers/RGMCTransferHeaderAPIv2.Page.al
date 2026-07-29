page 50327 "RGMC Transfer Header API v2"
{
    PageType = API;
    APIPublisher = 'rgmc';
    APIGroup = 'rgmccustom';
    APIVersion = 'v2.0';
    EntityName = 'transferHeader';
    EntitySetName = 'transferHeaders';
    Caption = 'RGMC Transfer Header API v2';

    SourceTable = "Transfer Header";
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
            }
            field(transferFromName; Rec."Transfer-from Name")
            {
                Caption = 'transferFromName';
                Editable = false;
            }
            field(transferToCode; Rec."Transfer-to Code")
            {
                Caption = 'transferToCode';
            }
            field(transferToName; Rec."Transfer-to Name")
            {
                Caption = 'transferToName';
                Editable = false;
            }
            field(inTransitCode; Rec."In-Transit Code")
            {
                Caption = 'inTransitCode';
            }
            field(postingDate; Rec."Posting Date")
            {
                Caption = 'postingDate';
            }
            field(shipmentDate; Rec."Shipment Date")
            {
                Caption = 'shipmentDate';
            }
            field(receiptDate; Rec."Receipt Date")
            {
                Caption = 'receiptDate';
            }
            field(status; Rec.Status)
            {
                Caption = 'status';
                Editable = false;
            }
            field(directTransfer; Rec."Direct Transfer")
            {
                Caption = 'directTransfer';
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
            field(completelyShipped; Rec."Completely Shipped")
            {
                Caption = 'completelyShipped';
                Editable = false;
            }
            field(completelyReceived; Rec."Completely Received")
            {
                Caption = 'completelyReceived';
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
            part(transferLines; "RGMC Transfer Line API v2")
            {
                Caption = 'transferLines';
                EntityName = 'transferLine';
                EntitySetName = 'transferLines';
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
        Rec.TestField("Transfer-from Code");
        Rec.TestField("Transfer-to Code");
        exit(true);
    end;

    trigger OnModifyRecord(): Boolean
    begin
        if Rec.Status = Rec.Status::Released then
            Error('Transfer Order %1 is Released. Reopen it before making changes.', Rec."No.");
        exit(true);
    end;

    trigger OnDeleteRecord(): Boolean
    begin
        if Rec.Status = Rec.Status::Released then
            Error('Transfer Order %1 cannot be deleted while in Released status.', Rec."No.");
        exit(true);
    end;

    var
        CurrentCompanyName: Text[30];
}
