// reset the timer if the player is close enough horizontally
if (object_exists(obj_player) && state = "IDLE") {
	if (abs(obj_player.x - x) <= activationDistance) {
		image_index = 2;
		state = "ACTIVATED";
	} else if (abs(obj_player.x - x) <= sightDistance) {
		image_index = 1;
	} else {
		image_index = 0;
	}
}

if (state = "ACTIVATED") {
	speed += acceleration;
	collideId = scr_find_collision(self, par_solid, 4)
	if (collideId) { // a wall was hit
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