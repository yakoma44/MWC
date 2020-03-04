if !instance_exists(target)
{
	exit;
}


// ESTABLISH REFERENCE VARIABLES FOR CAMERA MOVEMENT
var _widthHalf =widthHalf; //obj_displayControl.ideal_width*.5;
var _heightHalf = heightHalf; 

var _targetX = target.x + target.vx; 
var _targetY = target.y;// + target.vy; 

var _newY = target.y - heightHalf;

// KEEP CAMERA CENTERED ON 'MIDDLE' OF SCREEN
x = camera_get_view_x(view_camera[0]) + _widthHalf; 
y = _targetY; 
var _largeDistance = largeDistance;  // how far from middle to put the external boundaries.
var _smallDistance = smallDistance; 

var _slideSpeed = 4; // SPEED OF CAMERA SLIDE (0-1) when camera is 'swooshing' 

switch cameraSlide
{
	case -3://RIGHT EDGE CAMERA
		
		if (target.vx < 0 and (_targetX <= x - _smallDistance))//if(_targetX<=x-_largeDistance)
		{
			cameraX -= (_slideSpeed); 
			cameraX += target.vx;
			cameraSlide=-2
			
			//cameraX = room_width - width + target.vx; 
			//cameraSlide = -1; 
		}
	break;
	case -2: // CAMERA IS SNAPPING FROM THE LEFT GREEN LINE TO THE RIGHT RED LINE
		if(cameraX<=0)
		{
			cameraSlide=3
		}
		else
		if (_targetX < round(x) + _smallDistance)
		{

			cameraX -= (_slideSpeed); 
			cameraX += target.vx;
		}
		else {cameraSlide = -1;}
	break; 
	case -1: // CAMERA IS SET AT RIGHT RED LINE
		if(cameraX<=0)
		{
			cameraSlide=3
			//cameraX =	_targetX-(_widthHalf-_smallDistance);
		}else
		if(cameraX>=room_width - _widthHalf)
		{
			cameraSlide=-3
		}
		else
		switch sign(target.vx)
		{
			case 1: // MOVING RIGHT
				if (_targetX > x +_largeDistance)
				{cameraSlide = 2;}
			break;
			case -1: // MOVING LEFT
				if (_targetX < x + _smallDistance)
				{
					cameraX =	_targetX-(_widthHalf+_smallDistance);
				}
				break; 
		}
		break;
	case 0: // THIS SHOULD NEVER HAPPEN, SWITCH TO 1 IF IT DOES
		cameraX =	_targetX- (_widthHalf); 
		cameraSlide = 1; 
		break;
	case 1: // CAMERA IS TRACKING AT LEFT RED LINE
		if (cameraX>=room_width - width)
		{
			cameraSlide=-3;
		}else
		if(cameraX<=0)
		{
			cameraSlide=3
		}
		else
		switch sign(target.vx)
		{
			case -1: // MOVING LEFT
				if (_targetX < x - _largeDistance)
				{cameraSlide = -2;}
			break;
			case 1: // MOVING RIGHT
				if (_targetX > x - _smallDistance)
				{
					cameraX =	_targetX-(_widthHalf-_smallDistance);
				}
				break; 
		}
		
		break;
	case 2: // CAMERA IS 'SNAPPING' TO LEFT RED LINE
		if (cameraX>=room_width - width)
		{
			cameraSlide=-3;
		}else
		if (_targetX > round(x) - _smallDistance)
		{
			cameraX += (_slideSpeed); 
			cameraX += target.vx;
		}
		
		else 
		{
			cameraSlide = 1;
		}
		break; 
	case 3://LEFT EDGE CAMERA
		if(target.vx > 0 and (_targetX >= x +_smallDistance))
		{
			cameraX += (_slideSpeed); 
			cameraX += target.vx;
			cameraSlide=2
			//cameraX = target.vx; 
			//cameraSlide = 1; 
		}
	break;
}
cameraY = target.y - heightHalf;

// CLAMP FINAL CAMERA LOCATION INSIDE THE ROOM, WITHOUT ALTERING THE ACTUAL CAMERA X AND Y VALUES.
var _finalCameraX = clamp(cameraX, 0, room_width - width); 
var _finalCameraY = clamp(cameraY, 0, room_height - height); 
camera_set_view_pos(view_camera[0],_finalCameraX,_finalCameraY);

//DEACTIVATE INSTANCES OUTSIDE OF CAMERA
/*
var _vx = camera_get_view_x(view_camera[0]);
var _vy = camera_get_view_y(view_camera[0]);
var _vw = camera_get_view_width(view_camera[0]);
var _vh = camera_get_view_height(view_camera[0]);
instance_deactivate_region(_vx - 64, _vy - 64, _vw + 128, _vh + 128, false,true);
instance_activate_region(_vx - 64, _vy - 64, _vw + 128, _vh + 128, true);




/*if !instance_exists(target)
{
	exit;
}


// ESTABLISH REFERENCE VARIABLES FOR CAMERA MOVEMENT
var _widthHalf =widthHalf; //obj_displayControl.ideal_width*.5;
var _heightHalf = heightHalf; 

var _targetX = target.x + target.vx; 
var _targetY = target.y;// + target.vy; 

var _newY = target.y - heightHalf;

// KEEP CAMERA CENTERED ON 'MIDDLE' OF SCREEN
x = camera_get_view_x(view_camera[0]) + _widthHalf; 
y = _targetY; 
var _largeDistance = largeDistance;  // how far from middle to put the external boundaries.
var _smallDistance = smallDistance; 

var _slideSpeed = 4; // SPEED OF CAMERA SLIDE (0-1) when camera is 'swooshing' 

switch cameraSlide
{
	case -3://RIGHT EDGE CAMERA
		
		if (target.vx < 0 and (_targetX <= x + _smallDistance))//if(_targetX<=x-_largeDistance)
		{
			//cameraX -= (_slideSpeed); 
			//cameraX += target.vx;
			//cameraSlide=-2
			
			cameraX = room_width - width + target.vx; 
			cameraSlide = -1; 
		}
	break;
	case -2: // CAMERA IS SNAPPING FROM THE LEFT GREEN LINE TO THE RIGHT RED LINE
		if(cameraX<=0)
		{
			cameraSlide=3
		}
		else
		if (_targetX < round(x) + _smallDistance)
		{

			cameraX -= (_slideSpeed); 
			cameraX += target.vx;
		}
		else {cameraSlide = -1;}
	break; 
	case -1: // CAMERA IS SET AT RIGHT RED LINE
		if(cameraX<=0)
		{
			cameraSlide=3
			//cameraX =	_targetX-(_widthHalf-_smallDistance);
		}else
		if(cameraX>=room_width - _widthHalf)
		{
			cameraSlide=-3
		}
		else
		switch sign(target.vx)
		{
			case 1: // MOVING RIGHT
				if (_targetX > x +_largeDistance)
				{cameraSlide = 2;}
			break;
			case -1: // MOVING LEFT
				if (_targetX < x + _smallDistance)
				{
					cameraX =	_targetX-(_widthHalf+_smallDistance);
				}
				break; 
		}
		break;
	case 0: // THIS SHOULD NEVER HAPPEN, SWITCH TO 1 IF IT DOES
		cameraX =	_targetX- (_widthHalf); 
		cameraSlide = 1; 
		break;
	case 1: // CAMERA IS TRACKING AT LEFT RED LINE
		if (cameraX>=room_width - width)
		{
			cameraSlide=-3;
		}else
		if(cameraX<=0)
		{
			cameraSlide=3
		}
		else
		switch sign(target.vx)
		{
			case -1: // MOVING LEFT
				if (_targetX < x - _largeDistance)
				{cameraSlide = -2;}
			break;
			case 1: // MOVING RIGHT
				if (_targetX > x - _smallDistance)
				{
					cameraX =	_targetX-(_widthHalf-_smallDistance);
				}
				break; 
		}
		
		break;
	case 2: // CAMERA IS 'SNAPPING' TO LEFT RED LINE
		if (cameraX>=room_width - width)
		{
			cameraSlide=-3;
		}else
		if (_targetX > round(x) - _smallDistance)
		{
			cameraX += (_slideSpeed); 
			cameraX += target.vx;
		}
		
		else 
		{
			cameraSlide = 1;
		}
		break; 
	case 3://LEFT EDGE CAMERA
		if(target.vx > 0 and (_targetX >= x -_smallDistance))
		{
			//cameraX += (_slideSpeed); 
			//cameraX += target.vx;
			//cameraSlide=2
			cameraX = target.vx; 
			cameraSlide = 1; 
		}
	break;
}
cameraY = target.y - heightHalf;

// CLAMP FINAL CAMERA LOCATION INSIDE THE ROOM, WITHOUT ALTERING THE ACTUAL CAMERA X AND Y VALUES.
var _finalCameraX = clamp(cameraX, 0, room_width - width); 
var _finalCameraY = clamp(cameraY, 0, room_height - height); 
camera_set_view_pos(view_camera[0],_finalCameraX,_finalCameraY);

