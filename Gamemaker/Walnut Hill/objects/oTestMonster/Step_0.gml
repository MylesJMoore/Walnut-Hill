if (instance_exists(Dialogue)) {
	ReadyForBattle = true;
} else {
	if (ReadyForBattle) {
		ReadyForBattle = false;
		alarm[0] = 1;
	}
}


