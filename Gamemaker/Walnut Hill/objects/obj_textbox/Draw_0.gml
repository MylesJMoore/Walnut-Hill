#region Inputs
//Keyboard Input
var confirm_key = keyboard_check_pressed(ord("Z")) or keyboard_check_pressed(vk_enter) or keyboard_check_pressed(vk_space);
var up_key = keyboard_check_pressed(vk_up) || keyboard_check_pressed(ord("W"));
var down_key = keyboard_check_pressed(vk_down) || keyboard_check_pressed(ord("S"));

//Controller Input
//D-Pad Up
if(gamepad_button_check_pressed(0, gp_padu) > 0) {
	up_key = 1;
}

//D-Pad Down
if(gamepad_button_check_pressed(0, gp_padd) > 0) {
	down_key = 1;
}

//Joystick Support
var axis_y = gamepad_axis_value(0, gp_axislv);
if(axis_y < 0) {
	
	if(axis_y > -.5){
		controller_joystick_moved = false;
	}

	//We are moving down
	if(axis_y < controller_down_threshold && !controller_joystick_moved) {
		down_key = -1;
		controller_joystick_moved = true;
	}
} else {
	if(axis_y < .5){
		controller_joystick_moved = false;
	}
	
	//We are moving up
	if(axis_y > controller_up_threshold && !controller_joystick_moved) {
		down_key = 1;
		controller_joystick_moved = true;
	}
}

//Check if "A" button is pressed on the controller for confirmation
if (gamepad_button_check_pressed(0, gp_face1))
{
    confirm_key = 1;
}
#endregion

#region Textbox Setup Logic
//Textbox x and y values
/*
if(!global.textbox_x) {
	textbox_x = global.textbox_x_default;
} else {
	textbox_x = global.textbox_x;
}

if(!global.textbox_y) {
	textbox_y = global.textbox_y_default;
} else {
	textbox_y = global.textbox_y;
}*/

textbox_x = camera_get_view_x(view_camera[0]) + global.textbox_x_adjustment + global.dialogue_global_horizontal_adjustment;
textbox_y = camera_get_view_y(view_camera[0]) + global.textbox_y_adjustment + global.dialogue_global_vertical_adjustment;

//If we are in the Player Menu, offset the textbox
if(global.open_menu) 
{
	textbox_x = textbox_x + player_menu_textbox_horizontal_offset;
	textbox_y = textbox_y + player_menu_textbox_vertical_offset;
}

//If we are in the Player Menu, offset the textbox
if(global.open_soul) 
{
	textbox_x = textbox_x + player_menu_soul_textbox_horizontal_offset;
	textbox_y = textbox_y + player_menu_soul_textbox_vertical_offset;
}

//Setup
if(!setup) 
{
	setup = true;
	draw_set_font(global.font_main);
	draw_set_valign(fa_top);
	draw_set_halign(fa_left);
	
	//Loop through the pages
	page_number = array_length(text);
	for(var p = 0; p < page_number; p++) 
	{
		//Find how many characters are on each page
		text_length[p] = string_length(text[p]);
		
		//Get the x position for the textbox
		//Character on the left
		text_x_offset[p] = 80;
		portrait_x_offset[p] = 8;
		
		//Character on the right
		if(speaker_side[p] == -1) 
		{
			text_x_offset[p] = 8;
			portrait_x_offset[p] = 216;
		}
		
		//No Character (center on the screen)
		if(speaker_sprite[p] == noone) 
		{
			text_x_offset[p] = 44;
			dialogue_indicator_x = dialogue_indicator_x_right;
		}
		
		//Setting individual characters and find where the lines of text should break
		for(var c = 0; c < text_length[p]; c++) 
		{
			var _char_pos = c + 1;
			
			//Store individual characters in the "char" array
			char[c,p] = string_char_at(text[p], _char_pos);
			
			//Get current width of the line
			var _text_up_to_char = string_copy(text[p], 1, _char_pos);
			var _current_text_w = string_width(_text_up_to_char) - string_width(char[c,p]);
			
			//Get the last free space
			if(char[c,p] == " ") 
			{ 
				last_free_space = _char_pos + 1;
			}
			
			//Get the line breaks
			if(_current_text_w - line_break_offset[p] > line_width) 
			{
				line_break_pos[line_break_num[p], p] = last_free_space;
				line_break_num[p]++;
				var _txt_up_to_last_space = string_copy(text[p], 1, last_free_space);
				var _last_free_space_string = string_char_at(text[p], last_free_space);
				line_break_offset[p] = string_width(_txt_up_to_last_space) - string_width(_last_free_space_string);
			}
		}
		
		//Getting each characters coordinates
		for(var c = 0; c < text_length[p]; c++) 
		{
			var _char_pos = c + 1;
			var _txt_x = textbox_x + text_x_offset[p] + border;
			var _txt_y = textbox_y + border;
			//Get current width of the line
			var _text_up_to_char = string_copy(text[p], 1, _char_pos);
			var _current_txt_w = string_width(_text_up_to_char) - string_width(char[c,p]);
			var _txt_line = 0;
			
			//Compensate for string breaks
			for(var lb = 0; lb < line_break_num[p]; lb++)
			{
				//If the current looping character is after a line break
				if(_char_pos >= line_break_pos[lb,p])
				{
					var _str_copy = string_copy(text[p], line_break_pos[lb,p], _char_pos - line_break_pos[lb,p]);
					_current_txt_w = string_width(_str_copy);
					
					//Record the "line" this character should be on
					_txt_line = lb + 1; //+1 since lb starts at 0
				}
			}
			
			//Add to the x and y coordinates base on the new info
			char_x[c, p] = _txt_x + _current_txt_w
			char_y[c, p] = _txt_y + _txt_line * line_separation;
			
			//If Menu is open, then move up dialogue vertically a bit
			if(global.open_menu) 
			{
				char_y[c, p] = char_y[c, p] - player_menu_text_vertical_offset;
			}
		}
	}
}
#endregion

#region Typing
//Check the text pause timer FIRST!
if(text_pause_timer <= 0) {
	//Typing the text
	if (draw_character < text_length[page]) {
		draw_character += text_speed;
		draw_character = clamp(draw_character, 0, text_length[page]);
	
		//Check for punctuation pause
		var _check_char = string_char_at(text[page], draw_character);
		if(_check_char == "." || _check_char == "?" || _check_char == "!" || _check_char == ","|| _check_char == "|") 
		{
			text_pause_timer = text_pause_time;
			if((!audio_is_playing(speaker_sound[page])) && _check_char != "|")
			{
				audio_play_sound(speaker_sound[page], 8, false);
			}
		} else {
			//Typing Sound
			if(sound_count < sound_delay) 
			{
				sound_count++;
			} else {
				sound_count = 0;
				audio_play_sound(speaker_sound[page], 8, false);
			}
		}
	}
} else {
	//Subtract from the Timer
	text_pause_timer--;
}


#endregion

#region Flipping Through Pages
//Check if Typing is done
if(draw_character == text_length[page]) {
	global.dialogue_is_done_typing = true;
} else {
	if(instance_exists(obj_dialogue_indicator)) 
	{
		instance_destroy(obj_dialogue_indicator);
	}
} 


//Draw Inventory Indicator
if(global.dialogue_is_done_typing) {
	//Find out which side the speaker is on
	switch (speaker_side[page])
	{
	    case 1:
	        //Speaker is on the left
			dialogue_indicator_x = dialogue_indicator_x_left;
	    break;

	    case -1:
	        //Speaker is on the right
			dialogue_indicator_x = dialogue_indicator_x_right;
	    break;

	    default:
	        dialogue_indicator_x = dialogue_indicator_x_default;
	}
	
	if(speaker_indicator[page]) {
		instance_create_depth(textbox_x + dialogue_indicator_x, textbox_y + dialogue_indicator_y, -999999, obj_dialogue_indicator);
		obj_dialogue_indicator.image_xscale = .5;
		obj_dialogue_indicator.image_yscale = .5;
	}
}
	
	
//Flip through pages
if (confirm_key && !global.open_menu) {
	//If typing is done
	if(draw_character == text_length[page]) {
		//Go to Next Page
		if(page < page_number - 1) {
			page++;
			draw_character = 0;
			global.dialogue_is_done_typing = false;
		} else {
			//Link text for the options
			if (option_number > 0) {
				createTextbox(option_link_id[option_position]);
			}
			//Delete any dialogue indicators
			if(instance_exists(obj_dialogue_indicator)) 
			{
				instance_destroy(obj_dialogue_indicator);
			}
			
			//Typing is done, delete textbox
			instance_destroy();
		}
	} else {
	//We are not done typing
		draw_character = text_length[page];
	}
}
#endregion

#region Drawing Textbox

//Local Variables
var _txtb_x = textbox_x + text_x_offset[page];
var _txtb_y = textbox_y;

//Draw the textbox
textbox_image += textbox_image_speed;
textbox_sprite_width = sprite_get_width(textbox_sprite[page]);
textbox_sprite_height = sprite_get_height(textbox_sprite[page]);
textbox_option_sprite_width = (textbox_option_sprite[page] == noone) ? textbox_sprite_width : sprite_get_width(textbox_option_sprite[page]);
textbox_option_sprite_height = (textbox_option_sprite[page] == noone) ? textbox_sprite_height : sprite_get_height(textbox_option_sprite[page]);

//Draw the speaker
if(speaker_sprite[page] != noone) 
{
	sprite_index = speaker_sprite[page];
	//Stop Moving/Speaking if page is done typing
	if(draw_character = text_length[page]) 
	{
		image_index = 0;
	}
	
	var _speaker_x = textbox_x + portrait_x_offset[page];
	if(speaker_side[page] = -1) 
	{
		_speaker_x += sprite_width;
	}
	
	//Draw the Speaker
	draw_sprite_ext(textbox_sprite[page],textbox_image, textbox_x + portrait_x_offset[page],textbox_y, sprite_width/textbox_sprite_width, sprite_height/textbox_sprite_height,0, c_white, 1);
	draw_sprite_ext(sprite_index, image_index, _speaker_x, textbox_y, speaker_side[page],1,0,c_white,1);
}

//Back of the textbox
draw_sprite_ext(textbox_sprite[page], textbox_image, _txtb_x, _txtb_y, textbox_width/textbox_sprite_width, textbox_height/textbox_sprite_height, 0, c_white, 1);

//Option Logic
if (draw_character == text_length[page] && page == page_number - 1) 
{
	//Option Selection
	option_position += down_key - up_key;
	
	//Check for Option Looparound Flag
	if(option_looparound) {
		//If we moved to the very bottom, loop back to top
		if(option_position >= option_number) {
			option_position = 0;
		}

		//If we moved to the very top, loop back to bottom
		if(option_position < 0) {
			option_position = option_number - 1;
		}
	} else {
		option_position = clamp(option_position, 0, option_number - 1);
	}
	
	//Option Variables
	var _option_space = 21; //15
	var _option_border = 4; //4
	var _option_buffer = 16; //16
	var _option_text_buffer = 2; //2
	for(var op = 0; op < option_number; op++) 
	{
		//Draw the Option Box
		var _option_width = string_width(option[op]) + _option_border * 2;
		var _textbox_option_sprite = (textbox_option_sprite[page] == noone) ? textbox_sprite[page] : textbox_option_sprite[page];
		//var _textbox_option_sprite = spr_textbox;
		draw_sprite_ext(_textbox_option_sprite, textbox_image, _txtb_x + _option_buffer, _txtb_y - _option_space * option_number + _option_space * op, _option_width/textbox_option_sprite_width, (_option_space - 1)/textbox_option_sprite_height, 0, c_white, 1);

		//Draw the Option Indicator
		if (option_position == op) {
			//We are on the selected option, draw the indicator
			draw_sprite(spr_textbox_indicator, 0, _txtb_x, _txtb_y - _option_space * option_number + _option_space * op);
		}

		//Draw the Option Text
		draw_text(_txtb_x + _option_buffer + _option_border, _txtb_y - _option_space * option_number + _option_space * op + _option_text_buffer, option[op]);
	}
}

#endregion

#region Drawing Text
//Draw the text 2.0
for(var c = 0; c < draw_character; c++)
{
	//Floating Text
	var _float_y = 0;
	if(float_text[c,page] == true) 
	{
		float_dir[c,page] += float_amount;
		_float_y = dsin(float_dir[c,page]) * float_multiplier;
	}
	
	//Shake Text
	var _shake_x = 0;
	var _shake_y = 0;
	if(shake_text[c,page] == true) 
	{
		shake_timer[c,page]--;
		if(shake_timer[c,page] <= 0)
		{
			shake_timer[c,page] = irandom_range(4,8);
			shake_dir[c,page] = irandom(360);
		}
		
		//Shake on last two frames
		if(shake_timer[c,page] <= shake_frames)
		{
			_shake_x = lengthdir_x(1,shake_dir[c,page]);
			_shake_y = lengthdir_y(1,shake_dir[c,page]);
		}
		
		//_shake_x = lengthdir_x(1,shake_dir[c,page]);
		//_shake_y = lengthdir_y(1,shake_dir[c,page]);
	}
	
	//Draw Text with color, floating, shaking
	//Check for text pause character then replace with a blank
	if(char[c,page] == "|") {
		char[c,page] = "";
	}
	draw_text_color(char_x[c,page] + _shake_x, char_y[c,page] + _float_y + _shake_y + text_vertical_adjustment[page], char[c,page],col_1[c,page],col_2[c,page],col_3[c,page],col_4[c,page],1);
}

#endregion


