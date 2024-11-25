#region Keyboard Input
	var right_key = keyboard_check_pressed(vk_right) || keyboard_check_pressed(ord("D"));
	var left_key = keyboard_check_pressed(vk_left) || keyboard_check_pressed(ord("A"));
	var up_key = keyboard_check_pressed(vk_up) || keyboard_check_pressed(ord("W"));
	var down_key = keyboard_check_pressed(vk_down) || keyboard_check_pressed(ord("S"));
	var confirm_key = false;
	var cancel_key = false;
	
	//Confirm Key
	if (keyboard_check_pressed(ord("Z")) || keyboard_check_pressed(vk_enter))
	{
	    confirm_key = 1;
	}

	//Cancel Key
	if (keyboard_check_pressed(ord("X")))
	{
	    cancel_key = 1;
	}
#endregion
	
#region Controller Input
	// Controller Support
	var axis_x = gamepad_axis_value(0, gp_axislh);
	var axis_y = gamepad_axis_value(0, gp_axislv);
	
	//Moving Right
	if(axis_x > 0) {
		if(axis_x < .7) {
			controller_joystick_moved = false;
		}

		//We are moving left
		if(axis_x > controller_right_threshold && !controller_joystick_moved) {
			right_key = 1;
			controller_joystick_moved = true;
		}
	} else if (axis_x < 0) {
		if(axis_x > -.7) {
			controller_joystick_moved = false;
		}

		//We are moving left
		if(axis_x < controller_left_threshold && !controller_joystick_moved) {
			left_key = 1;
			controller_joystick_moved = true;
		}
	}
	
	//Moving Down
	if (axis_y > 0) {
		if(axis_y < .7) {
			controller_joystick_vertical_moved = false;
		}

		//We are moving down
		if(axis_y > controller_down_threshold && !controller_joystick_vertical_moved) {
			down_key = 1;
			controller_joystick_vertical_moved = true;
		}
	}
	
	//Moving Up
	if (axis_y < 0) {
		if(axis_y > -.7) {
			controller_joystick_vertical_moved = false;
		}

		//We are moving up
		if(axis_y < controller_up_threshold && !controller_joystick_vertical_moved) {
			up_key = 1;
			controller_joystick_vertical_moved = true;
		}
	}

	//D-Pad Up
	if(gamepad_button_check_pressed(0, gp_padu) > 0) {
		up_key = 1;
	}

	//D-Pad Down
	if(gamepad_button_check_pressed(0, gp_padd) > 0) {
		down_key = 1;
	}
	
	//D-Pad Left
	if(gamepad_button_check_pressed(0, gp_padl) > 0) {
		left_key = 1;
	}

	//D-Pad Right
	if(gamepad_button_check_pressed(0, gp_padr) > 0) {
		right_key = 1;
	}
	
	//Controller - Check if "A" button is pressed on the controller for confirmation
	if (gamepad_button_check_pressed(0, gp_face1))
	{
	    confirm_key = 1;
	}

	//Controller - Check if "B" button is pressed on the controller for cancellation
	if (gamepad_button_check_pressed(0, gp_face2))
	{
	    cancel_key = 1;
	}
	
	//Check if battle has ended and default all inputs
	if(oBulletBoard.battleEnd) {
		up_key = 0;
		down_key = 0;
		right_key = 0;
		left_key = 0;
	}
	
	if(oBulletBoard.battleEnd && oBulletBoard.battleEndDelay != 0) {
		confirm_key = 0;
		cancel_key = 0;
	}
#endregion

#region Menu Initialization
	//Check for no items
	if(array_length(global.item) == 0) 
	{
		ButtonSprites[2] = sMenuNoItems;
	}
	
	// Draw every button sprite with the "Unselected" form
	for (var i = 0; i < 4; i++) 
	{
		if(!oBulletBoard.game_has_ended) {
			draw_sprite(ButtonSprites[i], 0, ButtonPositions_X[i], 430);
		}
	}
#endregion

// To make sure that our menu is navigatable, we set the battleSelectionMenu variable to -1 when we don't want it
// I.E. during attacks or cutscenes
if (global.battleSelectionMenu > -1) 
{
	
#region Menu Display
		// Main menu
		if (global.battleMenu == 0) {
			if (left_key) {
				//Check for no items
				if(array_length(global.item) == 0 && global.battleSelectionMenu == 3) 
				{
					global.battleSelectionMenu -= 2;
				} else {
					global.battleSelectionMenu -= 1;
				}
				audio_play_sound(snd_menu_move, 1, false);
			}
			if (right_key) {
				//Check for no items
				if(array_length(global.item) == 0 && global.battleSelectionMenu == 1) 
				{
					global.battleSelectionMenu += 2;
				} else {
					global.battleSelectionMenu += 1;
				}
				audio_play_sound(snd_menu_move, 1, false);
			}
			
			global.battleSelectionMenu = clamp(global.battleSelectionMenu, 0, 3);
			for (var i = 0; i < 4; i++) {
				if(!oBulletBoard.game_has_ended) {
					draw_sprite(ButtonSprites[i], (global.battleSelectionMenu == i && !instance_exists(oMonsterSequenceGenerator)), ButtonPositions_X[i], 430);
				}
			}
		}
	
		// This forces the selection variable to stay within a certain range to prevent crashes and other weird oddities
		// Fight and ACT selection menu
		if (global.battleMenu == 1 || global.battleMenu == 2) {
			global.battleSelectionMenu = clamp(global.battleSelectionMenu, 0, array_length(global.monster) - 1);
		
			// Draws the health bar of the monsters, unless the monster doesn't want the health bar shown: "ShowHealthBar"
			for (var i = 0; i < array_length(global.monster); i++) {
				if instance_exists(global.monster[i]) {
					if (global.monster[i].ShowHealthBar) {
						var percent = (global.monster[i].MyHP / global.monster[i].MyMaxHP) * 100;
						draw_set_color(c_red);
						draw_rectangle(470, 287 + (30 * i), 570, 304 + (30 * i), false);
						draw_set_color(c_lime);
						draw_rectangle(470, 287 + (30 * i), 470 + percent, 304 + (30 * i), false);
					}
				}
			}
		}
		
		// Monster ACT menu
		if (global.battleMenu == 2.5)
			global.battleSelectionMenu = clamp(global.battleSelectionMenu, 0, array_length(global.monster[MonsterReferenceNum].Act) - 1);
		
		// Item menu
		if (global.battleMenu == 3) {
			global.battleSelectionMenu = clamp(global.battleSelectionMenu, 0, array_length(global.item) - 1);
		}
	
		//Vertical movement, "else" is for grid menus like ITEM and ACT commands
		if (global.battleMenu == 1 || global.battleMenu == 2 || global.battleMenu == 4) {
			var _soul_indicator_x = 63;
			var _soul_indicator_y = 295 + (30 * global.battleSelectionMenu) - 0;
			draw_sprite(spr_soul, 0, _soul_indicator_x, _soul_indicator_y);
		} else if (global.battleMenu > 0) {
			var _soul_indicator_x = 63 + (250 * (global.battleSelectionMenu % 2));
			var _soul_indicator_y = 295 + (30 * floor(global.battleSelectionMenu / 2)) - 8;
			draw_sprite(spr_soul, 0, _soul_indicator_x, _soul_indicator_y);
		}
#endregion

#region Menu Navigation
//Back out of a menu
	if (cancel_key) {
		global.battleMenu = 0;
		global.battleSelectionMenu = BelowUIReferenceNum;
	}
	//show_debug_message("Battle Menu = " + string(global.battleMenu));
	//show_debug_message("Battle Selection = " + string(global.battleSelectionMenu));
	//Navigation Controls
	if (global.battleMenu != 2 && global.battleMenu != 2.5 && global.battleMenu != 3) {
		// Don't allow up and down on the Main Menu!
		if(global.battleMenu != 0) {
			if (up_key && global.battleSelectionMenu > 0) {
				global.battleSelectionMenu -= 1;
			}	
		
			if (down_key) {
				global.battleSelectionMenu += 1;
			}	
		}
	} else if(global.battleMenu == 2.5) {
		if (left_key) {
			global.battleSelectionMenu -= 1;
		}
		
		if (right_key) {
			global.battleSelectionMenu += 1;
		}	
	} else if(global.battleMenu == 3) {
		if (up_key && global.battleSelectionMenu > 0 && global.battleSelectionMenu != 1) {
			global.battleSelectionMenu -= 2;
		}	
		
		if (down_key) {
			global.battleSelectionMenu += 2;
		}	
		
		if (left_key && global.battleSelectionMenu != 0) {
			global.battleSelectionMenu -= 1;
		}
		
		if (right_key) {
			global.battleSelectionMenu += 1;
		}		
	} else {
		if (up_key && global.battleSelectionMenu > 0) {
			global.battleSelectionMenu -= 2;
		}	
		
		if (down_key) {
			global.battleSelectionMenu += 2;
		}	
		
		if (left_key && global.battleMenu != 2) {
			global.battleSelectionMenu -= 1;
		}
		
		if (right_key) {
			global.battleSelectionMenu += 1;
		}	
	}
	
	// Confirm an input
	if(confirm_key && !oBulletBoard.game_has_ended) {
		// Leave battle if battle has ended 
		if(oBulletBoard.battleEnd && oBulletBoard.battleEndDelay == 0) {
			oBulletBoard.battleEnd = false;
			oBulletBoard.battleEndDelay = 120;
			BattleFlee();
		}
		
		//Check for no items, play a different sound for invalid option
		if(global.battleSelectionMenu == 2 && array_length(global.item) == 0) {
			audio_play_sound(snd_menu_close, 1, false);
		} else {
			//Play Default Sound
			audio_play_sound(snd_menu_close, 1, false);
		}
		
		switch global.battleMenu {
			case 0:
				// FIGHT, ACT, ITEM, MERCY
				global.battleMenu = (global.battleSelectionMenu + 1);
				if (global.battleSelectionMenu == 2 && array_length(global.item) == 0) {
					global.battleMenu = 0;
					exit;
				}
				
				// Keeps your original option in mind on the four buttons at the bottom
				BelowUIReferenceNum = global.battleSelectionMenu;
				
				// Sets your input action back to the first option
				global.battleSelectionMenu = 0;
				
				// You MUST include this to get out of the loop, otherwise your action will not work
				break;
			case 1:
				// Target bar menu
				MonsterReferenceNum = global.battleSelectionMenu;
				global.MRN = MonsterReferenceNum;
				// FIGHT Command
				with (global.monster[global.MRN]) {
					global.monster[global.MRN].alarm[0] = 1;
				}
				global.battleMenu = -2;
				global.battleSelectionMenu = -1;
				
				//Hide the Fight UI
				oBulletBoard.Fight.visible = false;
				
				// Set the soul to be in a shooting state
				global.soulCanShoot = true;
				break;
			case 2:
				// ACT menu
				MonsterReferenceNum = global.battleSelectionMenu;
				global.MRN = MonsterReferenceNum;
				global.battleMenu = 2.5;
				global.battleSelectionMenu = 0;
				break;
			case 2.5:
				// ACT commands
				with (global.monster[global.MRN]) {
					event_user(global.battleSelectionMenu);
				}
				global.battleMenu = -2;
				global.battleSelectionMenu = -1;
				break;
			case 3:
				// Item menu
				UseItem(global.battleSelectionMenu);
				global.battleMenu = -2;
				global.battleSelectionMenu = -1;
				break;
			case 4:
				// Spare or Flee from a monster
				switch (global.battleSelectionMenu)
				{
					//Spare Monster
				    case 0:
						global.battleMenu = -1;
						global.battleSelectionMenu = 0;
				        //Add this enemies overworld object to the defeated list
						array_push(global.overworld_enemies_defeated, global.monster[MonsterReferenceNum].OverworldObject);
						enemySpared = true;
						
						//BattleFlee();
				    break;

					//Flee Monster
				    case 1:
						global.battleMenu = -1;
						global.battleSelectionMenu = 0;
						BattleFlee();
				    break;

				    default:
				        global.battleMenu = -1;
						global.battleSelectionMenu = 0;
				}
				break;
		}
	}
	
	if(confirm_key && oBulletBoard.game_has_ended && !gameOverTimerSet) {
		gameOverTimerSet = true;
	}
	
	if(gameOverTimerSet) {
		gameOverTimer--;
	}
	
	if(gameOverTimer <= 0) {
		BattleFlee();
	}

#endregion

}