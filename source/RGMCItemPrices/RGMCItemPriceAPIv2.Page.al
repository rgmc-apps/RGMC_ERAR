page 50305 "RGMC Item Price API v2"
{
    PageType = API;
    Caption = 'RGMC Item Price API v2';
    APIPublisher = 'rgmc';
    APIGroup = 'rgmccustom';
    APIVersion = 'v2.0';
    EntityName = 'itemPrice';
    EntitySetName = 'itemPrices';
    SourceTable = "Price List Line";
    ODataKeyFields = SystemId;

    DelayedInsert = true;
    InsertAllowed = false;
    ModifyAllowed = false;
    DeleteAllowed = false;

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field(id; Rec.SystemId)
                {
                    Caption = 'id', Locked = true;
                    Editable = false;
                }
                field(priceListCode; Rec."Price List Code")
                {
                    Caption = 'priceListCode', Locked = true;
                    Editable = false;
                }
                field(productNo; Rec."Product No.")
                {
                    Caption = 'productNo', Locked = true;
                    Editable = false;
                }
                field(startingDate; Rec."Starting Date")
                {
                    Caption = 'startingDate', Locked = true;
                    Editable = false;
                }
                field(endingDate; Rec."Ending Date")
                {
                    Caption = 'endingDate', Locked = true;
                    Editable = false;
                }
                field(unitPrice; Rec."Unit Price")
                {
                    Caption = 'unitPrice', Locked = true;
                    Editable = false;
                }
                field(unitPriceIncVAT; Rec."LSC Unit Price Including VAT")
                {
                    Caption = 'unitPriceIncVAT', Locked = true;
                    Editable = false;
                }
                field(assignToNo; Rec."Assign-to No.")
                {
                    Caption = 'assignToNo', Locked = true;
                    Editable = false;
                }
                field(currencyCode; Rec."Currency Code")
                {
                    Caption = 'currencyCode', Locked = true;
                    Editable = false;
                }
                field(unitOfMeasureCode; Rec."Unit of Measure Code")
                {
                    Caption = 'unitOfMeasureCode', Locked = true;
                    Editable = false;
                }
                field(minimumQuantity; Rec."Minimum Quantity")
                {
                    Caption = 'minimumQuantity', Locked = true;
                    Editable = false;
                }
            }
        }
    }

    trigger OnOpenPage()
    begin
        Rec.FilterGroup(2);
        Rec.SetFilter("Price List Code", '<>*IC*');
        Rec.FilterGroup(0);
    end;
}
