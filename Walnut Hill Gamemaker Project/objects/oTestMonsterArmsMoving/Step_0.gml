if (instance_exists(Dialogue)) {
	ReadyForBattle = true;
} else {
	if (ReadyForBattle) {
		ReadyForBattle = false;
		alarm[0] = 1;
	}
}

// Variables to control the oscillation
var scale_amplitude = 0.05;  // For scale oscillation
var rotate_amplitude = 5;   // For rotation oscillation
var y_amplitude = .001;        // For Y position oscillation
var _speed = 0.002;           // The speed of the oscillation (shared by all)

// Apply sine wave to the scale
image_xscale = 1.5 + scale_amplitude * cos(current_time * _speed);
image_yscale = 1.5 + scale_amplitude * sin(current_time * _speed);

// Apply sine wave to the rotation
//image_angle = rotate_amplitude * sin(current_time * 0.0005);

// Apply sine wave to the Y position
//y = y + y_amplitude * sin(current_time * _speed);
