if (floor(image_index) == (image_number - 1) && sprite_index == spr_pizzaportalentrancestart)
{
    instance_create(x, y, obj_pizzaportalfade);
    state = 65;
    grav = 0.5;
}

mach2 = 0;
