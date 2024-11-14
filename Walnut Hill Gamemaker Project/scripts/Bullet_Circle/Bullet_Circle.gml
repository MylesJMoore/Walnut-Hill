/// @function BulletPattern_Circle

function Bullet_Circle() {
    var num_bullets = 6; // Number of bullets in the circle
    for (var i = 0; i < num_bullets; i++) {
        var angle = i * (360 / num_bullets);
        var bullet = instance_create_layer(x, y, "Bullets", oMonsterBullet);
        bullet.direction = angle;
        bullet.speed = bullet_speed;
        bullet.damage = bullet_damage;
    }
}
