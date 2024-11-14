/// @function HideOutsideBattlebox
function HideOutsideBattlebox(){
	//Hide Outside of box
	if(!oMonsterBulletGenerator.outside_hidden) {
		oMonsterBulletGenerator.hide_outside_box = true;
		instance_create_layer(6, 259, "Bullets", oBlackBoxLeft);
		instance_create_layer(385, 259, "Bullets", oBlackBoxRight);
	}
}