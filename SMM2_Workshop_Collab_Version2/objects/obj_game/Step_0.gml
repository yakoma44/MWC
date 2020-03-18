//lose all lives
if lives = 0 {
	instance_destroy();
    room_goto(rm_gameover);
}

//extra live
if global.coins = 100{
lives++;
global.coins = 0;
}

