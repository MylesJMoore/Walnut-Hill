MyName = "Solara";
OverworldObject = oMovingDancer;
EnemyMusicIndex = 0;
MyHP = 120;
MyMaxHP = 120;
CheckDescription[0] = "* Solara&* Protector of the Ruins.";
CheckDescription[1] = "* You can feel the heat& and coldness from her.";
SpeechBubble[0] = "Rain falls...&and the sun comes out... &but this storm...& will never stop!";
SpeechBubble[1] = "Hail falls...&and the night comes. &This storm...& will never stop!";
Act[0] = "Check";
Act[1] = "Talk";
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