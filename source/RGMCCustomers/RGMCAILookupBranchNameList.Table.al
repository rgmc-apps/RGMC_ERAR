table 50349 "RGMC AI Lookup Branch Name"
{
    Caption = 'AI Lookup Branch Name';
    DataCaptionFields = "Customer No.", "Ship-to Code", "Code", "Name";
    LookupPageID = "RGMC AI Lookup Branch Names";
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Customer No."; Code[20])
        {
            Caption = 'Customer No.';
            DataClassification = CustomerContent;
            NotBlank = true;
            TableRelation = Customer."No.";
        }
        field(2; "Ship-to Code"; Code[10])
        {
            Caption = 'Ship-to Code';
            DataClassification = CustomerContent;
            NotBlank = true;
            TableRelation = "Ship-to Address".Code where("Customer No." = field("Customer No."));
        }
        field(3; "Code"; Code[10])
        {
            Caption = 'Code';
            DataClassification = CustomerContent;
            NotBlank = true;
            ToolTip = 'Specifies a short identifier for this AI lookup branch name entry.';
        }
        field(4; "Name"; Text[100])
        {
            Caption = 'AI Lookup Branch Name';
            DataClassification = CustomerContent;
            ToolTip = 'Specifies the branch name as it appears on uploaded purchase order documents, used to match the PO to this ship-to address.';
        }
    }

    keys
    {
        key(PK; "Customer No.", "Ship-to Code", "Code") { Clustered = true; }
        key(UniqueName; "Customer No.", "Ship-to Code", "Name") { Unique = false; }
    }

    trigger OnInsert()
    begin
        CheckDuplicateName();
    end;

    trigger OnModify()
    begin
        CheckDuplicateName();
    end;

    local procedure CheckDuplicateName()
    var
        RGMCAILookupBranchName: Record "RGMC AI Lookup Branch Name";
    begin
        RGMCAILookupBranchName.SetRange("Customer No.", "Customer No.");
        RGMCAILookupBranchName.SetRange("Ship-to Code", "Ship-to Code");
        RGMCAILookupBranchName.SetRange(Name, Name);
        RGMCAILookupBranchName.SetFilter(Code, '<>%1', Code);
        if not RGMCAILookupBranchName.IsEmpty() then
            Error('An AI Lookup Branch Name entry with name %1 already exists for ship-to address %2.', Name, "Ship-to Code");
    end;
}
