scr_getinput();
landAnim = 0;
mach2 = 35;
hsp = xscale * movespeed;
grav = 0;
momemtum = 1;
dir = xscale;

if (image_index < 2)
    movespeed = 12;

if (image_index > 7)
    movespeed -= 1;

if (floor(image_index) == (image_number - 1))
{
    state = 0;
    grav = 0.5;
}

if (key_jump && place_meeting(x, y + 1, obj_collisionparent))
{
    sprite_index = spr_player_mach2jump;
    instance_create(x, y, obj_jumpdust);
    state = 61;
    vsp = -9;
}

if ((place_meeting(x + 1, y, obj_collisionparent) && xscale == 1) && !place_meeting(x + sign(hsp), y, obj_slopes))
{
    grav = 0.5;
    movespeed = 0;
    state = 63;
    hsp = -2.5;
    vsp = -3;
    mach2 = 0;
    image_index = 0;
    machslideAnim = 1;
    machhitAnim = 0;
    instance_create(x + 10, y + 10, obj_bumpeffect);
}

if ((place_meeting(x - 1, y, obj_collisionparent) && xscale == -1) && !place_meeting(x + sign(hsp), y, obj_slopes))
{
    grav = 0.5;
    movespeed = 0;
    state = 63;
    hsp = 2.5;
    vsp = -3;
    mach2 = 0;
    image_index = 0;
    machslideAnim = 1;
    machhitAnim = 0;
    instance_create(x - 10, y + 10, obj_bumpeffect);
}

image_speed = 0.4;

if (!instance_exists(obj_slidecloud) && place_meeting(x, y + 1, obj_collisionparent) && movespeed > 5)
    instance_create(x, y, obj_slidecloud);

scr_collideandmove();
