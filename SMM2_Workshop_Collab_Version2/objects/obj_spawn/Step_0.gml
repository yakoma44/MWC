var _x=obj_camera.x

if(place_meeting(x,y,obj_player))
{
    if !instance_exists(enemyID)
	{
        enemyID = instance_create(_x+xOffset*xfacing,480-yOffset,enemy)
		with(enemyID)
			facing=other.xfacing*-1
    }
}