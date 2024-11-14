//Save the state of the room we are leaving
if (skipRoomSave) == false {
	saveRoom();
}

skipRoomSave = false;