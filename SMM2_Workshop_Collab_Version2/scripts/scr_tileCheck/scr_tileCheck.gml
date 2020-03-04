/// scr_tileCheck(checkX,checkY, tileType, grid)
 
var grid = argument3;
 
if ds_exists(grid, ds_type_grid)
{
 
    var checkX = argument0 div TILESIZE;
    var checkY = argument1 div TILESIZE;
    var tileType = argument2;
   
   
    if (grid[# checkX, checkY] ==  tileType)
    {
        return true;
    }
    else
    {
        return false;
    }
}
else
{
    return false;
}