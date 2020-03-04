scr_setInputsToFalse(); // same script as in the Create Event
//scr_inputControlUpdateInputs(); 
//scr_inputControlUpdateKeyboardMouse()
//scr_inputControlUpdateGamepad()
scr_inputControlUpdateKeyboardAndGamepad()

jumpBuffer = max(jumpBuffer -1, 0); 
if playerJumpPressed 
{
	jumpBuffer = 3;
} 