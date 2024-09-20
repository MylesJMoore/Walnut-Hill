//Utility Variables
depth = -9999;
controller_down_threshold = -.8;
controller_up_threshold = .8;
controller_joystick_moved = false;
option_looparound = true;
dialogue_indicator_x_right = 190;
dialogue_indicator_x_left = 260;
dialogue_indicator_x_default = 260;
dialogue_indicator_x = 260;
dialogue_indicator_y = 50;
player_menu_text_vertical_offset = 16;
player_menu_textbox_vertical_offset = -3;
player_menu_textbox_horizontal_offset = -32;
player_menu_soul_textbox_vertical_offset = 10;
player_menu_soul_textbox_horizontal_offset = 0;


//Textbox Parameters
textbox_width = global.textbox_width;
textbox_height = global.textbox_height;
textbox_x = 0;
textbox_y = 0;
border = 8;
line_separation = 12;
line_width = textbox_width - border * 2;

//Textbox Information
textbox_sprite[0] = spr_textbox;
textbox_image = 0;
textbox_image_speed = 0; //<number>/60
textbox_sprite_width = 0;
textbox_sprite_height = 0;

//Text
page = 0;
page_number = 0;
text[0] = "";
text_length[0] = string_length(text[0]);
char[0,0] = "";
char_x[0,0] = 0;
char_y[0,0] = 0;
draw_character = 0;
text_speed = 1;
setup = false;
text_vertical_adjustment = 0; //Moves the text down or up extra

//Options
option[0] = "";
option_link_id[0] = -1;
option_position = 0;
option_number = 0;
option_buffer = 16;

//Sound
//*NOTE CAN SET DELAY FOR EACH SOUND IF YOU MAKE IT AN ARRAY LIKE textbox_sprite
sound_delay = 4;
sound_count = sound_delay;

//Effects
setDefaultsForText();
last_free_space = 0;
text_pause_timer = 0;
text_pause_time = 16;
float_amount = 6; //Can be negative or positive which affects the sinwave
float_multiplier = 1; //1 is pretty safe, but add more for more floating
shake_frames = 4; //1 shakes quick and close, 8 shakes slower and farther away

