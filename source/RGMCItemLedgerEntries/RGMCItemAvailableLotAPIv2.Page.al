page 50354 "RGMC Item Available Lot API v2"
{
    PageType = API;
    APIPublisher = 'rgmc';
    APIGroup = 'rgmccustom';
    APIVersion = 'v2.0';
    EntityName = 'itemAvailableLot';
    EntitySetName = 'itemAvailableLots';
    Caption = 'RGMC Item Available Lot API v2';

    SourceTable = "Item Ledger Entry";
    ODataKeyFields = SystemId;

    InsertAllowed = false;
    ModifyAllowed = false;
    DeleteAllowed = false;

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
                Editable = false;
            }
            field(lotNo; Rec."Lot No.")
            {
                Caption = 'lotNo';
                Editable = false;
            }
            field(serialNo; Rec."Serial No.")
            {
                Caption = 'serialNo';
                Editable = false;
            }
            field(expirationDate; Rec."Expiration Date")
            {
                Caption = 'expirationDate';
                Editable = false;
            }
            field(quantity; Rec.Quantity)
            {
                Caption = 'quantity';
                Editable = false;
            }
            field(remainingQuantity; Rec."Remaining Quantity")
            {
                Caption = 'remainingQuantity';
                Editable = false;
            }
            field(reservedQuantity; Rec."Reserved Quantity")
            {
                // "Remaining Quantity" alone overstates what's actually free
                // to promise: it drops as stock ships/is invoiced, but does
                // NOT drop when a quantity is reserved by another (even
                // unposted) sales order line — reservedQuantity is what the
                // food backend subtracts to get the true available number.
                Caption = 'reservedQuantity';
                Editable = false;
            }
            field(unitOfMeasureCode; Rec."Unit of Measure Code")
            {
                Caption = 'unitOfMeasureCode';
                Editable = false;
            }
            field(locationCode; Rec."Location Code")
            {
                Caption = 'locationCode';
                Editable = false;
            }
            field(postingDate; Rec."Posting Date")
            {
                Caption = 'postingDate';
                Editable = false;
            }
            field(positive; Rec.Positive)
            {
                Caption = 'positive';
                Editable = false;
            }
            field(open; Rec.Open)
            {
                Caption = 'open';
                Editable = false;
            }
        }
    }

    trigger OnOpenPage()
    begin
        // "Reserved Quantity" is a FlowField (CalcFormula, not a stored
        // column) — SetLoadFields alone does not compute it; SetAutoCalcFields
        // does, at fetch time, the same mechanism already used for Customer's
        // "Brand" FlowField in RGMCCustomerAPIv2.Page.al.
        Rec.SetLoadFields(
            SystemId, "Entry No.", "Item No.", "Lot No.", "Serial No.",
            "Expiration Date", Quantity, "Remaining Quantity",
            "Unit of Measure Code", "Location Code", "Posting Date",
            Positive, Open
        );
        Rec.SetAutoCalcFields("Reserved Quantity");
    end;
}
