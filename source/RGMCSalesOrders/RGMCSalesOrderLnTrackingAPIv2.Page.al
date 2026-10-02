page 50355 "RGMC Sales Ln Tracking API v2"
{
    // Writes Item Tracking (Lot No./Serial No.) for one Sales Order Line by
    // inserting directly into Reservation Entry (table 337) with
    // Reservation Status = Tracking — the same status Business Central's own
    // "Item Tracking Lines" page uses when a lot is assigned to a document
    // line without reserving against a specific supply entry. The caller
    // supplies documentNo/lineNo (it already has both from creating the
    // Sales Line via RGMC Sales Order Lines API v2) rather than this page
    // deriving them, keeping the page a plain, validated table CRUD wrapper
    // consistent with every other custom API page in this extension.
    PageType = API;
    APIPublisher = 'rgmc';
    APIGroup = 'rgmccustom';
    APIVersion = 'v2.0';
    EntityName = 'salesLineTrackingLine';
    EntitySetName = 'salesLineTrackingLines';
    Caption = 'RGMC Sales Ln Tracking API v2';

    SourceTable = "Reservation Entry";
    SourceTableView = where("Source Type" = const(37)); // Database::"Sales Line" — stable system table ID
    ODataKeyFields = SystemId;
    DelayedInsert = true;

    InsertAllowed = true;
    ModifyAllowed = false;
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
            field(entryNo; Rec."Entry No.")
            {
                Caption = 'entryNo';
                Editable = false;
            }
            field(itemNo; Rec."Item No.")
            {
                Caption = 'itemNo';
                Editable = true;
            }
            field(documentNo; Rec."Source ID")
            {
                Caption = 'documentNo';
                Editable = true;
            }
            field(lineNo; Rec."Source Ref. No.")
            {
                Caption = 'lineNo';
                Editable = true;
            }
            field(lotNo; Rec."Lot No.")
            {
                Caption = 'lotNo';
                Editable = true;
            }
            field(serialNo; Rec."Serial No.")
            {
                Caption = 'serialNo';
                Editable = true;
            }
            field(expirationDate; Rec."Expiration Date")
            {
                Caption = 'expirationDate';
                Editable = true;
            }
            field(variantCode; Rec."Variant Code")
            {
                Caption = 'variantCode';
                Editable = true;
            }
            field(locationCode; Rec."Location Code")
            {
                Caption = 'locationCode';
                Editable = true;
            }
            field(quantityBase; Rec."Quantity (Base)")
            {
                Caption = 'quantityBase';
                Editable = true;
            }
            field(qtyPerUnitOfMeasure; Rec."Qty. per Unit of Measure")
            {
                Caption = 'qtyPerUnitOfMeasure';
                Editable = true;
            }
        }
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Source Type" := Database::"Sales Line";
        Rec."Source Subtype" := 1; // Sales Header "Document Type"::Order
    end;

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    var
        ReservEntryTemplate: Record "Reservation Entry" temporary;
        InsertedReservEntry: Record "Reservation Entry";
        CreateReservEntry: Codeunit "Create Reserv. Entry";
        QtyBase: Decimal;
    begin
        Rec.TestField("Item No.");
        Rec.TestField("Source ID");
        Rec.TestField("Quantity (Base)");
        if (Rec."Lot No." = '') and (Rec."Serial No." = '') then
            Error('Either Lot No. or Serial No. must be set.');

        if Rec."Source Subtype" = 0 then
            Rec."Source Subtype" := 1; // Sales Header "Document Type"::Order

        QtyBase := Rec."Quantity (Base)";
        if QtyBase < 0 then
            QtyBase := -QtyBase;

        // Three prior versions of this trigger all failed differently: a
        // raw single-row Insert(), a hand-built Positive=No/Yes pair, and a
        // Create Reserv. Entry call using Reservation Status::Tracking with
        // a non-temporary template carrying Source Type/Subtype/Source ID/
        // Source Ref. No. — the last of which still errored with "Source
        // Type must have a value ... Entry No.=0", meaning some OTHER
        // internal record (not our template) was still being built without
        // it, consistent with Tracking status requiring a genuine paired
        // counterpart this codeunit couldn't construct from a single call.
        //
        // Traced to a real, working, public BC extension
        // (FBakkensen/CreateTrackingAndReservation,
        // ReleaseSalesDocumentSub.Codeunit.al) that does exactly this —
        // assign a lot to a Sales Line via Create Reserv. Entry without a
        // true reservation. Two things there differ from every attempt
        // above: the template is TEMPORARY and carries ONLY Lot No./Serial
        // No. (Source Type/Subtype/Source ID/Source Ref. No. come from the
        // CreateReservEntryFor scalar params, not the template), and the
        // final status is Reservation Status::SURPLUS, not Tracking —
        // Surplus is the single-row, no-counterpart-needed status for a
        // plain tracking assignment; Tracking is what demanded the paired
        // structure every earlier attempt kept failing to build correctly.
        // Quantities passed to CreateReservEntryFor are POSITIVE there too
        // (the codeunit derives the correct sign from source doc context).
        ReservEntryTemplate."Lot No." := Rec."Lot No.";
        ReservEntryTemplate."Serial No." := Rec."Serial No.";

        CreateReservEntry.CreateReservEntryFor(
            Database::"Sales Line", Rec."Source Subtype", Rec."Source ID", '', 0, Rec."Source Ref. No.",
            Rec."Qty. per Unit of Measure", QtyBase, QtyBase, ReservEntryTemplate);

        if Rec."Expiration Date" <> 0D then
            CreateReservEntry.SetDates(0D, Rec."Expiration Date");

        CreateReservEntry.CreateEntry(
            Rec."Item No.", Rec."Variant Code", Rec."Location Code", '', 0D, 0D, 0,
            Enum::"Reservation Status"::Surplus);

        // Reload Rec from the entry the codeunit actually persisted (real
        // Entry No., Positive, etc.) instead of Rec's own never-inserted
        // in-memory field values, so the API response reflects a real row.
        CreateReservEntry.GetLastInsertReservEntry(InsertedReservEntry);
        Rec.TransferFields(InsertedReservEntry);

        exit(true);
    end;

    trigger OnDeleteRecord(): Boolean
    var
        MirrorEntry: Record "Reservation Entry";
    begin
        if MirrorEntry.Get(Rec."Entry No.", not Rec.Positive) then
            MirrorEntry.Delete(false);
        exit(true);
    end;
}
