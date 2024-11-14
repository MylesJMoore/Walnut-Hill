/// @function getEnemyMusic
/// @param enemy
/// @param index
/// @returns Sound asset

function getEnemyMusic(_enemy, _index = 0) {
    // Search for the enemy in the multidimensional array
    var music_list = undefined;
    for (var i = 0; i < array_length(global.enemy_music_list); i++) {
        if (global.enemy_music_list[i][0] == _enemy) {
            music_list = global.enemy_music_list[i][1];
            break;
        }
    }

    // If music list was found, validate the index and return the sound
    if (music_list != undefined) {
        if (_index < 0 || _index >= array_length(music_list)) {
            _index = 0; // Set index to 0 if out of range
        }
        return music_list[_index];
    } else {
        // Handle the case where the enemy does not exist
        return undefined;
    }
}

/// @function getEnemyBulletSound
/// @param enemy
/// @param index
/// @returns Sound asset

function getEnemyBulletSound(_enemy, _index = 0) {
    // Search for the enemy in the multidimensional array
    var sound_list = undefined;
    for (var i = 0; i < array_length(global.enemy_bullet_sound_list); i++) {
        if (global.enemy_bullet_sound_list[i][0] == _enemy) {
            sound_list = global.enemy_bullet_sound_list[i][1];
            break;
        }
    }

    // If music list was found, validate the index and return the sound
    if (sound_list != undefined) {
        if (_index < 0 || _index >= array_length(sound_list)) {
            _index = 0; // Set index to 0 if out of range
        }
        return sound_list[_index];
    } else {
        // Handle the case where the enemy does not exist
        return undefined;
    }
}

/// @function getEnemyBulletPattern
/// @param enemy
/// @param index
/// @returns sequence

function getEnemyBulletPattern(_enemy, _index = 0) {
    // Search for the enemy in the multidimensional array
    var pattern_list = undefined;
    for (var i = 0; i < array_length(global.enemy_bullet_pattern_list); i++) {
        if (global.enemy_bullet_pattern_list[i][0] == _enemy) {
            pattern_list = global.enemy_bullet_pattern_list[i][1];
            break;
        }
    }

    // If music list was found, validate the index and return the pattern
    if (pattern_list != undefined) {
        if (_index < 0 || _index >= array_length(pattern_list)) {
            _index = 0; // Set index to 0 if out of range
        }
        return pattern_list[_index];
    } else {
        // Handle the case where the enemy does not exist
        return undefined;
    }
}
