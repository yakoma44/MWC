var _enemyObject = argument0

if(spawnBufferexists==false){
spawnBuffer= instance_create(homeX,homeY,obj_spawnBuffer)
spawnBuffer.enemyID=id;
spawnBuffer.enemy=_enemyObject;
other.spawnBufferexists=true;
}

cLeft    = place_meeting(x - 1, y, obj_block);
cRight   = place_meeting(x + 1, y, obj_block);
cUp		 = place_meeting(x,y-1,obj_block);
onGround = OnGround();
