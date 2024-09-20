//Draw Battle Information Text
var hp_barwidth = (global.player_max_hp);
var hp_barwidth_fill = (global.player_hp);
draw_set_font(fBattleStats);
draw_set_color(c_white);
draw_text(90, 400, global.player_name + "    LV " + string(global.player_level));
draw_text(380 + hp_barwidth, 400, string(global.player_hp) + " / " + string(global.player_max_hp));
draw_text(320, 400, "HP");

//Draw HP Bar
draw_set_color(c_red);
draw_rectangle(370, 400, 370 + hp_barwidth, 418, false);
draw_set_color(c_yellow);
draw_rectangle(370, 400, 370 + hp_barwidth_fill, 418, false);