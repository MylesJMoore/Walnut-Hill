if (instance_exists(Dialogue)) {
	ReadyForBattle = true;
} else {
	if (ReadyForBattle) {
		ReadyForBattle = false;
		alarm[0] = 1;
	}
}

if(!oSoul.visible) {
	oSolara.sprite_index = spr_solara;
} else {
	oSolara.sprite_index = spr_solara_sad;
}

if (oButtonController.enemySpared) {
	image_alpha = 0.5;
}