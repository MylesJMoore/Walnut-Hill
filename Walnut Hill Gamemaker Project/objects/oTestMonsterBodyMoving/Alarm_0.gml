global.border_height = 120;
global.border_width = 120;
oSoul.x = 320;
oSoul.y = 384 - (global.border_height / 2);
oSoul.visible = true;
global.battle_border_width = 120;
global.battle_border_height = 120;

//Enemy Bullet Creation
global.monster_bullet_pattern = irandom_range(0,5);
instance_create_depth(x, y, 3000, oMonsterBulletGenerator);