if (instance_exists(Dialogue)) {
	ReadyForBattle = true;
} else {
	if (ReadyForBattle) {
		ReadyForBattle = false;
		alarm[0] = 1;
	}
}

if (oButtonController.enemySpared) {
	image_alpha = 0.5;
	
	image_alpha -= 0.02;

    // Emit smoke particles as the enemy fades
    if (image_alpha > 0) {
        part_particles_create(part_system, x, y, part_smoke, 20); // Spawn 2 smoke particles
    }

    if (image_alpha <= 0) {
        instance_destroy();
    }
}

/* No smoke if enemy is spared
if (oButtonController.enemyKilled) {
	image_alpha = 0.5;
	
	image_alpha -= 0.02;

    // Emit smoke particles as the enemy fades
    if (image_alpha > 0) {
        part_particles_create(part_system, x, y, part_smoke, 20); // Spawn 2 smoke particles
    }

    if (image_alpha <= 0) {
        instance_destroy();
    }
}*/