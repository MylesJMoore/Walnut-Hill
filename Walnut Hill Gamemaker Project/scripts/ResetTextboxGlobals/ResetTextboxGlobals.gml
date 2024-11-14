/// @desc ResetTextboxGlobals()
// Resets the textbox globals to their defaults
function ResetTextboxGlobals() {
	global.textbox_is_open = false;
	global.textbox_x_adjustment = global.default_textbox_x_adjustment;
	global.textbox_y_adjustment = global.default_textbox_y_adjustment;
	global.textbox_width = global.default_textbox_width;
	global.textbox_height = global.default_textbox_height;
}