if (scr_isValidInstance(owner))
{
	x = owner.x + xOffset - image_xscale*.5;
	y = owner.y + yOffset - image_yscale*.5;
}

// CREATING A LIST TO CONTAIN ALL ENEMIES TOUCHING MY BOUNDING BOX ON THIS FRAME.
var _dummyList = ds_list_create(); 
// FILL LIST WITH ALL ENEMIES THAT WE ARE TOUCHING
instance_place_list(x,y, par_enemy,_dummyList, true);//add other damageable elements after here
var _listSize = ds_list_size(_dummyList); 

// LOOP THROUGH LISTs
for (var i = 0; i < _listSize; ++i)
{
	// DEFINE ENEMY TOUCHING
	var _enemyStruck = ds_list_find_value(_dummyList, i);
	// DESTROY ENEMIES IN THE LIST 
	if scr_isValidInstance(_enemyStruck)
	{
		with _enemyStruck 
		{
			audio_play_sound_on(global.SEemitter,snd_enemy_hit_with_sword,false,1)
			instance_destroy();//add code in future to deal with enemy hp, stun and knockback here
		}
	}
}

ds_list_destroy(_dummyList); 


/*
with (obj_enemyDummy) 
{
    // Destroy enemy. Need to prepare variation for bosses and enemies with more than 1hp
    if (!(bbox_left > other.bboxright || bbox_right < other.bboxleft || bbox_top > other.bboxbottom || bbox_bottom < other.bboxtop)) {
        instance_destroy();
    }
}
*/

/*with (oParGrass) {
    if (!cut) {
    // Chop grass
    if (!(bbox_left > other.bboxright || bbox_right < other.bboxleft || bbox_top > other.bboxbottom || bbox_bottom < other.bboxtop)) {
            GrassCut();
            xskew = round(random_range(2, 4)) * choose(-1, 1);
        }
        
        alarm[0] = 3;
        cut = true;
    }
}

with (oParCrate) {
    // Break crate
    if (!(bbox_left > other.bboxright || bbox_right < other.bboxleft || bbox_top > other.bboxbottom || bbox_bottom < other.bboxtop)) {
        instance_destroy();
    }
}*/
