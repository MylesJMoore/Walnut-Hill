function setDefaultsForText() {
	line_break_pos[0, page_number] = 999;
	line_break_num[page_number] = 0;
	line_break_offset[page_number] = 0;
	
	//Variables for every letter/character
	for(c = 0; c < 500; c++) 
	{
		col_1[c, page_number] = c_white;
		col_2[c, page_number] = c_white;
		col_3[c, page_number] = c_white;
		col_4[c, page_number] = c_white;
		
		float_text[c, page_number] = 0;
		float_dir[c, page_number] = c * 40; //20 Degrees away from each other
		
		shake_text[c, page_number] = 0;
		shake_dir[c, page_number] = irandom(360);
		shake_timer[c, page_number] = irandom(4);
	}
	
	textbox_sprite[page_number] = spr_textbox;
	textbox_option_sprite[page_number] = noone;
	text_vertical_adjustment[page_number] = 0;
	speaker_sprite[page_number] = noone;
	speaker_side[page_number] = 1;
	speaker_sound[page_number] = sndSpeakerDefault;
}


#region Text VFX
/// @param first_char
/// @param last_char
/// @param col1
/// @param col2
/// @param col3
/// @param col4
function setTextColor(_start, _end, _col1, _col2, _col3, _col4) {
	for(c = _start; c < _end; c++) 
	{
		//We do -1 so that you can color the previous text line | (Ex: line1 = "Stuff is red", line2 = setTextColor(1,10,c_red,c_red,c_red,c_red))
		col_1[c, page_number - 1] = _col1;
		col_2[c, page_number - 1] = _col2;
		col_3[c, page_number - 1] = _col3;
		col_4[c, page_number - 1] = _col4;
	}

}

/// @param first_char
/// @param last_char
function setTextFloat(_start, _end) {
	for(c = _start; c < _end; c++) 
	{
		//We do -1 so that you can float the previous text line | (Ex: line1 = "Stuff is floating", line2 = setTextFloat(1,10))
		float_text[c, page_number - 1] = true;
	}
}

/// @param first_char
/// @param last_char
function setTextShake(_start, _end) {
	for(c = _start; c < _end; c++) 
	{
		//We do -1 so that you can color the previous text line | (Ex: line1 = "Stuff is shaking", line2 = setTextShake(1,10))
		shake_text[c, page_number - 1] = true;
	}
}

#endregion

/// @param text
/// @param [character]
function createTextPage(_text, _character_text_information, _switch_speaker_side = false, _text_vertical_adjustment = 0, _textbox_option_sprite = noone, _hide_indicator = false) {
	setDefaultsForText();
	text[page_number] = _text;
	
	//Get character info
	if(argument_count > 1) 
	{
		//Speaker Info
		speaker_sprite[page_number] = getSpeakerSprite(_character_text_information);
		textbox_sprite[page_number] = getSpeakerTextbox(_character_text_information);
		speaker_sound[page_number] = getSpeakerSound(_character_text_information);
		speaker_side[page_number] = getSpeakerSide(_character_text_information);
		speaker_indicator[page_number] = true;
	}
	
	//Get side of the character that is speaking
	if(_switch_speaker_side) 
	{
		speaker_side[page_number] = -1;
	}
	
	if(_hide_indicator)
	{
		speaker_indicator[page_number] = false;
	}
	
	
	
	//Adjust Text Vertically by a specific amount
	text_vertical_adjustment[page_number] = _text_vertical_adjustment;
	
	//Override Textbox Option Sprite
	if(_textbox_option_sprite != noone) 
	{
		textbox_option_sprite[page_number] = _textbox_option_sprite;
	}
	
	page_number++;
}

/// @param text_id
function createTextbox(_text_id) {
	with(instance_create_depth(0, 0, -9999, obj_textbox)) 
	{
		gameText(_text_id);
	}
}

/// @param option
/// @param link_id
function createOption(_option, _link_id) {
	option[option_number] = _option;
	option_link_id[option_number] = _link_id;
	option_number++;
}