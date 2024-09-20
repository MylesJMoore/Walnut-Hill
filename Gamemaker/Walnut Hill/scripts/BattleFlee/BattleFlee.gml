/// @function BattleFlee

function BattleFlee() {
	//Return player to Overworld
	room_goto(global.player_previous_room);
	
	//Remove Player and Follower Objects
	RemovePlayerAndFollowers();
	
	//Create the player object
	global.player_left_battle = true;
	instance_create_layer(global.player_previous_x, global.player_previous_y, "Player", obj_player);
	
	//Reset player move flag for follower creation
	global.player_has_moved = false;
	
	//Reset enemy global
	global.current_enemy_macro = noone;
	
	//Reset Battle Trigger flag
	global.player_triggered_battle = false;
}