hsp = 0;

if (place_meeting(x, y + 1, obj_railh))
    hsp = -5;
else if (place_meeting(x, y + 1, obj_railh2))
    hsp = 5;

if (bombreset == 0)
{
    if (object_index == obj_pizzagoblin && floor(image_index) == 2)
    {
        bombreset = 200;
        
        with (instance_create(x, y, obj_bomb))
            hsp = other.image_xscale * 8;
    }
    
    if (object_index == obj_cheeserobot && floor(image_index) == 6)
    {
        bombreset = 200;
        
        with (instance_create(x, y, obj_cheeseblob))
        {
            sprite_index = spr_cheeserobot_goop;
            image_xscale = other.image_xscale;
            hsp = other.image_xscale * 8;
            vsp = 0;
            grav = 0;
        }
    }
    
    if (object_index == obj_spitcheese && floor(image_index) == 2)
    {
        bombreset = 100;
        
        with (instance_create(x + (image_xscale * 6), y - 6, obj_spitcheesespike))
        {
            image_xscale = other.image_xscale;
            hsp = other.image_xscale * 5;
            vsp = -6;
        }
    }
    
    if (object_index == obj_robot && floor(image_index) == 6)
    {
        bombreset = 200;
        
        with (instance_create(x, y, obj_robotknife))
        {
            image_xscale = other.image_xscale;
            hsp = other.image_xscale * 5;
        }
    }
}

if (floor(image_index) == (image_number - 1) && (place_meeting(x, y + 1, obj_enemiesbumpable) || place_meeting(x, y + 1, obj_onewaywall)))
{
    state = 84;
    image_index = 0;
}

if (!(place_meeting(x, y + 1, obj_enemiesbumpable) || place_meeting(x, y + 1, obj_onewaywall)) && hsp < 0)
    hsp += 0.1;
else if (!(place_meeting(x, y + 1, obj_enemiesbumpable) || place_meeting(x, y + 1, obj_onewaywall)) && hsp > 0)
    hsp -= 0.1;

if (object_index == obj_pizzagoblin)
    sprite_index = spr_pizzagoblin_throwbomb;

if (object_index == obj_robot)
    sprite_index = spr_robot_attack;

if (object_index == obj_cheeserobot)
    sprite_index = spr_cheeserobot_attack;

if (object_index == obj_spitcheese)
    sprite_index = spr_spitcheese_spit;

image_speed = 0.35;
scr_collideandmoveonlywall();
