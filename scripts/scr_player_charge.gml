scr_getinput();

if (windingAnim < 2000)
    windingAnim++;

if (!place_meeting(x, y + 1, obj_railh) && !place_meeting(x, y + 1, obj_railh2))
    hsp = xscale * movespeed;
else if (place_meeting(x, y + 1, obj_railh))
    hsp = (xscale * movespeed) - 5;
else if (place_meeting(x, y + 1, obj_railh2))
    hsp = (xscale * movespeed) + 5;

move2 = key_right2 + key_left2;
move = key_right + key_left;
movespeed = 10;
crouchslideAnim = 1;

if (!key_jump2 && jumpstop == 0 && vsp < 0.5)
{
    vsp /= 2;
    jumpstop = 1;
}

if (place_meeting(x, y + 1, obj_collisionparent) && vsp > 0)
    jumpstop = 0;

if (input_buffer_jump < 8 && place_meeting(x, y + 1, obj_collisionparent))
{
    image_index = 0;
    sprite_index = spr_player_secondjump1;
    scr_sound(44);
    vsp = -9;
}

if (key_jump)
    input_buffer_jump = 0;

if ((place_meeting(x + 1, y, obj_collisionparent) && xscale == 1) && !place_meeting(x + 1, y, obj_slopes))
{
    scr_sound(10);
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
    scr_sound(10);
    movespeed = 0;
    state = 63;
    hsp = 2.5;
    vsp = -3;
    mach2 = 0;
    image_index = 0;
    instance_create(x - 10, y + 10, obj_bumpeffect);
}

sprite_index = spr_player_charge;
image_speed = 0.65;

if (!instance_exists(obj_dashcloud) && place_meeting(x, y + 1, obj_collisionparent))
    instance_create(x, y, obj_dashcloud);

scr_collideandmove();
