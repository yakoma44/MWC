if (timer <= 0) {
	if (is_reloading) { // finished reloading!
		timer = prepare_to_shoot_time;
		is_reloading = false;
	} else { // shoot the bullet!
		timer = reload_pause_time;
		is_reloading = true;
		obj = instance_create(x + x_offset, y + y_offset, object_to_spawn);
		obj.speed = object_speed;
		obj.direction = object_direction;
	}
}

if (!is_reloading) {//if reloading is false
	// preparing to shoot. control the rate of the animation speed so that it ends by the time
	// the cannon is ready to shoot
	percentage = 1 - (timer / prepare_to_shoot_time) // from 0 to 1
	image_index = (percentage * (image_number - 1))
} else {
	image_index = image_number - 1;
}

timer -= 1;