/// @param [character]
function getSpeakerSprite(_character) {
	//Speaker Sprite (Uses no sprite if one is not present)
	_speaker_sprite = noone;
	switch(_character)
	{
		//=====================================================================//
		case "ms catty":
			_speaker_sprite = spr_ms_catty;
			break;
		case "ms catty 2":
			_speaker_sprite = spr_ms_catty;
			break;
		//=====================================================================//
		case "ms catty chatting":
			_speaker_sprite = spr_ms_catty;
			break;
		//=====================================================================//
		case "mr catty":
			_speaker_sprite = spr_mr_catty;
			break;
		//=====================================================================//
		case "mr catty chatting":
			_speaker_sprite = spr_mr_catty;
			break;
		//=====================================================================//
		case "words of wisdom":
			_speaker_sprite = noone;
			break;
			
		//=====================================================================//
		// ADD MORE HERE
		//=====================================================================//
		
		//*********************************************************************//	
		default:
			_speaker_sprite = noone;
	}
	
	return _speaker_sprite;
}

/// @param [character]
function getSpeakerTextbox(_character) {
	//Speaker Textbox (Uses default textbox if one is not present)
	_textbox_sprite = noone;
	switch(_character)
	{
		//=====================================================================//
		case "ms catty":
			_textbox_sprite = spr_textbox_gameboy_original;
			break;
		case "ms catty 2":
			_textbox_sprite = spr_textbox_gameboy_monochrome;
			break;
		//=====================================================================//
		case "ms catty chatting":
			_textbox_sprite = spr_textbox_green;
			break;
		//=====================================================================//
		case "mr catty":
			_textbox_sprite = spr_textbox_gameboy;
			break;
		//=====================================================================//
		case "mr catty chatting":
			_textbox_sprite = spr_textbox_blue;
			break;
			
		//=====================================================================//
		case "words of wisdom":
			_textbox_sprite = spr_player_menu_textbox;
			break;
		//=====================================================================//
		case "title opening text":
			_textbox_sprite = spr_empty_textbox;
			break;
			
		//=====================================================================//
		// ADD MORE HERE
		//=====================================================================//
			
		//*********************************************************************//	
		default:
			_textbox_sprite = spr_textbox;
	}
	
	return _textbox_sprite;
}

/// @param [character]
function getSpeakerSound(_character) {
	//Speaker Sounds (Uses default if no sound is present)
	switch(_character)
	{
		//=====================================================================//
		case "ms catty chatting":
			_sound = sndSpeaker1;
			break;
		//=====================================================================//
		case "mr catty":
			_sound = sndSpeaker2;
			break;
		//=====================================================================//
		case "mr catty chatting":
			_sound = sndSpeaker2;
			break;
			
		//=====================================================================//
		// ADD MORE HERE
		//=====================================================================//
			
		//*********************************************************************//	
		default:
			_sound = sndSpeakerDefault;
	}
	
	return _sound;
}

/// @param [character]
function getSpeakerSide(_character) {
	//Speaker Textbox (Speaker sprite will be on the left as default)
	// 1 = Left | -1 = Right
	_speaker_side = 1;
	switch(_character)
	{
		//=====================================================================//
		case "ms catty chatting":
			_speaker_side = -1;
			break;
		//=====================================================================//
		case "mr catty chatting":
			_speaker_side = 1;
			break;
			
		//=====================================================================//
		// ADD MORE HERE
		//=====================================================================//
			
		//*********************************************************************//
		default:
			_speaker_side = 1;
	}
	
	return _speaker_side;
}