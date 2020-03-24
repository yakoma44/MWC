///@Description @DebugDraw_Set Set values to be printed -- Only x1,y1 & x4,y4 used for rects!
///@param color
///@param x1
///@param y1
///@param ...

if((argument_count % 2) == 1)
{
	++global.debugDrawCount;
	
	global.debugDrawNumberOfXYPairs[global.debugDrawCount] = (argument_count-1) / 2;
	global.debugDrawColor[global.debugDrawCount] = argument[0];

	if(argument_count >= 2)
	{
		global.debugDrawX1[global.debugDrawCount] = argument[1];
		global.debugDrawY1[global.debugDrawCount] = argument[2];
	}

	if(argument_count >= 4)
	{
		global.debugDrawX2[global.debugDrawCount] = argument[3];
		global.debugDrawY2[global.debugDrawCount] = argument[4];
	}

	if(argument_count >= 6)
	{
		global.debugDrawX3[global.debugDrawCount] = argument[5];
		global.debugDrawY3[global.debugDrawCount] = argument[6];
	}

	if(argument_count >= 8)
	{
		global.debugDrawX4[global.debugDrawCount] = argument[7];
		global.debugDrawY4[global.debugDrawCount] = argument[8];
	}
}
else
{ 
	Print("Malformed call to DebugDraw_Set()!"); 
}