if(global.show_debug) {
	// Draw the text at a specified position (e.g., top-left corner)
	
	#region Coins Picked Up
	// Set Variables
	var text_position_x = 10;
	var text_position_y = 10;
	var offset = 1;
	var text = string(global.coins) + " coins picked up";

	//Draw Text with border
	drawBorderText(text_position_x,text_position_y,offset,fUndertale,text);
	#endregion

	#region Sample Health/Magic/Score Text
	/*
	draw_set_halign(fa_left);
	draw_text(100, 32, "Score: " + string(score));
	draw_set_halign(fa_center);
	draw_text(room_width - 100, 32, "Health: " + string(health));
	draw_set_halign(fa_right);
	draw_text(room_width - 200, 32, "Magic: " + string(health));
	*/
	#endregion
}
