#region Keyboard Input
	//Keyboard Input
	var confirm_key = keyboard_check_pressed(ord("Z")) or keyboard_check_pressed(vk_enter) or keyboard_check_pressed(vk_space);
	
	//Check if "Cancel" key is pressed on the keyboard to skip intro
	if (keyboard_check_pressed(ord("X")) || keyboard_check_pressed(vk_shift))
	{
		//Stop Title Opening Music
		if(audio_is_playing(snd_undertale_intro)) 
		{
			audio_stop_sound(snd_undertale_intro);
		}
	    room_goto_next();
	}
#endregion

#region Controller Input
	//Check if "Start" or "B" button is pressed on the controller to skip intro
	if (gamepad_button_check_pressed(0, gp_start) || gamepad_button_check_pressed(0, gp_face2))
	{
		//Stop Title Opening Music
		if(audio_is_playing(snd_undertale_intro)) 
		{
			audio_stop_sound(snd_undertale_intro);
		}
	    room_goto_next();
	}
	
	//Controller Input - "A" button
	if (gamepad_button_check_pressed(0, gp_face1))
	{
		confirm_key = 1;
	}
#endregion

if(confirm_key == 1) {
	confirm_key_hit = true;
}

if(confirm_key_hit && counter == 0)
{
	//Check if we have reached the last image
	var _total_frames = oTitleOpening.image_number - 1;
	if (title_index < _total_frames) {
		title_index++;
		oTitleOpening.image_index = title_index;
		counter = 30;
		confirm_key_hit = false;
		remove_text = false;
		text_written = false;
		global.title_opening_image_index = title_index;
	} else {
		//We have finished the opening intro, go to next room
		//Stop Title Opening Music
		if(audio_is_playing(snd_undertale_intro)) 
		{
			audio_stop_sound(snd_undertale_intro);
		}
		room_goto_next();
	}
} else if(confirm_key_hit && counter > 0) {
	counter--;
}