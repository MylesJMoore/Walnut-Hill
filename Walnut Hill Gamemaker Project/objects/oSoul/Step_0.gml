// Movement Keys
var right_key = keyboard_check(ord("D"));
var left_key = keyboard_check(ord("A"));
var up_key = keyboard_check(ord("W"));
var down_key = keyboard_check(ord("S"));
var shoot_right_key = keyboard_check(vk_right);
var shoot_left_key = keyboard_check(vk_left);
var shoot_up_key = keyboard_check(vk_up);
var shoot_key = keyboard_check_pressed(vk_space);

// Controller - Check if "A" button is pressed on the controller for confirmation
if (gamepad_button_check_pressed(0, gp_face2))
{
	shoot_key = 1;
}

// Controller Support for Player Movement
var axis_x = gamepad_axis_value(0, gp_axislh);
var axis_y = gamepad_axis_value(0, gp_axislv);
var shoot_axis_x = gamepad_axis_value(0, gp_axisrh);
var shoot_axis_y = gamepad_axis_value(0, gp_axisrv);

// Controller Left Stick Calibration
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

// Controller Right Stick Calibration
if (abs(shoot_axis_x) > 0.2 || abs(shoot_axis_y) > 0.2)
{
	var shoot_magnitude = point_distance(0, 0, shoot_axis_x, shoot_axis_y);
	var shoot_normalized_x = shoot_axis_x / shoot_magnitude;
	var shoot_normalized_y = shoot_axis_y / shoot_magnitude;
    
	// Adjust the deadzone and ensure the input is still valid
	if (shoot_magnitude > 0.8)
	{
	    shoot_left_key = round(max(-shoot_normalized_x, 0));
	    shoot_right_key = round(max(shoot_normalized_x, 0));
	    shoot_up_key = round(max(-shoot_normalized_y, 0));
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
		oSoul.sprite_index = spr_battle_soul;
		image_index = global.soul_selected;
	}
} else {
	oSoul.sprite_index = spr_battle_soul;
	image_index = global.soul_selected;
}

if (global.soulCanShoot) {
	//Change Shoot Directionssw
	if(shoot_right_key) {
		last_shoot_direction = 0;
		image_direction = right;
	}
		
	if(shoot_left_key) {
		last_shoot_direction = 180;
		image_direction = left;
	}
	
	if(shoot_up_key) {
		last_shoot_direction = 90;
		image_direction = up;
	}
		
    // If the player presses the shoot key (e.g., Spacebar)
    if (shoot_key) {
        // Create a bullet instance
        var bullet = instance_create_layer(x, y, "Bullets", oSoulBullet);
	
        // Set the bullet's direction and speed for vertical movement
        bullet.direction = last_shoot_direction;  // 90 for downward movement
        bullet.speed = 10;      // Adjust speed as desired
        
		
		
        // Optional: Play shooting sound effect
        // audio_play_sound(shoot_sound, 1, false);
    }
	image_angle = image_direction;
}