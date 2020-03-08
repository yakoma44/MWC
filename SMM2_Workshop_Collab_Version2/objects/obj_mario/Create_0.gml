/// @description Jumping only!

// Jumping

JUMP_HEIGHT = 34;
TIME_TO_JUMP_APEX = 0.31;
JUMP_GRAVITY = 2*JUMP_HEIGHT / sqr(TIME_TO_JUMP_APEX);
FALL_GRAVITY = 7*JUMP_HEIGHT / sqr(TIME_TO_JUMP_APEX);
JUMP_VELOCITY = 2*JUMP_HEIGHT / TIME_TO_JUMP_APEX;
JUMP_FLOAT = 3; // NOTE(hayden): Use small (< 4) positive values only

acceleration = JUMP_GRAVITY;
ySpeed = JUMP_VELOCITY;
initialHeight = 0;

// scr_updateLocation() stuff
cx = 0;
cy = 0;
vx = 0;
vy = 0;
prevRunSpd = 0;
currentRunSpd = 0;