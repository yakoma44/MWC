//sub pixel adjustment
cx += vx;
cy += vy;
vxNew = floor(cx);
vyNew = floor(cy);
cx -= vxNew;
cy -= vyNew;

//Finalize x movement
repeat(abs(vxNew)) {     
    //this needs to be changed to allow player to clip when going up/down slope but also prevent player from
	//going into a wall when at the top/bottom of a slope
	if (!place_meeting(x + sign(vxNew), y, obj_block))
	{
        x += sign(vxNew);
	}
    else if (position_meeting(x+sign(vxNew),y+1,obj_slope45))
	{
		x += sign(vxNew);
	}
	else{
		vxNew = 0;
	}
	//moving downhill
	if (position_meeting(x,y+2,obj_slope45))
	{
		var plat=instance_position(x,y+2,obj_slope45);
		//x += sign(vxNew);
		if(y > plat.y+14-(x-plat.x) || vyNew>=0)
		{
			y=plat.y+14-((x-plat.x));
			//vy=0;
		}
	}
	//moving uphill
	if (position_meeting(x,y-1,obj_slope45))
	{
		var plat=instance_position(x,y-1,obj_slope45);
		//x += sign(vxNew);
		if(y > plat.y+14-(x-plat.x)|| vyNew>=0)
		{
			y=plat.y+14-((x-plat.x));
			//vy=0;
		}
	}
}  
//Finalize y movement
for(i=0;i<=abs(vyNew);i++)
{
    // check for collision below for slope
	if(vyNew>0 && position_meeting(x,y+1,obj_slope45))
	{
        var plat=instance_position(x,y+1,obj_slope45);
		if(y > plat.y+14-((x-plat.x)))
		{
			y=plat.y+14-((x-plat.x));	
			vyNew=0;
			//vy=0;
		}
    }
	
	// check for collision below for quarter block
    if(vyNew>0 && place_meeting(x,y+sign(vyNew),obj_quarterBlock) && !place_meeting(x, y, obj_quarterBlock)){
        vyNew=0;//works with vyNew NOT vy
    }
	
	//check for collison below for half block
	if(vyNew>0)
	{
		if(place_meeting(x,y+sign(vyNew),obj_halfBlock) && !place_meeting(x, y, obj_halfBlock))
		{
			vyNew=0;//works with vyNew NOT vy
		}
		if(place_meeting(x,y-1,obj_halfBlock)&&!place_meeting(x,y,obj_halfBlock))
		{
			if(!obj_inputControl.playerDownHeld)
			{
				vyNew=0;//automatically grab when dropping through half-block
			}
		}
	}
	else if obj_inputControl.playerUpHeld
	{
		//check if player is holding up and not already inside a half-block
		if place_meeting(x,y+sign(vyNew),obj_halfBlock) and !place_meeting(x,y,obj_halfBlock)
			vyNew=0
	}
	
	// NORMAL Y MOVEMENT 
    if (!place_meeting(x,y+sign(vyNew),obj_block))
	{ 
		y+= sign(vyNew);
	}
	// ABNORMAL Y MOVEMENT
    else 
	{
		// NUDGE SYSTEM
		if (sign(vyNew) == -1) // IF WE ARE MOVING UPWARDS ONLY
		{
			// STORE INITIAL DESTINATION IN Y DIRECTION
			var _yTest = y +sign(vyNew)
			var _xIncrement = 0;
			var _nudgeFound = false;
			var _maxNudge = 5;  // MAX DISTANCE THAT WE CAN NUDGE
			do
			{
				_xIncrement += 1; 
				var _leftFree = !place_meeting(x - _xIncrement,_yTest,obj_block)
				var _rightFree = !place_meeting(x + _xIncrement,_yTest,obj_block)
				_nudgeFound = _leftFree or _rightFree;
			}
			until(_nudgeFound or (_xIncrement > _maxNudge));
			
			// NUDGE FOUND, PUT US THERE
			if (_nudgeFound)
			{
				// SET FINAL LOCATION AFTER NUDGE
				if (_leftFree){x -= _xIncrement;}
				if (_rightFree){x += _xIncrement;}
				y = _yTest;
			}
			// NUDGE NOT FOUND
			else 
			{
				vy = 0;
			}
		}
	}
    
}

/*

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