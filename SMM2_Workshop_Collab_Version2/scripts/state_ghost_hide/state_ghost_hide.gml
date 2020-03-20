if(state_new)
{
	scr_resetStateVars();
	sprite_index = spr_ghostHide;
}

//Reflecting sprite
if(x > obj_player.x)
{
	if(obj_player.image_xscale == -1)
	{
		scr_stateSwitch("Chase");
	}	
}
else
{
	if(obj_player.image_xscale == 1)
	{
		scr_stateSwitch("Chase");
	}	
}