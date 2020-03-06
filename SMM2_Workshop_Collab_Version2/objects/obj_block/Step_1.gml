if(x<positionFrom || x>positionTo)
{
	dir *=-1;		
}

momentum=platformSpeed*dir;
for(i=1;i<=abs(platformSpeed);i++)
{
	if(place_meeting(x+sign(platformSpeed*dir),y,obj_player))
	{
		obj_player.x += sign(platformSpeed*dir);
	}
	if(place_meeting(x-sign(platformSpeed*dir),y,obj_player))
	{
		obj_player.x += sign(platformSpeed*dir);
		//probably add code here to subtract player velocity
		//this way player isn't tossed off platform when reversing direction
		//alternatively, place code in wall state that ignores vx
		//error remains when player in between 2 moving blocks and reversing direction
	}
	x += sign(dir);
}

//x += platformSpeed * dir;
