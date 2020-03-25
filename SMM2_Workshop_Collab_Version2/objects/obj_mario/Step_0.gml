/// @description Jumping only!
// You can write your code in this editor

tDelta = delta_time * .000001; // Seconds
image_index = 0;

var xInputDirection = keyboard_check(vk_right) - keyboard_check(vk_left);
var isOnGroundOrCeiling = OnGround() || OnCeiling();
var runIsDown = keyboard_check(ord("Z"));
var absXSpeed = abs(xSpeed);

// Grounded X Movement ///////////////////////////////////////////////////////////

// Set acceleration based on whether or not the player is running
var signOfCurrentSpeed = sign(xSpeed);
if(isOnGroundOrCeiling == true)
{
	if(runIsDown)
	{
		xSpeed += RUN_ACCELERATION*xInputDirection;
		runCounter = 10; // Mario's run doesn't stop unless until 10 frames after the button has been released
		if(holding==noone)
		{
			holding=collision_rectangle(x,y,x+16,y-8,obj_shell,false,true);
		}
	}
	else
	{
		if(holding != noone)
		{
			holding.vx += vx;
			holding.isHeld=false;
			holding=noone;	
		}
		xSpeed += WALK_ACCELERATION*xInputDirection;
		if(runCounter > 0) { --runCounter; }
	}

	// Set max speed if running
	if(absXSpeed > RUN_SPEED_MAX)
	{
		xSpeed = RUN_SPEED_MAX*signOfCurrentSpeed;
	}

	// Set max speed if walking
	if(absXSpeed > WALK_SPEED_MAX && runCounter == 0)
	{ 
		xSpeed = WALK_SPEED_MAX*signOfCurrentSpeed; 
	}

	// Setting image
	if(xInputDirection != 0)
	{
		image_xscale = xInputDirection;
	}

	// Friction and Skid + Skid animation
	if(xInputDirection == 0)
	{
		if(absXSpeed >= WALK_STOP_THRESHOLD)
		{ 
			xSpeed -= X_FRICTION*signOfCurrentSpeed;
		}
		else // Stop walking completely if the speed is below a certain threshold
		{ 
			xSpeed = 0; 
		}
	}
	else if(absXSpeed > 0 && xInputDirection != signOfCurrentSpeed)
	{
		if(absXSpeed >= X_SKID_THRESHOLD) // Only skid if above a certain speed threshold
		{
			xSpeed -= X_SKID*signOfCurrentSpeed;
			image_index = 1;
			image_xscale = xInputDirection;
		}
	
		// Skid turnaround
		if(absXSpeed <= WALK_STOP_THRESHOLD) // NOTE(hayden): Enable for slightly "snappier" turns
		{
			//xSpeed = -WALK_STOP_THRESHOLD*signOfCurrentSpeed;
		}
	}
	
	wasInRunThreshold = (absXSpeed > WALK_SPEED_MAX);
	wasInWalkThreshold = (absXSpeed > X_AERIAL_BACKWARD_JUMP_START_WALKING_THRESHOLD);
}

// Aerial X Movement /////////////////////////////////////////////////////////////
if(isOnGroundOrCeiling == false)
{
	if(xInputDirection == image_xscale) // Forward momentum
	{
		if(absXSpeed >= WALK_SPEED_MAX)
		{
			xSpeed += xInputDirection*X_AERIAL_FORWARD_MOMENTUM_UPPER;
		}
		else if(absXSpeed < WALK_SPEED_MAX)
		{
			xSpeed += xInputDirection*X_AERIAL_FORWARD_MOMENTUM_LOWER;
		}
	}
	else if(xInputDirection == -image_xscale) // Backward momentum
	{
		if(wasInRunThreshold == true)
		{
			xSpeed += xInputDirection*X_AERIAL_BACKWARD_MOMENTUM_MAX;
		}
		else if(wasInWalkThreshold == true)
		{
			xSpeed += xInputDirection*X_AERIAL_BACKWARD_MOMENTUM_UPPER_BELOW_JUMP_START_THRESHOLD;
		}
		else if(wasInWalkThreshold == false)
		{
			xSpeed += xInputDirection*X_AERIAL_BACKWARD_MOMENTUM_LOWER_BELOW_JUMP_START_THRESHOLD;
		}
	}
	
	if(wasInRunThreshold == true)
	{
		if(absXSpeed > RUN_SPEED_MAX)
		{
			xSpeed = signOfCurrentSpeed*RUN_SPEED_MAX;
		}
	}
	else
	{
		if(xSpeed > WALK_SPEED_MAX)
		{
			xSpeed = signOfCurrentSpeed*WALK_SPEED_MAX;
		}
	}
	if(runIsDown)
	{
		if(holding==noone)
		{
			holding=collision_rectangle(x,y,x+16,y-8,obj_shell,false,true);
		}	
	}else{
		
		if(holding != noone)
		{
			holding.vx += vx;
			holding.isHeld=false;
			holding=noone;	
		}
	}
}

vx -= (previousXSpeed - xSpeed*tDelta);
previousXSpeed = xSpeed*tDelta;

// Jumping ///////////////////////////////////////////////////////////////////////
if(keyboard_check_pressed(ord("X")) && isOnGroundOrCeiling)
{
	ySpeed = -JUMP_VELOCITY;
	acceleration = JUMP_GRAVITY;
	initialHeight = vy;
}
else if(isOnGroundOrCeiling)
{
	acceleration = FALL_GRAVITY;
	ySpeed = 0;
}

if(keyboard_check_released(ord("X")) || ySpeed >= 0)
{
	acceleration = FALL_GRAVITY;
}
else if(keyboard_check(ord("X")))
{
	acceleration = JUMP_GRAVITY + JUMP_FLOAT*(vy-initialHeight);
}

vy = 0.5*acceleration*sqr(tDelta) + ySpeed*tDelta;
ySpeed += 0.5*acceleration*tDelta

scr_updateLocation();
if(holding != noone)
{
	with(holding)
	{
		x=obj_mario.x+(12*obj_mario.image_xscale);
		y=obj_mario.y-4;
		isHeld=true;
	}
}