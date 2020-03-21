//Handle Sub-Pixel Movement
cx += vx;
cy += vy;
vxNew = floor(cx);
vyNew = floor(cy);
cx -= vxNew;
cy -= vyNew;
//Finalize x movement
repeat(abs(vxNew)) 
{     
	if (!place_meeting(x + sign(vxNew), y, obj_block))
		x += sign(vxNew);
	else        
		vxNew = 0;
}  
//Finalize y movement
for(i=0;i<=abs(vyNew);i++)
{
		
	if(vyNew>0 && OnGround())
	{
		vyNew=0;//works with vyNew NOT vy
	}
	// NORMAL Y MOVEMENT 
	if (!place_meeting(x,y+sign(vyNew),obj_block))
	{ 
		y+= sign(vyNew);
	}else{
		vy = 0;
	}
}
