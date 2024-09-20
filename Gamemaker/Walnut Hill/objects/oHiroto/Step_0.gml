// NPC variables
var move_speed = .5; // Adjust as needed
var movement_area = room_width; // Adjust as needed
var move_timer = 60; // Time between choosing new target (in steps)
var move_timer_counter = move_timer;
var pause_timer = 0; // Timer to track the pause duration
var pause_duration = 3 * room_speed; // Pause duration in steps (adjust as needed)
depth = -bbox_bottom;

if(!global.open_menu && !global.player_triggered_battle) {
	//image_speed = 1;
	// Step event
	if (!is_moving && touched_player) {
	    if (pause_timer_count <= 0) {
	        // Resume movement if pause duration is over
	        is_moving = true;
			touched_player = false;
	    } else {
	        // Decrement pause timer
	        pause_timer_count--;
	    }
	} else {
	    // Move towards target
	    var dist = point_distance(x, y, target_x, target_y);
	    if (dist > 1) {
	        var move_amount = move_speed / dist;
        
	        // Check for collisions with the player
	        if (place_meeting(x, y, obj_player)) {
	            // Stop moving and start pause timer
				pause_timer_count = pause_duration;
	            is_moving = false;
				touched_player = true;
				face = IDLEDOWN;
				sprite_index = sprite[face];
	        } else {
	            // Check for collisions with walls
				var xSpeed = (target_x - x) * move_amount;
				var ySpeed = (target_y - y) * move_amount;
	            var new_x = x + xSpeed;
	            var new_y = y + ySpeed;
            
	            if (!place_meeting(new_x, new_y, obj_wall)) {
				
					if(xSpeed > ySpeed) {
						face = RIGHT;
					} else {
						face = LEFT;
					}
				
					sprite_index = sprite[face];
	                x = new_x;
	                y = new_y;
	            } else {
	                // Choose new target position
	                target_x = random_range(0, room_width);
	                target_y = random_range(0, room_height);
	            }
	        }
	    } else {
	        // Choose new target position
	        target_x = random_range(0, room_width);
	        target_y = random_range(0, room_height);
	    }
	}
} else {
	pause_timer_count = 3;
	is_moving = false;
	touched_player = true;
	face = IDLEDOWN;
	sprite_index = sprite[face];
}

