/// @param text_id
function gameText(_text_id) {
	switch(_text_id) {
		//=====================================================================//
		case "npc 1": 
			createTextPage("Hi! I'm Mrs Catty!", "ms catty", false,12);
			setTextColor(0,7,c_dkgray,c_dkgray,c_dkgray,c_dkgray);
			setTextColor(7,17,c_fuchsia,c_fuchsia,c_fuchsia,c_fuchsia);
			setTextColor(17,19,c_dkgray,c_dkgray,c_dkgray,c_dkgray);
			createTextPage("So, Myles... any progress on your game?", "ms catty", false,12);
			setTextColor(0,12,c_dkgray,c_dkgray,c_dkgray,c_dkgray);
			setTextColor(13,38,c_orange,c_orange,c_orange,c_orange);
			setTextFloat(13,38);
			setTextColor(38,39,c_dkgray,c_dkgray,c_dkgray,c_dkgray);
			createTextPage("Or are you still stuck on level one?", "ms catty", false,12); 
			setTextColor(0,100,c_dkgray,c_dkgray,c_dkgray,c_dkgray);
			createTextPage("Spooky! Lots of ghosts on level one.", "ms catty", false,12); 
			setTextColor(0,6,c_orange,c_orange,c_orange,c_orange);
			setTextColor(6,16,c_dkgray,c_dkgray,c_dkgray,c_dkgray);
			setTextColor(16,22,c_purple,c_purple,c_purple,c_purple);
			setTextColor(23,100,c_dkgray,c_dkgray,c_dkgray,c_dkgray);
			setTextShake(0,100);
			break;
		//=====================================================================//
		case "npc 2": 
			createTextPage("Yo! It's Mr Catty here.", "mr catty", false,12);
			setTextColor(0,100,c_dkgray,c_dkgray,c_dkgray,c_dkgray);
			createTextPage("There's just a few more lines of code to go!", "mr catty", false,12); 
			setTextColor(0,100,c_dkgray,c_dkgray,c_dkgray,c_dkgray);
			createTextPage("There's still a looot more to do...", "mr catty", false,12); 
			setTextColor(0,100,c_dkgray,c_dkgray,c_dkgray,c_dkgray);
			createTextPage("...but I'm just sooo happy to see you doing game dev.", "mr catty", false,10); 
			setTextColor(0,100,c_dkgray,c_dkgray,c_dkgray,c_dkgray);
			break;
		//=====================================================================//
		case "npc 3": 
			createTextPage("So honey what would you like for dinner?", "mr catty chatting");
			createTextPage("Hmmm... not sure! Wanna get tacos?", "ms catty chatting", true);
			createTextPage("Nah. What about super burgers at Grillsby's?", "mr catty chatting"); 
			createTextPage("That could be good. I really hope they have the ice cream machine working...", "ms catty chatting", true);
			createTextPage("...last time Grillsby said he would fix it!", "ms catty chatting", true);
			createTextPage("Guess we'll have to 'Grill' him about it... heh heh.", "mr catty chatting");
			createTextPage("...sigh.. why...", "ms catty chatting", true);
			break;
		//=====================================================================//
		case "npc 4": 
			createTextPage("Mr. Catty here with a question!", "mr catty", false,12);
			setTextColor(0,50,c_dkgray,c_dkgray,c_dkgray,c_dkgray);
			createNpcEmote(EMOTE_QUESTION);
			createTextPage("Should we make an RPG?", "mr catty", false,12,spr_textbox);
			setTextColor(0,50,c_dkgray,c_dkgray,c_dkgray,c_dkgray);
			createOption("Hell yeah!", "npc 4 - yes"); 
			createOption("Nah you stink!", "npc 4 - no");
			createPlayerEmote(EMOTE_THINKING);
			break;
			case "npc 4 - yes": 
				removeNpcEmote(EMOTE_QUESTION);
				removePlayerEmote(EMOTE_THINKING);
				createNpcEmote(EMOTE_REACTION);
				createTextPage("Sweet! This text option thing is helpful!", "mr catty", false,12);
				setTextColor(0,50,c_dkgray,c_dkgray,c_dkgray,c_dkgray);
			break;
			case "npc 4 - no": 
				removeNpcEmote(EMOTE_QUESTION);
				removePlayerEmote(EMOTE_THINKING);
				createNpcEmote(EMOTE_REACTION);
				createTextPage("Too bad! We're still doing it!", "ms catty 2", true, 12);
				setTextColor(0,50,c_dkgray,c_dkgray,c_dkgray,c_dkgray);
			break;
		//=====================================================================//
		case "words of wisdom": 
			global.words_of_wisdom = irandom(array_length(global.player_menu_messages) - 1);
			var wordsOfWisdomString = global.player_menu_messages[global.words_of_wisdom][0];
			var startColor = string_pos("R", wordsOfWisdomString) - 1;
			if(startColor < 0) {
				startColor = 0;
			}
			var endColor = (startColor) + 10;
			createTextPage(wordsOfWisdomString, "words of wisdom", false,12, noone, true);
			setTextColor(startColor,endColor,c_dkgray,c_white,c_silver,c_dkgray);
			//=====================================================================//
		case "title opening text": 
			var title_index = global.title_opening_image_index;
			if(title_index < (array_length(global.title_opening_text)))
			{
				createTextPage(global.title_opening_text[title_index][0], "title opening text" , false, 12, noone, true);
			}
			//setTextColor(startColor,endColor,c_dkgray,c_white,c_silver,c_dkgray);
	}
}