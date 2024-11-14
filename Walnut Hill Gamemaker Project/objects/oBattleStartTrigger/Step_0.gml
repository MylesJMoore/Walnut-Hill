if(place_meeting(x, y, obj_player) && !instance_exists(oSoulFlash)) {
	var inst = instance_create_depth(obj_player.x - 5, obj_player.y + 5, -99999, oSoulFlash);
}