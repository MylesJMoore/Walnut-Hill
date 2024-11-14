switch(Event) {
	case 0:
		show_debug_message("Cutscene has started");
		global.in_cutscene = true;
		Event = .5;
    case 1:
        // Initialize camera movement parameters
        oCutsceneCamera.distance_to_stop_camera = 200;
        oCutsceneCamera.time_to_delay_camera = 0;
        oCutsceneCamera.camera_movement_delay = oCutsceneCamera.time_to_delay_camera;
        camera_movement_increment = 3;
        Event = 2;
        break;

    case 2:
        if (oCutsceneCamera.camera_movement_delay <= 0) {
            var new_x = oCutsceneCamera.x + camera_movement_increment;
            var new_distance = oCutsceneCamera.current_camera_distance + camera_movement_increment;
            
            // Check if the new distance exceeds the stop distance
            if (new_distance >= oCutsceneCamera.distance_to_stop_camera) {
                // Adjust to exact stop position
                new_x = oCutsceneCamera.x + (oCutsceneCamera.distance_to_stop_camera - oCutsceneCamera.current_camera_distance);
                new_distance = oCutsceneCamera.distance_to_stop_camera;
                camera_movement_increment = 0; // Stop further movement
                Event = 3; // Proceed to the next event
            }
            
            // Update camera position and distance
            oCutsceneCamera.x = new_x;
            oCutsceneCamera.current_camera_distance = new_distance;
            oCutsceneCamera.camera_movement_delay = oCutsceneCamera.time_to_delay_camera;
        } else {
            oCutsceneCamera.camera_movement_delay -= 1;
        }
        break;
    case 3:
		if (!global.textbox_is_open) {
			//Set Custom Textbox Size Values for this cutscene
			global.textbox_is_open = true;
			global.textbox_x_adjustment = 0;
			global.textbox_y_adjustment = 124;
			global.textbox_width = 170;
			global.textbox_height = 60;
			createTextbox("npc 4");
	        Event = 4;
		}
        break;

    case 4:
        if(!instance_exists(obj_textbox)) {
			ResetTextboxGlobals();
			Event = 5;
		}
        break;
	case 5:
		//Make Follower Walk Forward
		obj_follower1.x = obj_follower1.x + 4;
		global.follower1_cutscene_face = RIGHT;
		npc_steps++;
		
		if(npc_steps >= 10) {
			Event = 6;
		}
	    break;
	case 6:
		oCutsceneCamera.x = obj_player.x;
		oCutsceneCamera.y = obj_player.y;
		camera_set_view_target(view_camera[0], obj_player);
		global.player_can_move = true;
		show_debug_message("Cutscene has ended");
		global.in_cutscene = false;
		Event = 7;
        break;
}
