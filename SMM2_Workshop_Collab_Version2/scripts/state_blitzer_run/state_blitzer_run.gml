if(state_new)
{
	scr_resetStateVars();
	sprite_index=spr_blitzEnemy;
}
vx=runSpeed*facing
//if there's a wall in the direction enemy is facing
if(cLeft&&facing==-1)
{
	//jump if the wall is low enough
	if(!place_meeting(x-1,y-36,obj_block))
	{
		vy=jumpSpeed
		scr_stateSwitch("Jump")
	}else{
		facing=1//Change direction when running into a wall that's too hight to jump over
	}
}
if(cRight&&facing==1)
{
	if(!place_meeting(x+1,y-36,obj_block))
	{
		vy=jumpSpeed
		scr_stateSwitch("Jump")
	}else{
		facing=-1
	}
}

image_xscale=-facing

if(!onGround){
	vy=jumpSpeed //jump if enemy runs off a ledge
	scr_stateSwitch("Jump")	
}