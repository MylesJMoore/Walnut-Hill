//Player Variables
xspeed = 0;
yspeed = 0;
move_speed = 1;

//Player Sprites with Macros
sprite[RIGHT] = PLAYER_RIGHT;
sprite[UP] = PLAYER_UP;
sprite[LEFT] = PLAYER_LEFT;
sprite[DOWN] = PLAYER_DOWN;
sprite[IDLERIGHT] = PLAYER_IDLERIGHT;
sprite[IDLEUP] = PLAYER_IDLEUP;
sprite[IDLELEFT] = PLAYER_IDLELEFT;
sprite[IDLEDOWN] = PLAYER_IDLEDOWN;
face = DOWN;

//Player Sprite Direction Information
sprite_information[RIGHT] = "Right";
sprite_information[UP] = "Up";
sprite_information[LEFT] = "Left";
sprite_information[DOWN] = "Down";
sprite_information[IDLERIGHT] = "Right";
sprite_information[IDLEUP] = "Up";
sprite_information[IDLELEFT] = "Left";
sprite_information[IDLEDOWN] = "Down";
current_direction = "Down";

//Player Recorded Positions for NPC Follow
recordedPositions = 94;
for (var i = recordedPositions -1; i >= 0; i--) {
	pos_x[i] = x;
	pos_y[i] = y;
	pos_face[i] = IDLEDOWN;
}


