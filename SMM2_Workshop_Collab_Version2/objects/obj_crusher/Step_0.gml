// reset the timer if the player is close enough horizontally
if (object_exists(obj_player) && state = "IDLE") {
	if (abs(obj_player.x - x) <= activationDistance) {
		initialY = y; // calculate where it was vertically in case it moved
		image_index = 2;
		state = "ACTIVATED";
	} else if (abs(obj_player.x - x) <= sightDistance) {
		image_index = 1;
	} else {
		image_index = 0;
	}
}

activatedOnce = false;
if (state = "ACTIVATED") {
	if (!activatedOnce) {
		activatedOnce = true;
		path_end(); // it may be following a path. break it from that path
		direction = 270;
	}
	
	speed += acceleration;
	collideId = scr_find_collision(self, par_solid, 4)
	if (collideId) { // a wall was hit
		activatedOnce = false;
		state = "RECOVERY";
		speed = 0;
		scr_move_contact(self, collideId, direction);
	}
}

if (state = "RECOVERY") {
	hitTimer -= 1;
	if (hitTimer < 0) {
		image_index = 1;
		y -= retreatSpeed;
		if (abs(y - initialY < retreatSpeed)) { // close enough back to the original spot
			state = "IDLE";
			y = initialY;
			hitTimer = pauseHitTime; // reset the timer
		}
	}
}

if (speed > maxSpeed) { // limit max speed
	speed = maxSpeed;	
}