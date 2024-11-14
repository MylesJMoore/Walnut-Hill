//Controller
controller_down_threshold = .8;
controller_up_threshold = -.8;
controller_left_threshold = -.9;
controller_right_threshold = .9;
controller_joystick_moved = false;
controller_joystick_vertical_moved = false;

ButtonPositions_X[0] = 32;
ButtonPositions_X[1] = 185;
ButtonPositions_X[2] = 345;
ButtonPositions_X[3] = 500;

//Button Sprites
ButtonSprites[0] = sMenuFight;
ButtonSprites[1] = sMenuAct;
ButtonSprites[2] = sMenuItem;
ButtonSprites[3] = sMenuMercy;

MonsterReferenceNum = 0;
BelowUIReferenceNum = 0;

enemySpared = false;
enemyKilled = false;