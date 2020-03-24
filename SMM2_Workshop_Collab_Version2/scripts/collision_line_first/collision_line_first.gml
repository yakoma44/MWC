/// collision_line_first(x1, y1, x2, y2, object, prec, notMe)
/// @param x1Origin
/// @param y1Origin
/// @param x2
/// @param y2
/// @param object
/// @param preciseCollision
/// @param ignoreCallingInstance

/// GMLscripts.com/license
//  Returns the instance id of an object colliding with a given line and
//  closest to the first point, or noone if no instance found.
//  The solution is found in log2(range) collision checks.
//
//      x1,y2       first point on collision line, real
//      x2,y2       second point on collision line, real
//      object      which objects to look for (or all), real
//      prec        if true, use precise collision checking, bool
//      notme       if true, ignore the calling instance, bool
//

{
    var ox, oy;
	var dx, dy;
	var object;
	var prec;
	var notMe; 
	var sx,sy;
	var inst;
	var i;
	
    ox = argument0;
    oy = argument1;
    dx = argument2;
    dy = argument3;
    object = argument4;
    prec = argument5;
    notMe = argument6;
	
    sx = dx - ox;
    sy = dy - oy;
	
    inst = collision_line(ox, oy, dx, dy, object, prec, notMe);
	
    if(inst != noone) 
	{
        while((abs(sx) >= 1) || (abs(sy) >= 1)) 
		{
            sx /= 2;
            sy /= 2;
			
            i = collision_line(ox, oy, dx, dy, object, prec, notMe);
			
            if(i) 
			{
                dx -= sx;
                dy -= sy;
				
                inst = i;
            }
			else
			{
                dx += sx;
                dy += sy;
            }
        }
    }
	
    return(inst);
}