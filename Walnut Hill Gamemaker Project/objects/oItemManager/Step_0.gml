#region Inventory Input - Mouse
// Get the camera view coordinates
var view_x = camera_get_view_x(view_camera[0]);
var view_y = camera_get_view_y(view_camera[0]);

// Get the raw mouse position
var raw_mouse_x = device_mouse_raw_x(0) - 37;
var raw_mouse_y = device_mouse_raw_y(0) - 46;

// Initialize selected_item to -1 (no selection)
selected_item = -1;

// Check for mouse hover over items
if(global.inventory_input_mouse)
{
	for (var i = 0; i < array_length(inventory); i++) 
	{
	    var _xx = screen_border;
	    var _yy = screen_border;
	    var _sep = sep;
    
	    // Drawing coordinates relative to the viewport
	    var draw_x = _xx;
	    var draw_y = _yy + _sep * i;
    
	    // Check if the mouse is over the current item using adjusted mouse coordinates
	    if (raw_mouse_x > draw_x && raw_mouse_x < draw_x + 200)
	    {
			//Check the Y Coordinates
			var start_y = inventory_y_coordinates[i][0];
			var end_y = inventory_y_coordinates[i][1];
			if(raw_mouse_y > start_y && raw_mouse_y < end_y)
			{
		        selected_item = i;
				input_selected_item = -1;
		        break; // Exit the loop early since we found the selected item
			}
	    }
	}
}
#endregion

#region Inventory Input - Keyboard/Controller 
if(global.open_inventory && !global.inventory_controller_keyboard_input && !global.inventory_input_mouse) 
{
	global.inventory_controller_keyboard_input = true;
	input_selected_item = 0;
}


if(global.inventory_controller_keyboard_input) 
{
	//Keyboard Input
	var confirm_key = keyboard_check_pressed(ord("Z")) or keyboard_check_pressed(vk_enter) or keyboard_check_pressed(vk_space);
	var up_key = keyboard_check_pressed(vk_up) || keyboard_check_pressed(ord("W"));
	var down_key = keyboard_check_pressed(vk_down) || keyboard_check_pressed(ord("S"));
	var drop_key = keyboard_check_pressed(ord("T"));
	var cancel_key = keyboard_check_pressed(ord("X")) or keyboard_check_pressed(vk_shift);
	var lock_keys = false;
	var top_of_list = false;
	
	//Check if we are in the drop menu prompt, lock the keys
	if(global.inventory_menu_drop_prompt) {
		lock_keys = true;
	}

	//Controller Input
	//D-Pad Up
	if(gamepad_button_check_pressed(0, gp_padu) > 0) {
		up_key = 1;
	}

	//D-Pad Down
	if(gamepad_button_check_pressed(0, gp_padd) > 0) {
		down_key = 1;
	}

	//Joystick Support
	var axis_y = gamepad_axis_value(0, gp_axislv);
	if(axis_y < 0) {
	
		if(axis_y > -.5){
			controller_joystick_moved = false;
		}

		//We are moving down
		if(axis_y < controller_down_threshold && !controller_joystick_moved) {
			down_key = -1;
			controller_joystick_moved = true;
		}
	} else {
		if(axis_y < .5){
			controller_joystick_moved = false;
		}
	
		//We are moving up
		if(axis_y > controller_up_threshold && !controller_joystick_moved) {
			down_key = 1;
			controller_joystick_moved = true;
		}
	}

	//Check if "A" button is pressed on the controller for confirmation
	if (gamepad_button_check_pressed(0, gp_face1))
	{
	    confirm_key = 1;
	}
	
	//Check if "B" button is pressed on the controller for confirmation
	if (gamepad_button_check_pressed(0, gp_face2))
	{
	    cancel_key = 1;
	}
	
	//Check if "X" button is pressed on the controller for confirmation
	if (gamepad_button_check_pressed(0, gp_face3))
	{
	    drop_key = 1;
	}
	
	//Check if we reached bottom of Inventory List
	if(input_selected_item > array_length(inventory) - 1)
	{
		input_selected_item = 0;
	}
	
	//Check if we reached top of Inventory List
	if(input_selected_item < 0)
	{
		input_selected_item = array_length(inventory) - 1;
		
		//Go to a Previous Page
		if(item_page > 0) {
			global.inventory_menu_goto_previous_page = true;
		}
		
		//If we are on the first page at the very top, don't move up
		if(item_page == 0) 
		{
			input_selected_item = 0;
			oSFX.inventoryMenuCantMoveSound = true;
		}
	}
		
	//Move Selection up or down depending on inputs
	if(up_key != 0 && !lock_keys) 
	{
		input_selected_item = input_selected_item - up_key;
	}
	
	if(down_key != 0 && !lock_keys) 
	{
		input_selected_item = input_selected_item + down_key;
	}
	
	//Play Sound effect
	if((down_key != 0 || up_key != 0) && !lock_keys) {
		if(item_page == 0) {
			if(input_selected_item < 0 && !oSFX.inventoryMenuCantMoveSound) {
				global.top_of_inventory_menu = true;
			} else {
				oSFX.inventoryMenuMoveSound = true;
			}
		} else {
			oSFX.inventoryMenuMoveSound = true;
		}
	}
	
	if(global.open_items) {
		confirm_key = 0;
		global.open_items = false;
	}
	
	//Check if confirm key was hit on an item and that the player actually has items
	if(confirm_key && array_length(inventory) > 0 && !lock_keys)
	{
		inventory[input_selected_item].effect(input_selected_item);
		
		//Play Sound effect
		oSFX.inventoryMenuConfirmSound = true;
		TurnOffInventoryMenu(false);
	}
	
	//Check if cancel key was hit
	if(cancel_key && !lock_keys)
	{
		TurnOffInventoryMenu();
	}
	
	//Check if drop item key was hit
	if(array_length(inventory) > 0)
	{
		if(drop_key && !global.inventory_menu_drop_prompt)
		{
			//Play Sound effect
			oSFX.inventoryMenuConfirmSound = true;
			global.inventory_menu_drop_prompt = true;
		}
	}
	
	//Player has confirmed the drop item prompt
	if(global.inventory_menu_drop_prompt && confirm_key)
	{
			if(inventory[input_selected_item].can_drop) 
			{
				//Play Sound effect
				oSFX.inventoryMenuConfirmSound = true;
				removeItemFromInventory(input_selected_item);
				global.inventory_menu_drop_prompt = false;
				global.inventory_menu_drop_fail = false;
			} else {
				global.inventory_menu_drop_fail = true;
			}
	}
	
	//Player has cancelled the drop item prompt
	if(global.inventory_menu_drop_prompt && cancel_key)
	{
		//Play Sound effect
		oSFX.inventoryMenuCloseSound = true;
		global.inventory_menu_drop_prompt = false;
		global.inventory_menu_drop_fail = false;
	}
}
#endregion