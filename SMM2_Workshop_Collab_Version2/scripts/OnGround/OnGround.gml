/// @description  OnGround();
if(place_meeting(x,y+1,par_solid) && !place_meeting(x,y,par_solid))
{
	var plat=instance_place(x,y+1,par_solid);
	currentPlatSpd=plat.momentum;
	if(plat.object_index == obj_slope45)
	{
		//use player x relative to slope x to determine y position and if actually standing on it
		//if 
		//slope object needs to indicate if positive or negative and which half is solid
		if(y==plat.y+14-((x-plat.x)))
		{
			return true;	
		}
	}
	return true;
}else{
	return false;	
}
/*if(place_meeting(x, y + 1, obj_block) or 
place_meeting(x, y + 1, obj_slope45) or
(place_meeting(x, y + 1, obj_quarterBlock ) && !place_meeting(x, y, obj_quarterBlock))or
(place_meeting(x,y+1,obj_halfBlock) && !place_meeting(x,y,obj_halfBlock)))
{
	var plat=instance_place(x,y+1,par_solid);
	currentPlatSpd=plat.momentum;
	if(plat.object_index == obj_slope45)
	{
		//use player x relative to slope to determine if y position actually standing on it
	}
	return true;
}else{
	return false;	
}



