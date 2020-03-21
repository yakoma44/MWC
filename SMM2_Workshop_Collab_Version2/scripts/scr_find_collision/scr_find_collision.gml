/// @description scr_find_collision given _object1's speed, finds the closest _object2 id of what it would run into on the next step
/// @param _object1
/// @param _object2
/// @param _stepsize - tells the algorithm how much distance it can cover while guaranteed 
///		not to skip over an object. makes the algorithm faster the higher the number
 
var _object1 = argument0;
var _object2 = argument1;
var _stepsize = argument2;

maxX = lengthdir_x(_object1.speed, _object1.direction);
maxY = lengthdir_y(_object1.speed, _object1.direction);
previousId = noone;
foundId = noone;
factor = 1;

with (_object1) {
	foundId = instance_place(x + maxX, y + maxY, _object2)
}

while (foundId) {
	distanceX = lengthdir_x(_object1.speed - (_stepsize * factor), _object1.direction);
	distanceY = lengthdir_y(_object1.speed - (_stepsize * factor), _object1.direction);
	factor += 1;
	previousId = foundId;
	with (_object1) {
		foundId = instance_place(x + distanceX, y + distanceY, _object2)
	}
}

return previousId;