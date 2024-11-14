function createAllGameItems() {
	//Item Constructor
	function create_item(_name, _description, _sprite,_can_drop, _effect) constructor
	{
		name = _name;
		description = _description;
		sprite = _sprite;
		can_drop = _can_drop;
		effect = _effect;
	}

	//Create the Items
	global.item_list = {
		mushroom : new create_item("Mushroom","This mushroom won't get you bigger.",spr_mushroom, true,
		function(_index = -1) {
			//Add Health
			increasePlayerHealth(10);
			
			//Remove Item from Inventory
			removeItemFromInventory(_index);
		}),
		bomb : new create_item("Bomb","A literal bomb with legs. It packs a...kick!",spr_bomb, true,
		function(_index = -1) {
			//Create the Bomb based on player face direction
			switch (global.player_face_direction)
			{
				case "Up":
					instance_create_depth(obj_player.x, obj_player.y - 30, 0, obj_bomb_weapon);
				break;

				case "Down":
					instance_create_depth(obj_player.x, obj_player.y + 30, 0, obj_bomb_weapon);
				break;
    
				case "Left":
					instance_create_depth(obj_player.x - 30, obj_player.y, 0, obj_bomb_weapon);
				break;
		
				case "Right":
					instance_create_depth(obj_player.x + 30, obj_player.y, 0, obj_bomb_weapon);
				break;
			}
			
			//Remove Item from Inventory
			removeItemFromInventory(_index);
		}),
		hat : new create_item("Ness' Hat","The infamous hat worn by Ness. You can feel the power coming from it.",spr_hat, false,
		function(_index = -1) {
			//Add Health
			increasePlayerHealth(100);
			
			//Remove Item from Inventory
			//array_delete(global.player_item_inventory, _index, 1);
		}),
		redkey : new create_item("Red Key","This key has a striking shade of Red. Opens doors.",spr_key_red, false,
		function(_index = -1) {
			var _used = false;
			if(instance_exists(obj_door_red))
			{
				with(obj_door_red)
				{
					if(distance_to_object(obj_player) < 20)
					{
						//Destroy Door
						instance_destroy();
						_used = true;
					}
				}
			} else {
				show_debug_message("No door is found");
			}
			
			//Remove Item from Inventory
			if(_used == true) 
			{
				array_delete(global.player_item_inventory, _index, 1);
			}
		}),
	}
}

function getAllGameItems() {
	return global.item_list;
}