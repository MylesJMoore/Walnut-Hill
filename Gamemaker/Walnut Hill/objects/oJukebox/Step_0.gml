var _finalVol = global.musicVolume * global.masterVolume;

//Play the Target Song
if (songAsset != targetSongAsset) 
{
	//Tell the old song to fade out
	if (audio_is_playing(songInstance)) 
	{
		//add our songInstance to our array of songs to fade out
		array_push(fadeOutInstances, songInstance);
		
		//add the songInstance's starting volume (so there's no abrupt change in volume)
		array_push(fadeOutInstanceVol, fadeInInstanceVolume);
		
		//add the fadeOutInstance's fade out frames
		array_push(fadeOutInstanceTime, endFadeOutTime);
		
		//Reset the songInstance and songAsset variables
		songInstance = noone;
		songAsset = noone;
	}
	
	//Play the Song, if the old song has faded out
	if (array_length(fadeOutInstances)) == 0 
	{
		if (audio_exists(targetSongAsset)) 
		{
			//Play the song and store it's instance in a variable
			songInstance = audio_play_sound(targetSongAsset, 4, true);
	
			//Start the song's volume at 0
			audio_sound_gain(songInstance, 0, 0);
			fadeInInstanceVolume = 0;
		}
	
		//Set the songAsset to match the targetSongAsset
		songAsset = targetSongAsset;
	
	}
}

//Volume Control
	//Main Song Volume
	if (audio_is_playing(songInstance)) 
	{
		//Fade the song in
		if (startFadeInTime > 0) 
		{
			if (fadeInInstanceVolume < 1) 
			{
				fadeInInstanceVolume += 1/startFadeInTime;
			} else {
				fadeInInstanceVolume = 1;
			}
		} else {
			//Immediately Start the song if the fade in time is 0 frames
			fadeInInstanceVolume = 1;
		}
	
		//Set the gain
		audio_sound_gain(songInstance, fadeInInstanceVolume * _finalVol, 0);
	}


	//Fading songs out
	for (var i = 0; i < array_length(fadeOutInstances); i++;) 
	{
		//Fade the volume
		if (fadeOutInstanceTime[i] > 0) 
		{
			if (fadeOutInstanceVol[i] > 0) 
			{
				fadeOutInstanceVol[i] -= 1 / fadeOutInstanceTime[i];
			}
		} else {
			//Immediately Cut volume to 0 otherwise
			fadeOutInstanceVol[i] = 0;
		}
		
		//Actually Set the gain
		audio_sound_gain( fadeOutInstances[i], fadeOutInstanceVol[i] * _finalVol, 0);
		
		//Stop the song when it's volume is at 0 and remove it from ALL arrays
		if (fadeOutInstanceVol[i] <= 0) 
		{
			//stop the song
			if (audio_is_playing(fadeOutInstances[i])) 
			{
				audio_stop_sound(fadeOutInstances[i]);
			}
			
			//Remove it from the arrays
			array_delete(fadeOutInstances, i, 1);
			array_delete(fadeOutInstanceVol, i, 1);
			array_delete(fadeOutInstanceTime, i, 1);
			
			//Set the loop back to 1 since we just deleted an entry
			i--;
		}
	}
	
	