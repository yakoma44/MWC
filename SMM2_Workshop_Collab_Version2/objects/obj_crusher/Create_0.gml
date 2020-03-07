//// public variables. change to how you see fit
sightDistance = 64; // how far the player has to be horizontally before the sprite changes
activationDistance = 32; // how far the player has to be horizontally before dropping on them
initialY = y; // the spot for the crusher to return to after falling
maxSpeed = 10; // how fast the crusher can go before hitting terminal velocity
acceleration = 1; // how much to change the speed when dropping
pauseHitTime = 30; // how long to wait after hitting a wall before retreating
retreatSpeed = 3; // how fast to retreat

// private variables. do not edit!
image_speed = 0;

// TODO: use the fsm scripts?

// IDLE: wait for a player to get close enough to drop
// ACTIVATED: drop down until a wall is hit
// RECOVERY: go back to the original spot
state = "IDLE";
direction = 270;
hitTimer = pauseHitTime;