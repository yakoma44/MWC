if state_new{
	scr_resetStateVars();
}
var _busy = (attacking or usingSub);
//Grab Horizontal and vertical Input
horizontalInputTotal=(obj_inputControl.playerRightHeld-obj_inputControl.playerLeftHeld);
verticalInputTotal=(obj_inputControl.playerDownHeld-obj_inputControl.playerUpHeld);

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
	if (horizontalInputTotal==0){
		sprite_index=spr_playerCeilingIdle;}
	else if (abs(horizontalInputTotal)>0){
		sprite_index=spr_playerCeilingSwing;}
	
	// RESPOND TO ATTACK BUTTON INPUTS 
	if (obj_inputControl.playerAttackPressed)
	{
		if (obj_inputControl.playerUpHeld) // USE SUB WEAPON
		{
			usingSub=true
			sprite_index = spr_playerCeilingSub; 
			image_index = 0; 
			prevRunSpd=0;
			vx-=currentRunspd;
		}
		else  // USE BASIC ATTACK 
		{
			attacking=true;
			// SET ATTACK SPRITE
			sprite_index = spr_playerCeilingSlash; 
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
	sprite_index = spr_playerCeilingIdle; 
}

if (sprite_index == spr_playerCeilingSlash && image_index==0) 
{    
   scr_createHitbox(id, 10*sign(image_xscale), 0, 20,20,20);
   audio_play_sound_on(global.SEemitter,snd_slash3,false,1);
}  

///State Switches
if ((cLeft && horizontalInputTotal==-1)||(cRight && horizontalInputTotal==1))
{
	prevRunSpd=0;
	vx-=currentRunspd;
	audio_play_sound_on(global.SEemitter,snd_cling,false,1)
	scr_stateSwitch("Wall");	
}

if(obj_inputControl.jumpBuffer>0){
	obj_inputControl.jumpBuffer=0;
	//jump up through if hanging on a half block
	if(place_meeting(x,y-1,obj_halfBlock)&&!verticalInputTotal==1)
	{
		y--
		vy=jumpSpeed
		prevRunSpd=0;
		vx-=currentRunspd;
		audio_play_sound_on(global.SEemitter,snd_jump,false,1)
		scr_stateSwitch("Air")
	}
	//go to air state if jumping down off platform
	if(verticalInputTotal==1)
	{
		y++
		prevRunSpd=0;
		vx-=currentRunspd;
		vy=0;
		scr_stateSwitch("Air")
	}
}else if(!cUp)//If no longer hanging off ceiling
{
	prevRunSpd=0;
	vx-=currentRunspd;
	scr_stateSwitch("Air");	
}

if(place_meeting(x,y,par_enemy)&& invincibleTimer=0)
{
	vx = knockbackX * sign(obj_player.x-par_enemy.x)
	vy = knockbackY
	prevRunSpd=0;
	invincibleTimer=30
	scr_stateSwitch("Hurt")			
}
