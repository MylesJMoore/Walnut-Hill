/// @function RemoveDefeatedOverworldEnemies
/// @description This function checks the global.overworld_enemies_defeated list for any instances of defeated enemies in the room and destroys them.

function RemoveDefeatedOverworldEnemies() {
    // Iterate through the global.overworld_enemies_defeated list
    for (var i = 0; i < array_length(global.overworld_enemies_defeated); i++) {
        // Get the object type for this enemy
        var enemy_object = global.overworld_enemies_defeated[i];
		
		if(instance_exists(enemy_object)) {
			instance_destroy(enemy_object);
		}
    }
}
