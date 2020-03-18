///Establish variables
vx=0; 
vy=0; 
grav=.6; 
//clingTime = 2.0;
prevPlatSpd=0;
currentPlatSpd=0;
runSpeed=3; //should be 1.5 but cannot figure out how to set roomspeed to 60 fps
prevRunSpd=0;
currentRunspd=0;
jumpSpeed=-8;
wallJumpSpeed=-6;
backAirSpeed=1; //should be 0.5
prevAirSpd=0;
currentAirSpd=0;
climbSpeed=2;
facing=1;
vyMax=8;
attacking=false;
usingSub=false;

nudgeMax=4;
hitstun=12;
invincibleTimer=0;
knockbackX=2;
knockbackY=-4;
//stats
health = 1;


// Used for sub-pixel movement
cx = 0;
cy = 0;

onGround = OnGround();
cLeft    = place_meeting(x - 1, y, obj_block);
cRight   = place_meeting(x + 1, y, obj_block);
cUp		 = place_meeting(x,y-1,obj_block);

//audio_listener_position(x,y,0);
scr_stateMachineCreate();
scr_stateAdd("Ground",state_player_ground);
scr_stateAdd("Air",state_player_air);
scr_stateAdd("Wall",state_player_wall);
scr_stateAdd("Ceiling",state_player_ceiling);
scr_stateAdd("Hurt",state_player_hurt);
scr_stateBeginIn("Ground");
/*scr_stateAdd("Idle" , state_player_idle);
scr_stateAdd("Run" ,state_player_run);
scr_stateAdd("Jump" ,state_player_jump );
scr_stateAdd("Fall" ,state_player_fall );
scr_stateAdd("Crouch" ,state_player_crouch );
scr_stateAdd("FlipJump" ,state_player_flipJump );
scr_stateAdd("WallIdle" ,state_player_wallIdle );
scr_stateAdd("WallClimb" ,state_player_wallClimb );
scr_stateAdd("CeilingIdle" ,state_player_ceilingIdle );
scr_stateAdd("CeilingSwing" ,state_player_ceilingSwing);
scr_stateAdd("Slash" ,state_player_slash );
scr_stateAdd("JumpSlash" ,state_player_jumpSlash );
scr_stateAdd("CrouchSlash" ,state_player_crouchSlash );
scr_stateAdd("FlipSlash" ,state_player_flipSlash );
scr_stateAdd("WallSlash" ,state_player_wallSlash );
scr_stateAdd("CeilingSlash" ,state_player_ceilingSlash );
scr_stateAdd("Sub" ,state_player_sub);
scr_stateAdd("JumpSub" ,state_player_jumpSub );
scr_stateAdd("WallSub" ,state_player_wallSub );
scr_stateAdd("CeilingSub" ,state_player_ceilingSub );
scr_stateAdd("Hurt" ,state_player_hurt );
scr_stateBeginIn("Idle")
