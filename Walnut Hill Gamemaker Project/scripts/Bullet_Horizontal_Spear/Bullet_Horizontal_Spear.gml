/// @function Bullet_Horizontal_Spear

function Bullet_Horizontal_Spear(_direction = 180, _x = 500, _y = 300) {
	oMonsterBulletGenerator.default_spawn_interval = 45;
	var _vertical_buffer = choose(15, -15, 30,-30, 45, -45);
	var bullet = instance_create_layer(_x, _y + _vertical_buffer, "Bullets", oMonsterSpear);
    bullet.image_angle = _direction;
	bullet.direction = _direction; // Adjust direction as needed (270 = downward)
	bullet.speed = 3;
	bullet.gravity = 0;
	bullet.damage = bullet_damage;
   
}