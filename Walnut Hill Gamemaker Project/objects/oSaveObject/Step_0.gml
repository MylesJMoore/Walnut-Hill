if (place_meeting(x,y,obj_player) && (keyboard_check_pressed(vk_enter) || keyboard_check_pressed(ord("Z")) 
|| gamepad_button_check(0, gp_face1))) {
	//Play Sound effect TEMPORARILY
	oSFX.pickupSound = true;
	saveRoom();
}