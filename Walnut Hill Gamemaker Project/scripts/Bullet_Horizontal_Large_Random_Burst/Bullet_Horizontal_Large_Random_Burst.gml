/// @function Bullet_Horizontal_Large_Random_Burst

function Bullet_Horizontal_Large_Random_Burst() {
	oMonsterBulletGenerator.default_spawn_interval = 50;
	var _vertical_buffer = choose(20, -20, 40, 30, -30);
    var _bullet2 = instance_create_layer(500, 300 + _vertical_buffer, "Bullets", oMonsterBurstBullet);
    _bullet2.direction = 180; // Adjust direction as needed (270 = downward)
	_bullet2.image_xscale = 3;
	_bullet2.image_yscale = 3;
    _bullet2.speed = 1.5;
    _bullet2.damage = bullet_damage;
}

function Bullet_Collision_Burst(_x, _y) {
    var num_bullets = 2; // Number of random bullets to spawn
    for (var i = 0; i < num_bullets; i++) {
        var bullet = instance_create_layer(_x, _y, "Bullets", oMonsterBullet);
        bullet.direction = irandom_range(25, 90); // Random direction
        bullet.speed = oMonsterBulletGenerator.bullet_speed;
        bullet.damage = oMonsterBulletGenerator.bullet_damage;
		bullet.gravity = .15;
    }
}