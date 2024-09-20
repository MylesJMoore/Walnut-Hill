enum e_info {
	total,
	selected,
	slider_has_moved
}

for (var i = 0; i <5; i++) {
	a_info[i, e_info.total] = 100; //irandom_range(20, 50)
	a_info[i, e_info.selected] = 0;
	a_info[i, e_info.slider_has_moved] = false;
}
slider_has_moved = false;
slider_bar_x_start_adjustment = 17; //-16
slider_bar_x_end_adjustment = 17; //-25
slider_bar_selected_text_adjustment = -18;//3
slider_bar_total_text_adjustment = 0;//13