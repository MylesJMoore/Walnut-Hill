/// @function TurnOffSoulSelectionMenu
function TurnOffSoulSelectionMenu(playSound = true) {
	if(global.open_soul_selection) {
		global.open_soul_selection = false;
		
		if(playSound) {
			//Play Sound effect
			oSFX.inventoryMenuCloseSound = true;
		}
	}
}

/// @function TurnOnSoulSelectionMenu
function TurnOnSoulSelectionMenu(playSound = true) {
	if(!global.open_soul_selection) {
		global.open_soul_selection = true;
		
		if(playSound) {
			//Play Sound effect
			oSFX.inventoryMenuOpenSound = true;
		}
	}
}

/// @function getSoulName
function getSoulName(_index) {
	return global.soul_lookup[_index];
}

/// @function getSoulNameOffset
function getSoulNameOffset(_name) {
	var _offset = 0;
	switch (_name)
	{
	    case "Resilience":
	        _offset = RESILIENCE;
	    break;

	    case "Determination":
	        _offset = DETERMINATION;
	    break;
		
		case "Bravery":
	        _offset = BRAVERY;
	    break;
		
		case "Justice":
	        _offset = JUSTICE;
	    break;
		
		case "Kindness":
	        _offset = KINDNESS;
	    break;
		
		case "Patience":
	        _offset = PATIENCE;
	    break;
		
		case "Integrity":
	        _offset = INTEGRITY;
	    break;
		
		case "Perseverance":
	        _offset = PERSEVERANCE;
	    break;
	}
	
	return _offset;
}

/// @function getSoulDescription
function getSoulDescription(soul_id) {
    switch(soul_id) {
        case 0: return " The Chrome Soul";
        case 1: return "When Resilience is paired with Determination, the result is unbreakable willpower. A soul that rises no matter how many times it falls.";
        case 2: return "When Resilience stands beside Bravery, the result is unyielding strength and fearless courage, a soul that remains steadfast in the face of danger.";
        case 3: return "When Resilience combines with Justice, the result is a steady resolve to fight for fairness and equality, a soul that will never falter in seeking what is right.";
        case 4: return "When Resilience aligns with Kindness, the result is strength tempered by compassion, a soul that remains gentle even in the harshest storms.";
        case 5: return "When Resilience merges with Patience, the result is enduring power and calm. A soul that weathers any trial with quiet strength.";
        case 6: return "When Resilience meets Integrity, the result is unshakeable strength and unwavering principles, a soul that stands firm no matter the challenge.";
        case 7: return "When Resilience intertwines with Perseverance, the result is boundless endurance and unbreakable spirit. A soul that never gives up, no matter how difficult the path.";
        default: return "A mysterious combination of souls.";
    }
}

/// @function getSoulDescriptionColor
function getSoulDescriptionColor(soul_id) {
    switch(soul_id) {
        case 0: return c_white;
        case 1: return c_red;
        case 2: return c_orange;
        case 3: return c_yellow;
        case 4: return c_green;
        case 5: return c_aqua;
        case 6: return c_navy;
        case 7: return c_purple;
        default: return c_white;
    }
}

/// @function getSoulAttackBonus
function getSoulAttackBonus(soul_id) {
    switch(soul_id) {
        case 0: return 0;
        case 1: return 10;
        case 2: return 50;
        case 3: return 25;
        case 4: return 0;
        case 5: return 5;
        case 6: return 20;
        case 7: return 30;
        default: return 99999;
    }
}

/// @function getSoulDefenseBonus
function getSoulDefenseBonus(soul_id) {
    switch(soul_id) {
        case 0: return 0;
        case 1: return 10;
        case 2: return 0;
        case 3: return 25;
        case 4: return 50;
        case 5: return 40;
        case 6: return 20;
        case 7: return 30;
        default: return 99999;
    }
}