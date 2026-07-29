page 50320 "RGMC Price List Header API v2"
{
    PageType = API;
    APIPublisher = 'rgmc';
    APIGroup = 'rgmccustom';
    APIVersion = 'v2.0';
    EntityName = 'priceListHeader';
    EntitySetName = 'priceListHeaders';
    Caption = 'RGMC Price List Header API v2';

    SourceTable = "Price List Header";
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
            field(code; Rec.Code)
            {
                Caption = 'code';
            }
            field(description; Rec.Description)
            {
                Caption = 'description';
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
            field(startingDate; Rec."Starting Date")
            {
                Caption = 'startingDate';
            }
            field(endingDate; Rec."Ending Date")
            {
                Caption = 'endingDate';
            }
            field(currencyCode; Rec."Currency Code")
            {
                Caption = 'currencyCode';
            }
            field(amountType; Rec."Amount Type")
            {
                Caption = 'amountType';
            }
            field(allowLineDisc; Rec."Allow Line Disc.")
            {
                Caption = 'allowLineDisc';
            }
            field(allowInvoiceDisc; Rec."Allow Invoice Disc.")
            {
                Caption = 'allowInvoiceDisc';
            }
            field(itemFamilyCode; Rec."Item Family Code")
            {
                Caption = 'itemFamilyCode';
            }
            field(lastModifiedDateTime; Rec.SystemModifiedAt)
            {
                Caption = 'lastModifiedDateTime';
                Editable = false;
            }
            part(priceListLines; "RGMC Price List Lines API v2")
            {
                Caption = 'priceListLines';
                EntityName = 'priceListLine';
                EntitySetName = 'priceListLines';
                SubPageLink = "Price List Code" = field(Code);
            }
        }
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec.Status := Rec.Status::Draft;
        Rec."Price Type" := Rec."Price Type"::Sale;
    end;

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        Rec.TestField(Code);
        Rec.TestField(Description);
        exit(true);
    end;

    trigger OnModifyRecord(): Boolean
    begin
        exit(true);
    end;

    trigger OnDeleteRecord(): Boolean
    begin
        if Rec.Status = Rec.Status::Active then
            Error('Price List %1 cannot be deleted while Active. Set it to Draft first.', Rec.Code);
        exit(true);
    end;
}
