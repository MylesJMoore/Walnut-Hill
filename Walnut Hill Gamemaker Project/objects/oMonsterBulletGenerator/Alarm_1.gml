/// @description Player has been defeated

//Make Player Soul Invisible/Unable to Shoot
oSoul.visible = false;
global.soulCanShoot = false;
oMonsterSoul.visible = false;

//Stop Battle Music
audio_stop_sound(global.current_enemy_music);

//Menu Defaults
SetBattleMenuDefaults();

//Cleanup Objects
CleanupBattleObjects();