// Bullet spawning interval (frames between spawns)
default_spawn_interval = 30;
spawn_interval = 30; // Adjust as needed for faster/slower spawn rate
spawn_timer = spawn_interval;
alarm[0] = 240;

// Bullet pattern (choose pattern by setting this variable)
pattern = global.monster_bullet_pattern; // 0 = Straight line, 1 = Circle, 2 = Random

// Other properties for bullets
bullet_speed = 2;
bullet_damage = 10;

//Make Monster Soul Visible
oMonsterSoul.image_alpha = 1;

//Flag for playing sequences
sequence_is_playing = false;

//Draw Black Rectangles around battle box
hide_outside_box = false;
outside_hidden = false;