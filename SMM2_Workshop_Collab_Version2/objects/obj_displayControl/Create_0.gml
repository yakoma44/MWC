persistent = true; // you can also just check 'persistent' in the editor.

if instance_number(object_index) > 1 {instance_destroy();} // singleton enforcement.

//scr_initResolution();

//the speed the game runs at
global.timeFactor = 1
