event_inherited();

chaseSpeed = 0.7;
//Variables for floating up and down
chaseDegree = 0;
chaseIncrement = 3;
chaseAmplitude = 1;
chaseDeadzone = 50;
enemyObject = obj_ghost;
scr_stateMachineCreate();
scr_stateAdd("Chase", state_ghost_chase);
scr_stateAdd("Hide", state_ghost_hide);
//scr_stateIdle("Idle", state_ghost_idle);
scr_stateBeginIn("Chase");

//No need to worry about walls
//Slowly move closer to the player. Calculate based off of player's location.
//Idle state wandering back and forth before detecting player?
//If player is looking at it, keep still.

//He approaches at a constant speed.
//He wobbles up and down.