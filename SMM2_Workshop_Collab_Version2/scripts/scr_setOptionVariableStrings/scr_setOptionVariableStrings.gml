/// Run this script every time that you change variables being referenced by the menu logic; the menu sizes will change, causing some of the slider
// and highlight logic to change. Make sure it's consistent! (Or design your menu so everything is the same size all the time!) 

optionVariableNameArray[3] = ": " + string(round(global.MUSVolume*10)); // MUSIC VOLUME
optionVariableNameArray[2] = ": " + string(round(global.SEVolume*10)); // SE VOLUME
optionVariableNameArray[1] = ": " + string(global.gameScale); // DISPLAY SCALE

// FULLSCREEN SETTING
switch window_get_fullscreen()
{
	case 0:
		optionVariableNameArray[0] = ": Windowed"; 
		break;
	case 1:
		optionVariableNameArray[0] = ": Fullscreen"; 
		break;
}
