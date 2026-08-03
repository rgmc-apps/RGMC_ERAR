permissionset 50302 "RGMC API EXT"
{
    Assignable = true;
    Caption = 'RGMC API Extension';

    Permissions =
        tabledata Company = R,
        tabledata Customer = RIMD,
        tabledata Contact = RIMD,
        tabledata Item = R,
        tabledata "LSC Item Family" = R,
        tabledata "LSC Transaction Header" = RIMD,
        tabledata "LSC Trans. Sales Entry" = RIMD,
        tabledata "LSC Trans. Payment Entry" = RIMD,
        tabledata "LSC Tender Type Setup" = RIMD,
        tabledata "LSC Store" = RIMD,
        tabledata "Price List Header" = RIMD,
        tabledata "Price List Line" = RIMD,
        tabledata "Sales Header" = RIMD,
        tabledata "Sales Line" = RIMD,
        tabledata "Tenant Media" = R,
        tabledata "Default Dimension" = RIMD,
        tabledata "Dimension Value" = R,
        tabledata "Transfer Header" = RIMD,
        tabledata "Transfer Line" = RIMD,
        tabledata "Transfer Shipment Header" = RIMD,
        tabledata "Transfer Shipment Line" = RIMD,
        tabledata "Transfer Receipt Header" = RIMD,
        tabledata "Transfer Receipt Line" = RIMD,
        tabledata "Sales Header Archive" = RIMD,
        tabledata "Sales Line Archive" = RIMD,
        tabledata "LSC Retail Product Group" = RIMD,
        tabledata "LSC Tender Type" = RIMD,
        tabledata "Return Shipment Line" = RIMD,
        tabledata "Return Receipt Line" = RIMD,
        tabledata "Item Ledger Entry" = RIMD,
        tabledata "RGMC Cutoff List" = RIMD,
        tabledata "RGMC Company Settings" = RIMD;
}
