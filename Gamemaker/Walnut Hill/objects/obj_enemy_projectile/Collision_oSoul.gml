if (global.player_invisible_frames <= 0) {
	show_debug_message("BULLET COLLIDING");
	global.player_invisible_frames = 45;
	global.player_hp -= damage;
	audio_play_sound(snd_hurt, 11, false);
	oSoul.image_index = 1;
	if (global.player_hp <= 0) {
		game_end();
	}
} else {
	show_debug_message("PLAYER IS INVISIBLE");
}

if (disappearOnContact) {
	instance_destroy();
}