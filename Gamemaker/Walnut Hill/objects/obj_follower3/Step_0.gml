// Move Follower
x = obj_player.pos_x[recordPosition];
y = obj_player.pos_y[recordPosition];

//Determine Follower Sprite
face = obj_player.pos_face[recordPosition];
if (obj_player.xspeed == 0 && obj_player.yspeed == 0) {
	switch (face)
	{
	    case RIGHT:
	        face = IDLERIGHT;
	    break;

	    case LEFT:
	        face = IDLELEFT;
	    break;
    
	    case UP:
	        face = IDLEUP;
	    break;
		
		case DOWN:
	        face = IDLEDOWN;
	    break;
	}
}

//Set Follower Sprite and Depth
sprite_index = sprite[face];
depth = -bbox_bottom;

//Check if we're in cutscene, and override to that face
if(global.in_cutscene) {
	sprite_index = sprite[global.follower3_cutscene_face];
}
