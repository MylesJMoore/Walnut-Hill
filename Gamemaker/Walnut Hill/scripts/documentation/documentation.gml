function getDocumentation()
{
	player = [
		"************************* Player *************************",
		"Player supports both Controller and Keyboard movement",
		"Follower Creation lives in the player object",
		"Players last moves are saved in an array for the follower objects",
		"Followers are destroyed and created to not have duplicates when leaving and entering a room",
		"Animations/Sprites are determined by spriteMacros",
		"Can set player direction in cutscenes"
	];
	
	followers = [
		"","************************* Followers *************************",
		"All follower sprites are created in the player object",
		"Follower sprites are determined by spriteMacros",
		"Can set follower direction in cutscenes"
	];
	
	cutscenes = [
		"","************************* Cutscenes *************************",
		"Cutscene Trigger -> TriggerCutscene() -> 'Example Cutscene Object' -> Cutscene Camera",
		"Cutscene Camera is almost like a real camera, moving that will move it on the screen",
		"After the cutscene ends, the camera returns to following the player",
		"Can set Follower/Player directions",
		"You MUST pass in the cutscene macro in the creation object in the room or the cutscene will not work!",
		"Obj_speakblock has a cleanup function called removeAllEmotes to clean up all emotes in the room."
	];
	
	dialogue = [
		"","************************* Dialogue *************************",
		"ALL Game Dialogue lives in gameText.gml",
		"ALL Game Dialogue settings such as textbox sprite, speaker sprite, dialogue sound, speaker side; live in gameTextSettings.gml",
		"ALL Emotes macro options live in emoteMacros",
		"To create a textbox for any preset game dialogue do this -----> createTextbox('npc 4');",
		"Text can have branching dialogue choices",
		"Text color can be set by specifying string range and colors ----> setTextColor(7,17,c_fuchsia,c_fuchsia,c_fuchsia,c_fuchsia);",
		"Text can float by specifying string range ----> setTextFloat(13,38);",
		"Text can shake by specifying string range ----> setTextShake(0,100);",
		"You can specify an emote by doing this ----> setTextEmote(obj_emote_thinking);",
		"You can remove an emote by doing this ----> deleteTextEmote(obj_emote_thinking);",
		"You set the emote_x and emote_y on the creation code of the speakblock to move it, depending on sprite location",
		"You can move textbox text up or down using optional param in createTextPage()",
		"Example Dialogue Option: createTextPage('Hi! I'm Mrs Catty!', 'ms catty', false, 12);",
	];
	
	items = [
		"","************************* FIXED *************************",
		" - Main objects are oItemManager and oItemOverworld",
		" - Can add items to the game via gameItems under Game Settings",
		" - All items added to the room MUST HAVE: item and item_id",
		" - item = global.item_list.bomb;",
		" - item_id = \"items1\"; <--- This should be the 'room_name#'",
		" - CURRENT player inventory is stored in global.player_item_inventory",
		" - Can modify Inventory Menu textboxes IN ---> oItemManager",
		" - Textbox width and height and sprite can be changed and may need to be tweaked to look good",
	]; 
	
	fixed = [
		"","************************* COMPLETED *************************",
		" - Specify a cutscene via param to TriggerCutscene()",
		" - Rename oUndertaleCutsceneTrigger ",
		" - Clean up Scripts names. PascalCase for helper functions. Snake_Case for Macros. camelCase for Modifable things like game text.",
		" - Added emotes to dialogue system",
		" - Emotes above player",
		" - Add ability to set choice textboxes separately",
		" - Add ability to add a buffer to text in textboxes",
		" - Enhanced sliders and added in custom slider bar",
		" - Enhanced dialogue boxes and added custom UI art using nine slice",
		" - Added a dialogue indicator when page is done typing",
		" - Add sound to using an item",
		" - Add sound to moving in item menu",
		" - Add sound to opening item menu",
		" - Add sound to closing item menu",
		" - Add sound to picking up items",
		" - Added a Title screen like Undertale with sound!!",
		" - Bug when going to item menu from player menu, item automatically gets used",
		" - Fix visual bug in Battle Menu when using ACT",
		" - Add /// @param _param and /// @function functionNameHere to all functions",
		" - Start Music in battle room",
		" - End Music in battle room when leaving",
		" - Add FUNCTIONALITY to FLEE",
		" - Return player back to previous room with x,y when battle is done or player flees",
		" - Controller Support in Battle Menu",
		" - Add SFX sounds to Bullet Sequence when bullets are moving",
		" - Create 3 Bullet Patterns that are randomly used by Test Enemy",
		" - Create Example Bullet Sequence that can hurt the Soul",
		" - Add SFX sounds to Soul when bullets are moving",
		" - Inventory Items show in ITEM Menu",
		" - Player can create bombs based on player face direction",
		" - Add an Array list for Enemy Sequences",
		" - START BATTLE WITH UNDERTALE HEART FLASHING BATTLE INTRO WITH SOUND (use StartBattle())",
		" - Bug in cave room when fleeing after battle trigger, also make trigger smart after you flee",
		" - Add a second test enemy",
		" - Add a macro list for Enemies",
		" - Dialogue bubble in battle room on Enemy",
		" - Clean up BattleSettings to be dynamic with Monsters",
		" - Change Enemy sprite/animation based on battle flow or randomize it",
		" - Clean up SOUL hurt timing and projectile hitboxes",
		" - Set up STATS for Player in Menu",
		" - Consolidate Player Items and Player stats in a new object thats not oGame",
	]; 

	todos = [
		"","************************* TODOS *************************",
		" - [HOLD] Add in Sequence Support with Cutscene System",
		" - [HOLD] Followers can position during cutscenes",
		" - [HOLD] Emotes above specific followers",
		" - [HOLD] Reference new globals in oBulletBoard and clean up code",
		" - [HOLD]Add FUNCTIONALITY to ITEMS",
		" - Controller support in battle menu",
		" - Set up SOUL selection for Player in Menu",
		" - Add FUNCTIONALITY to ATTACK",
		" - Add FUNCTIONALITY to SPARE",
		" - Add FUNCTIONALITY to ACT",
		" - Change battle box text based on battle flow or randomize values",
		" - Save improvements",
	];
	
	//Create Documentation Array
	documentationHeader = ["+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"];
	documentationFooter = ["","============================================================="];
	
	// Step-by-step concatenation
    var _documentation = array_concat(documentationHeader, player);
    _documentation = array_concat(_documentation, followers);
    _documentation = array_concat(_documentation, cutscenes);
    _documentation = array_concat(_documentation, dialogue);
	_documentation = array_concat(_documentation, items);
    _documentation = array_concat(_documentation, fixed);
    _documentation = array_concat(_documentation, todos);
    _documentation = array_concat(_documentation, documentationFooter);
	_documentation = array_concat(_documentation, documentationHeader);
    
    // Display Documentation Text in console
    for (var i = 0; i < array_length(_documentation); i++) {
        show_debug_message(_documentation[i]);
    }
}