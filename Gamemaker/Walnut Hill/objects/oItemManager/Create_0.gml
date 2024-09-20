//Create all Items
createAllGameItems();

//Create the Inventory
inventory = global.player_item_inventory; //Storing in a global so saving/loading works
page_inventory = global.player_item_page_inventory;

//Initalization Values
depth = -9999;
starting_index = 0;
ending_index = 8;
item_page = 0;
max_items_per_page = 8;
selected_item = -1;
input_selected_item = -1;
main_text_color = c_white;
description_text_color = c_white;
selection_text_color = c_yellow;
drop_selection_text_color = c_blue;
drop_selection_fail_color = c_red;
drop_text_color = c_yellow;
draw_item_icon = false; //TURNS ON AND OFF ITEM ICONS

//For Drawing and Mouse Positions
sep = 16;
screen_border = 16;

//Item Text Values
item_name_scale = .75;
item_description_scale = .75;
item_name_width = 215;

//Inventory Menu Name Textbox Adjustment Values
inventory_item_box_height = 5.5;
inventory_item_box_width = 4;
inventory_box_vertical_buffer = -20;
inventory_box_horizontal_buffer = -3;

//Item Text Description Adjustment Values
description_separation_buffer = 3;
description_x_buffer = 9;
description_y_buffer = 105;
description_text_width = 215;

//Item Inventory Menu Indicator
indicator_scale_factor = 0.5;
indicator_horizontal_value = 15;
indicator_vertical_value = 4;
indicator_horizontal_scale = 5;
indicator_vertical_scale = 2;
indicator_horizontal_calculated = (indicator_horizontal_value - indicator_horizontal_scale);
indicator_vertical_calculated = (indicator_vertical_value - indicator_vertical_scale);
indicator_horizontal_buffer = indicator_horizontal_calculated;
indicator_vertical_buffer = indicator_vertical_calculated;

// Get Inventory Y Coordinate Pairs
n = 10; // Number of pairs to generate
inventory_y_coordinates = GeneratePairs(n);

// Get Pagination Pages
n = 20; // Number of pairs to generate
pagination = GeneratePaginationPairs(n);

// Display the generated pairs
for (var i = 0; i < array_length(pagination); i++) {
    var pair = pagination[i];
	show_debug_message(string(pair));
}

//Controller Inputs
controller_down_threshold = -.8;
controller_up_threshold = .8;
controller_joystick_moved = false;
option_looparound = true;

		