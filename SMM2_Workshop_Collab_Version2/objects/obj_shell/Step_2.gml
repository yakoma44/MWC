/// @description Insert description here
// You can write your code in this editor
if(isHeld=false)
{
	if(onGround != true)
	{
		vy=Approach(vy,vyMax,0.1);	
	}
	scr_updateEnemyLocation();
}
