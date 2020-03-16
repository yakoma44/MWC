var _x=obj_camera.x;

if(place_meeting(x,y,obj_player))
{
    if !instance_exists(enemyID)
	{
        enemyID = instance_create(_x+obj_camera.widthHalf*xfacing+xOffset,obj_camera.height-yOffset,enemy);
		with(enemyID)
		{
			facing=other.xfacing*-1;
			spawnBufferexists=true;
		}
    }
}
