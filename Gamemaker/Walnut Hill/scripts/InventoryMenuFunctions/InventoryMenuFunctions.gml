/// @function TurnOffInventoryMenu
function TurnOffInventoryMenu(playSound = true) {
	if(global.open_inventory) {
		global.open_inventory = false;
		global.inventory_controller_keyboard_input = false;
		global.player_can_move = true;
		obj_player.image_speed = 1;
		if (instance_exists(obj_follower1)) {
			obj_follower1.image_speed = 1;
		}
	
		if (instance_exists(obj_follower2)) {
			obj_follower2.image_speed = 1;
		}
	
		if (instance_exists(obj_follower3)) {
			obj_follower3.image_speed = 1;
		}
		
		if(playSound) {
			//Play Sound effect
			oSFX.inventoryMenuCloseSound = true;
		}
	}
}

/// @function TurnOnInventoryMenu
function TurnOnInventoryMenu(playSound = true) {
	if(!global.open_inventory) {
		global.open_inventory = true;
		global.player_can_move = false;
		obj_player.image_speed = 0;
	
		if (instance_exists(obj_follower1)) {
			obj_follower1.image_speed = 0;
		}
	
		if (instance_exists(obj_follower2)) {
			obj_follower2.image_speed = 0;
		}
	
		if (instance_exists(obj_follower3)) {
			obj_follower3.image_speed = 0;
		}
		
		if(playSound) {
			//Play Sound effect
			oSFX.inventoryMenuOpenSound = true;
		}
	}
}