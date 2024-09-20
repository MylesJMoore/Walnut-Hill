if (event_data[? "event_type"] == "sequence event") {
	var broadcast_string = event_data[? "message"];
	show_debug_message(broadcast_string);
    switch (broadcast_string) {
        case "toriel_1":
            show_debug_message("PLAYING BULLET 1");
			global.current_enemy_bullet_sound_index = 0;
            oSFX.bulletSound = true;
            break;
    }
}