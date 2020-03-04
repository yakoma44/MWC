/// @description scr_initInputConfig

// Initializes the input device associated with each player; -1 corresponds to keyboard and mouse, 0-11 correspond to each of the respective gamepads.

//playerInputDevice[3] = 2; // Xinput gamepad 3
//playerInputDevice[2] = 1; // Xinput gamepad 2
//playerInputDevice[1] = 0; // Xinput gamepad 1
//playerInputDevice[0] = -1; // keyboard and mouse 

// Basically what we'll be doing now is storing each input 'button' for each player in the game, so what you see below is the default 'button config' for each player. Remember, in a real project you will want players to be able to configure this to their liking.

// Note: It may be a good idea to have your menu systems reference inputs configurations that cannot be reconfigured to prevent players from confusing themselves!

//for (var i = array_length_1d(playerInputDevice) - 1; i >= 0; --i)
//{
//    var _inputDevice = playerInputDevice[i];

//    if _inputDevice == -1 // KEYBOARD AND MOUSE
//    {
         playerJumpInput = ord("Z");
         playerAttackInput = ord("X"); 
         //playerRunButton[i] = vk_shift; 
         playerStartInput = vk_escape||gp_start;

         playerUpInput = vk_up; 
         playerDownInput = vk_down; 
         playerLeftInput = vk_left; 
         playerRightInput = vk_right; 
/*    }
    else // GAMEPAD (Gamepads don't need up/down/left/right definitions under normal circumstances since those will just correspond to the left analogue stick and d-pad.) 
    {
        jump[i] = gp_face1;
        attack[i] = gp_face2; 
        //playerRunButton[i] = gp_face3; 
        start[i] = gp_start;
    }
}