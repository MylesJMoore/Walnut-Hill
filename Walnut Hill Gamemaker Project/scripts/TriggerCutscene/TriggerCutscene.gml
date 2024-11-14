/// @desc TriggerCutscene(player_face, follower1_face, follower2_face,follower3_face)
/// @arg player_face
/// @arg follower1_face
/// @arg follower2_face
/// @arg follower3_face
/// @arg cutscene
// Triggers the cutscene when player interacts with object trigger
function TriggerCutscene(player_face,follower1_face,follower2_face,follower3_face, cutscene = false) {
	//If Cutscene is not provided, then exit
	if(!cutscene) {
		return;
	}
	
	//Stop Player from moving
	global.player_can_move = false;
	
	//Set the player face and follower face directions when cutscene starts
	SetPlayerAndFollowersFace(player_face,follower1_face,follower2_face,follower3_face);
	
	//Make the trigger invisible after triggering
	with(oCutsceneTrigger) {
		image_alpha = 0; 
	}

	//Create the cutscene object and cutscene camera
	if(!instance_exists(cutscene)) {
		instance_create_depth(0,0,0, cutscene);
		instance_create_depth(obj_player.x,obj_player.y,obj_player.depth, oCutsceneCamera);
	}

	//Destroy the Cutscene Trigger
	instance_destroy(oCutsceneTrigger);
}