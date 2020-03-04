/// scr_gridPositionMeeting(x,y, tileType)
// use this script to check if there is a grid type at a point.
//show_debug_message("gridPositionMeeting");
var xx = argument[0];
var yy = argument[1];
 
// PATCH IN A VALUE FROM MACROS.
var tileType = argument[2];
 
// remember position
 
// check for x meeting.
// x_meeting will only be true when one of the following two positions is not a floor.
var meeting = false;
var gridCheckX = floor(xx div TILESIZE);
 
var gridCheckY = floor(yy div TILESIZE);
if global.roomGrid[# gridCheckX, gridCheckY] == tileType
{
    meeting = true;
}
// now move back
 
//show_debug_message("gridPositionMeeting End");
return meeting;