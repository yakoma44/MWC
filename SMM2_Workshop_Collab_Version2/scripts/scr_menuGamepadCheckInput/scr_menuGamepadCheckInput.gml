var _playerInput = global.playerInput;

// SET ALL INPUTS TO FALSE BEFORE WE COLLECT THEM ON THIS FRAME
gpXAxis = false;
gpYAxis = false;
gpUp = false;
gpDown = false;
gpRight = false;
gpLeft = false;
gpConfirm = false;
gpCancel = false;

// CHECK FOR ALL INPUTS ON CURRENTLY ACTIVE GAMEPAD
if gamepad_is_connected(_playerInput)
{
	// DETERMINE AXIS VALUES
	var _xAxis = gamepad_axis_value(_playerInput, gp_axislh);
	var _yAxis = gamepad_axis_value(_playerInput, gp_axislv);
	
	if 
	(
	gpAxisReady == true 
	and ((_xAxis*_xAxis + _yAxis*_yAxis) > gamepadDeadZoneSquared)
	)
	{
		gpXAxis = round(_xAxis);
		gpYAxis = round(_yAxis);
		gpAxisReady = false;
	}
	else if ((_xAxis*_xAxis + _yAxis*_yAxis) < gamepadDeadZoneSquared)
	{
		gpAxisReady = true;
	}
	
	// DETERMINE 'BUTTON' VALUES
	
	gpUp = gamepad_button_check_pressed(_playerInput, gp_padu);
	gpDown = gamepad_button_check_pressed(_playerInput, gp_padd);
	gpRight = gamepad_button_check_pressed(_playerInput, gp_padr);
	gpLeft = gamepad_button_check_pressed(_playerInput, gp_padl);
	gpConfirm = gamepad_button_check_pressed(_playerInput, gp_face1);
	gpConfirm = gamepad_button_check_pressed(_playerInput, gp_face2);
}
