page 50321 "RGMC Price List Lines API v2"
{
    PageType = API;
    APIPublisher = 'rgmc';
    APIGroup = 'rgmccustom';
    APIVersion = 'v2.0';
    EntityName = 'priceListLine';
    EntitySetName = 'priceListLines';
    Caption = 'RGMC Price List Lines API v2';

    SourceTable = "Price List Line";
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
            field(priceListCode; Rec."Price List Code")
            {
                Caption = 'priceListCode';
                Editable = false;
            }
            field(lineNo; Rec."Line No.")
            {
                Caption = 'lineNo';
                Editable = false;
            }
            field(status; Rec.Status)
            {
                Caption = 'status';
            }
            field(priceType; Rec."Price Type")
            {
                Caption = 'priceType';
            }
            field(assignToNo; Rec."Assign-to No.")
            {
                Caption = 'assignToNo';
            }
            field(assetType; Rec."Asset Type")
            {
                Caption = 'assetType';
            }
            field(assetNo; Rec."Asset No.")
            {
                Caption = 'assetNo';
            }
            field(variantCode; Rec."Variant Code")
            {
                Caption = 'variantCode';
            }
            field(unitOfMeasureCode; Rec."Unit of Measure Code")
            {
                Caption = 'unitOfMeasureCode';
            }
            field(startingDate; Rec."Starting Date")
            {
                Caption = 'startingDate';
            }
            field(endingDate; Rec."Ending Date")
            {
                Caption = 'endingDate';
            }
            field(minimumQuantity; Rec."Minimum Quantity")
            {
                Caption = 'minimumQuantity';
            }
            field(amountType; Rec."Amount Type")
            {
                Caption = 'amountType';
            }
            field(unitPrice; Rec."Unit Price")
            {
                Caption = 'unitPrice';
            }
            field(directUnitCost; Rec."Direct Unit Cost")
            {
                Caption = 'directUnitCost';
            }
            field(unitCost; Rec."Unit Cost")
            {
                Caption = 'unitCost';
            }
            field(lineDiscountPercent; Rec."Line Discount %")
            {
                Caption = 'lineDiscountPercent';
            }
            field(allowLineDisc; Rec."Allow Line Disc.")
            {
                Caption = 'allowLineDisc';
            }
            field(allowInvoiceDisc; Rec."Allow Invoice Disc.")
            {
                Caption = 'allowInvoiceDisc';
            }
            field(currencyCode; Rec."Currency Code")
            {
                Caption = 'currencyCode';
            }
            field(description; Rec.Description)
            {
                Caption = 'description';
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
        Rec.TestField("Asset Type");
        Rec.TestField("Asset No.");
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
