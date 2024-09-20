#region Get Correct Position for Slider bars depending upon where mouse is, first example
/*
//Get the starting coordinates - startX is the left-most coordinate for the bars
startX = (surface_get_width(application_surface) / 2) - (sprite_get_width(spr_bar_pixel) / 2);
startY = (surface_get_height(application_surface) / 2) - (sprite_get_height(spr_slider_bar_pixel) * 3);

//Draw 5 Bars
for (var i = 0; i < 5; i++) {
	xx = startX;
	yy = startY + (i * (sprite_get_height(spr_slider_bar_pixel) * 1.5));
	
	draw_sprite(spr_bar_pixel, 0, xx, yy);

	var sliderBarX = xx;
	
	//Check to see if the mouse is within the collision rectangle for any of the 5 bars
	//(width of spr_bar_pixel and height of spr_slider_bar_pixel)
	if (abs(device_mouse_y_to_gui(0) - yy) < (sprite_get_height(spr_slider_bar_pixel) / 2) && device_mouse_x_to_gui(0) >= xx && 
		device_mouse_x_to_gui(0) <= xx + sprite_get_width(spr_bar_pixel)) {
			sliderBarX = device_mouse_x_to_gui(0);
		}
		
	//Draw the slider bar wherever the mouse is
	draw_sprite(spr_slider_bar_pixel, 0, sliderBarX, yy);
	
}
*/
#endregion

#region Get Correct Position for Slider bars depending upon where mouse is

//Get the starting coordinates - startX is the left-most coordinate for the bars
startX = (surface_get_width(application_surface) / 2) - (sprite_get_width(spr_bar_pixel) / 2);
startY = (surface_get_height(application_surface) / 2) - (sprite_get_height(spr_slider_bar_pixel) * 3);

//Draw 5 Bars
for (var i = 0; i < 5; i++) {
	xx = startX;
	yy = startY + (i * (sprite_get_height(spr_slider_bar_pixel) * 1.5));
	
	draw_sprite(spr_bar_pixel, 0, xx, yy);
	
	var percentage = (a_info[i, e_info.selected] / a_info[i, e_info.total]);

	var sliderBarX = startX + (sprite_get_width(spr_bar_pixel) * percentage);
	
	//Check if slider has moved, if it has not then adjust to appropriate part of the slider bar to start
	if(!a_info[i, e_info.slider_has_moved])
	{
		sliderBarX = sliderBarX + slider_bar_x_start_adjustment;
	}
	
	//Check to see if the mouse is within the collision rectangle for any of the 5 bars
	//(width of spr_bar_pixel and height of spr_slider_bar_pixel)
	if (abs(device_mouse_y_to_gui(0) - yy) < (sprite_get_height(spr_slider_bar_pixel) / 2) && device_mouse_x_to_gui(0) >= xx + slider_bar_x_end_adjustment && 
		device_mouse_x_to_gui(0) <= xx + sprite_get_width(spr_bar_pixel) - slider_bar_x_end_adjustment) 
		{
			if (mouse_check_button(mb_left)) 
			{
				mouseX = device_mouse_x_to_gui(0);
				
				//Find out how many pixels along the bar the mouse is
				indicatorLength = (mouseX - startX);
				
				//Find the percentage of how far along the bar the indicator is
				percentage = (indicatorLength / + sprite_get_width(spr_bar_pixel)) * 100;
				
				//Work out how much of the total info is selected
				a_info[i, e_info.selected] = round((a_info[i, e_info.total] / 100) * percentage);
				
				//Why do we multiply by 100 and then divide by 100? To ensure we get a decent result from the "round" function
				//If we are in the negative, default to 0
				if(a_info[i, e_info.selected] < 0) 
				{
					a_info[i, e_info.selected] = 0;
				}
				
				//Flip Slider flag
				if(!a_info[i, e_info.slider_has_moved])
				{
					a_info[i, e_info.slider_has_moved] = true;
				}
				
				//Update indicatorX
				percentage = (a_info[i, e_info.selected] / a_info[i, e_info.total]);
				sliderBarX = startX + (sprite_get_width(spr_bar_pixel) * percentage);
			}
		}
		
	//Draw the Bar on the slider
	draw_sprite(spr_slider_bar_pixel, 0, sliderBarX, yy);
	
	//Adjust Slider Bar Text
	var _selectedText = a_info[i, e_info.selected];
	var _totalText = a_info[i, e_info.total];
	
	if(a_info[i, e_info.slider_has_moved])
	{
		_selectedText = _selectedText + slider_bar_selected_text_adjustment + 5;
		_totalText = _totalText + slider_bar_total_text_adjustment;
	}
	
	//Set it to 100% if it's greater than 80%
	if(a_info[i, e_info.slider_has_moved] && percentage >= 0.78) 
	{
		_selectedText = _selectedText + 37;
		if(_selectedText > _totalText)
		{
			_selectedText = _totalText;
		}
	}
	
	//Draw Text
	draw_text(xx + sprite_get_width(spr_bar_pixel), yy, " Selected: " + string(_selectedText) + " / " + string(_totalText));
}

#endregion