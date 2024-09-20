var border_left = 320 - (oBulletBoard.current_width/2);
var border_right = 320 + (oBulletBoard.current_width/2);
var border_up = 384 - oBulletBoard.current_height;
var border_down = 384;

//Hide Act Sub-Menu
oBulletBoard.ActML.visible = false;
oBulletBoard.ActMR.visible = false;

if !Taunted {
	Dialogue = instance_create_depth(border_left + 30, border_up + 15, -202, oTextElement); //-4000
	Dialogue.TextToDraw = "* You flex.";
	Dialogue.TextQueue[0] = "* Toriel is embarrassed.";
	Dialogue.TextQueue[1] = "* Toriel's ATTACK increased!";
	Attack += 2;
	Dialogue.CanAdvance = true;
	Taunted = true;
}
else {
	Dialogue = instance_create_depth(border_left + 30, border_up + 15, -202, oTextElement); //-4000
	Dialogue.TextToDraw = "* You say something disturbing...";
	Dialogue.TextQueue[0] = "* ...but she ignores you!";
	Dialogue.CanAdvance = true;
}