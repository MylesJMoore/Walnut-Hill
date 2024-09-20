//Keyboard Support
var confirm_key = keyboard_check_pressed(ord("Z")) or keyboard_check_pressed(vk_enter);

//Controller Support
//Check if "A" button is pressed on the controller for confirmation
if (gamepad_button_check_pressed(0, gp_face1))
{
    confirm_key = 1;
}

if ((position_meeting(mouse_x, mouse_y, id) && mouse_check_button_pressed(mb_left)) || (place_meeting(x, y, obj_player) && confirm_key == 1 && !global.textbox_is_open)) 
{
	global.player_can_move = false;
	global.textbox_is_open = true;
	global.speakblock_x = x;
	global.speakblock_y = y;
	global.emote_x_buffer = emote_x;
	global.emote_y_buffer = emote_y;
	createTextbox(text_id);
}

if(place_meeting(x, y, obj_player) && !instance_exists(obj_textbox) && confirm_key == 0) {
	global.textbox_is_open = false;
	global.player_can_move = true;
	removeAllEmotes();
}