// UPDATE CURRENT MENU GRID AND HEIGHT

currentMenuGrid = optionsGridA;
currentMenuHeight = ds_grid_height(currentMenuGrid); // # of entries in current Grid

// SET CURSOR LOCATION APPROPRIATELY IF ON GAMEPAD.
if (global.playerInput > 0)
{
	cursorLocation = 1;
}
