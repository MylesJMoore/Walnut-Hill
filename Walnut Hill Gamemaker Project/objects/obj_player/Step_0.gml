if (global.player_can_move) {
	#region Player Movement

	// Movement Keys
	var right_key = keyboard_check(vk_right) || keyboard_check(ord("D"));
	var left_key = keyboard_check(vk_left) || keyboard_check(ord("A"));
	var up_key = keyboard_check(vk_up) || keyboard_check(ord("W"));
	var down_key = keyboard_check(vk_down) || keyboard_check(ord("S"));

	// Controller Support for Player Movement
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
	        up_key = round(max(-normalized_y, 0));
	        down_key = round(max(normalized_y, 0));
	    }
	}


	// Player Running
	if(keyboard_check(vk_shift) || (gamepad_button_check(0, gp_face2))) {
	    move_speed = RUNSPEED;
	} else {
	    move_speed = WALKSPEED;
	}

	// Movement Calculations
	xspeed = (right_key - left_key) * move_speed;
	yspeed = (down_key - up_key) * move_speed;

	#endregion

	#region Pause Player
	//Pause Player
	if (instance_exists(oPauser)) {
		xspeed = 0;
		yspeed = 0;
	}
	#endregion
	
	#region Random Encounters
	
	//Check if Player is moving
	if(xspeed != 0 || yspeed != 0) {
		global.player_step_count++;
	}
	
	//If we hit a step count based on our random encounter index then start a battle
	if(global.player_step_count == global.random_encounter[global.random_encounter_index]) {
		global.player_step_count = 0;
		global.random_encounter_index = irandom_range(0,2);
		if (global.allow_random_encounters) {
			global.player_triggered_battle = true;
			var inst = instance_create_depth(x - 5, y + 5, -99999, oSoulFlash);
		}
	}
	
	#endregion
	
	#region Open Inventory Menu - Controller
	//Check if "Y" button is pressed on the controller for confirmation
	if (gamepad_button_check_pressed(0, gp_face4))
	{
	    //TurnOnInventoryMenu();
	}
	#endregion
	
	#region Open Inventory Menu - Controller
	//Check if "Start" button is pressed on the controller for confirmation
	if (!global.player_triggered_battle && gamepad_button_check_pressed(0, gp_start))
	{
	    TurnOnPlayerMenu();
	}
	#endregion

	#region Player Collision
	//Collision from right to left
	if(place_meeting(x + xspeed, y, obj_wall))
	{
		xspeed = 0;
	}

	//Collision from down to up
	if(place_meeting(x, y + yspeed, obj_wall))
	{
		yspeed = 0;
	}
	#endregion

	#region Player Animation

	//Calculate Player Direction based on speed
	mask_index = sprite[DOWN];

	if(yspeed == 0) {
		if(xspeed > 0) {
			face = RIGHT;
		} 

		if(xspeed < 0) {
			face = LEFT;
		} 
	}

	//Direction horizontal swapping when going diagonal in opposite direction
	if(xspeed > 0 && face == LEFT) {
		face = RIGHT;
	} else if(xspeed > 0 && face != LEFT) {
		face = RIGHT;
	}

	if(xspeed < 0 && face == RIGHT) {
		face = LEFT;
	} else if(xspeed < 0 && face != RIGHT) {

	}

	if(xspeed == 0) {
		if(yspeed > 0) {
			face = DOWN;
		} 

		if(yspeed < 0) {
			face = UP;
		}
	}

	//Direction vertical swapping when going diagonal in opposite direction
	if(yspeed > 0 && face == UP) {
		face = DOWN;
	} else if(yspeed > 0 && face != UP) {
		//8 Directional Vertical Swap Check
		face = DOWN
	}

	if(yspeed < 0 && face == DOWN) {
		face = UP;
	} else if(yspeed < 0 && face != DOWN) {
		//8 Directional Vertical Swap Check
		face = UP;
	}

	if(xspeed == 0 and yspeed == 0) {
		switch (face)
		{
			case UP:
			    face = IDLEUP;
			break;

			case DOWN:
			    face = IDLEDOWN;
			break;
    
			case LEFT:
			    face = IDLELEFT;
			break;
		
			case RIGHT:
			    face = IDLERIGHT;
			break;
		}
	}

	//Set Player Sprite
	if(global.player_left_battle) {
		face = global.player_previous_sprite_face;
		global.player_left_battle = false;
	}
	sprite_index = sprite[face];
	current_direction = sprite_information[face];
	
	//Store Player Face Position
	switch (face)
	{
		case UP:
			global.player_face_direction = "Up";
		break;

		case DOWN:
			global.player_face_direction = "Down";
		break;
    
		case LEFT:
			global.player_face_direction = "Left";
		break;
		
		case RIGHT:
			global.player_face_direction = "Right";
		break;
	}

	#endregion

	#region Player Physics

	//Move Player
	x += xspeed;
	y += yspeed;
	
	//Set Player Depth
	depth = -bbox_bottom;

	#endregion
	
	#region Player Follower Creation
	//Set Player Moved Flag
	if (right_key > 0 || left_key > 0 || up_key > 0 || down_key > 0) && (global.player_has_moved == false) {
		//Follower Creation
		var follower_1 = instance_create_layer(x, y, "Player", obj_follower1);
		follower_1.recordPosition = 12;

		var follower_2 = instance_create_layer(x, y, "Player", obj_follower2);
		follower_2.recordPosition = 26;

		//var follower_3 = instance_create_layer(x, y, "Player", obj_follower3);
		//follower_3.recordPosition = 36;
	
		for (var i = recordedPositions -1; i >= 0; i--) {
			pos_x[i] = x;
			pos_y[i] = y;
			pos_face[i] = face;
		}
	
		global.player_has_moved = true;
	}
	#endregion

	#region Player Follower Logic
	//Update Player Recording for NPC Follow
	if (x != xprevious or y != yprevious) {
		for (var i = recordedPositions -1; i >= 1; i--) {
			pos_x[i] = pos_x[i-1];
			pos_y[i] = pos_y[i-1];
			pos_face[i] = pos_face[i-1];
		}
	
		pos_x[0] = x;
		pos_y[0] = y;
		pos_face[0] = face;
	}
	#endregion

	#region Player Duplicate Object Cleanup
	
	if (instance_number(obj_player) > 1) {
		instance_destroy();
	}
	
	#endregion
}
