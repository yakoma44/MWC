/// @description Insert description here
// You can write your code in this editor
homeX=x;
homeY=y;
spawnBufferexists=false;

vx=0;
vy=0;
vyMax=4;
grav=0.2;
facing=-1;
onGround = OnGround();
cLeft    = place_meeting(x - 1, y, obj_block);
cRight   = place_meeting(x + 1, y, obj_block);
cUp		 = place_meeting(x,y-1,obj_block);
cx=0;
cy=0;
objectSpeed = 0;
