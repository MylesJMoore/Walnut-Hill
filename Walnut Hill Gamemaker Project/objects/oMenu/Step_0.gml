#region Option Menu
if (room == rm_slider_bars) {
	//Keyboard Inputs
	//Check if cancel keys are pressed
	var cancel_key = keyboard_check_pressed(ord("X")) or keyboard_check_pressed(vk_shift);

	// Controller Support
	//Check if "B" button is pressed on the controller for cancellation
	if (gamepad_button_check_pressed(0, gp_face2))
	{
	    cancel_key = 1;
	}

	if(cancel_key) {
		room_goto(rm_title_menu);
	}
}

#endregion

