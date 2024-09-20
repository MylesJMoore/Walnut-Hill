/// @function drawBorderText
/// @param text_position_x
/// @param text_position_y
/// @param offset
/// @param font
/// @param text

function drawBorderText(text_position_x, text_position_y, offset, font, text) {
	draw_set_color(c_black);
	draw_text(text_position_x - offset, text_position_y, text);
	draw_text(text_position_x + offset, text_position_y, text);
	draw_text(text_position_x, text_position_y + offset, text);
	draw_text(text_position_x, text_position_y - offset, text);
	draw_set_color(c_white);
	draw_text(text_position_x, text_position_y, text);
}