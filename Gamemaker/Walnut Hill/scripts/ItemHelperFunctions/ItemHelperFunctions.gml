/// @desc addItemToInventory(_item)
/// @arg item
function addItemToInventory(_item) {
	array_push(oItemManager.inventory, _item);
	array_push(oItemManager.page_inventory, _item);
}

/// @desc removeItemFromInventory(_index)
/// @arg index
function removeItemFromInventory(_index) {
	array_delete(oItemManager.inventory, _index, 1);
	array_delete(oItemManager.page_inventory, _index, 1);
}

/// @desc increasePlayerHealth(hp)
/// @arg index
function increasePlayerHealth(_hp = 0) {
	if(global.player_hp <= global.player_max_hp) {
		global.player_hp += _hp;
	}
}