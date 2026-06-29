page 50303 "RGMC Cutoff API"
{
    PageType = API;
    Caption = 'RGMC Cutoff API';
    APIPublisher = 'rgmc';
    APIGroup = 'inventory';
    APIVersion = 'v1.0';
    EntityName = 'cutoff';
    EntitySetName = 'cutoffs';
    SourceTable = "RGMC Cutoff List";
    DelayedInsert = true;
    ODataKeyFields = systemId;

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field(systemId; Rec.SystemId)
                {
                    Caption = 'systemId', Locked = true;
                    Editable = false;
                }
                field(cutoffId; Rec."Cutoff ID")
                {
                    Caption = 'cutoffId', Locked = true;
                    Editable = false;
                }
                field(startDate; Rec."Start Date")
                {
                    Caption = 'startDate', Locked = true;
                }
                field(endDate; Rec."End Date")
                {
                    Caption = 'endDate', Locked = true;
                }
                field(active; Rec.Active)
                {
                    Caption = 'active', Locked = true;
                }
            }
        }
    }
}
