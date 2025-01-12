scr_getinput();

if (!place_meeting(x, y + 1, obj_railh) && !place_meeting(x, y + 1, obj_railh2))
    hsp = xscale * movespeed;
else if (place_meeting(x, y + 1, obj_railh))
    hsp = (xscale * movespeed) - 5;
else if (place_meeting(x, y + 1, obj_railh2))
    hsp = (xscale * movespeed) + 5;

move = key_right + key_left;

if (movespeed >= 0)
    movespeed -= 0.4;

if (sprite_index == spr_player_machslidestart && floor(image_index) == (image_number - 1))
    sprite_index = spr_player_machslide;

image_speed = 0.35;
landAnim = 0;

if (floor(movespeed) == 0 && (sprite_index == spr_player_machslide || sprite_index == spr_player_crouchslide))
{
    image_index = 0;
    
    if (sprite_index == spr_player_machslide)
        machslideAnim = 1;
    
    movespeed = 0;
    state = 0;
    movespeed = 4;
}

if (floor(movespeed) == 0 && sprite_index == spr_player_machslideboost && mach2 != 0)
{
    scr_sound(34);
    momemtum = 1;
    state = 61;
    image_index = 0;
    xscale *= -1;
    instance_create(x, y, obj_jumpdust);
}

if (floor(movespeed) == 0 && sprite_index == spr_player_machslideboost3 && mach2 != 0)
{
    sprite_index = spr_player_mach4;
    scr_sound(34);
    momemtum = 1;
    state = 81;
    image_index = 0;
    xscale *= -1;
    instance_create(x, y, obj_jumpdust);
}

if ((place_meeting(x + 1, y, obj_collisionparent) && xscale == 1) && !place_meeting(x + 1, y, obj_slopes))
{
    movespeed = 0;
    state = 63;
    hsp = -2.5;
    vsp = -3;
    mach2 = 0;
    image_index = 0;
    instance_create(x + 10, y + 10, obj_bumpeffect);
}

if ((place_meeting(x - 1, y, obj_collisionparent) && xscale == -1) && !place_meeting(x - 1, y, obj_slopes))
{
    movespeed = 0;
    state = 63;
    hsp = 2.5;
    vsp = -3;
    mach2 = 0;
    image_index = 0;
    instance_create(x - 10, y + 10, obj_bumpeffect);
}

if (mach2 == 0)
{
    if (!instance_exists(obj_slidecloud) && place_meeting(x, y + 1, obj_collisionparent))
        instance_create(x, y, obj_slidecloud);
}
else if (mach2 >= 35)
{
    if (!instance_exists(obj_dashcloud) && place_meeting(x, y + 1, obj_collisionparent))
        instance_create(x, y, obj_dashcloud);
}
else if (mach2 >= 100)
{
    if (!instance_exists(obj_dashcloud2) && place_meeting(x, y + 1, obj_collisionparent))
        instance_create(x, y, obj_dashcloud2);
}

scr_collideandmove();
