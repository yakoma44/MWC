onGround = OnGround();
cUp		 = OnCeiling();

cLeft  = place_meeting(x - 1, y, obj_block); 
cRight = place_meeting(x + 1, y, obj_block);
if(cLeft xor cRight)
{
	var plat=instance_place(x+(cRight-cLeft),y,obj_block);
	currentPlatSpd=plat.momentum;
}

invincibleTimer = max(invincibleTimer -1, 0);
scr_stateExecute();
scr_updateLocation(); 
/*
///Input Handling & Movement
//---------------------------------------------------------------------------------------
var kLeft, kRight, kUp, kDown, kJump, kJumpRelease, kAction,

kLeft        = keyboard_check(vk_left)  || gamepad_axis_value(0, gp_axislh) < -0.4;
kRight       = keyboard_check(vk_right) || gamepad_axis_value(0, gp_axislh) >  0.4;
kUp          = keyboard_check(vk_up)    || gamepad_axis_value(0, gp_axislv) < -0.4;
kDown        = keyboard_check(vk_down)  || gamepad_axis_value(0, gp_axislv) >  0.4;

kJump        = keyboard_check_pressed(ord("Z")) || gamepad_button_check_pressed(0, gp_face1);
kJumpRelease = keyboard_check_released(ord("Z")) || gamepad_button_check_released(0, gp_face1);
kAction      = keyboard_check_pressed(ord("X"))  || gamepad_button_check_pressed(0, gp_face3);

// Handle gravity and wall sticking
if (!onGround && !wallstick && !ceilingstick) {//if player is in air and not sticking to a wall
    if ((cUp&&kUp)){//handle ceilingstick
		wallstick=false;
		ceilingstick=true;
		knockedback=false;
		vy=0;
	}
	if ((cLeft&& kLeft)||(cRight && kRight)){//handle wallstick
        facing=(cRight-cLeft);
		ceilingstick=false
        wallstick=true;
		knockedback=false;
        vy = 0;
    } 
	
	if(!wallstick && !ceilingstick){
        // Fall normally
        vy =Approach(vy, vyMax, grav);
    }
}
//Fall off ceiling if no longer above player
if(ceilingstick){
	if(!cUp|| (kDown && kJump)){//let go if no longer ceiling above player or if jump-down
		ceilingstick=false;	
	}
	if((cLeft&& kLeft)||(cRight && kRight)){//transition to wallstick if you climb into it
		ceilingstick=false
		wallstick=true
	}
}
//Handle wall movement
if (wallstick){
	vy=(kDown-kUp)*climbspeed*!attacking*!usingSub;//add variable for ifClimbable
	if((facing=1 && !cRight)|| (facing=-1 && !cLeft)){ //let go if no longer wall in direction facing
		wallstick=false;
	}
	if(cUp&&kUp){//transition to ceilingstick if you climb into it
		wallstick=false;
		ceilingstick=true;
	}
}

//Set horizontal speed when pressing key. Also stops x movement when sticking to wall
vx = ((kRight-kLeft))*!wallstick*!attacking*!usingSub*runSpeed; 


//set direction facing and mid-air x movement
if(onGround||ceilingstick){
    if (kLeft && !kRight && !wallstick &&!attacking &&!usingSub ) {
        facing = -1;
    }
    if (kRight && !kLeft && !wallstick &&!attacking&&!usingSub) {
        facing = 1;
    }
    
}else if (!onGround && !wallstick && !ceilingstick){//this handles mid-air movement
    if ((kRight-kLeft)=facing){
        vx=facing*runSpeed;
    } else if ((kRight-kLeft)!=facing){
        vx=abs(kRight-kLeft)*-facing*backairspeed;
    }
}
//crouch
if(onGround && kDown){
	crouching = true;
	wallstick=false;
}else{
	crouching = false;	
}
//Jump
if (kJump) { 
    if (onGround && !wallstick) {
        // Fall thru platform
        if (kDown) {
            if (place_meeting(x, y + 1, obj_quarterBlock))
                ++y;
        } else {
            vy = jumpspeed;
        }
    }
}
// Wall jump
if (kJump && wallstick) {
    //if (cLeft) {
    if(kRight&&!kLeft&&cLeft){
        wallstick=false;
        facing=1
        vy = walljumpspeed;
        vx =  runSpeed;
        
    }
    if(kLeft&&!kRight&&cRight){
        wallstick=false;
        facing=-1;
        vy = walljumpspeed;
        vx = -runSpeed;
    }
}
if (kAction && !kUp && !usingSub) {
    if (!attacking) {  //add additional variable for if in hitstun
        attacking = true;
    }
}
if (kAction && kUp && !attacking){
	if (!usingSub){
		usingSub=true;	
	}
}
image_xscale=facing;

///Animation Handling

if (onGround){
    
	if(attacking&&!crouching){
        sprite_index=spr_playerSlash;
    }
	if(attacking && crouching){
		sprite_index=spr_playerCrouchSlash	
	}
    if(abs(kRight-kLeft)>0 && abs(vx)>0&&!attacking&&!usingSub&&!wallstick&&!ceilingstick){
        sprite_index=spr_playerRun
    }
    if ((!kRight&&!kLeft||kRight&&kLeft)&&!attacking&&!usingSub&&!wallstick&&!ceilingstick){
        sprite_index=spr_playerIdle
    }
	if(crouching&&!attacking){
		sprite_index=spr_playerCrouch	
	}
	if(!crouching&&usingSub){
		sprite_index=spr_playerSub	
	}
}
if (!onGround){
    if(attacking && !wallstick && !ceilingstick){
        sprite_index=spr_playerJumpSlash;
    }
    if((!kDown&&!kUp||kDown&&kUp) && wallstick && !attacking &&!usingSub ){
        sprite_index=spr_playerWallIdle;
    }
	if((abs(kDown-kUp)>0) && wallstick && !attacking &&!usingSub ){
        sprite_index=spr_playerWallClimb;
    }
	if(wallstick && attacking){
		sprite_index=spr_playerWallSlash;	
	}
	if(abs(kRight-kLeft)>0 && ceilingstick && !attacking &&!usingSub){
		sprite_index=spr_playerCeilingSwing;
	}
	if((!kRight&&!kLeft||kRight&&kLeft) && ceilingstick &&!attacking && !usingSub){
		sprite_index=spr_playerCeilingIdle;	
	}
	if(ceilingstick && attacking){
		sprite_index=spr_playerCeilingSlash	;
	}
    if (!wallstick && !ceilingstick && !attacking &&!usingSub&& (vy<0)){
        sprite_index=spr_playerJump;
    }
	if (!wallstick && !ceilingstick && !attacking &&!usingSub &&(vy>=0)){
        sprite_index=spr_playerFall;
    }
	if(usingSub && !wallstick && !ceilingstick){
		sprite_index=spr_playerJumpSub;	
	}
	if(usingSub && wallstick && !ceilingstick){
		sprite_index=spr_playerWallSub;	
	}
	if(usingSub && !wallstick && ceilingstick){
		sprite_index=spr_playerCeilingSub;	
	}
	
}

/// Hitbox

if ((sprite_index == spr_playerSlash||sprite_index == spr_playerJumpSlash)&&round(image_index)>0) {    
    with (instance_create(x, y, obj_hitbox)) {
        bboxleft  = min(other.x + (-8 * other.facing), other.x + (48 * other.facing));
        bboxright = max(other.x + (-8 * other.facing), other.x + (48 * other.facing));
        
        bboxtop    = other.y - 16;
        bboxbottom = other.y + 8; 
    }
}
if (sprite_index == spr_playerCrouchSlash&&round(image_index)>0) {    
    with (instance_create(x, y, obj_hitbox)) {
        bboxleft  = min(other.x + (-8 * other.facing), other.x + (48 * other.facing));
        bboxright = max(other.x + (-8 * other.facing), other.x + (48 * other.facing));
        
        bboxtop    = other.y - 8;
        bboxbottom = other.y + 16; 
    }//NOTE: adjust later when crouch uses its own sprite mask.
}  
if (sprite_index == spr_playerCeilingSlash&&round(image_index)>0) {    
    with (instance_create(x, y, obj_hitbox)) {
        bboxleft  = min(other.x + (-8 * other.facing), other.x + (48 * other.facing));
        bboxright = max(other.x + (-8 * other.facing), other.x + (48 * other.facing));
        
        bboxtop    = other.y - 8;
        bboxbottom = other.y + 24; 
    }
}  
if (sprite_index == spr_playerWallSlash&&round(image_index)>0) {    
    with (instance_create(x, y, obj_hitbox)) {
        bboxleft  = min(other.x - (-8 * other.facing), other.x - (48 * other.facing));
        bboxright = max(other.x - (-8 * other.facing), other.x - (48 * other.facing));
        
        bboxtop    = other.y - 8;
        bboxbottom = other.y + 16; 
    }
}  

