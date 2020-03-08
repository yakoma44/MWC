/// @description Jumping only!
// You can write your code in this editor

tDelta = delta_time * .000001; // Seconds

var horizontalInputTotal = keyboard_check(vk_right) - keyboard_check(vk_left);

// Placeholder horizontal movement
currentRunSpd = horizontalInputTotal*-4;
vx += (prevRunSpd-currentRunSpd);
prevRunSpd = currentRunSpd;
if(horizontalInputTotal == -1)
{
	image_xscale = -1;
}
else if(horizontalInputTotal == 1)
{
	image_xscale = 1;
}

// Jump!
if(keyboard_check_pressed(ord("Z")))
{
	ySpeed = -JUMP_VELOCITY;
	acceleration = JUMP_GRAVITY;
	initialHeight = vy;
}
else if(keyboard_check_released(ord("Z")) || ySpeed >= 0)
{
	acceleration = FALL_GRAVITY;
}
else if(keyboard_check(ord("Z")))
{
	acceleration = JUMP_GRAVITY + JUMP_FLOAT*(vy-initialHeight);
}

vy = 0.5*acceleration*sqr(tDelta) + ySpeed*tDelta;
ySpeed += 0.5*acceleration*tDelta

// TODO(hayden): onGround checks
// TODO(hayden): Fix gravity accumulating while grounded (causing teleporting when leaving platforms)
// TODO(hayden): x-axis movement

scr_updateLocation();