/// @description Insert description here
// You can write your code in this editor
//room is set to level1 just for the purpose of making it work atm
if(room == rm_level1) {
	if(global.coins >= 100) {
		audio_play_sound(snd_jingle8, 1, false);
		lives++;
		global.coins = 0;
	}
}

