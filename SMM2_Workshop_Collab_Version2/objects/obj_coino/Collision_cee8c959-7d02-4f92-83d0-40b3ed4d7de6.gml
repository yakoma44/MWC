/// @description Insert description here
// You can write your code in this editor
/// @description Collect the coin

//Play the coin sound
audio_play_sound(snd_jingle2,0,0);

//Increment coins
global.coins++;

//Destroy
instance_destroy();

