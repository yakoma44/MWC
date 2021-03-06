/// @description Jumping only!

// X-Axis Movement
X_MULTIPLIER        = .02; // Scales all X-Axis movement proportionally
WALK_ACCELERATION   = 0x98 * X_MULTIPLIER;
WALK_SPEED_MAX      = 0x1900 * X_MULTIPLIER;
WALK_STOP_THRESHOLD = 1200 * X_MULTIPLIER; // NOTE(hayden): This value is not in SMB!
RUN_ACCELERATION    = 0xE4 * X_MULTIPLIER;
RUN_SPEED_MAX       = 0x2900 * X_MULTIPLIER;
X_SKID              = 0x1A0 * X_MULTIPLIER;
X_SKID_THRESHOLD    = 0x900 * X_MULTIPLIER;
X_FRICTION          = 0xD0 * X_MULTIPLIER;

xSpeed = 0;
previousXSpeed = 0;
runCounter = 0;
wasInRunThreshold = false;

// X-Axis Aerial Movement
X_AERIAL_FORWARD_MOMENTUM_LOWER = 0x98 * X_MULTIPLIER;
X_AERIAL_FORWARD_MOMENTUM_UPPER = 0xE4 * X_MULTIPLIER;

X_AERIAL_BACKWARD_JUMP_START_WALKING_THRESHOLD              = 0x1000 * X_MULTIPLIER;
X_AERIAL_BACKWARD_MOMENTUM_MAX                              = 0xE4 * X_MULTIPLIER;
X_AERIAL_BACKWARD_MOMENTUM_UPPER_BELOW_JUMP_START_THRESHOLD = 0xA0 * X_MULTIPLIER;
X_AERIAL_BACKWARD_MOMENTUM_LOWER_BELOW_JUMP_START_THRESHOLD = 0x68 * X_MULTIPLIER;

// Jumping
WALKING_JUMP_HEIGHT = 22;
WALKING_TIME_TO_JUMP_APEX = 0.26;
JUMP_GRAVITY = 2*WALKING_JUMP_HEIGHT / sqr(WALKING_TIME_TO_JUMP_APEX);
FALL_GRAVITY = 7*WALKING_JUMP_HEIGHT / sqr(WALKING_TIME_TO_JUMP_APEX);
JUMP_VELOCITY = 2*WALKING_JUMP_HEIGHT / WALKING_TIME_TO_JUMP_APEX;
JUMP_FLOAT = 0; // NOTE(hayden): Use small (< 4) positive values only

acceleration = JUMP_GRAVITY;
ySpeed = JUMP_VELOCITY;
initialHeight = 0;

// scr_updateLocation() stuff
cx = 0;
cy = 0;
vx = 0;
vy = 0;

holding=noone;