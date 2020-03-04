///@description @scr_tileCollideAtPoint determine where colliding with tiles
///@param tilemapID
///@param point array
 
var _tilemapID = argument[0];
var _collisionFound = false;
 
//loop through points and check for tile
for (var i = 1; i < argument_count; i++) {
    var _point = argument[i];
    _collisionFound = _collisionFound || tilemap_get_at_pixel(_tilemapID,_point[0],_point[1]);
 
}
 
//return result
return _collisionFound;