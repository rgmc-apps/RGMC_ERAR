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
        MirrorEntry: Record "Reservation Entry";
        NextEntryNo: Integer;
    begin
        Rec.TestField("Item No.");
        Rec.TestField("Source ID");
        Rec.TestField("Quantity (Base)");
        if (Rec."Lot No." = '') and (Rec."Serial No." = '') then
            Error('Either Lot No. or Serial No. must be set.');

        Rec."Source Type" := Database::"Sales Line";
        if Rec."Source Subtype" = 0 then
            Rec."Source Subtype" := 1; // Order
        Rec."Source Prod. Order Line" := 0;
        Rec."Reservation Status" := Rec."Reservation Status"::Tracking;
        Rec.Positive := false; // demand — consumed from a Sales Line, not supply

        // Demand entries are stored with a negative sign; accept a positive
        // quantity from the caller (matching the app's own line quantity)
        // and normalize the sign here so API consumers never have to guess.
        if Rec."Quantity (Base)" > 0 then
            Rec."Quantity (Base)" := -Rec."Quantity (Base)";
        Rec."Qty. to Handle (Base)" := Rec."Quantity (Base)";
        Rec."Qty. to Invoice (Base)" := Rec."Quantity (Base)";

        Rec."Creation Date" := Today;
        Rec."Created By" := CopyStr(UserId(), 1, MaxStrLen(Rec."Created By"));

        // Reservation Entry's real primary key is Entry No. + Positive, not
        // Entry No. alone — every entry Business Central itself creates
        // (even a plain Item Tracking assignment, Reservation Status =
        // Tracking, not a true reservation against distinct supply) exists
        // as a PAIR sharing one Entry No.: a Positive=No demand half and a
        // Positive=Yes half. The posting engine looks up that Positive=Yes
        // counterpart unconditionally, regardless of Reservation Status —
        // omitting it (as this page originally did) posts fine at first but
        // fails later at Sales Order posting with "The Reservation Entry
        // does not exist. ... Positive='Yes'". Since this is tracking, not a
        // reservation against genuinely different inbound supply, the mirror
        // half references the same source document — it exists to satisfy
        // the paired-record structure, not to link separate inventory.
        MirrorEntry.LockTable();
        if MirrorEntry.FindLast() then
            NextEntryNo := MirrorEntry."Entry No." + 1
        else
            NextEntryNo := 1;
        Rec."Entry No." := NextEntryNo;

        MirrorEntry.Init();
        MirrorEntry.Copy(Rec);
        MirrorEntry.Positive := true;
        MirrorEntry."Quantity (Base)" := -Rec."Quantity (Base)"; // mirrors Rec's negative demand as a positive counterpart
        MirrorEntry."Qty. to Handle (Base)" := MirrorEntry."Quantity (Base)";
        MirrorEntry."Qty. to Invoice (Base)" := MirrorEntry."Quantity (Base)";
        MirrorEntry.Insert(false);

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
