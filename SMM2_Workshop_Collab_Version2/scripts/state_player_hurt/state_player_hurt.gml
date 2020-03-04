if (state_new)
{
	scr_resetStateVars();
	sprite_index=spr_playerHurt;
	audio_play_sound_on(global.SEemitter,snd_player_hurt1,false,1)
	state_var[2]=hitstun
}
 
state_var[2]=max(state_var[2]-1,0);
//set Gravity
vy =Approach(vy, vyMax, grav);

if(state_var[2]<=0)
{
	if((cLeft&&obj_inputControl.playerLeftHeld)||(cRight&&obj_inputControl.playerRightHeld))
	{
		facing=cRight-cLeft;
		vy=0;
		audio_play_sound_on(global.SEemitter,snd_cling,false,1)
		scr_stateSwitch("Wall");
	}
	if((cUp&&verticalInputTotal==-1)or
	(vy>0 && !obj_inputControl.playerDownHeld && place_meeting(x,y-1,obj_halfBlock)&&!place_meeting(x,y,obj_halfBlock)))
	{
		vy=0;
		audio_play_sound_on(global.SEemitter,snd_cling,false,1)
		scr_stateSwitch("Ceiling");	
	}
	if(vy>=0 && onGround)
	{
		vy=0;//DO NOT REMOVE THIS else player drops like a rock when moving off half and quarter blocks
		vx=0;
		scr_stateSwitch("Ground");	
	}else{
		vx=0;
		scr_stateSwitch("Air");	
	}
}