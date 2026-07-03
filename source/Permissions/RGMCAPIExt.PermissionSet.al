permissionset 50302 "RGMC API EXT"
{
    Assignable = true;
    Caption = 'RGMC API Extension';

    Permissions =
        tabledata "RGMC Cutoff List" = RIMD,
        tabledata "RGMC Company Settings" = RIMD;
}
