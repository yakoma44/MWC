if(x<positionFrom || x>positionTo)
{
	dir *=-1;		
}

momentum=platformSpeed*dir;

for(i=1;i<=abs(platformSpeed);i++)
{
	//Check if player in direction of movement
	if(place_meeting(x+sign(platformSpeed*dir),y,obj_player))
	{
		obj_player.x += dir;
	}
	
	x += sign(dir);
}
//Check if player attached to opposite side of direction platform moving and where platform used to be
if(obj_player.state=="Wall")
{
	if(!place_meeting(x-dir,y,obj_player) && place_meeting(x-(platformSpeed*dir+dir),y,obj_player))
	{
		do
		{
		    obj_player.x += dir;
		} until (place_meeting(x-dir,y,obj_player));
	}
}
