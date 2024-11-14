//Check if Enemy has been defeated
if (global.monster[0].MyHP <= 0) {
	//oMonsterSoul.image_alpha = 1; //Hiding the monster soul sprite
} else {
	oMonsterSoul.image_alpha = 0;
}

//Make Player Soul Invisible/Unable to Shoot
oSoul.visible = false;
global.soulCanShoot = false;

//Menu Defaults
SetBattleMenuDefaults();

//Cleanup Objects
CleanupBattleObjects()

//Turn off this Alarm
alarm[0] = false;