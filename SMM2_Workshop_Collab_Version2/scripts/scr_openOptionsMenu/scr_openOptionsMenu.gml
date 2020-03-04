// UPDATE CURRENT MENU GRID AND HEIGHT

if (global.playerInput > 0)
{
	cursorLocation = 0;
}

// SET CURSOR LOCATION APPROPRIATELY IF ON GAMEPAD.

currentMenuGrid = optionsGridB;
currentMenuHeight = ds_grid_height(currentMenuGrid); // # of entries in current Grid
