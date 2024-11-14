/// @function BulletPattern_Cross

function Bullet_Cross() {
	Horizontal_Line();
	Vertical_Line();
}

function Horizontal_Line() {
	oMonsterBulletGenerator.spawn_interval = 15;
    var _bullet2 = instance_create_layer(500, 300, "Bullets", oMonsterBullet);
    _bullet2.direction = 180; // Adjust direction as needed (270 = downward)
    _bullet2.speed = bullet_speed;
    _bullet2.damage = bullet_damage;
}

function Vertical_Line() {
	oMonsterBulletGenerator.spawn_interval = 45;
	var _bullet1 = instance_create_layer(x, y, "Bullets", oMonsterBullet);
    _bullet1.direction = 270; // Adjust direction as needed (270 = downward)
    _bullet1.speed = bullet_speed;
    _bullet1.damage = bullet_damage;
}