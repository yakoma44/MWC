/// @description scr_gridPlaceMeeting(x,y, tileType);
/// @param x
/// @param y
/// @param TILETYPE
 
/*
    Please Note:    -   This script was designed to be used for movement code, where the movement did not exceed one cell (eg 32px)
                    -   Checks for edges only! Not the inner part of your object. Eg assuming a 3x3 cell object the "middle" tile is NOT checked.
            You can either write your own loop to handle this case, or if the grid entries allow use the built in ds_grid_get_sum or _max functions to check all cells at once!
*/
 
// === Grab Arguments === //
var _x = argument[0],
    _y = argument[1],
    _tileType = argument[2],
    _g = global.roomGrid;       // grab local grid handle for performance boost - not neccesary when a global var. Shown here for consistency reasons.
   
// === determine coords === //
var _xp = x, // save previous position
    _yp = y;
x = _x; // move to update bbox coordinates
y = _y;
var _r = bbox_right div TILESIZE,// << do these calculations only once - again performance reasons!
    _l = bbox_left div TILESIZE,
    _u = bbox_top div TILESIZE,
    _d = bbox_bottom div TILESIZE;
x = _xp; // move back
y = _yp;
 
// === Check Corners === // : if any of these flag true ==> early exit;
var col = ( _g[# _l, _u] == _tileType ||// Left  Top Corner
            _g[# _r, _u] == _tileType ||// Right Top Corner
            _g[# _l, _d] == _tileType ||// Left  Bot Corner
            _g[# _r, _d] == _tileType );// Right Bot Corner
if col return col;// return if collision detected, bypass edge check
 
// === Edge Check === // : triggered if there is more than 1 cell between left + right or top + bot tile.
var i=1; repeat(_r-_l-1){ if (_g[# _l+i,_u] == _tileType  || _g[# _l+i, _d] == _tileType ) {return true} ++i}; // check cells between LR (eg 5-3) => 3 cells, 1 cell in between to check.  [LEFT]-[TOCHECK]-[RIGHT]
var j=1; repeat(_d-_u-1){ if (_g[# _l,_u+j] == _tileType  || _g[# _r, _u+j] == _tileType ) {return true} ++j}; // check cells between UD
 
return col;// return [true,false]