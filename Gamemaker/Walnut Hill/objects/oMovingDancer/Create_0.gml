//Depth
depth = -bbox_bottom;

//Variables
is_moving = true;
target_x = random(room_width);
target_y = random(room_height);
touched_player = false;
pause_timer_count = 0;

//NPC Sprites
sprite[RIGHT] = sMovingDancer;
sprite[LEFT] = sMovingDancer;
sprite[IDLEDOWN] = sMovingDancer;
face = DOWN;//Depth
depth = -bbox_bottom;