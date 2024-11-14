//Button is pressed
if(place_meeting(x, y, obj_player) && image_index == 0)
{
	//Player is pressing button, change image index
	image_index = 1;
	
	//Play Sound effect
	oSFX.buttonPressSound = true;
}

//Button is released
if(!place_meeting(x, y, obj_player) && image_index == 1)
{
	//Player is no longer on the button, change image index
	image_index = 0;
	
	//Play Sound effect
	oSFX.buttonReleaseSound = true;
}