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

	
//Movement Calculations
var xspeed = (right_key - left_key) * global.soul_speed;
var yspeed = (down_key - up_key) * global.soul_speed;
x += xspeed;
y += yspeed;

if (global.player_invisible_frames > 0) {
	global.player_invisible_frames -= 1;
	if(global.player_invisible_frames == 30) {
		image_index = 0;
	}
	//image_speed = 1;
} else {
	image_speed = 0;
	image_index = 0;
}