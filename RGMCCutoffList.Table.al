table 50300 "RGMC Cutoff List"
{
    Caption = 'Cutoff List';
    DataClassification = CustomerContent;
    LookupPageId = "RGMC Cutoff List";
    DrillDownPageId = "RGMC Cutoff List";

    fields
    {
        field(1; "Cutoff ID"; Integer)
        {
            Caption = 'Cutoff ID';
            DataClassification = CustomerContent;
            AutoIncrement = true;
        }
        field(2; "Start Date"; Date)
        {
            Caption = 'Start Date';
            DataClassification = CustomerContent;
        }
        field(3; "End Date"; Date)
        {
            Caption = 'End Date';
            DataClassification = CustomerContent;

            trigger OnValidate()
            begin
                if ("End Date" <> 0D) and ("Start Date" <> 0D) and ("End Date" < "Start Date") then
                    Error('End Date must be equal to or later than Start Date.');
            end;
        }
        field(4; Active; Boolean)
        {
            Caption = 'Active';
            DataClassification = CustomerContent;
        }
    }

    keys
    {
        key(PK; "Cutoff ID")
        {
            Clustered = true;
        }
        key(DateKey; "Start Date", "End Date") { }
    }

    fieldgroups
    {
        fieldgroup(DropDown; "Cutoff ID", "Start Date", "End Date", Active) { }
    }
}
