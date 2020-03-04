/// @description scr_setInputsToFalse Basically all we are doing here is creating (or resetting) arrays that will store the current value of each input on every frame. We want to know whether each button has been pressed and whether it has been held on each frame by each player. These arrays will store the most recent input information for every player.

//for (var i = array_length_1d(playerInputDevice) - 1; i >= 0; --i)
//{
  // action keys/buttons
  playerAttackPressed = false;
  playerAttackHeld = false;
  playerJumpPressed = false;
  playerJumpHeld = false;
  //playerRunPressed[i] = false;
  //playerRunHeld[i] = false;
  playerStartPressed = false;
  playerStartHeld = false;  

  // directional keys/buttons
  playerUpPressed = false;
  playerUpHeld = false;
  playerDownPressed = false;
  playerDownHeld = false;
  playerLeftPressed = false;
  playerLeftHeld = false;
  playerRightPressed = false;
  playerRightHeld = false;

  // For gamepad players, we also need a system to store the axis values of their respective gamepads
  playerXAxis = 0;
  playerYAxis = 0; 
//}