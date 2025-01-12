image_xscale = -obj_player.xscale;
stunned = 200;
obj_player.baddiegrabbedID = id;

if (obj_player.state == 19 || obj_player.state == 37 || obj_player.state == 32 || obj_player.state == 33 || obj_player.state == 85)
{
    x = obj_player.x + (obj_player.xscale * 15);
    y = obj_player.y;
    image_xscale = -obj_player.xscale;
}

with (obj_player)
{
    suplexhavetomash = other.hp - 1;
    scr_getinput();
    move = key_left2 + key_right2;
    
    if (key_slap2 && sprite_index == spr_player_grab)
    {
        scr_sound(10);
        global.hit += 1;
        global.combotime = 60;
        image_index = 0;
        sprite_index = choose(spr_player_suplexmash1, spr_player_suplexmash2, spr_player_suplexmash4);
        other.hp -= 1;
        instance_create(other.x, other.y, obj_slapstar);
        instance_create(other.x, other.y, obj_baddiegibs);
        other.flash = 1;
        
        with (obj_camera)
        {
            shake_mag = 3;
            shake_mag_acc = 3 / room_speed;
        }
    }
    
    if (!(state == 37 || state == 19 || state == 32 || state == 33 || state == 85 || state == 38 || state == 34 || state == 39 || state == 40 || state == 41))
    {
        other.x = x;
        other.y = y;
        other.state = 95;
        other.image_index = 0;
    }
}

hsp = 0;

if (obj_player.state == 38 && floor(obj_player.image_index) == 2)
{
    global.hit += 1;
    hp -= 1;
    instance_create(x + (obj_player.xscale * 30), y, obj_bumpeffect);
    alarm[1] = 5;
    thrown = 1;
    x = obj_player.x;
    y = obj_player.y;
    state = 95;
    hsp = -image_xscale * 25;
    grav = 0;
    vsp = -2;
    global.combotime = 60;
    instance_create(x, y, obj_slapstar);
    instance_create(x, y, obj_baddiegibs);
    flash = 1;
    
    with (obj_camera)
    {
        shake_mag = 3;
        shake_mag_acc = 3 / room_speed;
    }
}

if (obj_player.state == 39 && floor(obj_player.image_index) == 2)
{
    global.hit += 1;
    hp -= 1;
    instance_create(x + (-obj_player.xscale * 50), y, obj_bumpeffect);
    alarm[1] = 5;
    thrown = 1;
    x = obj_player.x;
    y = obj_player.y;
    state = 95;
    image_xscale *= -1;
    hsp = -image_xscale * 20;
    vsp = -7;
    global.combotime = 60;
    instance_create(x, y, obj_slapstar);
    instance_create(x, y, obj_baddiegibs);
    flash = 1;
    
    with (obj_camera)
    {
        shake_mag = 3;
        shake_mag_acc = 3 / room_speed;
    }
}

if (obj_player.state == 41 && floor(obj_player.image_index) == 2)
{
    global.hit += 1;
    hp -= 1;
    instance_create(x, y + 20, obj_bumpeffect);
    alarm[1] = 5;
    thrown = 1;
    x = obj_player.x;
    y = obj_player.y;
    state = 95;
    hsp = -image_xscale * 10;
    vsp = -10;
    global.combotime = 60;
    instance_create(x, y, obj_slapstar);
    instance_create(x, y, obj_baddiegibs);
    flash = 1;
    
    with (obj_camera)
    {
        shake_mag = 3;
        shake_mag_acc = 3 / room_speed;
    }
}

if (obj_player.state == 32 && floor(obj_player.image_index) == 2)
{
    global.hit += 1;
    hp -= 1;
    alarm[1] = 5;
    thrown = 1;
    x = obj_player.x;
    y = obj_player.y;
    state = 95;
    hsp = -image_xscale * 10;
    vsp = -10;
}

if (obj_player.state == 40 && floor(obj_player.image_index) == 2)
{
    global.hit += 1;
    hp -= 1;
    instance_create(x + (-obj_player.xscale * 15), y - 50, obj_bumpeffect);
    alarm[1] = 5;
    thrown = 1;
    x = obj_player.x;
    y = obj_player.y;
    hsp = -image_xscale * 2;
    state = 95;
    vsp = -20;
    global.combotime = 60;
    instance_create(x, y, obj_slapstar);
    instance_create(x, y, obj_baddiegibs);
    flash = 1;
    
    with (obj_camera)
    {
        shake_mag = 3;
        shake_mag_acc = 3 / room_speed;
    }
}

if (obj_player.state == 85)
{
    x = obj_player.x + (obj_player.xscale * 15);
    y = obj_player.y;
}

if (obj_player.state == 63)
{
    instance_create(x, y, obj_slapstar);
    instance_create(x, y, obj_baddiegibs);
    flash = 1;
    global.combotime = 60;
    global.hit += 1;
    hp -= 1;
    alarm[1] = 5;
    thrown = 1;
    x = obj_player.x;
    y = obj_player.y;
    state = 95;
    hsp = -image_xscale * 10;
    vsp = -10;
    
    with (obj_camera)
    {
        shake_mag = 3;
        shake_mag_acc = 3 / room_speed;
    }
}

if (obj_player.state == 34)
{
    if (floor(obj_player.image_index) == 0)
    {
        depth = 0;
        x = obj_player.x + (obj_player.xscale * 10);
        y = obj_player.y;
    }
    
    if (floor(obj_player.image_index) == 1)
    {
        depth = 0;
        x = obj_player.x + (obj_player.xscale * 5);
        y = obj_player.y;
    }
    
    if (floor(obj_player.image_index) == 2)
    {
        depth = 0;
        x = obj_player.x;
        y = obj_player.y;
    }
    
    if (floor(obj_player.image_index) == 3)
    {
        depth = 0;
        x = obj_player.x + (obj_player.xscale * -5);
        y = obj_player.y;
    }
    
    if (floor(obj_player.image_index) == 4)
    {
        depth = 0;
        x = obj_player.x + (obj_player.xscale * -10);
        y = obj_player.y;
    }
    
    if (floor(obj_player.image_index) == 5)
    {
        depth = -7;
        x = obj_player.x + (obj_player.xscale * -5);
        y = obj_player.y;
    }
    
    if (floor(obj_player.image_index) == 6)
    {
        depth = -7;
        x = obj_player.x;
        y = obj_player.y;
    }
    
    if (floor(obj_player.image_index) == 7)
    {
        depth = -7;
        x = obj_player.x + (obj_player.xscale * 5);
        y = obj_player.y;
    }
    
    if (obj_player.sprite_index == spr_player_piledriverland)
    {
        instance_create(x, y, obj_slapstar);
        instance_create(x, y, obj_baddiegibs);
        flash = 1;
        global.combotime = 60;
        global.hit += 1;
        hp -= 1;
        alarm[1] = 5;
        thrown = 1;
        x = obj_player.x;
        y = obj_player.y;
        state = 95;
        hsp = -image_xscale * 10;
        vsp = -10;
    }
}

sprite_index = grabbedspr;
image_speed = 0.35;
