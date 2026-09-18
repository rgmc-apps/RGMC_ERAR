page 50351 "RGMC Whse Activity Hdr API v2"
{
    PageType = API;
    APIPublisher = 'rgmc';
    APIGroup = 'rgmccustom';
    APIVersion = 'v2.0';
    EntityName = 'warehouseActivityHeader';
    EntitySetName = 'warehouseActivityHeaders';
    Caption = 'RGMC Warehouse Activity Header API v2';

    SourceTable = "Warehouse Activity Header";
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
            field(activityType; Rec.Type)
            {
                Caption = 'activityType';
            }
            field(no; Rec."No.")
            {
                Caption = 'no';
            }
            field(locationCode; Rec."Location Code")
            {
                Caption = 'locationCode';
            }
            field(assignedUserId; Rec."Assigned User ID")
            {
                Caption = 'assignedUserId';
            }
            field(assignmentDate; Rec."Assignment Date")
            {
                Caption = 'assignmentDate';
                Editable = false;
            }
            field(assignmentTime; Rec."Assignment Time")
            {
                Caption = 'assignmentTime';
                Editable = false;
            }
            field(sortingMethod; Rec."Sorting Method")
            {
                Caption = 'sortingMethod';
            }
            field(comment; Rec.Comment)
            {
                Caption = 'comment';
                Editable = false;
            }
            field(noOfLines; Rec."No. of Lines")
            {
                Caption = 'noOfLines';
                Editable = false;
            }
            field(postingDate; Rec."Posting Date")
            {
                Caption = 'postingDate';
            }
            field(sourceDocument; Rec."Source Document")
            {
                Caption = 'sourceDocument';
                Editable = false;
            }
            field(sourceNo; Rec."Source No.")
            {
                Caption = 'sourceNo';
                Editable = false;
            }
            field(destinationType; Rec."Destination Type")
            {
                Caption = 'destinationType';
            }
            field(destinationNo; Rec."Destination No.")
            {
                Caption = 'destinationNo';
            }
            field(externalDocumentNo; Rec."External Document No.")
            {
                Caption = 'externalDocumentNo';
            }
            field(expectedReceiptDate; Rec."Expected Receipt Date")
            {
                Caption = 'expectedReceiptDate';
            }
            field(shipmentDate; Rec."Shipment Date")
            {
                Caption = 'shipmentDate';
            }
            field(lastModifiedDateTime; Rec.SystemModifiedAt)
            {
                Caption = 'lastModifiedDateTime';
                Editable = false;
            }
            part(warehouseActivityLines; "RGMC Whse Activity Line API v2")
            {
                Caption = 'Lines';
                EntityName = 'warehouseActivityLine';
                EntitySetName = 'warehouseActivityLines';
                SubPageLink = "Activity Type" = field("Type"),
                              "No." = field("No.");
            }
        }
    }

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        Rec.TestField(Type);
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
}
