page 50346 "RGMC PO Bulk Process API v2"
{
    PageType = API;
    APIPublisher = 'rgmc';
    APIGroup = 'rgmccustom';
    APIVersion = 'v2.0';
    EntityName = 'purchaseOrderBulkProcess';
    EntitySetName = 'purchaseOrderBulkProcesses';
    Caption = 'RGMC PO Bulk Process API v2';

    SourceTable = "RGMC PO Bulk Job";
    SourceTableTemporary = true;
    ODataKeyFields = "Entry No.";
    DelayedInsert = true;

    InsertAllowed = true;
    ModifyAllowed = false;
    DeleteAllowed = false;

    layout
    {
        area(Content)
        {
            field(id; Rec."Entry No.")
            {
                Caption = 'id';
                Editable = false;
            }
            field(importId; Rec."Import Id")
            {
                Caption = 'importId';
            }
            field(processedCount; Rec."Processed Count")
            {
                Caption = 'processedCount';
                Editable = false;
            }
            field(errorCount; Rec."Error Count")
            {
                Caption = 'errorCount';
                Editable = false;
            }
            field(errorSummary; Rec."Error Summary")
            {
                Caption = 'errorSummary';
                Editable = false;
            }
        }
    }

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    var
        BulkImportMgt: Codeunit "RGMC PO Bulk Import Mgt.";
        ProcessedCount: Integer;
        ErrorCount: Integer;
        ErrorSummary: Text[2048];
    begin
        Rec."Entry No." := 1;

        if IsNullGuid(Rec."Import Id") then
            BulkImportMgt.ProcessAllPending(ProcessedCount, ErrorCount, ErrorSummary)
        else
            BulkImportMgt.ProcessImport(Rec."Import Id", ProcessedCount, ErrorCount, ErrorSummary);

        Rec."Processed Count" := ProcessedCount;
        Rec."Error Count" := ErrorCount;
        Rec."Error Summary" := ErrorSummary;
        exit(true);
    end;
}
