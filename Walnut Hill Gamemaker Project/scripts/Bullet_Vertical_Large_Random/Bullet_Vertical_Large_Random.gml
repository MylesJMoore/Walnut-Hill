/// @function Bullet_Vertical_Large_Random

function Bullet_Vertical_Large_Random() {
	oMonsterBulletGenerator.default_spawn_interval = 35;
	var _horizontal_buffer = choose(20, -20, 40, 30, -30);
    var _bullet2 = instance_create_layer(300 + _horizontal_buffer, 250, "Bullets", oMonsterBullet);
    _bullet2.direction = 270; // Adjust direction as needed (270 = downward)
	_bullet2.image_xscale = 3;
	_bullet2.image_yscale = 3;
    _bullet2.speed = 1.5;
    _bullet2.damage = bullet_damage;
}