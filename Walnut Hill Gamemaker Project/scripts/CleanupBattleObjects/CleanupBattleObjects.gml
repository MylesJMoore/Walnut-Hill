/// @function CleanupBattleObjects
function CleanupBattleObjects(){
	instance_destroy(oMonsterBullet);
	instance_destroy(oMonsterBurstBullet);
	instance_destroy(oMonsterSpear);
	instance_destroy(oMonsterBulletGenerator);
	instance_destroy(obj_speech_bubble);
	if(instance_exists(oMonsterSequenceGenerator)) {
		layer_sequence_destroy(oMonsterSequenceGenerator.my_sequence);
		instance_destroy(oMonsterSequenceGenerator);
	}

	//Hide Black Boxes
	if(instance_exists(oBlackBoxLeft)) {
		instance_destroy(oBlackBoxLeft);
	}
	if(instance_exists(oBlackBoxRight)) {
		instance_destroy(oBlackBoxRight);
	}
}