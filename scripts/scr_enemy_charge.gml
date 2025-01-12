if (place_meeting(x, y + 1, obj_enemiesbumpable) || (place_meeting(x, y + 1, obj_onewaywall) && !place_meeting(x, y, obj_onewaywall)))
    hsp = image_xscale * (movespeed * 4);
else
    hsp = 0;

if (x != obj_player.x)
{
    if ((obj_player.x > (x - 400) && obj_player.x < (x + 400)) && obj_player.y == y && image_xscale == sign(obj_player.x - x))
        chargereset = 200;
}

image_speed = 0.35;
chargereset--;

if (chargereset == 0)
    state = 91;

if (((place_meeting(x + 1, y, obj_enemiesbumpable) && image_xscale == 1) || (place_meeting(x - 1, y, obj_enemiesbumpable) && image_xscale == -1)) && !place_meeting(x + sign(hsp), y, obj_slopes))
    image_xscale *= -1;

if (!(place_meeting(x + 15, y + 31, obj_enemiesbumpable) || place_meeting(x + 15, y + 31, obj_onewaywall)) && image_xscale == 1 && movespeed > 0)
    image_xscale *= -1;

if (!(place_meeting(x - 15, y + 31, obj_enemiesbumpable) || place_meeting(x - 15, y + 31, obj_onewaywall)) && image_xscale == -1 && movespeed > 0)
    image_xscale *= -1;

if (!(place_meeting(x, y + 1, obj_enemiesbumpable) || (place_meeting(x, y + 1, obj_onewaywall) && !place_meeting(x, y, obj_onewaywall))) && hsp < 0)
    hsp += 0.1;
else if (!(place_meeting(x, y + 1, obj_enemiesbumpable) || (place_meeting(x, y + 1, obj_onewaywall) && !place_meeting(x, y, obj_onewaywall))) && hsp > 0)
    hsp -= 0.1;

sprite_index = spr_peasanto_attack;
scr_collideandmoveonlywall();
