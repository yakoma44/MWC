if(state_new)
{
	scr_resetStateVars();
	sprite_index = spr_ghostChase;
}
//Reflecting sprite
if(x > obj_player.x)
{
	if(abs(x - obj_player.x) >= 1)
	{
		image_xscale = 1;
	}
	if(obj_player.image_xscale == 1)
	{
		scr_stateSwitch("Hide");
	}
	x -= chaseSpeed;
} 
else
{
	if(abs(x - obj_player.x) >= 1)
	{
		image_xscale = -1;
	}
	if(obj_player.image_xscale == -1)
	{
		scr_stateSwitch("Hide");
	}	
	x += chaseSpeed;
}

//Floating up and down sine wave. 
// Still a little rough.
chaseDegree = (chaseDegree + chaseIncrement) mod 360;
shift = chaseAmplitude * dsin(chaseDegree);
y += shift;

if((y - chaseDeadzone) >= obj_player.y)
{
	y -= chaseSpeed;
} 
else if ((y + chaseDeadzone) < obj_player.y)
{
	y += chaseSpeed;
}



