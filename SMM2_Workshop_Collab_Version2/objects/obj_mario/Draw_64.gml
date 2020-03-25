/// @description Insert description here
// You can write your code in this editor
if(keyboard_check(ord("Z")))
	{
		 // Mario's run doesn't stop unless until 10 frames after the button has been released
		if(holding==noone)
		{
			draw_rectangle(x,y,x+(16*image_xscale),y-8,c_blue)
		}
	}