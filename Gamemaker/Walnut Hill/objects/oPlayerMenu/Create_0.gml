//Initalization Values
createPlayerMenuMessages();
depth = -9999;
sep = 16;
screen_border = 16;
controller_down_threshold = -.8;
controller_up_threshold = .8;
controller_joystick_moved = false;


//Main Menu Navigation
position = 0;
option_length = 0;
menu_level = 0;

//Main Menu Options
option[0, 0] = "ITEM";
option[0, 1] = "STAT";
option[0, 2] = "SOUL";

//Main Menu Option Box
menu_option_box_height = 2.5;
menu_option_box_width = 2.5;
menu_option_horizontal_buffer = -3;
menu_option_vertical_buffer = 38;

//Main Menu Option Text
option_border = 4;
option_space = 16;
menu_text_horizontal_buffer = 12;
menu_text_vertical_buffer = 40;

//Player Info Box
player_info_box_height = 2;
player_info_box_width = 2.5;
player_info_horizontal_buffer = -3;
player_info_vertical_buffer = -12;

//Player Info Name Text
player_info_name_text_horizontal_buffer = 1;
player_info_name_text_vertical_buffer = -9;

//Player Info Stats Text
player_stats_border = 4;
player_stats_space = 8;
player_info_stats_text_horizontal_buffer = 2;
player_info_stats_text_vertical_buffer = -11;

//Random Messages Box
message_box_height = 2.5;
message_box_width = 9;
message_horizontal_buffer = -3;
message_vertical_buffer = 100;

//Random Message Text
messages_border = 4;
messages_space = 20;
messages_separation = 14;
message_text_scale = .75;
message_text_width = 285;
message_text_horizontal_buffer = 5;
message_text_vertical_buffer = 84;

// Store Split Messages
split_messages = [];
normal_color = c_white;
chrome_color = c_yellow;

for (var i = 0; i < array_length(global.player_menu_messages); i++) {
    var msg = global.player_menu_messages[i];
    var split_pos = string_pos("Chrome", msg);

    if (split_pos > 0) {
        var before_chrome = string_copy(msg, 1, split_pos - 1);
        var after_chrome = string_copy(msg, split_pos + string_length("Chrome"), string_length(msg) - (split_pos + string_length("Chrome")) + 1);
        array_push(split_messages, [before_chrome, after_chrome]);
    } else {
        array_push(split_messages, [msg, ""]);
    }
}