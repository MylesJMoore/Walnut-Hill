if(global.open_soul_selection) {
	//Get the camera view coordinates
	var view_x = camera_get_view_x(view_camera[0]);
	var view_y = camera_get_view_y(view_camera[0]);

	//Get Player Menu Coordinates
	var player_menu_x = screen_border + view_x;
	var player_menu_y = screen_border + sep + view_y;
	
	// Positioning variables for text and arrows
	var player_name_text_x = player_menu_x + player_info_name_text_horizontal_buffer;
	var player_name_text_y = player_menu_y + player_info_name_text_vertical_buffer;
	var _soul_name = getSoulName(global.soul_selected);
	var _soul_name_offset = getSoulNameOffset(_soul_name);
	
	var text_width = string_width(_soul_name);  // Width of the soul name

	// Adjust the arrows and their positions
	var left_arrow_x = player_name_text_x + 0 + global.arrow_left_offset;  // Apply left arrow offset
	//var right_arrow_x = player_name_text_x + 30 + text_width + global.arrow_right_offset;  // Adjust for string width and right arrow offset
	var right_arrow_x = player_name_text_x + 120 + global.arrow_right_offset;
	
	//Adjust Soul Name Position
	var soul_name_x = player_name_text_x + 30;
	var soul_name_y = player_name_text_y + 50;
	
	// Position for the soul description
    var soul_description_x = left_arrow_x - global.arrow_left_offset;      // Align it with the left Arrow
    var soul_description_y = soul_name_y + 30;  // Place it below the soul name

    // Get the description of the soul combination
    var _soul_description = getSoulDescription(global.soul_selected);  // A function that returns the soul description text

	// Get the text color for the description of the soul combination
    var _soul_description_color = getSoulDescriptionColor(global.soul_selected);  // A function that returns the soul description text
	
	//Adjust Soul Selection Sprite
	var soul_sprite_x = player_menu_x + 145;
	var soul_sprite_y = player_menu_y + 25;
	
	//Draw Textbox
	draw_sprite_ext(spr_player_stats_textbox, 0, player_menu_x + player_stats_horizontal_buffer, player_menu_y + player_stats_vertical_buffer, player_stats_box_width, player_stats_box_height, 0, c_white, 1);
	
	// Draw the arrows with dynamic color
	draw_text_ext_transformed_colour(left_arrow_x, player_name_text_y + 50, "<-", 20, 200, 1, 1, 0, global.arrow_left_color, global.arrow_left_color, global.arrow_left_color, global.arrow_left_color, 1);
	draw_text_ext_transformed_colour(right_arrow_x, player_name_text_y + 50, " ->", 20, 200, 1, 1, 0, global.arrow_right_color, global.arrow_right_color, global.arrow_right_color, global.arrow_right_color, 1);

	// Draw the soul name
	draw_text_ext_transformed_colour(soul_name_x + _soul_name_offset, soul_name_y, _soul_name, 20, 200, 1, 1, 0, c_white, c_white, c_white, c_white, 1);

	// Draw the soul description
	if(global.soul_selected != 0) {
		draw_text_ext_transformed_colour(soul_description_x, soul_description_y, _soul_description, 15, 300, .5, .5, 0, _soul_description_color, _soul_description_color, _soul_description_color, _soul_description_color, 1);
	} else {
		draw_text_ext_transformed_colour(soul_description_x, soul_description_y, _soul_description, 15, 300, 1, 1, 0, _soul_description_color, _soul_description_color, _soul_description_color, _soul_description_color, 1);
	}
	// Draw Soul Selection Sprite
	draw_sprite_ext(spr_soul_selection_left, 0, soul_sprite_x, soul_sprite_y, 3, 3, 0, c_white, 1);
	draw_sprite_ext(spr_soul_selection_right, global.soul_selected, soul_sprite_x, soul_sprite_y, 3, 3, 0, c_white, 1);
	
	
}
