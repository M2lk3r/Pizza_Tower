scr_getinput();

if (!place_meeting(x, y + 1, obj_railh) && !place_meeting(x, y + 1, obj_railh2))
    hsp = xscale * movespeed;
else if (place_meeting(x, y + 1, obj_railh))
    hsp = (xscale * movespeed) - 5;
else if (place_meeting(x, y + 1, obj_railh2))
    hsp = (xscale * movespeed) + 5;

if (movespeed >= 0)
    movespeed -= 0.2;

mask_index = spr_crouchmask;

if (mach2 >= 35 && !key_down && !place_meeting(x + 27, y - 32, obj_collisionparent) && !place_meeting(x - 27, y - 32, obj_collisionparent) && !place_meeting(x, y - 32, obj_collisionparent) && !place_meeting(x, y - 16, obj_collisionparent) && key_attack && sprite_index != spr_player_shootslide)
{
    sprite_index = spr_player_machhit;
    state = 61;
}

if (((hsp == 0 || ((place_meeting(x + 1, y, obj_collisionparent) && xscale == 1) || (place_meeting(x - 1, y, obj_collisionparent) && xscale == -1))) && !place_meeting(x + sign(hsp), y, obj_slopes)) || movespeed <= 0)
{
    state = 57;
    movespeed = 0;
    mach2 = 0;
    crouchslideAnim = 1;
    image_index = 0;
    crouchAnim = 1;
    start_running = 1;
    alarm[4] = 14;
}

if ((place_meeting(x + 1, y, obj_collisionparent) && xscale == 1) && !place_meeting(x + sign(hsp), y, obj_slopes))
{
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

if (!instance_exists(obj_slidecloud) && place_meeting(x, y + 1, obj_collisionparent) && movespeed > 5)
    instance_create(x, y, obj_slidecloud);

image_speed = 0.35;
scr_collideandmove();
