	scr_stateExecute();
	scr_updateEnemyLocation();
//}
//DESPAWN ENEMY IF TOO FAR OFFSCREEN
if(!scr_isActive(96))
{
	instance_destroy();	
}
