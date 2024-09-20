#region Keyboard Support
//Keyboard Inputs
var up_key = keyboard_check_pressed(vk_up) || keyboard_check_pressed(ord("W"));
var down_key = keyboard_check_pressed(vk_down) || keyboard_check_pressed(ord("S"));

var confirm_key = keyboard_check_pressed(ord("Z")) or keyboard_check_pressed(vk_enter);
var cancel_key = keyboard_check_pressed(ord("X")) or keyboard_check_pressed(vk_shift);
#endregion

#region Controller Support
// Controller Support
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

//D-Pad Up
if(gamepad_button_check_pressed(0, gp_padu) > 0) {
	up_key = 1;
}

//D-Pad Down
if(gamepad_button_check_pressed(0, gp_padd) > 0) {
	down_key = 1;
}

//Check if "A" button is pressed on the controller for confirmation
if (gamepad_button_check_pressed(0, gp_face1))
{
    confirm_key = 1;
}

//Check if "B" button is pressed on the controller for  cancellation
if (gamepad_button_check_pressed(0, gp_face2))
{
    cancel_key = 1;
}
#endregion

#region Menu Logic
//Store Number of options in current menu
option_length = array_length(option[menu_level]);

//Move through the menu
position += down_key - up_key;

//If we moved to the very bottom, loop back to top
if(position >= option_length) {
	position = 0;
}

//If we moved to the very top, loop back to bottom
if(position < 0) {
	position = option_length - 1;
}

if(cancel_key) {
	room_goto_previous();
}

if(confirm_key) {
	//Save current menu level
	var _startMenuLevel = menu_level;
	
	switch(menu_level) {
		//Main Menu
		case 0: 
			switch(position) {
				//Start Game
				case 0: room_goto(rm_cave); break;
				
				//Load Game
				case 1: 
					loadGame(2);
					show_debug_message("GAME 2 IS LOADED!"); 
					break;
		
				//Settings
				case 2: menu_level = 1; break;
			
				//Sliders
				case 3: room_goto(rm_slider_bars); break;
			
				//Quit Game
				case 4: game_end(); break;
				
				//Dialogue Test
				case 5: room_goto(rm_debug_dialogue_system); break;
				
				//Battle Test
				case 6: room_goto(rm_battle_test); break;
			}
		break;
		
		//Settings Menu
		case 2: 
			switch(position) {
				//Window Size
				case 0:  break;
				
				//Window Color
				case 1:  break;
		
				//Brightness
				case 2:  break;
			
				//Controls
				case 3:  break;
			
				//Back
				case 4: menu_level = 0; break;
			}
		break;
	}
	
	//Reset Menu Position if we've gone to a different level
	if (_startMenuLevel != menu_level){
		position = 0;
	}
	
	//Correct Option Length
	option_length = array_length(option[menu_level]);
}
#endregion