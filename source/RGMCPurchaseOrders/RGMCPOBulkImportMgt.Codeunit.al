codeunit 50344 "RGMC PO Bulk Import Mgt."
{
    procedure ProcessImport(ImportId: Guid; var ProcessedCount: Integer; var ErrorCount: Integer; var ErrorSummary: Text[2048])
    var
        BulkHeader: Record "RGMC PO Bulk Header";
    begin
        BulkHeader.Get(ImportId);
        ProcessHeaderSafely(BulkHeader);
        if BulkHeader.Status = BulkHeader.Status::Success then
            ProcessedCount += 1
        else begin
            ErrorCount += 1;
            if ErrorSummary = '' then
                ErrorSummary := BulkHeader."Error Message";
        end;
    end;

    procedure ProcessAllPending(var ProcessedCount: Integer; var ErrorCount: Integer; var ErrorSummary: Text[2048])
    var
        BulkHeader: Record "RGMC PO Bulk Header";
        ImportIds: List of [Guid];
        ImportId: Guid;
    begin
        BulkHeader.SetRange(Status, BulkHeader.Status::Pending);
        if BulkHeader.FindSet() then
            repeat
                ImportIds.Add(BulkHeader."Import Id");
            until BulkHeader.Next() = 0;

        foreach ImportId in ImportIds do begin
            BulkHeader.Get(ImportId);
            ProcessHeaderSafely(BulkHeader);
            if BulkHeader.Status = BulkHeader.Status::Success then
                ProcessedCount += 1
            else begin
                ErrorCount += 1;
                if ErrorSummary = '' then
                    ErrorSummary := StrSubstNo('Import %1: %2', ImportId, BulkHeader."Error Message");
            end;
        end;
    end;

    local procedure ProcessHeaderSafely(var BulkHeader: Record "RGMC PO Bulk Header")
    var
        NewDocumentNo: Code[20];
    begin
        if TryProcessHeader(BulkHeader."Import Id", NewDocumentNo) then begin
            BulkHeader.Status := BulkHeader.Status::Success;
            BulkHeader."Document No." := NewDocumentNo;
            BulkHeader."Error Message" := '';
        end else begin
            BulkHeader.Status := BulkHeader.Status::Error;
            BulkHeader."Error Message" := CopyStr(GetLastErrorText(), 1, 2048);
            ClearLastError();
        end;
        BulkHeader.Modify();
        Commit();
    end;

    [TryFunction]
    local procedure TryProcessHeader(ImportId: Guid; var DocumentNo: Code[20])
    var
        BulkHeader: Record "RGMC PO Bulk Header";
        BulkLine: Record "RGMC PO Bulk Line";
        PurchaseHeader: Record "Purchase Header";
        PurchaseLine: Record "Purchase Line";
        LineNo: Integer;
    begin
        BulkHeader.Get(ImportId);

        PurchaseHeader.Init();
        PurchaseHeader."Document Type" := PurchaseHeader."Document Type"::Order;
        PurchaseHeader.Insert(true);

        PurchaseHeader.Validate("Buy-from Vendor No.", BulkHeader."Buy-from Vendor No.");
        if BulkHeader."Posting Date" <> 0D then
            PurchaseHeader.Validate("Posting Date", BulkHeader."Posting Date");
        if BulkHeader."Document Date" <> 0D then
            PurchaseHeader."Document Date" := BulkHeader."Document Date";
        if BulkHeader."Order Date" <> 0D then
            PurchaseHeader."Order Date" := BulkHeader."Order Date";
        if BulkHeader."Expected Receipt Date" <> 0D then
            PurchaseHeader."Expected Receipt Date" := BulkHeader."Expected Receipt Date";
        if BulkHeader."Currency Code" <> '' then
            PurchaseHeader.Validate("Currency Code", BulkHeader."Currency Code");
        if BulkHeader."Location Code" <> '' then
            PurchaseHeader."Location Code" := BulkHeader."Location Code";
        if BulkHeader."Purchaser Code" <> '' then
            PurchaseHeader."Purchaser Code" := BulkHeader."Purchaser Code";
        if BulkHeader."Shortcut Dimension 1 Code" <> '' then
            PurchaseHeader.Validate("Shortcut Dimension 1 Code", BulkHeader."Shortcut Dimension 1 Code");
        if BulkHeader."Shortcut Dimension 2 Code" <> '' then
            PurchaseHeader.Validate("Shortcut Dimension 2 Code", BulkHeader."Shortcut Dimension 2 Code");
        if BulkHeader."Vendor Invoice No." <> '' then
            PurchaseHeader."Vendor Invoice No." := BulkHeader."Vendor Invoice No.";
        if BulkHeader."Vendor Order No." <> '' then
            PurchaseHeader."Vendor Order No." := BulkHeader."Vendor Order No.";
        PurchaseHeader.Modify(true);

        BulkLine.SetRange("Import Id", ImportId);
        BulkLine.SetCurrentKey("Import Id", "Line No.");
        LineNo := 0;
        if BulkLine.FindSet() then
            repeat
                LineNo += 10000;
                PurchaseLine.Init();
                PurchaseLine."Document Type" := PurchaseLine."Document Type"::Order;
                PurchaseLine."Document No." := PurchaseHeader."No.";
                PurchaseLine."Line No." := LineNo;
                PurchaseLine.Insert(true);

                if BulkLine."Type" <> '' then
                    PurchaseLine.Validate(Type, TextToLineType(BulkLine."Type"));
                if BulkLine."No." <> '' then
                    PurchaseLine.Validate("No.", BulkLine."No.");
                if BulkLine."Variant Code" <> '' then
                    PurchaseLine.Validate("Variant Code", BulkLine."Variant Code");
                if BulkLine."Unit of Measure Code" <> '' then
                    PurchaseLine.Validate("Unit of Measure Code", BulkLine."Unit of Measure Code");
                if BulkLine.Quantity <> 0 then
                    PurchaseLine.Validate(Quantity, BulkLine.Quantity);
                if BulkLine."Direct Unit Cost" <> 0 then
                    PurchaseLine.Validate("Direct Unit Cost", BulkLine."Direct Unit Cost");
                if BulkLine."Line Discount %" <> 0 then
                    PurchaseLine.Validate("Line Discount %", BulkLine."Line Discount %");
                if BulkLine.Description <> '' then
                    PurchaseLine.Description := BulkLine.Description;
                if BulkLine."Description 2" <> '' then
                    PurchaseLine."Description 2" := BulkLine."Description 2";
                if BulkLine."Location Code" <> '' then
                    PurchaseLine."Location Code" := BulkLine."Location Code";
                if BulkLine."Expected Receipt Date" <> 0D then
                    PurchaseLine."Expected Receipt Date" := BulkLine."Expected Receipt Date";
                if BulkLine."Job No." <> '' then
                    PurchaseLine."Job No." := BulkLine."Job No.";
                if BulkLine."Shortcut Dimension 1 Code" <> '' then
                    PurchaseLine.Validate("Shortcut Dimension 1 Code", BulkLine."Shortcut Dimension 1 Code");
                if BulkLine."Shortcut Dimension 2 Code" <> '' then
                    PurchaseLine.Validate("Shortcut Dimension 2 Code", BulkLine."Shortcut Dimension 2 Code");
                PurchaseLine.Modify(true);
            until BulkLine.Next() = 0;

        DocumentNo := PurchaseHeader."No.";
    end;

    local procedure TextToLineType(TypeText: Text[50]): Enum "Purchase Line Type"
    begin
        case TypeText of
            'Item':
                exit("Purchase Line Type"::Item);
            'G/L Account':
                exit("Purchase Line Type"::"G/L Account");
            'Fixed Asset':
                exit("Purchase Line Type"::"Fixed Asset");
            'Charge (Item)':
                exit("Purchase Line Type"::"Charge (Item)");
            else
                exit("Purchase Line Type"::" ");
        end;
    end;
}
