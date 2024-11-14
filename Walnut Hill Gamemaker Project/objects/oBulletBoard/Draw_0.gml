//Boundary Box for Soul 
var border_left = 320 - (current_width/2);
var border_right = 320 + (current_width/2);
var border_up = 384 - current_height;
var border_down = 384;

if (current_width == 570 && current_height == 120) {
	// Set up the text writer
	if instance_exists(Dialogue) {
		Dialogue.visible = false;
		Fight.visible = false;
		Act.visible = false;
		ItemL.visible = false;
		ItemR.visible = false;
		Mercy.visible = false;
	}
	
	if (oButtonController.enemySpared) {
		show_debug_message("WIN TEXT");
		battleEnd = true;
		audio_stop_sound(global.current_enemy_music);
		audio_play_sound(snd_vaporized, 11, false);
		Dialogue = instance_create_depth(border_left + 30, border_up + 15, -9999, oTextElement); //-4000
		Dialogue.TextToDraw = "* YOU WON! &* You earned 0 XP and 0 gold.";
		Dialogue.CanAdvance = false;
		oButtonController.enemySpared = false;
		global.battleMenu = -1;
	}
	
	if (oButtonController.enemyKilled) {
		show_debug_message("ENEMY KILLED TEXT");
		battleEndDelay = 180;
		battleEnd = true;
		audio_stop_sound(global.current_enemy_music);
		audio_play_sound(snd_monster_soul_destroyed, 11, false);
		Dialogue = instance_create_depth(border_left + 30, border_up + 15, -9999, oTextElement); //-4000
		Dialogue.TextToDraw = "* You won... &* You earned 6 XP and 66 gold.";
		Dialogue.CanAdvance = false;
		oButtonController.enemyKilled = false;
		global.battleMenu = -1;
	}
	
	if(battleEnd && battleEndDelay != 0 && !battleEndDelayFinished) {
		battleEndDelay--;
	}
	
	if(battleEnd && battleEndDelay == 0) {
		battleEndDelayFinished = true;
	}
	
	if (global.battleMenu == -1) {
		// Create the instance responsible for drawing text
		// GetStatusText() will fetch the text depending on your encounter
		if(!battleEnd) {
			Dialogue = instance_create_depth(border_left + 30, border_up + 15, -100, oTextElement); //-4000
			Dialogue.TextToDraw = "* You can feel the weight of this& tutorial...";
			Dialogue.CanAdvance = false;
		}
		
		// Fight Menu
		Fight = instance_create_depth(border_left + 50, border_up + 15, -100, oTextElement); //-4100
		for (var i = 0; i < array_length(global.monster); i++) {
			Fight.TextToDraw += "* " + global.monster[i].MyName + "&";
		}
		
		Fight.TextLength = string_length(Fight.TextToDraw);
		Fight.CanAdvance = false;
		Fight.visible = false;
		
		// ACT Menu, it's the same as FIGHT but it leads to the monster ACT commands
		Act = instance_create_depth(border_left + 50, border_up + 15, -100, oTextElement); //-4200
		for (var i = 0; i < array_length(global.monster); i++) {
			Act.TextToDraw += "* " + global.monster[i].MyName + "&";
		}
		Act.TextLength = string_length(Act.TextToDraw);
		Act.CanAdvance = false;
		Act.visible = false;
		
		//ACT Commands
		ActML = instance_create_depth(border_left + 50, border_up + 15, -100, oTextElement); 
		for (var i = 0; i < array_length(global.monster); i += 2) {
			ActML.TextToDraw += "* " + global.monster[i].Act[0] + "&";
		}
		ActML.TextLength = string_length(ActML.TextToDraw);
		ActML.CanAdvance = false;
		ActML.visible = false;
		
		ActMR = instance_create_depth(border_left + 300, border_up + 15, -100, oTextElement); 
		for (var i = 0; i < array_length(global.monster); i += 2) {
			ActMR.TextToDraw += "* " + global.monster[i].Act[1] + "&";
		}
		ActMR.TextLength = string_length(ActMR.TextToDraw);
		ActMR.CanAdvance = false;
		ActMR.visible = false;
		
		// Item Menu, this is also in two halves
		ItemL = instance_create_depth(border_left + 50, border_up + 15, -100, oTextElement); //-4300
		for (var i = 0; i < array_length(global.item); i += 2) {
			ItemL.TextToDraw += "* " + global.item[i] + "&";
		}
		ItemL.TextLength = string_length(ItemL.TextToDraw);
		ItemL.CanAdvance = false;
		ItemL.visible = false;
		
		ItemR = instance_create_depth(border_left + 300, border_up + 15, -100, oTextElement); //-4400
		for (var i = 1; i < array_length(global.item); i += 2) {
			ItemR.TextToDraw += "* " + global.item[i] + "&";
		}
		ItemR.TextLength = string_length(ItemR.TextToDraw);
		ItemR.CanAdvance = false;
		ItemR.visible = false;
		
		// MERCY Menu
		Mercy = instance_create_depth(border_left + 50, border_up + 15, -100, oTextElement); //-4500
		for (var i = 0; i < array_length(global.monster); i++) {
			if instance_exists(global.monster[i]) {
				if global.monster[i].CanSpare {
					Mercy.TextToDraw += "~Y";
					break;
				}
			}
		}
		Mercy.TextToDraw += "* Spare~D&* Flee";
		if (!global.canFlee) {
			Mercy.TextToDraw += "* Spare";
		}
		Mercy.TextLength = string_length(Mercy.TextToDraw);
		Mercy.CanAdvance = false;
		Mercy.visible = false;
		
		// For long conversations such as in cutscenes, use an array to store your next few lines
		// In this case, I've set it to have 256 total lines if they are all full, but you can use up to 32,000
		// Of course, nobody is stupid enough to actually have 32,000 lines of dialogue in a single cutscene
		
		// EXAMPLE:
		// Dialogue.TextToDraw = "* Hi guys, I'm present.&* Where's my cookie?";
		// Dialogue.TextQueue[0] = "* Sorry, you don't get one.";
		// Dialogue.TextQueue[1] = "* WHAT DO YOU MEAN?";
		// Dialogue.TextQueue[2] = "* I WAS WORKING FOR 60 HOURS&  AND YOU HAVEN'T GIVEN ME ONE!";
		// Dialogue.TextQueue[3] = "* Sorry, mate. But I'm afraid&  you still don't get one...";
		
		// EXAMPLE FROM UNDERTALE REJUVENATION
		// Dialogue.TextToDraw = "* The Great Papyrus&  110 - ATK, 80 - DEF.";
		// Dialogue.TextQueue[0] = "* Can't take damage...&* Maybe try tiring him out!";
		
		// Sets the menu state to enable menu navigation
		// Also gets us out of this loop so that you don't create infinite writers, which would cause a memory leak and crash the game
		global.battleMenu = 0;
	}
	
	if (global.battleMenu == 0) {
		if (instance_exists(Dialogue)) {
		    Dialogue.visible = true;
		} else {
		    //show_debug_message("Dialogue instance no longer exists when trying to set visibility.");
		}
	}
		
	if (global.battleMenu == 1) {
		Fight.visible = true;
	}
	
	if (global.battleMenu == 2) {
		Act.visible = true;
	}
	
	if (global.battleMenu == 2.5) {
		ActML.visible = true;
		ActMR.visible = true;
	} else {
		ActML.visible = false;
		ActMR.visible = false;
	}
	
	if (global.battleMenu == 3) {
		ItemL.visible = true;
		ItemR.visible = true;
	}
	
	if (global.battleMenu == 4) {
		Mercy.visible = true;
	}
}

// Restricts the SOUL to the Bullet Board boundaries
oSoul.x = clamp(oSoul.x, border_left + 7, border_right - 7);
oSoul.y = clamp(oSoul.y, border_up + 7, border_down - 7);
draw_set_color(c_white);
draw_rectangle(border_left - 4, border_up - 4, border_right + 4, border_down + 4, false);
draw_set_color(c_black);
draw_rectangle(border_left, border_up, border_right, border_down, false);
