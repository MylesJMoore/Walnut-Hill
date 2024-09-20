MyName = "Toriel";
OverworldObject = oMovingDancer;
EnemyMusicIndex = 0;
MyHP = 120;
MyMaxHP = 120;
CheckDescription[0] = "* Toriel&* Just a test monster.";
CheckDescription[1] = "* She's just teaching you& how to play.";
SpeechBubble[0] = "I don't really&want to do &this but you &leave me no &choice!";
Act[0] = "Check";
Act[1] = "Annoy";
ShowHealthBar = true;
CanSpare = true;
Attack = 4;
Defense = 0;
Dialogue = noone;
SpeechBubbleDialogue = noone;
ReadyForBattle = false;

//Monster Status
Taunted = false;
Killed = false;

//Effects
ShakeEffect = 0;
Myself = -1;
DodgeAnim = 0;
Siner = 0;

//Miscellaneous
MySpeechBubble = noone;
Turn = 0;

//Enemy Music
oSFX.enemyName = MyName;
oSFX.enemyMusicIndex = EnemyMusicIndex;
oSFX.enemyBattleThemeLoop = true;
global.current_enemy_name = MyName;
global.current_enemy_overworld_obj = OverworldObject;
global.current_enemy_music_index = EnemyMusicIndex;

//Sprite Adjustments
image_xscale = 1.5;
image_yscale = 1.5;