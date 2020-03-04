playerJumpPressed = keyboard_check_pressed(playerJumpInput)||gamepad_button_check_pressed(0,gp_face1)
playerJumpHeld = keyboard_check(playerJumpInput)gamepad_button_check(0,gp_face1)
 
playerAttackPressed = keyboard_check_pressed(playerAttackInput)||gamepad_button_check_pressed(0,gp_face3);//scr_checkKeyboardOrMouseButtonPressed(playerAttackInput);
playerAttackHeld =	keyboard_check(playerAttackInput)||gamepad_button_check(0,gp_face3);//scr_checkKeyboardOrMouseButtonHeld(playerAttackInput);
 
//playerRunPressed[i] = scr_checkKeyboardOrMouseButtonPressed(playerRunButton[i]);
//playerRunHeld[i] = scr_checkKeyboardOrMouseButtonHeld(playerRunButton[i]);
 
playerStartPressed = keyboard_check_pressed(playerStartInput)||gamepad_button_check_pressed(0,gp_start)
playerStartHeld = keyboard_check(playerStartInput)||gamepad_button_check(0,playerJumpInput);
 
// directional keys/buttons We can't assign mouse inputs to the directional keys because that seemed like overkill.
 
playerUpPressed = keyboard_check_pressed(playerUpInput)||gamepad_button_check_pressed(0, gp_padu);
playerUpHeld = keyboard_check(playerUpInput)||gamepad_button_check(0, gp_padu);
playerDownPressed = keyboard_check_pressed(playerDownInput)||gamepad_button_check_pressed(0, gp_padd);
playerDownHeld = keyboard_check(playerDownInput)||gamepad_button_check(0, gp_padd);
playerLeftPressed = keyboard_check_pressed(playerLeftInput)||gamepad_button_check_pressed(0, gp_padl);
playerLeftHeld = keyboard_check(playerLeftInput)||gamepad_button_check(0, gp_padl);
playerRightPressed = keyboard_check_pressed(playerRightInput)||gamepad_button_check_pressed(0, gp_padr);
playerRightHeld = keyboard_check(playerRightInput)||gamepad_button_check(0, gp_padr);
