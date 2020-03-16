/// @description Jumping only!
// You can write your code in this editor
onGround = OnGround1();
tDelta = delta_time * .000001; // Seconds

var xInputDirection = keyboard_check(vk_right) - keyboard_check(vk_left);

// Grounded X Movement ///////////////////////////////////////////////////////////

// Check if Run pressed
var isRunning = keyboard_check(ord("Z"));
if(isRunning)
{
	currentRunSpd += RUN_ACCELERATION*xInputDirection;
	runCounter = 10;
}
else
{
	currentRunSpd += WALK_ACCELERATION*xInputDirection;
	if(runCounter > 0)
	{
		--runCounter;
	}
}

// Set max speed if running
if(currentRunSpd > RUN_SPEED_MAX)
{
	currentRunSpd = RUN_SPEED_MAX;
}
else if(currentRunSpd < -RUN_SPEED_MAX)
{
	currentRunSpd = -RUN_SPEED_MAX;
}

// Set max speed if walking
if(currentRunSpd > WALK_SPEED_MAX && runCounter == 0)
{ 
	currentRunSpd = WALK_SPEED_MAX; 
}
else if(currentRunSpd < -WALK_SPEED_MAX && runCounter == 0) 
{ 
	currentRunSpd = -WALK_SPEED_MAX; 
}

// Setting image
/* NOTE(hayden): This can be moved elsewhere, but it is placed here for a (procedural) reason
** so variables would need to be set here, or additional testing would need to occur in a 
** designated animation section
*/
image_index = 0;
if(xInputDirection == -1)
{
	image_xscale = -1;
}
else if(xInputDirection == 1)
{
	image_xscale = 1;
}

// Friction and Skid + Skid animation
if(xInputDirection == 0)
{
	if(currentRunSpd >= WALK_STOP_THRESHOLD && currentRunSpd > 0)
	{ 
		currentRunSpd -= X_FRICTION;
	}
	else if(currentRunSpd <= -WALK_STOP_THRESHOLD && currentRunSpd < 0) 
	{ 
		currentRunSpd += X_FRICTION;
	}
	else // Stop walking completely if the speed is below a certain threshold
	{ 
		currentRunSpd = 0; 
	}
}
else if((currentRunSpd > 0) && (xInputDirection == -1))//if currently running right but input left
{
	if(currentRunSpd >= X_SKID_THRESHOLD) // Only skid if above a certain speed threshold
	{
		currentRunSpd -= X_SKID;
		image_index = 1;
		image_xscale = 1;
	}
	
	// Skid turnaround
	if(currentRunSpd <= WALK_STOP_THRESHOLD)
	{
		// NOTE(hayden): Enable for slightly "snappier" turns
		//currentRunSpd = -WALK_STOP_THRESHOLD;
	}
}
else if((currentRunSpd < 0) && (xInputDirection == 1))//if currently running left but input right
{
	if(currentRunSpd <= -X_SKID_THRESHOLD) // Only skid if below a certain speed threshold
	{
		currentRunSpd += X_SKID;
		image_index = 1;
		image_xscale = -1;
	}
	
	// Skid turnaround
	if(currentRunSpd >= -WALK_STOP_THRESHOLD)
	{
		// NOTE(hayden): Enable for slightly "snappier" turns
		//currentRunSpd = WALK_STOP_THRESHOLD;
	}
}

vx -= (prevRunSpd - currentRunSpd*tDelta);
prevRunSpd = currentRunSpd*tDelta;

// Jumping ///////////////////////////////////////////////////////////////////////
if(keyboard_check_pressed(ord("X")) && onGround==true)
{
	ySpeed = -JUMP_VELOCITY;
	acceleration = JUMP_GRAVITY;
	initialHeight = vy;
}
else if(keyboard_check_released(ord("X")) || ySpeed >= 0)
{
	acceleration = FALL_GRAVITY;
}
else if(keyboard_check(ord("X")))
{
	acceleration = JUMP_GRAVITY + JUMP_FLOAT*(vy-initialHeight);
}

vy = 0.5*acceleration*sqr(tDelta) + ySpeed*tDelta;
ySpeed += 0.5*acceleration*tDelta
if(onGround==true&&vy>0)
{
	vy=0;	
}
// TODO(hayden): onGround checks
// TODO(hayden): Fix gravity accumulating while grounded (causing teleporting when leaving platforms)
// TODO(hayden): x-axis movement

scr_updateLocation1();
