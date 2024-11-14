/// @function TurnOffStatsMenu
function TurnOffStatsMenu(playSound = true) {
	if(global.open_stats) {
		global.open_stats = false;
		
		if(playSound) {
			//Play Sound effect
			oSFX.inventoryMenuCloseSound = true;
		}
	}
}

/// @function TurnOnStatsMenu
function TurnOnStatsMenu(playSound = true) {
	if(!global.open_stats) {
		global.open_stats = true;
		
		if(playSound) {
			//Play Sound effect
			oSFX.inventoryMenuOpenSound = true;
		}
	}
}