/// @description DebugDraw functionality

// DebugDraw()
for(i = 0; i <= global.debugDrawCount; ++i)
{
	if(global.debugDrawNumberOfXYPairs[i] == 1)
	{
		draw_point_color(global.debugDrawX1[i], global.debugDrawY1[i], 
						 global.debugDrawColor[i]);
	}

	if(global.debugDrawNumberOfXYPairs[i] == 2)
	{
		draw_line_color(global.debugDrawX1[i], global.debugDrawY1[i], 
						global.debugDrawX2[i], global.debugDrawY2[i], 
						global.debugDrawColor[i], global.debugDrawColor[i]);
	}

	if(global.debugDrawNumberOfXYPairs[i] == 3)
	{
		draw_triangle_color(global.debugDrawX1[i], global.debugDrawY1[i], 
						    global.debugDrawX2[i], global.debugDrawY2[i],
							global.debugDrawX3[i], global.debugDrawY3[i],
							global.debugDrawColor[i], global.debugDrawColor[i], 
							global.debugDrawColor[i], true);			
	}

	if(global.debugDrawNumberOfXYPairs[i] == 4)
	{
		draw_rectangle_color(global.debugDrawX1[i], global.debugDrawY1[i], 
							 global.debugDrawX4[i], global.debugDrawY4[i],
							 global.debugDrawColor[i], global.debugDrawColor[i], 
							 global.debugDrawColor[i], global.debugDrawColor[i], 
							 true);
	}
}
global.debugDrawCount = 0;