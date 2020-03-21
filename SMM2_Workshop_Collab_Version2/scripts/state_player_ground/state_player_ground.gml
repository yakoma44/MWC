if (state_new)
{
	scr_resetStateVars();
}
obj_inputControl.ledgeGraceTime=4;
var _busy = (attacking or usingSub);
//Grab Horizontal Input
horizontalInputTotal=(obj_inputControl.playerRightHeld-obj_inputControl.playerLeftHeld);

//Inherit Momentum from Moving Platform
vx+=(prevPlatSpd-currentPlatSpd)*-1;
prevPlatSpd=currentPlatSpd;
///Set NORMAL ANIMATIONS WHEN NOT ATTACKING OR USING SUB
if !(_busy)
{
	// NORMAL MOVEMENT FOR THE PLAYER 
	currentRunspd = horizontalInputTotal*runSpeed; 
	vx+=(prevRunSpd-currentRunspd)*-1;
	prevRunSpd=currentRunspd;
	
	// FACING AND XSCALE
	scr_setFacingAndXScale();
	
	// SPRITE CHOICE DURING FREE MOVEMENT
	if(obj_inputControl.playerDownHeld){ 
		sprite_index=spr_playerCrouch;
		prevRunSpd=0;
		vx-=currentRunspd;
	}
	else if (horizontalInputTotal==0){
		sprite_index=spr_playerIdle;}
	else if (abs(horizontalInputTotal)>0){
		sprite_index=spr_playerRun;}
	
	// RESPOND TO ATTACK BUTTON INPUTS 
	if (obj_inputControl.playerAttackPressed)
	{
		if (obj_inputControl.playerUpHeld) // USE SUB WEAPON
		{
			usingSub=true
			sprite_index = spr_playerSub; 
			image_index = 0; 
			prevRunSpd=0;
			vx-=currentRunspd;
		}
		else  // USE BASIC ATTACK 
		{
			attacking=true;
			// SET ATTACK SPRITE
			sprite_index = spr_playerSlash; 
			if (obj_inputControl.playerDownHeld == true)
			{sprite_index = spr_playerCrouchSlash}
			// RESET ANIMATION
			image_index = 0; 
			prevRunSpd=0;
			vx-=currentRunspd;
		}
	}
}
// ALLOW ATTACK ANIMATIONS TO FINISH 
else if (image_index >= image_number - 1)
{
	attacking = false;
	usingSub = false;
	//sprite_index = spr_playerIdle; 
}
//Standing Slash
if ((sprite_index == spr_playerSlash)) 
{
	if (image_index == 0)
	{scr_createHitbox(id, 10*sign(image_xscale), 0, 20,20,20);
		audio_play_sound_on(global.SEemitter,snd_slash1,false,1);}
	
	// EXAMPLE OF DOUBLE HITBOX SYSTEM
	if (floor(image_index) == 2 and (floor(image_index - image_speed) != 2))
	{
		//scr_createHitbox(id, 40*sign(image_xscale), 0,50,20,10);
	}
	
}

//Crouch Slash
if (sprite_index == spr_playerCrouchSlash&&image_index == 0) 
{    
   scr_createHitbox(id, 10*sign(image_xscale), 0, 20,20,20);
   audio_play_sound_on(global.SEemitter,snd_slash2,false,1);
}  

///State Switches
if (onGround==false)
{
	scr_stateSwitch("Air");
	vy=0;
	prevRunSpd=0;
	vx-=currentRunspd;
}
else if (obj_inputControl.jumpBuffer>0)
{
	obj_inputControl.jumpBuffer=0
	if(obj_inputControl.playerDownHeld && (place_meeting(x,y+1,obj_quarterBlock)or place_meeting(x,y+1,obj_halfBlock)))
	{
		++y;
		vy=0;
		prevRunSpd=0;
		vx-=currentRunspd;
		scr_stateSwitch("Air");
	}else{
		vy=jumpSpeed;
		audio_play_sound_on(global.SEemitter,snd_jump,false,1);
		obj_inputControl.ledgeGraceTime=0;
		prevRunSpd=0;
		vx-=currentRunspd;
		scr_stateSwitch("Air");
	}
}

if(place_meeting(x,y,par_enemy)&& invincibleTimer=0)
{
	var _enemy=instance_place(x,y,par_enemy);
	prevRunSpd=0;
	vx = knockbackX * sign(obj_player.x-_enemy.x);
	vy = knockbackY;
	invincibleTimer=invincibleDuration;
	scr_stateSwitch("Hurt");
	attacking=false;
	usingSub=false;
}
