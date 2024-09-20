///@desc Battle Sequence Test

// Create the sequence instance on the "Cutscenes" layer at position (80, 60)
var my_sequence = layer_sequence_create("Cutscenes", 80, 60, seq_battle_test);

// Debugging output
if (my_sequence != -1) {
    show_debug_message("Sequence created successfully: " + string(my_sequence));

    // Play the sequence using layer_sequence_play
    layer_sequence_play(my_sequence);
    show_debug_message("Sequence started playing.");
} else {
    show_debug_message("Failed to create sequence on layer 'Cutscenes'. Check layer name and sequence asset name.");
}
