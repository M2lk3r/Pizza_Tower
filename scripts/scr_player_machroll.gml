scr_getinput();

if (!place_meeting(x, y + 1, obj_railh))
    hsp = xscale * movespeed;
else if (place_meeting(x, y + 1, obj_railh))
    hsp = (xscale * movespeed) - 5;
else if (place_meeting(x, y + 1, obj_railh2))
    hsp = (xscale * movespeed) + 5;

mach2 = 100;
machslideAnim = 1;
move = key_right + key_left;
movespeed = 12;

if ((!key_down && !place_meeting(x + 27, y - 32, obj_collisionparent) && !place_meeting(x - 27, y - 32, obj_collisionparent) && !place_meeting(x, y - 32, obj_collisionparent) && !place_meeting(x, y - 16, obj_collisionparent)) || !place_meeting(x, y + 1, obj_collisionparent))
{
    machhitAnim = 1;
    state = 61;
}

if ((place_meeting(x + 1, y, obj_bumpable) && xscale == 1) && !place_meeting(x + sign(hsp), y, obj_slopes))
{
    scr_sound(19);
    
    with (obj_camera)
    {
        shake_mag = 20;
        shake_mag_acc = 40 / room_speed;
    }
    
    hsp = 0;
    image_speed = 0.35;
    
    with (obj_baddie)
    {
        if (point_in_rectangle(x, y, view_xview[0], view_yview[0], view_xview[0] + view_wview[0], view_yview[0] + view_hview[0]))
        {
            stun = 1;
            alarm[0] = 200;
            ministun = 0;
            vsp = -5;
            hsp = 0;
            image_xscale *= -1;
        }
    }
    
    flash = 0;
    combo = 0;
    state = 63;
    hsp = -2.5;
    vsp = -3;
    mach2 = 0;
    image_index = 0;
    instance_create(x + 10, y + 10, obj_bumpeffect);
}

if ((place_meeting(x - 1, y, obj_bumpable) && xscale == -1) && !place_meeting(x + sign(hsp), y, obj_slopes))
{
    scr_sound(19);
    
    with (obj_camera)
    {
        shake_mag = 20;
        shake_mag_acc = 40 / room_speed;
    }
    
    hsp = 0;
    image_speed = 0.35;
    flash = 0;
    combo = 0;
    state = 63;
    hsp = 2.5;
    vsp = -3;
    mach2 = 0;
    image_index = 0;
    instance_create(x - 10, y + 10, obj_bumpeffect);
}

if (place_meeting(x, y + 1, obj_collisionparent))
    sprite_index = spr_player_machroll;

if (floor(image_index) == 0)
    flash = 1;
else
    flash = 0;

if (!instance_exists(obj_cloudeffect) && place_meeting(x, y + 1, obj_collisionparent))
    instance_create(x, y + 43, obj_cloudeffect);

image_speed = 0.8;
scr_collideandmove();
