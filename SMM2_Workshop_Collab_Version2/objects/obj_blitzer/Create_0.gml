vx=0
vy=0
vyMax=6
grav=0.6
runSpeed=4
jumpSpeed=-6
facing=-1
onGround = OnGround();
cLeft    = place_meeting(x - 1, y, obj_block);
cRight   = place_meeting(x + 1, y, obj_block);
//cUp		 = place_meeting(x,y-1,obj_block);
cx=0
cy=0

scr_stateMachineCreate();
scr_stateAdd("Run",state_blitzer_run);
scr_stateAdd("Jump",state_blitzer_jump);
//scr_stateAdd("Hurt",state_player_hurt);
scr_stateBeginIn("Jump");