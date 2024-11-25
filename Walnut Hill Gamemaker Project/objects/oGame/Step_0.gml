if(room == rm_items) {
	global.dialogue_global_vertical_adjustment = -7;
}

global.player_attack = global.player_base_attack + getSoulAttackBonus(global.soul_selected);
global.player_defense = global.player_base_attack + getSoulDefenseBonus(global.soul_selected);