if (global.player_invisible_frames <= 0) {
	show_debug_message("PLAYER DAMAGED");
	global.player_invisible_frames = 45;
	global.player_hp -= damage;
	show_debug_message(global.player_hp);
	audio_play_sound(snd_hurt, 11, false);
	oSoul.sprite_index = spr_soul_hurt;
	if (global.player_hp <= 0) {
		global.player_hp = 0;
		show_debug_message("PLAYER IS DEAD");
		oSoul.image_alpha = 0;
		oMonsterBulletGenerator.alarm[1] = true;
		instance_create_depth(oSoul.x, oSoul.y, oSoul.depth - 10, oPlayerSoulDefeatedTopLeft);
		instance_create_depth(oSoul.x, oSoul.y, oSoul.depth - 10, oPlayerSoulDefeatedTopRight);
		instance_create_depth(oSoul.x, oSoul.y, oSoul.depth - 10, oPlayerSoulDefeatedBottomLeft);
		instance_create_depth(oSoul.x, oSoul.y, oSoul.depth - 10, oPlayerSoulDefeatedBottomRight);
		oButtonController.playerKilled = true;
	}
}

if (disappearOnContact) {
	instance_destroy();
}