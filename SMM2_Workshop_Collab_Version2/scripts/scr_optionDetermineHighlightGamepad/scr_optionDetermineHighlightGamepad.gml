var _menuSize = currentMenuHeight;
var _cursorLocation = cursorLocation;

if (gpUp or gpYAxis < 0)
{
	_cursorLocation -= 1;
}

if (gpDown or gpYAxis > 0)
{
	_cursorLocation += 1;
}

cursorLocation = scr_wrap(_cursorLocation, 0, _menuSize);
