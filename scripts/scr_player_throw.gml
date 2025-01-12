scr_getinput();
movespeed = 0;
mach2 = 0;

if (place_meeting(x, y + 1, obj_collisionparent))
    hsp = 0;

jumpAnim = 1;
dashAnim = 1;
landAnim = 0;
moveAnim = 1;
stopAnim = 1;
crouchslideAnim = 1;
crouchAnim = 1;

if (floor(image_index) == (image_number - 1))
    state = 0;

image_speed = 0.35;
scr_collideandmove();
