pageextension 50494 "RGMC Customer Card" extends "Customer Card"
{
    layout
    {
        addafter(Name)
        {
            field("Brand Code"; Rec."Brand Code")
            {
                Caption = 'Brand Code';
                ApplicationArea = All;
                Editable = false;
                ToolTip = 'Specifies the brand code synced from the Brand dimension value assigned to this customer.';
            }
            field(BrandDimValueCode; BrandDimValueCode)
            {
                Caption = 'Brand';
                ApplicationArea = All;
                TableRelation = "Dimension Value".Code where("Dimension Code" = const('BRAND'), Blocked = const(false));
                ToolTip = 'Specifies the Brand dimension value directly assigned to this customer.';

                trigger OnValidate()
                var
                    DefaultDim: Record "Default Dimension";
                begin
                    if BrandDimValueCode = '' then begin
                        if DefaultDim.Get(DATABASE::Customer, Rec."No.", 'BRAND') then
                            DefaultDim.Delete(true);
                    end else begin
                        if DefaultDim.Get(DATABASE::Customer, Rec."No.", 'BRAND') then begin
                            DefaultDim."Dimension Value Code" := BrandDimValueCode;
                            DefaultDim.Modify(true);
                        end else begin
                            DefaultDim.Init();
                            DefaultDim."Table ID" := DATABASE::Customer;
                            DefaultDim."No." := Rec."No.";
                            DefaultDim."Dimension Code" := 'BRAND';
                            DefaultDim."Dimension Value Code" := BrandDimValueCode;
                            DefaultDim.Insert(true);
                        end;
                    end;
                    Rec."Brand Code" := BrandDimValueCode;
                    Rec.Modify(true);
                    CurrPage.Update(false);
                end;
            }
        }
    }

    actions
    {
    }

    trigger OnAfterGetRecord()
    var
        DefaultDim: Record "Default Dimension";
    begin
        if DefaultDim.Get(DATABASE::Customer, Rec."No.", 'BRAND') then
            BrandDimValueCode := DefaultDim."Dimension Value Code"
        else
            BrandDimValueCode := '';
    end;

    var
        BrandDimValueCode: Code[20];
}
