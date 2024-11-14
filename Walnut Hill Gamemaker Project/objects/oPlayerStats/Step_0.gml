if(global.open_stats) {
	#region Keyboard Support
	//Keyboard Inputs
	var confirm_key = keyboard_check_pressed(ord("Z")) or keyboard_check_pressed(vk_enter);
	var cancel_key = keyboard_check_pressed(ord("X")) or keyboard_check_pressed(vk_shift);
	#endregion

	#region Controller Support
	// Controller Support
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
	if(cancel_key) {
		TurnOffStatsMenu();
	}
	#endregion
}

