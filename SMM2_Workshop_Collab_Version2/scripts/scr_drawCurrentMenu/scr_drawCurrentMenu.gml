if ds_exists(currentMenuGrid, ds_type_grid)
{
	// SET BASIC DRAW VARIABLES FOR OPTIONS MENU
	var _centerX = centerX;
	var _centerY = centerY;
	var _optionSeparation = optionSeparation;
	var _optionsTop = currentMenuHeight*optionSeparation*.5;
	
	draw_set_valign(fa_middle);
	draw_set_halign(fa_center);
	
	// DRAW EACH OPTION IN OPTIONS MENU
	for (var i = 0; i < currentMenuHeight; ++i)
	{
		var _text = ds_grid_get(currentMenuGrid, 0, i);
		
		// DETERMINE IF CURRENTLY SELECTED OPTION IS A SLIDER SWITCH
		var _buttonType = ds_grid_get(currentMenuGrid, 4, i);
	
		// ADD VARIABLE VALUES FOR OPTIONS TO APPRORPRIATE MENUS
		var _displaysVariable = ds_grid_get(currentMenuGrid, 3, i);
		if (_displaysVariable == true)
		{
			_text += optionVariableNameArray[i];
		}
		
		// ADJUST STRING IF SLIDER SWITCH
		// THIS CAN BE REPLACED WITH IMAGES OR ICONOGRAPHY INSTEAD OF SIMPLE TEXT
		if (_buttonType == SLIDER)
		{
			_text = "<- " + _text + " ->"; 
		}
		
		// DRAW APPROPRIATE TEXT AND COLOR DEPENDING ON SLIDER SWITCH SETTINGS
		if (cursorLocation == i and (_buttonType == TOGGLE or global.playerInput >= 0))
		{
			// NORMAL NON-SLIDER SWITCHES SHOULD DISPLAY AS YELLOW WHEN HIGHLIGHTED
			// THIS LOGIC COULD BE REPLACED WITH IMAGE/ SPRITE CHANGES
			draw_set_color(c_yellow);
			draw_text(_centerX, _centerY -  _optionsTop + i*_optionSeparation, _text);
		}
		else if (cursorLocation == i and _buttonType == SLIDER)
		{
			// SLIDERS OPTIONS SHOULD NEVER HIGHLIGHT, BUT THE TOGGLE SWITCHES SHOULD HIGHLIGHT YELLOW
			var _halfStringWidth = string_width(_text)*.5;
			draw_set_color(c_white);
			draw_text(_centerX, _centerY -  _optionsTop + i*_optionSeparation, _text);
			// HIGHLIGHT TOGGLE SWITCHES
			switch toggleHighlight
			{
				case -1:
					draw_set_color(c_yellow);
					draw_set_halign(fa_left);
					draw_text(_centerX -_halfStringWidth, _centerY -  _optionsTop + i*_optionSeparation, "<- ");
					break;
				case 1:
					draw_set_color(c_yellow);
					draw_set_halign(fa_right);
					draw_text(_centerX +_halfStringWidth, _centerY -  _optionsTop + i*_optionSeparation, " ->");
					break;
			}
		}
		else
		{
			// DRAW NORMAL MENU OPTIONS IN WHITE WHEN NOT HIGHLIGHTED
			draw_set_color(c_white);
			draw_text(_centerX, _centerY -  _optionsTop + i*_optionSeparation, _text);
		}
		draw_set_halign(fa_center);
		draw_set_color(c_white);
	}
}
