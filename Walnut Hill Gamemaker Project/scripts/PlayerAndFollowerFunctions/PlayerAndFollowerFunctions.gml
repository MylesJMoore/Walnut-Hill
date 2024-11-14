/// @function HidePlayerAndFollowers
/// @desc HidePlayerAndFollowers()
// Flips the image alpha so players and followers are invisible
function HidePlayerAndFollowers(){
	with(obj_player) {
	image_alpha = 0;
	}

	with(obj_follower1) {
		image_alpha = 0;
	}

	with(obj_follower2) {
		image_alpha = 0;
	}

	with(obj_follower3) {
		image_alpha = 0;
	}
}

/// @function ShowPlayerAndFollowers
/// @desc ShowPlayerAndFollowers()
// Flips the image alpha so players and followers are visible
function ShowPlayerAndFollowers(){
	with(obj_player) {
	image_alpha = 1;
	}

	with(obj_follower1) {
		image_alpha = 1;
	}

	with(obj_follower2) {
		image_alpha = 1;
	}

	with(obj_follower3) {
		image_alpha = 1;
	}
}

/// @function SetPlayerAndFollowersFace(player_face, follower1_face, follower2_face,follower3_face)
/// @param player_face
/// @param follower1_face
/// @param follower2_face
/// @param follower3_face
// Flips the image alpha so players and followers are visible
function SetPlayerAndFollowersFace(player_face, follower1_face, follower2_face, follower3_face) {
	with(obj_player) {
		sprite_index = sprite[player_face];
	}

	with(obj_follower1) {
		global.follower1_cutscene_face = follower1_face;
	}

	with(obj_follower2) {
		global.follower2_cutscene_face = follower2_face;
	}

	with(obj_follower3) {
		global.follower3_cutscene_face = follower3_face;
	}
}