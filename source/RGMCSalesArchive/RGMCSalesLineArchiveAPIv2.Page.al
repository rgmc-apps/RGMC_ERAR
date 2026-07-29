page 50334 "RGMC Sales Line Archive API v2"
{
    PageType = API;
    APIPublisher = 'rgmc';
    APIGroup = 'rgmccustom';
    APIVersion = 'v2.0';
    EntityName = 'salesLineArchive';
    EntitySetName = 'salesLineArchives';
    Caption = 'RGMC Sales Line Archive API v2';

    SourceTable = "Sales Line Archive";
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
            field(documentNo; Rec."Document No.")
            {
                Caption = 'documentNo';
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
            field(lineNo; Rec."Line No.")
            {
                Caption = 'lineNo';
                Editable = false;
            }
            field(lineType; Rec.Type)
            {
                Caption = 'lineType';
            }
            field(no; Rec."No.")
            {
                Caption = 'no';
            }
            field(description; Rec.Description)
            {
                Caption = 'description';
            }
            field(description2; Rec."Description 2")
            {
                Caption = 'description2';
            }
            field(variantCode; Rec."Variant Code")
            {
                Caption = 'variantCode';
            }
            field(locationCode; Rec."Location Code")
            {
                Caption = 'locationCode';
            }
            field(unitOfMeasureCode; Rec."Unit of Measure Code")
            {
                Caption = 'unitOfMeasureCode';
            }
            field(quantity; Rec.Quantity)
            {
                Caption = 'quantity';
            }
            field(unitPrice; Rec."Unit Price")
            {
                Caption = 'unitPrice';
            }
            field(lineDiscountPercent; Rec."Line Discount %")
            {
                Caption = 'lineDiscountPercent';
            }
            field(lineAmount; Rec."Line Amount")
            {
                Caption = 'lineAmount';
                Editable = false;
            }
            field(amount; Rec.Amount)
            {
                Caption = 'amount';
                Editable = false;
            }
            field(amountIncludingVat; Rec."Amount Including VAT")
            {
                Caption = 'amountIncludingVat';
                Editable = false;
            }
            field(shipmentDate; Rec."Shipment Date")
            {
                Caption = 'shipmentDate';
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
        }
    }

    trigger OnAfterGetRecord()
    begin
        CurrentCompanyName := CompanyName();
    end;

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        Rec.TestField("Document No.");
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
