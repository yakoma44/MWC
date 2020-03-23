// calculate platform speed based on its movement
// paths do not utilize the built in speed variable, for whatever reason... 
// this should be calculated after whatever the walls do
// or else VERY weird things happen to the calculated platform speed
with (tracking_id) {
	platformSpeed = x - other.previousTrackingX; // welp
	dir = -1 // to be honest, I don't know why this works...
	//dir = x - other.previousTrackingX > 0 ? 1 : -1;
	other.previousTrackingX = x;
}