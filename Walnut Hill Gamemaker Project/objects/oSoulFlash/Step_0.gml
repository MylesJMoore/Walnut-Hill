if(!is_flashing && is_using_emote) {
	battle_emote_timer += 1;
	if (battle_emote_timer >= battle_emote_duration) {
		//Start Delay before the Soul Flashing and delete emote
		is_using_emote = false;
		removePlayerEmote(EMOTE_REACTION);
		audio_play_sound(snd_battle_encounter_end, 11, false);
	}
}

//Check if we are done with Emote
if(!is_using_emote) {
	delay_timer += 1;
	if (delay_timer >= delay_duration) {
	    // Start the Flashing effect
	    is_flashing = true;
	}
}

if (is_flashing && !flashing_complete) {
    // Increase the flash timer
    flash_timer += 1;
    
    // Change the color of the soul (flashing effect)
    if (flash_timer mod 10 < 1) {
        image_blend = c_white;
		instance_destroy(oSoulFlashBackground);
		image_alpha = 0;
    } else {
        image_blend = c_white; // Change to the color you want the soul to flash
		instance_create_depth(0, 0, -5000, oSoulFlashBackground);
		image_alpha = 1;
    }
    
    // Check if the flashing duration is over
    if (flash_timer >= flash_duration) {
        // End the flashing effect
        is_flashing = false;
        image_blend = c_white;
		flashing_complete = true;
		image_alpha = 0; //Hide Flash Soul so we can show splitting heart
		instance_create_depth(x, y, depth - 100, oSoulFlashLeft);
		instance_create_depth(x, y, depth - 100, oSoulFlashRight);
		oSoulFlashLeft.image_yscale = .5;
		oSoulFlashLeft.image_xscale = .5;
		oSoulFlashRight.image_yscale = .5;
		oSoulFlashRight.image_xscale = .5;
    }
}

if (flashing_complete) {
	image_blend = c_white;
	instance_create_depth(0, 0, -5000, oSoulFlashBackground);
	transition_timer += 1;
	oSoulFlashLeft.x -= 3;
	oSoulFlashRight.x += 3;
		
	if (transition_timer >= transition_duration) {
		instance_destroy(oSoulFlashBackground);
		instance_destroy(oSoulFlash);
		// Trigger the transition to the battle scene
		StartBattle(noone, noone, true);
	}
}