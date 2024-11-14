/// @param emote
function createNpcEmote(_emote) {
	with(obj_textbox) {
		instance_create_depth(global.speakblock_x + global.emote_x_buffer, global.speakblock_y + global.emote_y_buffer, -999999, _emote);
	}
}

/// @param emote
function createPlayerEmote(_emote, _emote_buffer = 0) {
	with(obj_player) {
		instance_create_depth(obj_player.x, obj_player.y + global.emote_y_buffer + _emote_buffer, -999999, _emote);
	}
}
/// @param emote
function removePlayerEmote(_emote) {
	with(obj_player) {
		instance_destroy(_emote);
	}
}

/// @param emote
function removeNpcEmote(_emote) {
	if(instance_exists(_emote)) {
		instance_destroy(_emote);
	}
}

function removeAllEmotes() {
	if(instance_exists(EMOTE_QUESTION)) {
		instance_destroy(EMOTE_QUESTION);
	}

	if(instance_exists(EMOTE_REACTION)) {
		instance_destroy(EMOTE_REACTION);
	}

	if(instance_exists(EMOTE_THINKING)) {
		instance_destroy(EMOTE_THINKING);
	}
}

