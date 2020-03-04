/// @description Determine which options should be highlighted and listen for confirm clicks + run appropriate script with appropriate argument.

var _confirm = false;

scr_swapPlayerInput(); // Allows you to press start on a gamepad to make it the 'player input device'

if (global.playerInput == -1) // Keyboard + Mouse is being used
{
	scr_optionDetermineHighlightKBM();
	_confirm = scr_menuListenForMouseClick()
}
else // GAMEPAD is being used
{
	scr_menuGamepadCheckInput(); // grabs all gamepad inputs.
	_confirm = gpConfirm;
	_cancel = gpCancel; // unused for now, but we can use this to have behaviors attached to 'cancel' button inside menu.
	scr_optionDetermineHighlightGamepad();
}

// EXECUTES RELEVANT SCRIPTS FOR OPTION MENU BEHAVIORS.

if cursorLocation != -1
{
	var _script = ds_grid_get(currentMenuGrid, 1, cursorLocation); // Script associated with this button
	var _argument = ds_grid_get(currentMenuGrid, 2, cursorLocation); // argument to pass into that script (from grid.)
	var _buttonType = ds_grid_get(currentMenuGrid, 4, cursorLocation); // argument to pass into that script (from grid.)
	
	if (global.playerInput == -1) // KEYBOARD AND MOUSE
	{
		if (_confirm == true)
		{
			if (_buttonType == TOGGLE) // BUTTON IS A TOGGLE BUTTON
			{
				if _argument == NULLVALUE // NO ARGUMENT PASSED
				{
					script_execute(_script);
				}
				else // ARGUMENT PASSED
				{
					script_execute(_script, _argument);
				}
			}
			else if (_buttonType == SLIDER) // BUTTON IS A SLIDER BUTTON
			{
				// All slider buttons have arguments (the amount to slide by) 
				script_execute(_script, _argument*toggleHighlight);
			}
		}
	}
	else // GAMEPAD LOGIC
	{
		if (_buttonType == TOGGLE and _confirm == true)
		{
			if (_argument == NULLVALUE) // NO ARGUMENT PASSED
			{
				script_execute(_script);
			}
			else // ARGUMENT PASSED
			{
				script_execute(_script, _argument);
			}
		}
		else if (_buttonType == SLIDER)
		{
			if (gpLeft or gpXAxis < 0)
			{
				script_execute(_script, _argument*-1);
			}
			else if (gpRight or gpXAxis > 0)
			{
				script_execute(_script, _argument);
			}
		}
	}
}
