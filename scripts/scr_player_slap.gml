scr_getinput();

if (!place_meeting(x, y + 1, obj_collisionparent))
{
    fallinganimation++;
    
    if (fallinganimation >= 40 && fallinganimation < 80)
    {
        sprite_index = spr_player_facestomp;
        state = 49;
    }
}

move = key_left + key_right;

if (momemtum == 0)
{
    if (!place_meeting(x, y + 1, obj_railh) && !place_meeting(x, y + 1, obj_railh2))
        hsp = move * movespeed;
    else if (place_meeting(x, y + 1, obj_railh))
        hsp = (move * movespeed) - 5;
    else if (place_meeting(x, y + 1, obj_railh2))
        hsp = (move * movespeed) + 5;
}
else
{
    hsp = xscale * movespeed;
}

if (move != xscale && momemtum == 1 && movespeed != 0)
    movespeed -= 0.05;

if (movespeed == 0)
    momemtum = 0;

if ((move == 0 && momemtum == 0) || (place_meeting(x + hsp, y, obj_collisionparent) && !place_meeting(x + sign(hsp), y, obj_slopes)))
    movespeed = 0;

if (move != 0 && movespeed < 4)
    movespeed += 0.25;

if (movespeed > 4)
    movespeed -= 0.05;

if (((place_meeting(x + 1, y, obj_collisionparent) && move == 1) || (place_meeting(x - 1, y, obj_collisionparent) && move == -1)) && !place_meeting(x + sign(hsp), y, obj_slopes))
    movespeed = 0;

if (dir != xscale)
{
    dir = xscale;
    movespeed = 0;
}

if (move == -xscale)
{
    movespeed = 0;
    momemtum = 0;
}

landAnim = 0;

if (key_slap)
    slapbuffer = 0;

if (floor(image_index) == (image_number - 1) && slapbuffer < 8)
{
    if (place_meeting(x, y + 1, obj_collisionparent) && move == 0)
    {
        if (slaphand == 1)
        {
            scr_sound(16);
            sprite_index = spr_player_slap1;
        }
        
        if (slaphand == -1)
        {
            scr_sound(15);
            sprite_index = spr_player_slap2;
        }
    }
    else if (place_meeting(x, y + 1, obj_collisionparent) && move != 0)
    {
        if (slaphand == 1)
        {
            scr_sound(16);
            sprite_index = spr_player_slaprun1;
        }
        
        if (slaphand == -1)
        {
            scr_sound(15);
            sprite_index = spr_player_slaprun2;
        }
    }
    else
    {
        if (slaphand == 1)
        {
            scr_sound(16);
            sprite_index = spr_player_slap1air;
        }
        
        if (slaphand == -1)
        {
            scr_sound(15);
            sprite_index = spr_player_slap2air;
        }
    }
    
    image_index = 0;
    slaphand *= -1;
}

scr_collideandmove();

if (place_meeting(x, y + 1, obj_collisionparent) && move == 0)
{
    if (slaphand == 1)
        sprite_index = spr_player_slap1;
    
    if (slaphand == -1)
        sprite_index = spr_player_slap2;
}
else if (place_meeting(x, y + 1, obj_collisionparent) && move != 0)
{
    if (slaphand == 1)
        sprite_index = spr_player_slaprun1;
    
    if (slaphand == -1)
        sprite_index = spr_player_slaprun2;
}
else
{
    if (slaphand == 1)
        sprite_index = spr_player_slap1air;
    
    if (slaphand == -1)
        sprite_index = spr_player_slap2air;
}

if (floor(image_index) == 1 && !instance_exists(obj_slaphitbox2))
    instance_create(x, y, obj_slaphitbox2);

if (floor(image_index) == (image_number - 1) && slapbuffer == 8)
{
    if (place_meeting(x, y + 1, obj_collisionparent))
    {
        state = 0;
    }
    else if (!place_meeting(x, y + 1, obj_collisionparent))
    {
        sprite_index = spr_player_fall;
        state = 49;
    }
}

if (move != 0)
    xscale = move;

if (!instance_exists(obj_cloudeffect) && place_meeting(x, y + 1, obj_collisionparent) && move != 0 && (floor(image_index) == 4 || floor(image_index) == 10))
    instance_create(x, y + 43, obj_cloudeffect);

image_speed = 0.35;
