instance_destroy(oBullet);
oSoul.visible = false;
global.battleMenu = 0;
global.battleSelectionMenu = 0;
global.border_width = 570;
global.border_height = 120;
global.battle_border_width = 570;
global.battle_border_height = 120;
oBulletBoard.current_offsetx = 0;
oBulletBoard.current_offsety = 0;
sequence_playing = false;
alarm[0] = false;
instance_destroy(oMonsterSequenceGenerator);
instance_destroy(obj_speech_bubble);

var a = layer_get_all_elements("Sequences");
for (var i = 0; i < array_length(a); i++;)
{
    if layer_get_element_type(a[i]) == layerelementtype_sequence
    {
        layer_sequence_destroy(a[i]);
		show_debug_message("Sequence is destroyed.");
		instance_destroy(oBubbleTextElement);
		global.soulCanShoot = false;
    }
}