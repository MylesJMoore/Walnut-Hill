// Monster Soul Movement (If Enemy is Alive)
if(global.monster[0].MyHP > 0) {
	
	if (global.enemy_invisible_frames > 0) {
		global.enemy_invisible_frames -= 1;
		if(global.enemy_invisible_frames == 30) {
			image_index = 0;
			global.monster[0].image_index = 0;
		}
	} else {
		image_speed = 0;
		image_index = 0;
		global.monster[0].image_index = 0;
		global.monster[0].image_speed = 0;
	}
	
	// Midpoint and amplitude for the X oscillation
	var x_midpoint = 315;         // (255 + 375) / 2 = 315
	var x_amplitude = 60;         // Half the range of oscillation (120 / 2 = 60)

	// Variables to control the oscillation
	var scale_amplitude = 0.05;   // For scale oscillation
	var rotate_amplitude = 5;     // For rotation oscillation
	var y_amplitude = 0.001;      // For Y position oscillation
	var _speed = 0.002;           // The speed of the oscillation

	// Apply sine wave to the scale
	image_xscale = 1.5 + scale_amplitude * cos(current_time * _speed);
	image_yscale = 1.5 + scale_amplitude * sin(current_time * _speed);

	// Apply sine wave to the Y position for vertical oscillation
	y += y_amplitude * sin(current_time * _speed * 2);

	// Apply sine wave to the X position for horizontal oscillation
	// Adjust x to oscillate between 255 and 375
	x = x_midpoint + x_amplitude * sin(current_time * _speed);
} else {
	//Hide soul when Monster Dies
	//image_alpha = 0;
}