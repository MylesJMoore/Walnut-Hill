if (place_meeting(x,y,obj_player) && (keyboard_check_pressed(vk_enter) || keyboard_check_pressed(ord("Z")) 
|| gamepad_button_check(0, gp_face1))) {
	//Play Sound effect TEMPORARILY
	oSFX.pickupSound = true;
	saveRoom();
}

//TEMPORARY WAY OF SAVING AND LOADING THE GAME NOT IN A MENU
if (keyboard_check_pressed(ord("1"))) {
	saveGame(0);
	show_debug_message("GAME 0 IS SAVED!");
}

if (keyboard_check_pressed(ord("2"))) {
	saveGame(1);
	show_debug_message("GAME 1 IS SAVED!");
}

if (keyboard_check_pressed(ord("3"))) {
	saveGame(2);
	show_debug_message("GAME 2 IS SAVED!");
}

if (keyboard_check_pressed(ord("4"))) {
	loadGame(0);
	show_debug_message("GAME 0 IS LOADED!");
}

if (keyboard_check_pressed(ord("5"))) {
	loadGame(1);
	show_debug_message("GAME 1 IS LOADED!");
}

if (keyboard_check_pressed(ord("6"))) {
	loadGame(2);
	show_debug_message("GAME 2 IS LOADED!");
}