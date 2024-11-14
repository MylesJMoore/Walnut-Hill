//Keyboard Input
var confirm_key = keyboard_check_pressed(ord("Z")) or keyboard_check_pressed(vk_enter) or keyboard_check_pressed(vk_space);

//Controller Input - "A" button
if (gamepad_button_check_pressed(0, gp_face1))
{
	confirm_key = 1;
}

if(confirm_key == 1)
{
	room_goto_next();
}