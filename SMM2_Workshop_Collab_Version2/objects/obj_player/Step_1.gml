/*onGround = OnGround();

cLeft  = place_meeting(x - 1, y, obj_block); 
cRight = place_meeting(x + 1, y, obj_block);
cUp		 = place_meeting(x,y-1,obj_block)or 
(place_meeting(x,y-1,obj_halfBlock)&&!place_meeting(x,y,obj_halfBlock));
invincibleTimer = max(invincibleTimer -1, 0);