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
        tabledata "Price List Line" = R,
        tabledata "Sales Header" = RIMD,
        tabledata "Sales Line" = RIMD,
        tabledata "Tenant Media" = R,
        tabledata "Default Dimension" = RIMD,
        tabledata "Dimension Value" = R,
        tabledata "RGMC Cutoff List" = RIMD,
        tabledata "RGMC Company Settings" = RIMD;
}
