page 50498 "RGMC AI Lookup Name List"
{
    Caption = 'AI Lookup Name List';
    PageType = List;
    SourceTable = "RGMC AI Lookup Name List";
    ApplicationArea = All;
    UsageCategory = Lists;
    DataCaptionFields = "Customer No.";

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                ShowCaption = false;
                field("Code"; Rec."Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies a short identifier for this AI lookup name entry.';
                }
                field("Name"; Rec."Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the customer name as it appears on uploaded purchase order documents, used to match the PO to this customer.';
                }
            }
        }
    }
}
