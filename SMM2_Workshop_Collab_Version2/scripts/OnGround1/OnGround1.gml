/// @description  OnGround();
/*var list = ds_list_create()
instance_place_list(x+x_dist, y+y_dist, obj_wall, list, true);
if(ds_list_size(list) > 0)
{*/
//var list = ds_list_create();

//var slope=instance_position(x,y+1,obj_slope45);

if(place_meeting(x, y + 1, obj_block) or 
place_meeting(x, y + 1, obj_slope45) or
(place_meeting(x, y + 1, obj_quarterBlock ) && !place_meeting(x, y, obj_quarterBlock))or
(place_meeting(x,y+1,obj_halfBlock) && !place_meeting(x,y,obj_halfBlock)))
{
	var plat=instance_place(x,y+1,par_solid);
	currentPlatSpd=plat.momentum;
	if(plat.object_index == obj_slope45)
	{
		if(x-plat.x>-1 && x-plat.x<16)
		{
			if(y==plat.y+14-((x-plat.x)))
			{
				return true;	
			}else{
				return false;	
			}
		}
	}
	return true;
}else{
	return false;	
}/*
//need to do a list because instant touches another slope object, renders onground false which is wrong
//check if a child of par_solid is below AND NOT overlapping
if(place_meeting(x,y+1,par_solid))
{
	var plat=instance_place(x,y+1,par_solid);
	//grab specific instance on top of and inherit momentum
	if(!place_meeting(x,y,obj_block))
	{
		currentPlatSpd=plat.momentum;
		return true;
	}
}else if(slope)
{
	if(y==slope.y+14-((x-slope.x)))
	{
		return true;	
	}	
}else
{
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



