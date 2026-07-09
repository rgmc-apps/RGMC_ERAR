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
                field("Display Name"; Rec."Display Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the display name of the company.';
                }
                field("Evaluation Company"; Rec."Evaluation Company")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies whether this is an evaluation company.';
                }
                field("Business Profile Id"; Rec."Business Profile Id")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the business profile ID of the company.';
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
