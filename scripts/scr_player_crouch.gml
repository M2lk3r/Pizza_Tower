scr_getinput();
move = key_left + key_right;

if (!place_meeting(x, y + 1, obj_railh) && !place_meeting(x, y + 1, obj_railh2))
    hsp = move * movespeed;
else if (place_meeting(x, y + 1, obj_railh))
    hsp = (move * movespeed) - 5;
else if (place_meeting(x, y + 1, obj_railh2))
    hsp = (move * movespeed) + 5;

mask_index = spr_crouchmask;
turning = 0;
movespeed = 4;

if (!place_meeting(x, y + 1, obj_collisionparent) && !key_jump)
{
    jumpAnim = 0;
    state = 58;
    movespeed = 4;
    crouchAnim = 1;
    image_index = 0;
}

if (key_jump && place_meeting(x, y + 1, obj_collisionparent) && !place_meeting(x, y - 16, obj_collisionparent) && !place_meeting(x, y - 32, obj_collisionparent))
{
    scr_sound(44);
    vsp = -8;
    state = 58;
    movespeed = 4;
    image_index = 0;
    crouchAnim = 1;
    jumpAnim = 1;
}

if (place_meeting(x, y + 1, obj_collisionparent) && !key_down && !place_meeting(x, y - 16, obj_collisionparent) && !place_meeting(x, y - 32, obj_collisionparent) && !key_jump)
{
    state = 0;
    movespeed = 0;
    crouchAnim = 1;
    jumpAnim = 1;
    image_index = 0;
    mask_index = spr_player_mask;
}

if (crouchAnim == 0)
{
    if (move == 0)
    {
        if (shotgunAnim == 0)
            sprite_index = spr_player_crouch;
        else
            sprite_index = spr_shotgun_duck;
    }
    
    if (move != 0)
        sprite_index = spr_player_crawl;
}

if (crouchAnim == 1)
{
    if (move == 0)
    {
        if (shotgunAnim == 0)
            sprite_index = spr_player_couchstart;
        else
            sprite_index = spr_shotgun_goduck;
        
        if (floor(image_index) == (image_number - 1))
            crouchAnim = 0;
    }
}

if (move != 0)
{
    xscale = move;
    crouchAnim = 0;
}

image_speed = 0.6;
scr_collideandmove();
