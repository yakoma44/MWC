/// @description  OnGround();
if(place_meeting(x,y-1,obj_block)or 
	(place_meeting(x,y-1,obj_halfBlock)&&!place_meeting(x,y,obj_halfBlock)))
{
	var plat=instance_place(x,y-1,par_solid);
	currentPlatSpd=plat.momentum;
	return true;
}else{
	return false;	
}

