persistent = true; // you can also just check 'persistent' in the editor.

if instance_number(object_index) > 1 {instance_destroy();} // singleton enforcement.

myCamera = view_camera[0]; 

target=obj_player;

width = 640//obj_displayControl.ideal_width;
height= 480//obj_displayControl.ideal_height;
//camera_set_view_size(myCamera, width, height); 
widthHalf = width*0.5;
heightHalf = height*.5;

cameraX = 0; 
cameraY = 0; 
cameraSlide = 1; 

smallDistance = 16; 
largeDistance = 48; 

if (scr_isValidInstance(target))
{
	cameraX = target.x - widthHalf + smallDistance; 
	x = target.x;
	camera_set_view_pos(myCamera,cameraX,target.y - heightHalf);
}


surface_resize(application_surface, 640, 480);
window_set_size(640, 480);