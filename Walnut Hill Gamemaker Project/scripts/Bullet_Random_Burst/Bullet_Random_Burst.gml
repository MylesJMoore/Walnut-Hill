/// @function Bullet_Random_Burst

function Bullet_Random_Burst() {
	var _randomNumber = irandom_range(0,2);
	var _randomBurst = [
            [200, 300],
            [300, 200],
			[400, 300]
        ];
	
    var num_bullets = 3; // Number of random bullets to spawn
    for (var i = 0; i < num_bullets; i++) {
        var bullet = instance_create_layer(_randomBurst[_randomNumber][0], _randomBurst[_randomNumber][1], "Bullets", oMonsterBullet);
        bullet.direction = irandom_range(0, 360); // Random direction
        bullet.speed = oMonsterBulletGenerator.bullet_speed;
        bullet.damage = oMonsterBulletGenerator.bullet_damage;
    }
}