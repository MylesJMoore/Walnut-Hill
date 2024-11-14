//Set Draw Options
draw_set_font(global.font_main);
draw_set_valign(fa_top);
draw_set_halign(fa_left);

#region Menu Position Calculations
//Dynamically get width and height of the menu
var _new_width = 0;
for(var i = 0; i < option_length; i++) 
{
	var _option_width = string_width(option[menu_level, i]);
	_new_width = max(_new_width, _option_width);
}

//Set Height & Width to new dynamic values
width = _new_width + option_border * 2;
height = option_border * 2 + string_height(option[0,0]) + (option_length - 1) * option_space;

//Center Menu
x = camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0])/2 - width/2;
y = camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0])/2 - height/2;

#endregion

//Draw the Menu background
draw_sprite_ext(sprite_index, image_index, x, y, width/sprite_width, height/sprite_height, 0, c_white, 1);

//Draw Text
for(var i = 0; i < option_length; i++) 
{
	var _color = c_white;
	
	//If we are on that option then set the color to yellow
	if(position == i) 
	{
		_color = c_yellow;
	}
	
	//Draw text
	draw_text_color(x + option_border, y + option_border + option_space * i, option[menu_level, i],_color, _color, _color, _color, 1);
}