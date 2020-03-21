var _xBuffer=argument0;

var _vx = camera_get_view_x(view_camera[0]);
var _vy = camera_get_view_y(view_camera[0]);
var _vw = camera_get_view_width(view_camera[0]);
var _vh = camera_get_view_height(view_camera[0]);

if (collision_rectangle(_vx-_xBuffer,_vy,_vx+_vw+_xBuffer,_vy+_vh,id,false,false) ==noone)
{
	return false;	
}else{
	return true;	
}
