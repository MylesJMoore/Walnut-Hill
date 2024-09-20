/// @function removeTitleTextbox
function removeTitleTextbox() {
	//Delete any textbox or dialogue indicators before creating a new one
	if(instance_exists(obj_dialogue_indicator)) 
	{
		instance_destroy(obj_dialogue_indicator);
	}
						
	if(instance_exists(obj_textbox)) 
	{
		instance_destroy(obj_textbox);
	}
}