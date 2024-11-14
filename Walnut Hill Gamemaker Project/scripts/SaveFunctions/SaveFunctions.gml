/// @function saveRoom
//Room Save
function saveRoom(){
	var _coinNumber = instance_number(oPickup);
	var _roomStruct =
	{
		coinNumber : _coinNumber,
		coinData : array_create(_coinNumber)
	}
	
	//Get the data from the different savable objects
		//Coins
		for (var i = 0; i < _coinNumber; i++) {
			var _inst = instance_find(oPickup, i);
			_roomStruct.coinData[i] = {
				x : _inst.x,
				y : _inst.y
			}
		}
		
	//Store the room specific struct in global.levelData's variable meant for that level
	if (room == rm_cave) {
		global.levelData.level_1 = _roomStruct;
	}
	
	if (room == rm_debug) {
		global.levelData.level_2 = _roomStruct;
	}
	
	if (room == rm_factory) {
		global.levelData.level_3 = _roomStruct;
	}
}

/// @function loadRoom
function loadRoom() {
	var _roomStruct = 0;
	
	//Get the correct struct for the room you're in
	if (room == rm_cave) {
		_roomStruct = global.levelData.level_1;
	}
	
	if (room == rm_debug) {
		_roomStruct = global.levelData.level_2;
	}
	
	if (room == rm_factory) {
		_roomStruct = global.levelData.level_3;
	}
	
	//Exit if _roomStruct isn't a struct
	if (!is_struct(_roomStruct)) {
		exit;
	}
	
	//Coins - get rid of the default room editor coins, then create new coins with previous data saved
	if (instance_exists(oPickup)) {
		instance_destroy(oPickup);
	}
	
	for (var i = 0; i < _roomStruct.coinNumber; i++) {
			instance_create_depth(_roomStruct.coinData[i].x,_roomStruct.coinData[i].y, depth, oPickup);
		}
}

/// @function saveGame
function saveGame(_fileNum = 0) {
	//Saves it to: C:\Users\Myles\AppData\Local\Walnut_Hill or search for %localappdata%
	var _saveArray = array_create(0);
	
	//Save the room you're in
	saveRoom();
	
	//Set and save stat related stuff
	global.statData.save_x = obj_player.x;
	global.statData.save_y = obj_player.y;
	global.statData.save_room = room_get_name(room);
	global.statData.coins = global.coins;
	global.statData.item_inventory = global.item_inventory;
	global.statData.player_item_inventory = global.player_item_inventory;
	
	array_push(_saveArray, global.statData);
	
	//Save all the room data
	array_push(_saveArray, global.levelData);
	
	//Actual Saving
	var _filename = "save_data" + string(_fileNum) + "sav";
	var _json = json_stringify(_saveArray);
	var _buffer = buffer_create(string_byte_length(_json) + 1, buffer_fixed, 1);
	buffer_write(_buffer, buffer_string, _json);
	buffer_save(_buffer, _filename);
}

/// @function loadGame
function loadGame(_fileNum = 0) {
	//Loads it from: C:\Users\Myles\AppData\Local\Walnut_Hill or search for %localappdata%
	//Loading our saved data
	var _filename = "save_data" + string(_fileNum) + "sav";
	if (!file_exists(_filename)) 
	{
		exit;
	}
	
	//Load the buffer, get the JSON, delete the buffer to free memory
	var _buffer = buffer_load(_filename);
	var _json = buffer_read(_buffer, buffer_string);
	buffer_delete(_buffer);
	
	//Parse the JSON and get the data array
	var _loadArray = json_parse(_json);
	
	//Set the data in our game to match our loaded data
	global.statData = array_get(_loadArray, 0);
	global.levelData = array_get(_loadArray, 1);
	global.coins = global.statData.coins;
	global.item_inventory = global.statData.item_inventory;
	global.statData.player_item_inventory = global.player_item_inventory;
	
	//Use our new data to get back to where we were in the game
	//go to the correct room
	var _loadRoom = asset_get_index(global.statData.save_room);
	room_goto(_loadRoom);
	
	//Make sure our obj_saveLoad doesn't save the room we're exiting from
	oSaveLoad.skipRoomSave = true;
	
	//Remove Player and Follower Objects
	RemovePlayerAndFollowers();
	
	//Create the player object
	instance_create_layer(global.statData.save_x, global.statData.save_y, layer, obj_player);
	
	//Reset player move flag for follower creation
	global.player_has_moved = false;
	
	//Manually load the room
	loadRoom();
}