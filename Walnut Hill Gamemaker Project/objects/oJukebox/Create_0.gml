//Global Volume Control
global.masterVolume = .5;
global.musicVolume = 1;


//Information for the song we are current playing/ trying to play
songInstance = noone;
songAsset = noone;
targetSongAsset = noone;

//How Many frames to fade out the song current playing
endFadeOutTime = 0; 

//How Many frames to fade in the new song (60 = 1 second)
startFadeInTime = 0; 

//Volume of the Song Instance
fadeInInstanceVolume = 1; 

//for fading music out and stopping songs that are no longer playing 
fadeOutInstances = array_create(0); //audio instances to fade out
fadeOutInstanceVol = array_create(0); //volumes of each individual audio instance
fadeOutInstanceTime = array_create(0); //how fast the fadeout should happen