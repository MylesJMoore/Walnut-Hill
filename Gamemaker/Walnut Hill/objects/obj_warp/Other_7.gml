//Move Player to room
room_goto(target_room);
obj_player.x = target_x;
obj_player.y = target_y;
obj_player.face = target_face;

//Destroy Follower Instances
instance_destroy(obj_follower1);
instance_destroy(obj_follower2);
instance_destroy(obj_follower3);

//Reset Player Move Flag
global.player_has_moved = false;

//Reset Player Random Encounter Steps
global.player_step_count = 0;

//Reset Image Speed
image_speed = -1;