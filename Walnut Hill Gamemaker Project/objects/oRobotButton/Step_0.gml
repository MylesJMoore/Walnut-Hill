//Button is pressed while robot is off
if(place_meeting(x, y, obj_player) && image_index == 0 && state == 0)
{
	//Player is pressing button, play sound and change image index
	image_index = 1;
	oSFX.buttonPressSound = true;
	
	//Change robot image index
	oRobot.sprite_index = spr_robot_on;
	oRobot.image_index = 1;
	state = 1;
}


if (state == 1) 
{
	//Play SFX Loop Sound effect
	oSFX.sfxSoundLoop = true;
}

//Button is released
if(!place_meeting(x, y, obj_player) && image_index == 1 && state == 1)
{
	//Player is no longer on the button, change image index
	image_index = 0;
	
	//Play Sound effect
	oSFX.buttonReleaseSound = true;
	
	//Change robot image index
	oRobot.sprite_index = spr_robot_off;
	oRobot.image_index = 0;
	state = 0;
	
	//Stop SFX Loop Sound effect
	oSFX.sfxSoundLoop = false;
	audio_stop_sound(snd_robot_loop);
}
