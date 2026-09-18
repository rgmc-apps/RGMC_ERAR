codeunit 50345 "RGMC Customer Chain Upgrade"
{
    Subtype = Upgrade;

    trigger OnUpgradePerCompany()
    var
        Customer: Record Customer;
        UpgradeTag: Codeunit "Upgrade Tag";
    begin
        if UpgradeTag.HasUpgradeTag(GetChainDefaultTrueTag()) then
            exit;

        // New Chain field defaults every existing customer to false. Backfill true
        // so nothing already onboarded silently drops out of chain-filtered views
        // (e.g. the consignment app's customer dropdown) the moment this ships.
        Customer.SetRange("Chain", false);
        if Customer.FindSet(true) then
            repeat
                Customer."Chain" := true;
                Customer.Modify();
            until Customer.Next() = 0;

        UpgradeTag.SetUpgradeTag(GetChainDefaultTrueTag());
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Upgrade Tag", 'OnGetPerCompanyUpgradeTags', '', false, false)]
    local procedure RegisterPerCompanyTags(var PerCompanyUpgradeTags: List of [Code[250]])
    begin
        PerCompanyUpgradeTags.Add(GetChainDefaultTrueTag());
    end;

    procedure GetChainDefaultTrueTag(): Code[250]
    begin
        exit('RGMC-CUSTOMER-CHAIN-DEFAULT-TRUE-20260918');
    end;
}
