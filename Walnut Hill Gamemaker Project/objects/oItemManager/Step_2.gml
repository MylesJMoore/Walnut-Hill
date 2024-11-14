//Store the current inventory in a global
global.player_item_inventory = inventory;
global.player_item_page_inventory = inventory;

//Play Top of Menu Sound
if(global.top_of_inventory_menu) {
	oSFX.inventoryMenuCantMoveSound = true;
	global.top_of_inventory_menu = false;
}