if state_new
{
	scr_resetStateVars();
}
 
//grab horizontal and vertical input
horizontalInputTotal=(obj_inputControl.playerRightHeld-obj_inputControl.playerLeftHeld);
verticalInputTotal=obj_inputControl.playerDownHeld-obj_inputControl.playerUpHeld;

var _busy = (attacking or usingSub);
if !(_busy)
{
	// NORMAL MOVEMENT FOR THE PLAYER
	vy=verticalInputTotal*climbSpeed;
	
	// FACING AND XSCALE
	image_xscale=facing;
	
	// SPRITE CHOICE DURING FREE MOVEMENT
	if (verticalInputTotal==0)
	{
		sprite_index=spr_playerWallIdle;
	}
	else if (abs(verticalInputTotal)>0)
	{
		sprite_index=spr_playerWallClimb;
	}
	
	// RESPOND TO ATTACK BUTTON INPUTS 
	if (obj_inputControl.playerAttackPressed)
	{
		if (obj_inputControl.playerUpHeld) // USE SUB WEAPON
		{
			usingSub=true
			sprite_index = spr_playerWallSub; 
			image_index = 0; 
			vy=0
		}
		else  // USE BASIC ATTACK 
		{
			attacking=true;
			// SET ATTACK SPRITE
			sprite_index = spr_playerWallSlash; 
			// RESET ANIMATION
			image_index = 0; 
			vy=0;
		}
	}
}
// ALLOW ATTACK ANIMATIONS TO FINISH 
else if (image_index >= image_number - 1)
{
	attacking = false;
	usingSub = false;
}

if (sprite_index == spr_playerWallSlash&&image_index == 0) 
{    
   scr_createHitbox(id, 10*sign(image_xscale), 0, 20,20,20);
   audio_play_sound_on(global.SEemitter,snd_slash2,false,1);
} 

///State Switches
if (onGround && verticalInputTotal==1)
{
	scr_stateSwitch("Ground");	
}
if(cUp && verticalInputTotal==-1)
{
	audio_play_sound_on(global.SEemitter,snd_cling,false,1)
	scr_stateSwitch("Ceiling");	
}

if(facing=-1)
{
	if(!cLeft)//If no longer in contact with a wall to the left when facing left. Switch to air state
	{
		//Inherit Momentum from Moving Platform
		vx+=(prevPlatSpd-currentPlatSpd)*-1;
		prevPlatSpd=currentPlatSpd;
		scr_stateSwitch("Air");	
	}
	if(horizontalInputTotal==1 && obj_inputControl.jumpBuffer>0)//Switch direction facing and wall jump
	{
		obj_inputControl.jumpBuffer=0
		facing=1;
		//Inherit Momentum from Moving Platform
		vx+=(prevPlatSpd-currentPlatSpd)*-1;
		prevPlatSpd=currentPlatSpd;
		audio_play_sound_on(global.SEemitter,snd_jump,false,1)
		scr_stateSwitch("Air");
		vy=jumpSpeed;	
	}
}
else if(facing=1)
{
	if(!cRight)
	{
		//Inherit Momentum from Moving Platform
		vx+=(prevPlatSpd-currentPlatSpd)*-1;
		prevPlatSpd=currentPlatSpd;
		scr_stateSwitch("Air");	
	}
	if(horizontalInputTotal==-1 && obj_inputControl.jumpBuffer>0)
	{
		obj_inputControl.jumpBuffer=0;
		facing=-1;
		//Inherit Momentum from Moving Platform
		vx+=(prevPlatSpd-currentPlatSpd)*-1;
		prevPlatSpd=currentPlatSpd;
		audio_play_sound_on(global.SEemitter,snd_jump,false,1)
		scr_stateSwitch("Air");
		vy=jumpSpeed;	
	}
}

if(place_meeting(x,y,par_enemy)&& invincibleTimer=0)
{
	vx = knockbackX * sign(obj_player.x-par_enemy.x);
	vy = knockbackY;
	invincibleTimer=30;
	scr_stateSwitch("Hurt");	
}
