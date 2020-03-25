/// @description Jumping only!
// You can write your code in this editor

tDelta = delta_time * .000001; // Seconds
image_index = 0;

var xInputDirection = keyboard_check(vk_right) - keyboard_check(vk_left);
//var isOnGroundOrCeiling = OnGround() || OnCeiling();
var runIsDown = keyboard_check(ord("Z"));
var absXSpeed = abs(xSpeed);

// Grounded X Movement ///////////////////////////////////////////////////////////

if(collider[collider.left] == true || collider[collider.right] == true)
{
	xSpeed = 0;
}

// Set acceleration based on whether or not the player is running
var signOfCurrentSpeed = sign(xSpeed);
if(collider[collider.below] == true)
{
	if(runIsDown)
	{
		xSpeed += RUN_ACCELERATION*xInputDirection;
		runCounter = 10; // Mario's run doesn't stop unless until 10 frames after the button has been released
	}
	else
	{
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
if(collider[collider.below] == false)
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
}

vx -= (previousXSpeed - xSpeed*tDelta);
previousXSpeed = xSpeed*tDelta;

// Jumping ///////////////////////////////////////////////////////////////////////

if(collider[collider.above] == true || collider[collider.below] == true)
{
	//yVelocity = 0;
	ySpeed = 0;
}

if(keyboard_check_pressed(ord("X")) && collider[collider.below] == true)
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
ySpeed += 0.5*acceleration*tDelta;

//scr_updateLocation();

var xVelocity = vx;
var yVelocity = vy;

// Slopes ////////////////////////////////////////////////////////////////////////

// Reset values
collider[collider.left]  = false;
collider[collider.right] = false;
collider[collider.above] = false;
collider[collider.below] = false;
collider[collider.climbingSlope] = false;
collider[collider.slopeAnglePrevious] = collider[collider.slopeAngle];
collider[collider.slopeAngle] = 0;

// Bounds
var bounds = 0;
bounds[rect.left]   = bbox_left   + SKIN_WIDTH;
bounds[rect.right]  = bbox_right  - SKIN_WIDTH;
bounds[rect.top]    = bbox_top    + SKIN_WIDTH;
bounds[rect.bottom] = bbox_bottom - SKIN_WIDTH;

var horizontalRayCount = 4;
var verticalRayCount   = 4;

var horizontalBounds = bounds[rect.right]  - bounds[rect.left];
var verticalBounds   = bounds[rect.bottom] - bounds[rect.top];

var horizontalRaySpacing = horizontalBounds / (horizontalRayCount-1);
var verticalRaySpacing   = verticalBounds   / (verticalRayCount-1);

// Horizontal Collisions
if(xVelocity != 0)
{
	var xDirection = sign(xVelocity);
	var xRayLength = abs(xVelocity) + SKIN_WIDTH;

	for(i = 0; i < horizontalRayCount; ++i)
	{
		var xRayOrigin = (xDirection == -1) ? bounds[rect.left] : bounds[rect.right];
		var yOffset = -horizontalRaySpacing*i;
	
		var xHit = collision_line_first(xRayOrigin, bounds[rect.bottom]+yOffset, 
										xRayOrigin+(xRayLength*xDirection), bounds[rect.bottom]+yOffset, 
										par_solid, false, true);
	
		DebugDraw(c_fuchsia, 
				  xRayOrigin, bounds[rect.bottom]+yOffset, 
				  xRayOrigin+(6*xRayLength*xDirection), bounds[rect.bottom]+yOffset);
		
		if(xHit)
		{
			var slopeAngle = xHit.image_angle;
			var xHitDistance = distance_to_object(xHit);
			
			if(i == 0 && slopeAngle > 0 && slopeAngle <= MAX_CLIMB_ANGLE)
			{
				var distanceToSlopeStart = 0;
				if(slopeAngle != collider[collider.slopeAnglePrevious])
				{
					distanceToSlopeStart = xHitDistance;
					xVelocity -= distanceToSlopeStart*xDirection;
				}

				// Climb Slope
				{
					var moveDistance = abs(xVelocity);
					var yClimbVelocity = -(sin(degtorad(slopeAngle)) * moveDistance);
					if(yVelocity >= yClimbVelocity)
					{
						xVelocity = cos(degtorad(slopeAngle)) * moveDistance * sign(xVelocity);
						yVelocity = yClimbVelocity;
						collider[collider.below] = true;
						collider[collider.climbingSlope] = true;
						collider[collider.slopeAngle] = slopeAngle;
					}
				}
				
				xVelocity += distanceToSlopeStart*xDirection;
			}
			
			if(collider[collider.climbingSlope] == false || slopeAngle > MAX_CLIMB_ANGLE)
			{
				xVelocity = (xHitDistance*xDirection);
				if(xDirection == -1) { xVelocity += 1; }
				xRayLength = xHitDistance;
				
				if(collider[collider.climbingSlope] == true)
				{
					yVelocity = tan(degtorad(collider[collider.slopeAngle])) * abs(xVelocity);
				}
				
				collider[collider.left]  = (xDirection == -1);
				collider[collider.right] = (xDirection ==  1);
			}
		}
	}
}

// Vertical Collisions
if(yVelocity != 0)
{
	var yDirection = sign(yVelocity);
	var yRayLength = abs(yVelocity) + SKIN_WIDTH;

	for(i = 0; i < verticalRayCount; ++i)
	{
		var yRayOrigin = (yDirection == 1) ? bounds[rect.bottom]/*+1*/ : bounds[rect.top];
		var xOffset = verticalRaySpacing*i + xVelocity;
	
		var yHit = collision_line_first(bounds[rect.left]+xOffset, yRayOrigin, 
										bounds[rect.left]+xOffset, yRayOrigin+(yRayLength*yDirection), 
										par_solid, false, true);
	
		DebugDraw(c_fuchsia, 
				  bounds[rect.left]+xOffset, yRayOrigin, 
				  bounds[rect.left]+xOffset, yRayOrigin+(6*yRayLength*yDirection));
		
		if(yHit)
		{
			var yHitDistance = distance_to_object(yHit);
			yVelocity = yHitDistance*yDirection; //(yHitDistance-1)*yDirection;
			yRayLength = yHitDistance;
			
			if(collider[collider.climbingSlope] == true)
			{
				xVelocity = yVelocity/tan(degtorad(collider[collider.slopeAngle])) * sign(xVelocity);
			}
			
			collider[collider.below] = (yDirection ==  1);
			collider[collider.above] = (yDirection == -1);
		}
	}
}

x += xVelocity;
y += yVelocity;