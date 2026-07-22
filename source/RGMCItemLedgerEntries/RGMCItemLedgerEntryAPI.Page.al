page 50304 "RGMC Item Ledger Entry API"
{
    PageType = API;
    Caption = 'RGMC Item Ledger Entry API';
    APIPublisher = 'rgmc';
    APIGroup = 'inventory';
    APIVersion = 'v1.0';
    EntityName = 'itemLedgerEntry';
    EntitySetName = 'itemLedgerEntries';
    SourceTable = "Item Ledger Entry";
    DelayedInsert = true;
    InsertAllowed = false;
    ModifyAllowed = false;
    DeleteAllowed = false;
    ODataKeyFields = systemId;

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field(systemId; Rec.SystemId)
                {
                    Caption = 'systemId', Locked = true;
                    Editable = false;
                }
                field(entryNo; Rec."Entry No.")
                {
                    Caption = 'entryNo', Locked = true;
                    Editable = false;
                }
                field(itemNo; Rec."Item No.")
                {
                    Caption = 'itemNo', Locked = true;
                }
                field(postingDate; Rec."Posting Date")
                {
                    Caption = 'postingDate', Locked = true;
                }
                field(entryType; Rec."Entry Type")
                {
                    Caption = 'entryType', Locked = true;
                }
                field(sourceType; Rec."Source Type")
                {
                    Caption = 'sourceType', Locked = true;
                }
                field(sourceNo; Rec."Source No.")
                {
                    Caption = 'sourceNo', Locked = true;
                }
                field(documentNo; Rec."Document No.")
                {
                    Caption = 'documentNo', Locked = true;
                }
                field(documentType; Rec."Document Type")
                {
                    Caption = 'documentType', Locked = true;
                }
                field(description; Rec.Description)
                {
                    Caption = 'description', Locked = true;
                }
                field(locationCode; Rec."Location Code")
                {
                    Caption = 'locationCode', Locked = true;
                }
                field(variantCode; Rec."Variant Code")
                {
                    Caption = 'variantCode', Locked = true;
                }
                field(serialNo; Rec."Serial No.")
                {
                    Caption = 'serialNo', Locked = true;
                }
                field(lotNo; Rec."Lot No.")
                {
                    Caption = 'lotNo', Locked = true;
                }
                field(quantity; Rec.Quantity)
                {
                    Caption = 'quantity', Locked = true;
                }
                field(invoicedQuantity; Rec."Invoiced Quantity")
                {
                    Caption = 'invoicedQuantity', Locked = true;
                }
                field(remainingQuantity; Rec."Remaining Quantity")
                {
                    Caption = 'remainingQuantity', Locked = true;
                }
                field(unitOfMeasureCode; Rec."Unit of Measure Code")
                {
                    Caption = 'unitOfMeasureCode', Locked = true;
                }
                field(open; Rec.Open)
                {
                    Caption = 'open', Locked = true;
                }
                field(positiveEntry; Rec.Positive)
                {
                    Caption = 'positiveEntry', Locked = true;
                }
                field(globalDimension1Code; Rec."Global Dimension 1 Code")
                {
                    Caption = 'globalDimension1Code', Locked = true;
                }
                field(globalDimension2Code; Rec."Global Dimension 2 Code")
                {
                    Caption = 'globalDimension2Code', Locked = true;
                }
            }
        }
    }

    trigger OnOpenPage()
    begin
        // Item Ledger Entry is one of the widest, highest-volume tables in BC.
        // Without SetLoadFields every API call fetches all columns for every row —
        // a significant SQL data-transfer cost on large tenants.
        Rec.SetLoadFields(
            SystemId, "Entry No.", "Item No.", "Posting Date", "Entry Type",
            "Source Type", "Source No.", "Document No.", "Document Type",
            Description, "Location Code", "Variant Code", "Serial No.", "Lot No.",
            Quantity, "Invoiced Quantity", "Remaining Quantity", "Unit of Measure Code",
            Open, Positive, "Global Dimension 1 Code", "Global Dimension 2 Code"
        );
    end;
}
