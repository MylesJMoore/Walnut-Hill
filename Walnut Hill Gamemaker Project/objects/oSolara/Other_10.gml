var border_left = 320 - (oBulletBoard.current_width/2);
var border_right = 320 + (oBulletBoard.current_width/2);
var border_up = 384 - oBulletBoard.current_height;
var border_down = 384;

//Hide Act Sub-Menu
oBulletBoard.ActML.visible = false;
oBulletBoard.ActMR.visible = false;

Dialogue = instance_create_depth(border_left + 30, border_up + 15, -500, oTextElement); //-4500
Dialogue.TextToDraw = CheckDescription[0];
Dialogue.TextQueue[0] = CheckDescription[1];
Dialogue.CanAdvance = true;