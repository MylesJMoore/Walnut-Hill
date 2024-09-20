//Get the camera view coordinates
var view_x = camera_get_view_x(view_camera[0]);
var view_y = camera_get_view_y(view_camera[0]);
//Draw Textbox
var player_menu_x = screen_border + view_x;
var player_menu_y = screen_border + sep + view_y;

if(global.open_menu) {
	#region Menu Player Info
		//Menu Option List
		draw_sprite_ext(spr_player_menu_textbox, 0, player_menu_x + player_info_horizontal_buffer, player_menu_y + player_info_vertical_buffer, player_info_box_width, player_info_box_height, 0, c_white, 1);
	
		//Draw Menu Option Text
		draw_set_font(global.menu_player_name_font);
		draw_set_valign(fa_top);
		draw_set_halign(fa_left);
		
		//Draw Player Name
		var player_name_text_x = player_menu_x + player_info_name_text_horizontal_buffer;
		var player_name_text_y = player_menu_y + player_info_name_text_vertical_buffer;
		draw_text_color(player_name_text_x, player_name_text_y, string(global.player_name),c_white, c_white, c_white, c_white, 1);
		
		//Draw Player Stats
		draw_set_font(global.menu_player_info_font);
		var player_stats_text_x = player_menu_x + player_info_stats_text_horizontal_buffer;
		var player_stats_text_y = player_menu_y + player_info_stats_text_vertical_buffer;
		draw_text_color(player_stats_text_x, player_stats_text_y + player_stats_border + player_stats_space * 2, "LV   " + string(global.player_level),c_white, c_white, c_white, c_white, 1);
		draw_text_color(player_stats_text_x, player_stats_text_y + player_stats_border + player_stats_space * 3, "HP   " + string(global.player_hp) + "/" + string(global.player_max_hp),c_white, c_white, c_white, c_white, 1);
		draw_text_color(player_stats_text_x, player_stats_text_y + player_stats_border + player_stats_space * 4, "G    " + string(global.player_gold),c_white, c_white, c_white, c_white, 1);
	#endregion
	
	#region Menu Options
		//Menu Option Textbox
		draw_sprite_ext(spr_player_menu_textbox, 0, player_menu_x + menu_option_horizontal_buffer, player_menu_y + menu_option_vertical_buffer, menu_option_box_width, menu_option_box_height, 0, c_white, 1);
	
		//Draw Menu Option Text
		draw_set_font(global.menu_option_font);
		draw_set_valign(fa_top);
		draw_set_halign(fa_left);
		
		//Draw Text for Menu Options
		for(var i = 0; i < option_length; i++) 
		{
			var _color = c_white;
	
			//If we are on that option then set the color to yellow
			if(position == i) 
			{
				_color = c_yellow;
			}
	
			//Draw text
			var text_x = player_menu_x + menu_text_horizontal_buffer;
			var text_y = player_menu_y + menu_text_vertical_buffer;
			draw_text_color(text_x, text_y + option_border + option_space * i, option[menu_level, i],_color, _color, _color, _color, 1);
		}
	#endregion
	
	#region Random Messages "SOUL" Text
		if(global.show_words_of_wisdom) 
		{
			createTextbox("words of wisdom");
			global.show_words_of_wisdom = false;
		}
	#endregion
	

}
