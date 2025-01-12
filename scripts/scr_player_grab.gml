scr_getinput();
grav = 0.5;
anger = 100;

if (!place_meeting(x, y + 1, obj_railh) && !place_meeting(x, y + 1, obj_railh2))
    hsp = xscale * movespeed;
else if (place_meeting(x, y + 1, obj_railh))
    hsp = (xscale * movespeed) - 5;
else if (place_meeting(x, y + 1, obj_railh2))
    hsp = (xscale * movespeed) + 5;

if (movespeed > 0)
    movespeed -= 1;

move = key_left2 + key_right2;
image_speed = 0.35;

if (key_slap2 && suplexhavetomash <= 0)
{
    scr_sound(16);
    hsp = 0;
    movespeed = 0;
    state = 32;
    image_index = 1;
    image_speed = 0.35;
    scr_sound(21);
}

if (key_attack2)
{
    state = 85;
    instance_create(x, y, obj_jumpdust);
}

if (move == xscale)
{
    scr_sound(10);
    hsp = 0;
    movespeed = 0;
    state = 38;
    image_index = 1;
    image_speed = 0.35;
    scr_sound(21);
}

if (move == -xscale)
{
    scr_sound(10);
    hsp = 0;
    movespeed = 0;
    state = 39;
    image_index = 1;
    image_speed = 0.35;
    scr_sound(21);
}

if (key_up)
{
    scr_sound(10);
    hsp = 0;
    movespeed = 0;
    state = 40;
    image_index = 1;
    image_speed = 0.35;
    scr_sound(21);
}

if (key_down)
{
    scr_sound(10);
    hsp = 0;
    movespeed = 0;
    state = 41;
    image_index = 1;
    image_speed = 0.35;
    
    with (obj_baddie)
    {
        if (point_in_rectangle(x, y, view_xview[0], view_yview[0], view_xview[0] + view_wview[0], view_yview[0] + view_hview[0]))
        {
            vsp = -7;
            hsp = 0;
        }
    }
    
    with (obj_camera)
    {
        shake_mag = 10;
        shake_mag_acc = 30 / room_speed;
    }
}

landAnim = 0;
scr_collideandmove();

if (key_jump)
{
    scr_sound(44);
    hsp = 0;
    movespeed = 0;
    sprite_index = spr_player_piledriver;
    vsp = -14;
    state = 34;
    image_index = 0;
    image_speed = 0.35;
}

if (floor(image_index) == (image_number - 1) && (sprite_index == spr_player_suplexmash1 || 251 || 250 || 249 || 248))
    sprite_index = spr_player_grab;
