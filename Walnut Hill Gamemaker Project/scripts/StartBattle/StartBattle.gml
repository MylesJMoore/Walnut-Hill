/// @function StartBattle
/// @param _overworldEnemy
function StartBattle(_enemy = noone,_overworldEnemy = noone, _random = false) {
	global.player_previous_x = obj_player.x;
	global.player_previous_y = obj_player.y;
	global.player_previous_room = room;
	global.player_previous_sprite_face = obj_player.face;
	if(instance_exists(_overworldEnemy)) {
		instance_destroy(_overworldEnemy);
	}
	
	if(_random) {
		_enemy = global.enemy_macros[irandom(array_length(global.enemy_macros) - 1)];
	}
	global.current_enemy_macro = _enemy;
	//Remove Player and Follower Objects
	RemovePlayerAndFollowers();
	room_goto(rm_battle);
	global.player_triggered_battle = true;
}