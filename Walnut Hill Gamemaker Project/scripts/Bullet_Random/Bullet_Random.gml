/// @function BulletPattern_Random

function Bullet_Random() {
    var num_bullets = 3; // Number of random bullets to spawn
    for (var i = 0; i < num_bullets; i++) {
        var bullet = instance_create_layer(x, y, "Bullets", oMonsterBullet);
        bullet.direction = irandom_range(0, 360); // Random direction
        bullet.speed = bullet_speed;
        bullet.damage = bullet_damage;
    }
}