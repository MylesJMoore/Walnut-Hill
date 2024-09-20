//Get the volume
var _sfxVol = global.sfx_master_volume;

#region Title Intro Sound
//Inventory Can't Move Sound
if (titleScreenIntro == true) 
{
	//Play Sound
	var _snd = audio_play_sound(snd_title_intro, 8, false);
	audio_sound_gain(_snd, _sfxVol, 0);
	
	//Reset Variable
	titleScreenIntro = false;
}
#endregion

#region Pickup Sound
//Pickup Sound
if (pickupSound == true) 
{
	//Play Sound
	var _snd = audio_play_sound(snd_pickup, 8, false);
	audio_sound_gain(_snd, _sfxVol, 0);
	
	//Reset Variable
	pickupSound = false;
}
#endregion

#region Button Press
//Button Press
if (buttonPressSound == true) 
{
	//Play Sound
	var _snd = audio_play_sound(snd_button_press, 8, false);
	audio_sound_gain(_snd, _sfxVol, 0);
	
	//Reset Variable
	buttonPressSound = false;
}
#endregion

#region Button Release
//Button Release
if (buttonReleaseSound == true) 
{
	//Play Sound
	var _snd = audio_play_sound(snd_button_release, 8, false);
	audio_sound_gain(_snd, _sfxVol, 0);
	
	//Reset Variable
	buttonReleaseSound = false;
}
#endregion

#region Looping SFX
//Looping SFX
//Turn sound effect on
if (sfxSoundLoop == true && !audio_is_playing(sfxSoundLoopInstance)) 
{
	sfxSoundLoopInstance = audio_play_sound(snd_robot_loop, 6, true);
}
#endregion

#region Fade In/Fade Out
//Beach Fade In/Out
//Start the loop and turn up the volume
if (beachSoundLoop == true)
{
	if (!audio_is_playing(beachSoundLoopInstance))
	{
		beachSoundLoopInstance = audio_play_sound(snd_beach, 6, true);
	}
	
	if (beachSoundLoopVolume < 1)
	{
		beachSoundLoopVolume += beachSoundLoopSpeed;
	} else {
		beachSoundLoopVolume = 1;
	}
}

//Fade out and turn off
if (beachSoundLoop == false)
{

	if (beachSoundLoopVolume > 0)
	{
		beachSoundLoopVolume -= beachSoundLoopSpeed;
	} else {
		beachSoundLoopVolume = 0;
	}
	
	if (beachSoundLoopVolume <= 0) 
	{
		audio_stop_sound(beachSoundLoopInstance);
	}
}

//Set the volume
if(audio_is_playing(beachSoundLoopInstance))
{
	audio_sound_gain(beachSoundLoopInstance, beachSoundLoopVolume * _sfxVol, 0);
}

//Reset Variable
beachSoundLoop = false;
#endregion

#region Inventory Menu Open Sound
//Inventory Menu Open Sound
if (inventoryMenuOpenSound == true) 
{
	//Play Sound
	var _snd = audio_play_sound(snd_menu_open, 8, false);
	audio_sound_gain(_snd, _sfxVol, 0);
	
	//Reset Variable
	inventoryMenuOpenSound = false;
}
#endregion

#region Inventory Menu Close Sound
//Inventory Menu Close Sound
if (inventoryMenuCloseSound == true) 
{
	//Play Sound
	var _snd = audio_play_sound(snd_menu_close, 8, false);
	audio_sound_gain(_snd, _sfxVol, 0);
	
	//Reset Variable
	inventoryMenuCloseSound = false;
}
#endregion

#region Inventory Menu Move Sound
//Inventory Menu Move Sound
if (inventoryMenuMoveSound == true) 
{
	//Play Sound
	var _snd = audio_play_sound(snd_menu_move, 8, false);
	audio_sound_gain(_snd, _sfxVol, 0);
	
	//Reset Variable
	inventoryMenuMoveSound = false;
}
#endregion

#region Inventory Menu Confirm Sound
//Inventory Confirm Move Sound
if (inventoryMenuConfirmSound == true) 
{
	//Play Sound
	var _snd = audio_play_sound(snd_menu_confirm, 8, false);
	audio_sound_gain(_snd, _sfxVol, 0);
	
	//Reset Variable
	inventoryMenuConfirmSound = false;
}
#endregion

#region Inventory Menu Can't Move Sound
//Inventory Can't Move Sound
if (inventoryMenuCantMoveSound == true) 
{
	//Play Sound
	var _snd = audio_play_sound(snd_menu_cant_select, 8, false);
	audio_sound_gain(_snd, _sfxVol, 0);
	
	//Reset Variable
	inventoryMenuCantMoveSound = false;
}
#endregion

#region Title Opening
//Title Opening
if (titleOpeningLoop == true) 
{
	//Play Sound
	var _snd = audio_play_sound(snd_undertale_intro, 8, true);
	audio_sound_gain(_snd, _sfxVol, 0);
	
	//Reset Variable
	titleOpeningLoop = false;
}
#endregion

#region Enemy Battle Theme
//Battle Theme
if (enemyBattleThemeLoop == true && enemyName != "") 
{
	//Get battle theme for this specific enemy
	enemySound = getEnemyMusic(enemyName,enemyMusicIndex);
	global.current_enemy_music = enemySound;
	
	//Play Sound
	var _snd = audio_play_sound(enemySound, 8, true);
	audio_sound_gain(_snd, _sfxVol, 0);
	
	//Reset Variables
	enemySound = noone;
	enemyName = "";
	enemyMusicIndex = 0;
	enemyBattleThemeLoop = false;
}
#endregion

#region Battle Bullet Sound
//Battle Bullet Sound
if (bulletSound == true) 
{
	//Get battle theme for this specific enemy
	bulletSound = getEnemyBulletSound(global.current_enemy_name,global.current_enemy_bullet_sound_index);
	
	//Play Sound
	var _snd = audio_play_sound(bulletSound, 8, false);
	audio_sound_gain(_snd, _sfxVol, 0);
	
	//Reset Variable
	bulletSound = false;
}
#endregion