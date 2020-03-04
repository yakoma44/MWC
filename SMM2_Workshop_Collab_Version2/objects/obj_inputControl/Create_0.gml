persistent = true; // you can also just check 'persistent' in the editor.

if instance_number(object_index) > 1 {instance_destroy();} // singleton enforcement.

gamepadDeadzone = .5;
gamepadDeadzoneSquared = gamepadDeadzone*gamepadDeadzone;
scr_initInputConfig();
scr_setInputsToFalse();

jumpBuffer=0
ledgeGraceTime=4;
/*for (var i = array_length_1d(playerInputDevice) -1; i >= 0; --i;)
{
    playerAxisReady[i] = true;
}