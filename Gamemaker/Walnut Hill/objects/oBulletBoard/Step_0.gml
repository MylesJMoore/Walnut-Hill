if (current_width < global.battle_border_width) {
	current_width += ((global.border_width - current_width)/2);
}

if (current_width > global.battle_border_width) {
	current_width -= ((current_width - global.battle_border_width)/2);
}

if (current_height < global.battle_border_height) {
	current_height += ((global.battle_border_height - current_height)/2);
}

if (current_height > global.battle_border_height) {
	current_height -= ((current_height - global.battle_border_height)/2);
}

if (keyboard_check_pressed(vk_space)) {
	global.battle_border_width = random(600);
	global.battle_border_height = random(300);
}