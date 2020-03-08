//if enemy is dead and spawn buffer not on screen when this happens, respawn enemy once it does

if (!instance_exists(enemyID) && !scr_isActive(xbuffer))
{
	spawnReady=true	;
}

if (spawnReady==true && !instance_exists(enemyID) && scr_isActive(xbuffer))
{
	enemyID=instance_create(x,y,enemy);
	enemyID.spawnBufferexists=true;
	enemyID.facing= sign(obj_player.x-x);
	spawnReady=false;
}