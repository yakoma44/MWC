if state_new{
	scr_resetStateVars();
	
}
var _busy = (attacking or usingSub);
obj_inputControl.ledgeGraceTime = max(obj_inputControl.ledgeGraceTime -1, 0); 
//Get Directional Inputs
horizontalInputTotal=obj_inputControl.playerRightHeld-obj_inputControl.playerLeftHeld;
verticalInputTotal=obj_inputControl.playerDownHeld-obj_inputControl.playerUpHeld;

//mid-air x movement
if (horizontalInputTotal=facing){
    //vx=facing*runSpeed;
	currentAirSpd=facing*runSpeed;
	vx+=(prevAirSpd-currentAirSpd)*-1;
	prevAirSpd=currentAirSpd;
} else if (horizontalInputTotal!=facing){
    //vx=abs(horizontalInputTotal)*-facing*backAirSpeed;
	currentAirSpd=abs(horizontalInputTotal)*-facing*backAirSpeed;
	vx+=(prevAirSpd-currentAirSpd)*-1;
	prevAirSpd=currentAirSpd;
}

//set Gravity
vy =Approach(vy, vyMax, grav);

//set direction facing
image_xscale=facing;

if !(_busy)
{
	///Set in-state animations
	if(vy<=0)
	{
		sprite_index= spr_playerJump;	
	}else if (vy>0)
	{
		sprite_index=spr_playerFall;
	}
	
	// RESPOND TO ATTACK BUTTON INPUTS 
	if (obj_inputControl.playerAttackPressed)
	{
		if (obj_inputControl.playerUpHeld) // USE SUB WEAPON
		{
			usingSub=true;
			sprite_index = spr_playerJumpSub; 
			image_index = 0; 
		}
		else  // USE BASIC ATTACK 
		{
			attacking=true;
			// SET ATTACK SPRITE
			sprite_index = spr_playerJumpSlash; 
			// RESET ANIMATION
			image_index = 0; 
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

if ((sprite_index == spr_playerJumpSlash)&&image_index == 0) {    
  scr_createHitbox(id, 10*sign(image_xscale), 0, 20,20,20);
  audio_play_sound_on(global.SEemitter,snd_slash2,false,1);
}

///State Switches
if(vy>=0 && onGround){
	vy=0 //DO NOT REMOVE THIS else player drops like a rock when moving off half and quarter blocks
	vx-=currentAirSpd;
	prevAirSpd=0;
	scr_stateSwitch("Ground");	
}
if((cLeft&&obj_inputControl.playerLeftHeld)||(cRight&&obj_inputControl.playerRightHeld)){//add extra condition for not using sub or attacking
	facing=cRight-cLeft;
	vy=0;
	vx-=currentAirSpd;
	prevAirSpd=0;
	audio_play_sound_on(global.SEemitter,snd_cling,false,1);
	scr_stateSwitch("Wall");
}
//check if holding up with a ceiling above us or if when falling down and not holding down to go through
// a half block, to stick on the underside of it
if((cUp&&verticalInputTotal==-1)or
(vy>0 && !obj_inputControl.playerDownHeld && place_meeting(x,y-1,obj_halfBlock)&&!place_meeting(x,y,obj_halfBlock)))
{
	vy=0;
	vx-=currentAirSpd;
	prevAirSpd=0;
	audio_play_sound_on(global.SEemitter,snd_cling,false,1);
	scr_stateSwitch("Ceiling");	
}
//Allows player to Ghost Jump
if(obj_inputControl.ledgeGraceTime>0&&obj_inputControl.jumpBuffer>0){
	obj_inputControl.jumpBuffer=0;
	vy=jumpSpeed;
	audio_play_sound_on(global.SEemitter,snd_jump,false,1);
	//scr_stateSwitch("Air");
}
//Apply knockback and invincibility timer when hit by an enemy
if(place_meeting(x,y,par_enemy)&& invincibleTimer=0)
{
	vx = knockbackX * sign(obj_player.x-par_enemy.x);
	vy = knockbackY;
	invincibleTimer=30;
	scr_stateSwitch("Hurt");			
}
