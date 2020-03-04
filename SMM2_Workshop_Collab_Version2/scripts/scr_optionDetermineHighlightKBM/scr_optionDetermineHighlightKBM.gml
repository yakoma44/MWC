cursorLocation = -1;

if ds_exists(currentMenuGrid, ds_type_grid)
{
	var _centerX = centerX;
	var _centerY = centerY;
	var _optionSeparation = optionSeparation;
	var _optionsTop = currentMenuHeight*optionSeparation*.5;
	
	var _mouseX = device_mouse_x_to_gui(0);
	var _mouseY = device_mouse_y_to_gui(0);

	draw_set_valign(fa_top);
	draw_set_halign(fa_middle);
	var _toggleStringWidth = string_width("<- ");
	var _toggleSwitchWidth = 0; 
	
	
	for (var i = 0; i < currentMenuHeight; ++i)
	{
		var _text = ds_grid_get(currentMenuGrid, 0, i);
		
		// UPDATE STRINGS FOR SLIDER SWITCHES
		var _displaysVariable = ds_grid_get(currentMenuGrid, 3, i);
		if (_displaysVariable == true)
		{
			_text += optionVariableNameArray[i];
		}
		
		var _textWidthHalf = string_width(_text)*.5;
		var _textHeightHalf = string_height(_text)*.5;
		var _textLeft = _centerX - _textWidthHalf;
		var _textRight = _centerX + _textWidthHalf;
		var _textY = _centerY -  _optionsTop + i*_optionSeparation;
		var _textTop = _textY - _textHeightHalf;
		var _textBottom = _textY + _textHeightHalf;
		
		
		if (ds_grid_get(currentMenuGrid, 4, i) == TOGGLE) // TOGGLE SWITCH
		{
			_toggleSwitchWidth = 0;
		}
		else
		{
			_toggleSwitchWidth = _toggleStringWidth;
		}
		
		if 
		(
		_mouseX > _textLeft - _toggleSwitchWidth and _mouseX < _textRight + _toggleSwitchWidth
		and _mouseY > _textTop and _mouseY < _textBottom
		)
		{
			cursorLocation = i;
		}
		
		if (i == cursorLocation and _toggleSwitchWidth != 0)
		{
			if // LEFT TOGGLE HIGHLIGHTED
			(_mouseX > _textLeft - _toggleSwitchWidth and _mouseX < _textLeft)
			{
				toggleHighlight = -1;
			}
			else if // RIGHT TOGGLE HIGHLIGHTED
			(_mouseX < _textRight + _toggleSwitchWidth and _mouseX > _textRight)
			{
				toggleHighlight = 1;
			} 
			else
			{
				toggleHighlight = 0;
			}
		}
	}
}

