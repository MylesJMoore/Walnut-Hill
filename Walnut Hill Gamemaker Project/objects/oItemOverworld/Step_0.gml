sprite_index = item.sprite;
// Check if the item has already been picked up
if (ds_list_find_index(global.picked_up_items, item_id) != -1) {
    instance_destroy();
}

if (place_meeting(x, y, obj_player)) 
{
	//Play Sound effect
	oSFX.pickupSound = true;
	addItemToInventory(item);
	ds_list_add(global.picked_up_items, item_id); // Add unique item ID to the global list
    instance_destroy();
}

