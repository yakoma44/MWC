/// @description scr_move_contact moves the first object so that it's right up against the second object
/// @param _object1
/// @param _object2
/// @param _direction - the direction _object1 must go in in order to be flush with _object2
///			only pass in 0, 90, 180, or 270 (right, up, left, down)
 
var _object1 = argument0;
var _object2 = argument1;
var _direction = argument2;
 
if (_direction = 0) {
	distanceToBbox = _object1.bbox_right - _object1.x;
	_object1.x = _object2.bbox_left - distanceToBbox;
} else if (_direction = 90) {
	distanceToBbox = _object1.bbox_top - _object1.y;
	_object1.y = _object2.bbox_bottom - distanceToBbox;
} else if (_direction = 180) {
	distanceToBbox = _object1.bbox_left - _object1.x;
	_object1.x = _object2.bbox_right - distanceToBbox;
} else if (_direction = 270) {
	distanceToBbox = _object1.bbox_bottom - _object1.y;
	_object1.y = _object2.bbox_top - distanceToBbox;
}