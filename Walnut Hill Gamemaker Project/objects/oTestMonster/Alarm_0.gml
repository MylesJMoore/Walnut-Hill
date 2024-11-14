global.border_height = 120;
global.border_width = 120;
oSoul.x = 320;
oSoul.y = 384 - (global.border_height / 2);
oSoul.visible = true;
//oSoul.image_angle = oSoul.up;
global.battle_border_width = 120;
global.battle_border_height = 120;

//Enemy Speech Bubble
var _speechx = x + 175;
var _speechy = y;
SpeechBubbleDialogue = instance_create_depth(_speechx, _speechy, -9999, oTextElement); 
SpeechBubbleDialogue.TextToDraw = SpeechBubble[0];
SpeechBubbleDialogue.CanAdvance = false;
SpeechBubbleDialogue.IsBubbleText = true;
SpeechBubbleDialogue.DefaultColour = c_black;
SpeechBubbleDialogue.DefaultFont = fUndertale;
SpeechBubbleDialogue.LineSpacing = 15;
SpeechBubbleDialogue.LetterSpacing = 7;
SpeechBubbleDialogue.BubbleBufferX = 30;
SpeechBubbleDialogue.BubbleBufferY = 9;
instance_create_depth(_speechx, _speechy, -9000, obj_speech_bubble);

//Enemy Bullet Creation
global.monster_bullet_pattern = irandom_range(0,11);
instance_create_depth(x, y, 3000, oMonsterBulletGenerator);