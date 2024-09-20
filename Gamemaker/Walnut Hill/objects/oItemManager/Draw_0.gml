//Get the camera view coordinates
var view_x = camera_get_view_x(view_camera[0]);
var view_y = camera_get_view_y(view_camera[0]);
//Draw Textbox
var inventory_box_x = screen_border + view_x;
var inventory_box_y = screen_border + sep + view_y;
if(global.open_inventory) {
	//Textbox Item List
	draw_sprite_ext(spr_inventory_menu_textbox, 0, inventory_box_x + inventory_box_horizontal_buffer, inventory_box_y + inventory_box_vertical_buffer, inventory_item_box_width, inventory_item_box_height, 0, c_white, 1);
	
	//Textbox Item Description
	draw_sprite_ext(spr_inventory_menu_textbox, 0, inventory_box_x + inventory_box_horizontal_buffer, inventory_box_y + inventory_box_vertical_buffer + 135, 9, 2, 0, c_white, 1);
}

//We need to Paginate to the next page and start with the next items
if ((input_selected_item == pagination[item_page + 1][0] || selected_item == pagination[item_page + 1][0])) 
{
	show_debug_message("Going to page 2!");
	array_delete(inventory, starting_index, 8);
	item_page++;
	starting_index = pagination[item_page][0];
	ending_index = pagination[item_page][1];
	var _index = 0;
	for (var i = starting_index; i < array_length(page_inventory); i++) 
	{
		inventory[_index] = page_inventory[i];
		_index++;
	}
}

//Check if we need to Paginate to the previous page
if (global.inventory_menu_goto_previous_page) 
{
	show_debug_message("Going back to previous page!");
	array_delete(inventory, starting_index, 8);
	item_page--;
	starting_index = pagination[item_page][0];
	ending_index = pagination[item_page][1];
	var _index = 0;
	for (var i = starting_index; i < array_length(page_inventory); i++) 
	{
		inventory[_index] = page_inventory[i];
		_index++;
	}
	input_selected_item = 7;
	selected_item = 7;
	global.inventory_menu_goto_previous_page = false;
}
		

//Draw Item Sprite/Item Text
for (var i = 0; i < array_length(inventory); i++) 
{
    var _xx = screen_border;
    var _yy = screen_border;
    var _sep = sep;
    var _col = main_text_color;
    
    //Adjust the drawing coordinates by the camera view coordinates
    var draw_x = _xx + view_x;
    var draw_y = _yy + _sep * i + view_y;
	
    //Draw Sprite of item in the Inventory
	if(global.open_inventory && i < max_items_per_page && draw_item_icon) {
	 draw_sprite(inventory[i].sprite, 0, draw_x, draw_y);
	}
    
    //If this item is selected in the Inventory
    if (selected_item == i || input_selected_item == i) 
    {
		//Check if this item is selected to be dropped by the Player
		if(global.inventory_menu_drop_prompt) 
		{
			_col = drop_selection_text_color;
		} else {
			_col = selection_text_color;
		}
    }
	
    //Draw Name of item in the Inventory
	if(global.open_inventory && i < max_items_per_page) {
	    draw_set_color(_col);
		//draw_set_font(fInventory);
		draw_set_font(global.menu_option_font);
		draw_text_ext_transformed(draw_x + 16, draw_y, inventory[i].name, 1, item_name_width, item_name_scale,item_name_scale,image_angle);
	}
    
    // We have selected an Inventory Item
    if (selected_item == i || input_selected_item == i) 
    {
		//Draw Description of Item
		if(global.open_inventory && !global.inventory_menu_drop_prompt) {
			draw_set_color(description_text_color);
			draw_text_ext_transformed(draw_x + description_x_buffer, view_y + description_y_buffer + _sep * description_separation_buffer, inventory[i].description, 12, description_text_width, item_description_scale,item_description_scale,image_angle); //ALLOWS SCALING
		}
		
		//Draw Successful Drop Item Prompt
		if(global.inventory_menu_drop_prompt && !global.inventory_menu_drop_fail) {
			draw_set_color(drop_text_color);
			draw_text_ext_transformed(draw_x + description_x_buffer, view_y + description_y_buffer + _sep * description_separation_buffer, "Drop " + inventory[i].name + "?", 12, description_text_width, item_description_scale,item_description_scale,image_angle); //ALLOWS SCALING
		}
		
		//Draw Failed Drop Item Prompt
		if(global.inventory_menu_drop_prompt && global.inventory_menu_drop_fail) {
			draw_set_color(drop_selection_fail_color);
			draw_text_ext_transformed(draw_x + description_x_buffer, view_y + description_y_buffer + _sep * description_separation_buffer, inventory[i].name + " cannot be dropped! Sorry!", 12, description_text_width, item_description_scale,item_description_scale,image_angle); //ALLOWS SCALING
		}
		
		//Draw Inventory Indicator
		if(global.open_inventory) {
			draw_sprite_ext(spr_inventory_indicator, 0, draw_x + string_width(inventory[i].name) + indicator_horizontal_buffer, draw_y + indicator_vertical_buffer, indicator_scale_factor, indicator_scale_factor, 0, c_white, 1);
		}
	}
    
    //Reset Text Color
    draw_set_color(main_text_color);
}
