/// @Description @collision_normal - Returns normal of collided object (or -1 if none found)
/// @param x1
/// @param y1
/// @param object
/// @param [optional:radius]
/// @param [optional:resolution]
//
/// GMLscripts.com/license
//  Returns a 2D "surface normal" (in degrees) at a given point 
//  on or near an instance detected within a circular test area.
//  Makes approximately pi*(radius*radius) / (resolution*resolution) collision calls.
//  If no collision is found, (-1) is returned.
//
//      x1, y1         point on the surface            : real
//      object         object or instance (or all)     : real
//      radius         radius of test area (default 4) : real
//      resolution     resolution of test (default 1)  : real
//
{
    var result;

    var xx         = argument[0];
    var yy         = argument[1];
    var object     = argument[2];
    var radius     = (argument_count > 3) ? argument[3] : 4;
    var resolution = (argument_count > 4) ? argument[4] : 1;

    if(radius <= 0)     { radius = 4; }
    if(resolution <= 0) { resolution = 1; }

    var nx = 0;
    var ny = 0;

    if(collision_circle(xx, yy, radius, object, true, true)) 
    {
        for(var j = resolution; j <= radius; j += resolution) 
        {
            for(var i = 0; i < radius; i += resolution) 
            {
                if(point_distance(0, 0, i, j) <= radius) 
                {
                    if(!collision_point(xx+i, yy+j, object, true, true)) 
                    { 
                        nx += i; 
                        ny += j; 
                    }

                    if(!collision_point(xx+j, yy-i, object, true, true)) 
                    { 
                        nx += j; 
                        ny -= i; 
                    }

                    if(!collision_point(xx-i, yy-j, object, true, true)) 
                    { 
                        nx -= i; 
                        ny -= j; 
                    }

                    if(!collision_point(xx-j, yy+i, object, true, true)) 
                    { 
                        nx -= j; 
                        ny += i; 
                    }
                }
            }
        }
        if(nx == 0 && ny == 0) 
        { 
            result = -1; 
        }
        else
        {
            result = point_direction(0, 0, nx, ny);
        }
    }
    else
    {
        result = -1;
    }

    return(result);
}