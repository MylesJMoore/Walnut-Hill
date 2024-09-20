/// @function RemovePlayerAndFollowers
function RemovePlayerAndFollowers() {
	//Check if player & follower objects exist
	if (instance_exists(obj_player)) {
		instance_destroy(obj_player);
	}
	
	if (instance_exists(obj_follower1)) {
		instance_destroy(obj_follower1);
	}
	
	if (instance_exists(obj_follower2)) {
		instance_destroy(obj_follower2);
	}
	
	if (instance_exists(obj_follower3)) {
		instance_destroy(obj_follower3);
	}
}