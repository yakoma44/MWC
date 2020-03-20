// public variables. change to how you see fit
prepare_to_shoot_time = 30; // how long it takes to telegraph it is about to shoot
reload_pause_time = 60; // how long to wait after firing until preparing to shoot again
object_to_spawn = obj_cannonball; // the object to spawn once ready
object_speed = 8;
is_facing_left = true; // whether the cannon is facing left. if false, then it's facing right

// private variables. do not edit!
timer = prepare_to_shoot_time;
is_reloading = false;

//NOTE: if the cannonball touches the cannon that spawns it, it will die
//so, you need x_offset to push the cannonball out far enough that it won't do that
if (is_facing_left) {
    //x_offset = -12;
    x_offset = -20;
    y_offset = -2;
    object_direction = 180;
} else {
    //x_offset = 12;
    x_offset = 20;
    y_offset = -2;
	object_direction = 0;
	image_xscale = -1; // flip the image
}
image_speed = 0;