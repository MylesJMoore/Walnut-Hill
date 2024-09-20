if(place_meeting(x, y, obj_player))
{
	//Play Sound effect
	oSFX.pickupSound = true;
	
	global.coins++;
	
	instance_destroy();
}