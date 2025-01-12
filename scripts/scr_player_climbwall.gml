scr_getinput();

if (windingAnim < 200)
    windingAnim++;

vsp = -movespeed;

if (movespeed > 0)
    movespeed -= 0.5;

crouchslideAnim = 1;
sprite_index = spr_player_climbwall;

if (!key_attack)
{
    state = 49;
    sprite_index = spr_player_fall;
}

if (!place_meeting(x + xscale, y, obj_collisionparent))
{
    instance_create(x, y, obj_jumpdust);
    vsp = 0;
    state = 61;
}

if ((place_meeting(x, y + 1, obj_collisionparent) && movespeed <= 0) || movespeed <= 0)
{
    state = 49;
    sprite_index = spr_player_fall;
}

image_speed = 0.6;

if (!instance_exists(obj_cloudeffect))
    instance_create(x, y + 43, obj_cloudeffect);

if (key_jump && key_attack)
{
    instance_create(x, y, obj_jumpdust);
    vsp = -9;
    state = 61;
    xscale *= -1;
}

scr_collideandmove();
