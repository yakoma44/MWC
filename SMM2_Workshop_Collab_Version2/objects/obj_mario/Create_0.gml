/// @description Jumping only!

// X-Axis Movement
X_MULTIPLIER = .02; // Scales all X-Axis movement proportionally
WALK_ACCELERATION = 152 * X_MULTIPLIER;
WALK_SPEED_MAX = 6400 * X_MULTIPLIER;
WALK_STOP_THRESHOLD = 1200 * X_MULTIPLIER; // This value is not in SMB
RUN_ACCELERATION = 228 * X_MULTIPLIER;
RUN_SPEED_MAX = 10496 * X_MULTIPLIER;
X_SKID = 416 * X_MULTIPLIER;
X_SKID_THRESHOLD = 2304 * X_MULTIPLIER;
X_FRICTION = 208 * X_MULTIPLIER;
runCounter = 0;

// Jumping
JUMP_HEIGHT = 27;
TIME_TO_JUMP_APEX = 0.31;
JUMP_GRAVITY = 2*JUMP_HEIGHT / sqr(TIME_TO_JUMP_APEX);
FALL_GRAVITY = 7*JUMP_HEIGHT / sqr(TIME_TO_JUMP_APEX);
JUMP_VELOCITY = 2*JUMP_HEIGHT / TIME_TO_JUMP_APEX;
JUMP_FLOAT = 0; // NOTE(hayden): Use small (< 4) positive values only

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