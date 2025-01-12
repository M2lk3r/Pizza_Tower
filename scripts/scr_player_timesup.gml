scr_getinput();
xscale = 1;
sprite_index = spr_player_timesup;

if (place_meeting(x, y, obj_timesup))
{
    scr_sound(33);
    state = 46;
    sprite_index = spr_player_deathend;
    alarm[10] = 5;
    vsp = -8;
    hsp = -4;
}

if (room == timesuproom)
{
    obj_player.x = 480;
    obj_player.y = 270;
}

if (floor(image_index) == 9)
    image_speed = 0;
