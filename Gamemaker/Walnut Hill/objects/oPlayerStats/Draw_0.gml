//Get the camera view coordinates
var view_x = camera_get_view_x(view_camera[0]);
var view_y = camera_get_view_y(view_camera[0]);
//Draw Textbox
var player_menu_x = screen_border + view_x;
var player_menu_y = screen_border + sep + view_y;

if(global.open_stats) {
		//Draw Textbox
		draw_sprite_ext(spr_player_stats_textbox, 0, player_menu_x + player_stats_horizontal_buffer, player_menu_y + player_stats_vertical_buffer, player_stats_box_width, player_stats_box_height, 0, c_white, 1);
	
		//Set Text Variables
		draw_set_font(global.menu_player_name_font);
		draw_set_valign(fa_top);
		draw_set_halign(fa_left);
		draw_set_color(c_white);
		var _name = string("\"" + global.player_name + "\"");
		var _level = string(global.player_level);
		var _hp = string(global.player_hp) + "/" + string(global.player_max_hp);
		var _attack = string(global.player_attack);
		var _defense = string(global.player_defense);
		var _weapon = global.player_weapon;
		var _armor = global.player_armor;
		
		//Draw Text
		var player_name_text_x = player_menu_x + player_info_name_text_horizontal_buffer;
		var player_name_text_y = player_menu_y + player_info_name_text_vertical_buffer;
		draw_text_color(player_name_text_x, player_name_text_y, _name,c_white, c_white, c_white, c_white, 1);
		draw_text_color(player_name_text_x, player_name_text_y + 25, "LV " + _level,c_white, c_white, c_white, c_white, 1);
		draw_text_color(player_name_text_x, player_name_text_y + 40, "HP " + _hp,c_white, c_white, c_white, c_white, 1);
		draw_text_color(player_name_text_x, player_name_text_y + 65, "AT " + _attack,c_white, c_white, c_white, c_white, 1);
		draw_text_color(player_name_text_x, player_name_text_y + 80, "DF " + _defense,c_white, c_white, c_white, c_white, 1);
		draw_text_ext_transformed(player_name_text_x, player_name_text_y + 105, "WEAPON: ", 500, 500, 1, 1, image_angle);
		draw_text_ext_transformed(player_name_text_x, player_name_text_y + 120, "ARMOR: ", 500, 500, 1, 1, image_angle);
		draw_set_color(c_yellow);
		draw_text_ext_transformed(player_name_text_x + 60, player_name_text_y + 105, _weapon, 500, 500, .9, .9, image_angle);
		draw_text_ext_transformed(player_name_text_x + 50, player_name_text_y + 120, _armor, 500, 500, .9, .9, image_angle);
}





