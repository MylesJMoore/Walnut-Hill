/// @description Draw the title screen
switch (title_screen_active)
{
    case 1:
		draw_sprite_ext(spr_title_1, 0, title_1_x, title_1_y, title_1_x_scale, title_1_y_scale, 0, c_white, 1);
    break;

    case 2:
		//First Title
		draw_sprite_ext(spr_title_1, 0, title_1_x, title_1_y, title_1_x_scale, title_1_y_scale, 0, c_white, 1);
		
		//Second Title
		draw_sprite_ext(spr_title_2, 0, title_2_x, title_2_y, title_2_x_scale, title_2_y_scale, 0, c_dkgray, 1);
		draw_sprite_ext(spr_title_2, 0, title_2_x, title_2_y  + 3, title_2_x_scale, title_2_y_scale, 0, c_silver, 1);
    break;
}