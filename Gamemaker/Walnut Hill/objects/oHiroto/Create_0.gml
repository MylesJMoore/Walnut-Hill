//Depth
depth = -bbox_bottom;

//Variables
is_moving = true;
target_x = random(room_width);
target_y = random(room_height);
touched_player = false;
pause_timer_count = 0;

//NPC Sprites
sprite[RIGHT] = s_Hiroto_walk_right;
sprite[LEFT] = s_Hiroto_walk_left;
sprite[IDLEDOWN] = sHiroto;
face = DOWN;