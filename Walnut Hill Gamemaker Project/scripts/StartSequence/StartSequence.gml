/// @function StartSequence
function StartSequence(){
	if(!oMonsterBulletGenerator.sequence_is_playing) {
		instance_create_depth(x, y, 3000, oMonsterSequenceGenerator);
		oMonsterBulletGenerator.sequence_is_playing = true;
	}
}