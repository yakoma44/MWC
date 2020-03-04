if(state_new)
{
	scr_resetStateVars();
	sprite_index=spr_blitzEnemy;
}
vx=runSpeed*facing
vy=Approach(vy,vyMax,grav)
image_xscale=-facing
if(vy>=0 && onGround){
	vy=0 
	scr_stateSwitch("Run");	
}