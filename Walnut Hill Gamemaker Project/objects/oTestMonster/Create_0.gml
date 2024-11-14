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


part_system = part_system_create();
part_smoke = part_type_create();

// Set up the smoke particle's appearance and behavior
part_type_alpha3(part_smoke, 1, 0.5, 0); // Fades out
part_type_size(part_smoke, 0.5, 1, 0, 0);
part_type_scale(part_smoke, 1, 1);
part_type_speed(part_smoke, 0.5, 1, -0.01, 0);
part_type_direction(part_smoke, 0, 360, 0, 0);
part_type_life(part_smoke, 30, 60);
part_type_color1(part_smoke, c_white);

// Option 1: Use a built-in shape
//part_type_shape(part_smoke, pt_shape_explosion);  // Built-in smoke shape

// Option 2: Use a custom smoke sprite (if you have one)
part_type_sprite(part_smoke, spr_enemy_smoke, false, false, false);