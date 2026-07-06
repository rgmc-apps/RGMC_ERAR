page 50491 "RGMC Company Settings List"
{
    Caption = 'Company Settings';
    PageType = List;
    SourceTable = "RGMC Company Settings";
    ApplicationArea = All;
    UsageCategory = Administration;

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("Company Name"; Rec."Company Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the name of the company.';
                }
                field("Consignment App Visible"; Rec."Consignment App Visible")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies whether this company is visible in the Consignment App.';
                }
            }
        }
    }
}
