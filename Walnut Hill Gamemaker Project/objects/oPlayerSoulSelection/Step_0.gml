// Add this at the top of the event or script to manage delays
if (!variable_global_exists("soul_selection_cooldown")) global.soul_selection_cooldown = 0;

// Ensure the cooldown timer is always counting down
if (global.soul_selection_cooldown > 0) {
    global.soul_selection_cooldown--;
}

if(global.open_soul_selection) {
	#region Keyboard Support
	//Keyboard Inputs
	var confirm_key = keyboard_check_pressed(ord("Z")) or keyboard_check_pressed(vk_enter);
	var cancel_key = keyboard_check_pressed(ord("X")) or keyboard_check_pressed(vk_shift);
	var right_key = keyboard_check(ord("D"));
	var left_key = keyboard_check(ord("A"));
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
	
	// Controller Left Stick Calibration
	var axis_x = gamepad_axis_value(0, gp_axislh);
	var axis_y = gamepad_axis_value(0, gp_axislv);
	if (abs(axis_x) > 0.2 || abs(axis_y) > 0.2)
	{
		var magnitude = point_distance(0, 0, axis_x, axis_y);
		var normalized_x = axis_x / magnitude;
		var normalized_y = axis_y / magnitude;
    
		// Adjust the deadzone and ensure the input is still valid
		if (magnitude > 0.2)
		{
		    left_key = round(max(-normalized_x, 0));
		    right_key = round(max(normalized_x, 0));
		}
	}
	#endregion

	#region Menu Logic
	if(cancel_key) {
		TurnOffSoulSelectionMenu();
	}
	#endregion
	
	#region Arrow Movement and Color Logic
	if (global.soul_selection_cooldown == 0) {
        // Handle left key input
        if (left_key && global.soul_selected > 0) {
            global.soul_selected--;
            global.arrow_left_offset = -5;  // Move the left arrow slightly left
            global.arrow_left_color = c_white;  // Change arrow color to yellow
            global.arrow_right_color = c_white;  // Reset right arrow color
            global.soul_selection_cooldown = 20;  // Add a short cooldown (10 frames)
        }

        // Handle right key input
        else if (right_key && global.soul_selected < array_length(global.soul_lookup) - 1) {
            global.soul_selected++;
            global.arrow_right_offset = 5;  // Move the right arrow slightly right
            global.arrow_right_color = c_white;  // Change arrow color to yellow
            global.arrow_left_color = c_white;  // Reset left arrow color
            global.soul_selection_cooldown = 20;  // Add a short cooldown (10 frames)
        }
    }

    // Reset arrow offsets when no key is pressed
    if (!left_key && !right_key) {
        global.arrow_left_offset = 0;
        global.arrow_right_offset = 0;
        global.arrow_left_color = c_white;
        global.arrow_right_color = c_white;
    }
	
	#endregion
}

