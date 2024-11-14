/// @function Bullet_Horizontal_Large_Random

function Bullet_Horizontal_Large_Random() {
	oMonsterBulletGenerator.default_spawn_interval = 35;
	var _vertical_buffer = choose(20, -20, 40, 30, -30);
    var _bullet2 = instance_create_layer(500, 300 + _vertical_buffer, "Bullets", oMonsterBullet);
    _bullet2.direction = 180; // Adjust direction as needed (270 = downward)
	_bullet2.image_xscale = 3;
	_bullet2.image_yscale = 3;
    _bullet2.speed = 1.5;
    _bullet2.damage = bullet_damage;
}