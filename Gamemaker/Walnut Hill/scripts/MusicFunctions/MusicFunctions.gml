/// @function setSongInGame
/// @param _song = set to any song (including "noone" to stop or fade the track out)
/// @param _fadeOutCurrentSong = time (in frames) the current song (if playing) will take to fade out
/// @param _fadeIn = time (in frames) the target song (if not "noone") will take to fade in
function setSongInGame(_song, _fadeOutCurrentSong = 0, _fadeIn = 0) {
	with(oJukebox) 
	{
		targetSongAsset = _song;
		endFadeOutTime = _fadeOutCurrentSong;
		startFadeInTime = _fadeIn;
	}
}