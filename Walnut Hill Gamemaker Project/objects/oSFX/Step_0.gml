//Stop Title Opening Music
if(room != rm_title_introduction && audio_is_playing(snd_undertale_intro)) 
{
	audio_stop_sound(snd_undertale_intro);
}

//Stop Battle Music
if(room != rm_battle && audio_is_playing(global.current_enemy_music)) 
{
	audio_stop_sound(global.current_enemy_music);
}
