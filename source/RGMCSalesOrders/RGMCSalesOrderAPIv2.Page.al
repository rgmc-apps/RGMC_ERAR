page 50315 "RGMC Sales Order API v2"
{
    PageType = API;
    APIPublisher = 'rgmc';
    APIGroup = 'rgmccustom';
    APIVersion = 'v2.0';
    EntityName = 'salesOrder';
    EntitySetName = 'salesOrders';
    Caption = 'RGMC Sales Order API v2';

    SourceTable = "Sales Header";
    SourceTableView = where("Document Type" = const("Order"));
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
            field(noSeries; Rec."No. Series")
            {
                Caption = 'noSeries';
                Editable = true;
            }
            field(status; Rec.Status)
            {
                Caption = 'status';
                Editable = false;
            }
            field(externalDocumentNo; Rec."External Document No.")
            {
                Caption = 'externalDocumentNo';
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
            field(orderDate; Rec."Order Date")
            {
                Caption = 'orderDate';
            }
            field(documentDate; Rec."Document Date")
            {
                Caption = 'documentDate';
            }
            field(requestedDeliveryDate; Rec."Requested Delivery Date")
            {
                Caption = 'requestedDeliveryDate';
            }
            field(shipmentDate; Rec."Shipment Date")
            {
                Caption = 'shipmentDate';
                Importance = Additional;
            }
            field(dueDate; Rec."Due Date")
            {
                Caption = 'dueDate';
                Importance = Additional;
            }
            field(postingDescription; Rec."Posting Description")
            {
                Caption = 'postingDescription';
                Importance = Additional;
            }
            field(shipToCode; Rec."Ship-to Code")
            {
                Caption = 'shipToCode';
                Importance = Additional;
            }
            field(locationCode; Rec."Location Code")
            {
                Caption = 'locationCode';
            }
            field(salespersonCode; Rec."Salesperson Code")
            {
                Caption = 'salespersonCode';
            }
            field(shortcutDimension1Code; Rec."Shortcut Dimension 1 Code")
            {
                Caption = 'shortcutDimension1Code';
            }
            field(shortcutDimension2Code; Rec."Shortcut Dimension 2 Code")
            {
                Caption = 'shortcutDimension2Code';
            }
            field(submittedBy; Rec."Submitted By")
            {
                Caption = 'submittedBy';
            }
            field(lastModifiedDateTime; Rec.SystemModifiedAt)
            {
                Caption = 'lastModifiedDateTime';
                Editable = false;
            }
            part(salesOrderLines; "RGMC Sales Order Lines API v2")
            {
                Caption = 'Lines';
                EntityName = 'salesOrderLine';
                EntitySetName = 'salesOrderLines';
                SubPageLink = "Document Type" = const("Order"),
                              "Document No." = field("No.");
            }
        }
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Document Type" := Rec."Document Type"::Order;
    end;

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    var
        NoSeries: Codeunit "No. Series";
        RequestedSeries: Code[20];
    begin
        Rec.TestField("Sell-to Customer No.");
        Rec.TestField("Posting Date");

        // BC's own insert (Base App default series, or an LS Central event
        // subscriber keyed off Location Code) can silently reassign the
        // company default series instead of honoring an explicit "No.
        // Series" value posted through this API — confirmed in prod: SBIC
        // food-consignment orders requesting SO-ONLINE kept landing on
        // S-ORDER. A post-insert Rename is not an option (BC blocks renaming
        // a Sales Header outright), so assign the number ourselves up front:
        // standard insert logic only auto-numbers when "No." is still blank.
        RequestedSeries := Rec."No. Series";
        if RequestedSeries <> '' then
            Rec."No." := NoSeries.GetNextNo(RequestedSeries, Rec."Posting Date");

        Rec.Insert(true);
        exit(false);
    end;

    trigger OnModifyRecord(): Boolean
    begin
        if Rec.Status = Rec.Status::Released then
            Error('Sales Order %1 is Released. Reopen it before making changes.', Rec."No.");
        exit(true);
    end;

    trigger OnDeleteRecord(): Boolean
    begin
        if Rec.Status = Rec.Status::Released then
            Error('Sales Order %1 cannot be deleted while in Released status.', Rec."No.");
        exit(true);
    end;
}
