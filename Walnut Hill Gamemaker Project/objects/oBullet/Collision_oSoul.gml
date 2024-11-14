if (global.player_inv_frames <= 0) {
	global.player_inv_frames = 30;
	//global.player_hp -= damage;
	audio_play_sound(snd_hurt, 11, false);
	if (global.player_hp <= 0) {
		game_end();
	}
}

if (disappearOnContact) {
	instance_destroy();
}