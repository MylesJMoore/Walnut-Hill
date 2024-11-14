if (global.enemy_invisible_frames <= 0) {
	show_debug_message("PLAYER BULLET COLLIDING(oSoulBullet)");
	global.enemy_invisible_frames = 15;
	global.monster[0].MyHP -= damage;
	oMonsterSoul.image_index = 1;
	global.monster[0].image_index = 1;
	audio_play_sound(snd_hurt, 11, false);
	if (global.monster[0].MyHP <= 0) {
		show_debug_message("ENEMY IS DEAD");
		//oMonsterSoul.image_index = 2;
		oMonsterSoul.image_alpha = 0;
		instance_create_depth(oMonsterSoul.x, oMonsterSoul.y, oMonsterSoul.depth - 10, oMonsterSoulDefeatedTopLeft);
		instance_create_depth(oMonsterSoul.x, oMonsterSoul.y, oMonsterSoul.depth - 10, oMonsterSoulDefeatedTopRight);
		instance_create_depth(oMonsterSoul.x, oMonsterSoul.y, oMonsterSoul.depth - 10, oMonsterSoulDefeatedBottomLeft);
		instance_create_depth(oMonsterSoul.x, oMonsterSoul.y, oMonsterSoul.depth - 10, oMonsterSoulDefeatedBottomRight);
		oButtonController.enemyKilled = true;
	}
}

if (disappearOnContact) {
	instance_destroy();
}