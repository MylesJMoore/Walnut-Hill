// Find the player and follow their X position
if (instance_exists(oMonsterSoul)) {
    x = oMonsterSoul.x; // Set the generator's X position to match the player's X position
}

//Check if Enemy has been defeated
if (global.monster[0].MyHP <= 0) {
	alarm[0] = true;
}

//Turn off shooting before alarm ends (GAME FEEL)
if(alarm[0] == 30) {
	global.soulCanShoot = false;
}

// Countdown to spawn bullets
spawn_timer -= 1;

if (spawn_timer <= 0) {
    // Reset timer
    spawn_timer = spawn_interval;
    
    // Generate bullets based on the selected pattern
    switch (pattern) {
        case 0:
			//Bullets Straight Pattern
            Bullet_Straight();
            break;
        case 1:
			//Bullet Circle Pattern
            Bullet_Circle();
            break;
        case 2:
			//Random Bullets
            Bullet_Random();
            break;
		case 3:
			//Bullet Cross Pattern
            Bullet_Cross();
            break;
		case 4:
			//Random Burst of Bullets
            Bullet_Random_Burst();
            break;
		case 5:
			//Bullet Sequence
			StartSequence();
			break;
		case 6:
			//Random Straight Bullets + Sequence
            Bullet_Random_Bullets_And_Sequence();
			StartSequence();
            break;
		case 7:
			//Random Large Horizontal Bullets 
			HideOutsideBattlebox();
            Bullet_Horizontal_Large_Random();
            break;
		case 8:
			//Random Large Vertical Bullets 
            HideOutsideBattlebox();
            Bullet_Vertical_Large_Random();
            break;
		case 9:
			//Random Large Horizontal Bullets explode to burst
            HideOutsideBattlebox();
            Bullet_Horizontal_Large_Random_Burst();
            break;
		case 10:
			//Horizontal Spear Left
            Bullet_Horizontal_Spear();
            break;
		case 11:
			//Horizontal Spear Right
            Bullet_Horizontal_Spear(0, 125);
            break;
    }
	spawn_interval = default_spawn_interval;
}

if(hide_outside_box) {
	outside_hidden = true;
	hide_outside_box = false;
}