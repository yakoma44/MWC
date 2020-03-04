var _change = argument0;

var _newGameScale = max(1, global.gameScale + _change);

if 
(
ideal_width*_newGameScale <= display_get_width()
and ideal_height*_newGameScale <= display_get_height()
)
{
	global.gameScale = _newGameScale;
	
	window_set_size(ideal_width*global.gameScale, ideal_height*global.gameScale);
	alarm[0] = 1;
}

scr_setOptionVariableStrings();
