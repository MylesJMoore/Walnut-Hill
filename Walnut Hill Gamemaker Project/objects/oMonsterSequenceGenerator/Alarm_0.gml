#region Individual Instance Creation - Random Falling Bullet Generation (Very Basic)
//Random Bullet Generation
//instance_create_depth(random(640), -40, -2000,oBullet);
//instance_create_depth(oSoul.x, -40, -2000,oBullet);\

//Battle Timer
//alarm[0] = choose(10, 20, 30);
#endregion

#region Sequences - Bullet Generation (Planned Patterns)
// Create the sequence instance on the "Cutscenes" layer at position (80, 60)
if(!sequence_playing) {
	var _enemyBulletPattern = irandom_range(0,2);
	show_debug_message(_enemyBulletPattern);
	var _bulletSequence = getEnemyBulletPattern(global.current_enemy_name, _enemyBulletPattern);
	my_sequence = layer_sequence_create("Bullets", 80, 60, _bulletSequence);
}

// Debugging output
if (my_sequence != -1 && !sequence_playing) {
    show_debug_message("Sequence created successfully: " + string(my_sequence));
	sequence_playing = true;
    // Play the sequence using layer_sequence_play
    layer_sequence_play(my_sequence);
    show_debug_message("Sequence started playing.");
}
#endregion



