/// @description press start on gamepad to set it as player input.
// if the selected gamepad is 'already' playerInput, set playerInput to be keyboard+mouse instead.

for (var i = 0; i < 7; ++i;)
{
	if (gamepad_is_connected(i))
	{
		if gamepad_button_check_pressed(i, gp_start)
		{
			if (global.playerInput != i)
			{
				global.playerInput = i;
				cursorLocation = 0;
			}
			else
			{
				global.playerInput = -1;
			}
		}
	}
}

// if input is a gamepad, and that gamepad is no longer connected, reset input to be keyboard+mouse.
if global.playerInput > 0 and !gamepad_is_connected(global.playerInput)
{
	global.playerInput = -1;
}
