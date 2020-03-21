if (timer <= 0) {
    // shoot the bullet!
	timer = shootTime;
	aimRight = false; // default to shooting left

	// find the player and target them
	if (object_exists(obj_player)) {
		if (obj_player.x > x) {
			aimRight = true;
		}
	}
	
	if (aimRight) {
		obj = instance_create(x + xRightOffset, y + yOffset, objectToSpawn);
		obj.speed = objectSpeed;
		obj.direction = 0; 		
	} else {
		obj = instance_create(x - xRightOffset, y + yOffset, objectToSpawn);
		obj.speed = objectSpeed;
		obj.direction = 180; 	
	}
}

// reset the timer if the player is close enough horizontally
if (object_exists(obj_player)) {
	if (abs(obj_player.x - x) <= playerDistancePause) {
		timer = shootTime;
	}
}

timer -= 1;