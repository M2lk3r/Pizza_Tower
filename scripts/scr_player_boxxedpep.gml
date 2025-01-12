scr_getinput();
mask_index = spr_crouchmask;
key_particles = 0;
alarm[5] = 2;
alarm[7] = 60;
hurted = 1;

if (key_jump)
    input_buffer_jump = 0;

if (!key_jump2 && jumpstop == 0 && vsp < 0.5 && stompAnim == 0)
{
    vsp /= 2;
    jumpstop = 1;
}

if (place_meeting(x, y + 1, obj_collisionparent) && vsp > 0)
    jumpstop = 0;

if (dir != xscale)
{
    dir = xscale;
    movespeed = 0;
}

if (sprite_index != spr_boxxedpep_intro)
{
    move = key_left + key_right;
    
    if (!place_meeting(x, y + 1, obj_railh) && !place_meeting(x, y + 1, obj_railh2))
        hsp = move * movespeed;
    else if (place_meeting(x, y + 1, obj_railh))
        hsp = (move * movespeed) - 5;
    else if (place_meeting(x, y + 1, obj_railh2))
        hsp = (move * movespeed) + 5;
}

if (place_meeting(x + sign(hsp), y, obj_collisionparent) && xscale == 1 && move == 1 && !place_meeting(x + 1, y, obj_slopes))
    movespeed = 0;

if (place_meeting(x + sign(hsp), y, obj_collisionparent) && xscale == -1 && move == -1 && !place_meeting(x - 1, y, obj_slopes))
    movespeed = 0;

if ((place_meeting(x, y + 1, obj_collisionparent) && input_buffer_jump < 8 && vsp > 0) && !place_meeting(x, y - 16, obj_collisionparent) && !place_meeting(x, y - 32, obj_collisionparent))
{
    scr_sound(44);
    instance_create(x, y, obj_highjumpcloud2);
    vsp = -11;
}

if (move != 0)
{
    if (movespeed < 8)
        movespeed += 0.5;
    else if (floor(movespeed) == 8)
        movespeed = 8;
}
else
{
    movespeed = 0;
}

if (movespeed > 8)
    movespeed -= 0.1;

if (sprite_index == spr_boxxedpep_intro && floor(image_index) == (image_number - 1))
    sprite_index = spr_boxxedpep_idle;

if (sprite_index != spr_boxxedpep_intro)
{
    if (move != 0)
        xscale = move;
    
    if (place_meeting(x, y + 1, obj_collisionparent))
    {
        if (move != 0)
            sprite_index = spr_boxxedpep_walk;
        else
            sprite_index = spr_boxxedpep_idle;
    }
    else
    {
        sprite_index = spr_boxxedpep_air;
    }
}

if (!instance_exists(obj_cloudeffect) && place_meeting(x, y + 1, obj_collisionparent) && move != 0 && (floor(image_index) == 4 || floor(image_index) == 10))
    instance_create(x, y + 43, obj_cloudeffect);

if (!instance_exists(obj_cloudeffect) && place_meeting(x, y + 1, obj_collisionparent) && move != 0 && (sprite_index == spr_player_downslopes || sprite_index == spr_player_upslopes))
    instance_create(x, y + 43, obj_cloudeffect);

if (move != 0 && (floor(image_index) == 3 || floor(image_index) == 8) && steppy == 0)
{
    scr_sound(7);
    steppy = 1;
}

if (move != 0 && floor(image_index) != 3 && floor(image_index) != 8)
    steppy = 0;

scr_collideandmove();
