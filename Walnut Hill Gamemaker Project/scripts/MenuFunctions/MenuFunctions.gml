/// @function TurnOffPlayerMenu
function TurnOffPlayerMenu(playSound = true) {
	if(global.open_menu) {
		global.open_menu = false;
		global.words_of_wisdom = 0;
		global.open_soul = false;
		global.show_words_of_wisdom = false;
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

/// @function TurnOnPlayerMenu
function TurnOnPlayerMenu(playSound = true) {
	if(!global.open_menu) {
		oPlayerMenu.position = 0;
		global.open_menu = true;
		global.open_items = false;
		global.words_of_wisdom = irandom(array_length(global.player_menu_messages) - 1);
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

/// @function removePlayerMenuTextbox
function removePlayerMenuTextbox() {
	//Delete any textbox or dialogue indicators before creating a new one
	if(instance_exists(obj_dialogue_indicator)) 
	{
		instance_destroy(obj_dialogue_indicator);
	}
						
	if(instance_exists(obj_textbox)) 
	{
		instance_destroy(obj_textbox);
	}
}