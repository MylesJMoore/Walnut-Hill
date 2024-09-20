switch (room)
{
	case DEBUG_ROOM:
        audio_stop_all();
    break;
	
    case CAVE:
        setSongInGame(CAVE_MUSIC, 0, 0);
    break;
	
	case CLIFF_SKY:
        setSongInGame(CLIFF_SKY_MUSIC, 0, 0);
    break;

    case FACTORY:
        setSongInGame(FACTORY_MUSIC, 60, 2*60);
    break;
	
	case FOREST_PLATEAU_1:
        setSongInGame(FOREST_PLATEAU_1_MUSIC, 2*60, 2*60);
    break;
	
	case FOREST_PLATEAU_2:
        setSongInGame(FOREST_PLATEAU_2_MUSIC, 2*60, 2*60);
    break;
	
	case FOREST_PLATEAU_3:
        setSongInGame(FOREST_PLATEAU_3_MUSIC, 2*60, 2*60);
    break;
}