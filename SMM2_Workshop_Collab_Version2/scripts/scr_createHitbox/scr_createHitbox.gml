///@param owner,xOffset,yOffset,width,height,duration
var _owner = argument[0]; 
var _xOffset = argument[1]; 
var _yOffset = argument[2]; 
var _width = argument[3]; 
var _height = argument[4]; 
var _duration = argument[5]; 

var _hitbox =instance_create(x + _xOffset, y + _yOffset, obj_hitbox);
_hitbox.owner = _owner;
_hitbox.xOffset = _xOffset; 
_hitbox.yOffset = _yOffset; 
_hitbox.image_xscale = _width;
_hitbox.image_yscale = _height;
_hitbox.duration = _duration;