
// SINGLETON ENFORCEMENT
if instance_number(object_index) > 1
{
	instance_destroy();
	
}

// ESTABLISH A BUNCH OF OPTIONS FOR US TO ALTER LATER.
/*
fullScreen = false; // Whether game is full screen 
global.gameScale = 1; // scale of window (compared with native resolution) when game is windowed
global.SEVolume = .5; // Sound Effect Volume (scale of 0 - 10)
global.MUSVolume = .5; // Music Volume (scale of 0-10)

// Initialize emitters to make allow us to alter the sound effects and music independently.
global.SEEmitter = audio_emitter_create();
audio_emitter_gain(global.SEVolume, .5);
global.MUSEmitter = audio_emitter_create();
audio_emitter_gain(global.MUSVolume, .5);
*/
// We also want to make this menu compatible with keyboard and mouse or gamepads, so let’s keep track of which one is currently active.
global.playerInput = -1; // -1 is keyboard and mouse, 0 -7 are reserved for gamepads.
// GAMEPAD BUTTONS ACCEPTED
gpXAxis = 0;
gpYAxis = 0;
gpAxisReady = true; // tells us whether the axis is ready to accept a new input.
gpUp = false;
gpDown = false;
gpRight = false;
gpLeft = false;
gpConfirm = false;
gpCancel = false;

// gamepad deadzone values. We don't want to use the built in deadzone system because it doesn't work very well. 
gamepadDeadZone = .5;
gamepadDeadZoneSquared = gamepadDeadZone*gamepadDeadZone;


// DECLARE OPTIONS VALUES AND THEIR LOCATION INSIDE THE GRID (THIS LETS US REALLY EASILY BUILD AN OPTIONS MENU AND MODIFY IT) 
// IF YOU CHANGE THESE OPTIONS, YOU NEED ONLY CHANGE A FEW THINGS ACROSS THIS OBJECT...
// 1 -> Any switches which display a value for a variable scr_setOptionVariableStrings();
// 2 -> Make sure that any option script which adjusts a variable runs scr_setOptionVariableStrings.
// 3 -> make sure that the optionsGrids are the correct size. For instance, if you wanted to add a fourth option to optionGridA, the grid would need to be declared with optionsGridA = ds_grid_create(4,4);

// optionGrid, cursorLocation, name, script, valueChange(NULLVALUE IF A TOGGLE SWITCH), displaysVariable)
// Note, setting displays variable to true MUST correspond to scr_setOptionVariableStrings();
// If multiple options menus require display variables, use a switch statement inside scr_setOptionVariableStrings

// EXAMPLE BASIC TITLE MENU
optionsGridA = ds_grid_create(5,3);
scr_declareOptionsMenu(optionsGridA, 0, "Start Game", scr_beginGame,  NULLVALUE, false, TOGGLE); 
scr_declareOptionsMenu(optionsGridA, 1, "Options", scr_openOptionsMenu,  NULLVALUE, false, TOGGLE); 
scr_declareOptionsMenu(optionsGridA, 2, "Exit", scr_exitGame,  NULLVALUE, false, TOGGLE); 

// EXAMPLE BASIC OPTIONS MENU
optionsGridB = ds_grid_create(5, 5);
scr_declareOptionsMenu(optionsGridB, 0, "Display", scr_displaySwap,  NULLVALUE,true, TOGGLE); 
scr_declareOptionsMenu(optionsGridB, 1, "Window Scale", scr_adjustWindowScale, 1, true, SLIDER); 
scr_declareOptionsMenu(optionsGridB, 2, "SE Volume", scr_adjustSEVolume,  .1, true, SLIDER); 
scr_declareOptionsMenu(optionsGridB, 3, "MUS Volume", scr_adjustMUSVolume,  .1, true, SLIDER); 
scr_declareOptionsMenu(optionsGridB, 4, "Return", scr_closeOptions,  NULLVALUE, false, TOGGLE); 

// DECLARE NECESSARY VARIABLES FOR DISPLAY AND LOGIC
currentMenuGrid = optionsGridA;
currentMenuHeight = ds_grid_height(currentMenuGrid); // # of entries in current Grid
cursorLocation = -1; // Location of the cursor in the current menu
optionSeparation = 50; // Distance (in pixels) that options should be separated)

// SET BASIC MENU LOCATION IN CENTER OF DISPLAY
menuYOffset = 25;
centerX = display_get_gui_width()/2;
centerY = (display_get_gui_height()/2)+ menuYOffset;

draw_set_font(fnt_basic);

ideal_width = room_width;
ideal_height = room_height;

// TELLS US WHICH 'SIDE' OF BUTTON IS HIGHLIGHTED ON SLIDER OPTIONS
toggleHighlight = 0;

// GAME SCALE VALUE
global.gameScale = 1;

// SETS TRING VALUE OF SLIDER OPTION VALUE MENU OPTIONS.
// SHOULD BE RUN AGAIN WHEN ANY OF THESE VARIABLES ARE CHANGED
scr_setOptionVariableStrings();
