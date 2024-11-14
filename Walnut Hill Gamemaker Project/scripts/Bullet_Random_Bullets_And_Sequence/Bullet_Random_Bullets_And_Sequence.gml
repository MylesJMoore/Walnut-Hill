/// @function Bullet_Random_Bullets_And_Sequence

function Bullet_Random_Bullets_And_Sequence() {
    var bullet = instance_create_layer(x, y, "Bullets", oMonsterBullet);
    bullet.direction = 270; // Adjust direction as needed (270 = downward)
    bullet.speed = bullet_speed;
    bullet.damage = bullet_damage;
}