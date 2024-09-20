//Create instance of sequence
global.current_sequence = layer_sequence_create("Cutscenes", 0, 0, seq_city);
//Get the objects for this sequence fro mthe instance
var _seq_inst = layer_sequence_get_instance(global.current_sequence);

var _seq = sequence_get(seq_city);
sequence_objects = sequence_get_objects(_seq);

//Override the sequence with the room objects
for (var i = 0; i < array_length(sequence_objects); i++) {
	var _object = sequence_objects[i];
	
	if (instance_exists(_object)) {
		var _room_obj_inst = instance_find(_object, 0);
		sequence_instance_override_object(_seq_inst, _object, _room_obj_inst);
	}
}
