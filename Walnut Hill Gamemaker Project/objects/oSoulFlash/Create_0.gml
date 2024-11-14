// Initialize variables
battle_emote_timer = 0;           // Timer for battle emote
battle_emote_duration = 40;       // Duration of the battle emote in frames
delay_timer = 0;				  // Timer for delay
delay_duration = 5;			  // Duration of the delay in frames
flash_timer = 0;			      // Timer for flashing effect
flash_duration = 30;              // Duration of the flashing effect in frames
transition_timer = 0;			      // Timer for battle room transition
transition_duration = 30;              // Duration of the battle room transition in frames
is_flashing = false;              // Flag to control flashing
flashing_complete = false;
is_using_emote = true;
image_alpha = 0;
image_yscale = .5;
image_xscale = .5;

createPlayerEmote(EMOTE_REACTION, -20);
audio_stop_all();
audio_play_sound(snd_battle_encounter_start, 11, false);
