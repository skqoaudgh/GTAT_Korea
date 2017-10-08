// This is a comment
// uncomment the line below if you want to write a filterscript
//#define FILTERSCRIPT

#include <a_samp>

#if defined FILTERSCRIPT

public OnFilterScriptInit()
{
	print("\n--------------------------------------");
	print(" Blank Filterscript by your name here");
	print("--------------------------------------\n");
	return 1;
}

public OnFilterScriptExit()
{
	return 1;
}

#else

main()
{
	print("\n----------------------------------");
	print(" Blank Gamemode by your name here");
	print("----------------------------------\n");
}

#endif

public OnGameModeInit()
{
	// Don't use these lines if it's a filterscript
	SetGameModeText("Blank Script");
	AddPlayerClass(0,956.84290, -1712.90039, 13.55910,95.6418,0,0,0,0,0,0);
	SetWorldTime(12);
	new obj;


	CreateObject(9482, 917.48993, -1755.66760, 19.00560,   0.00000, 0.00000, 90.00000);
	CreateObject(9482, 917.46918, -1581.73450, 19.00560,   0.00000, 0.00000, 90.00000);
	CreateObject(14608, 956.82336, -1720.15759, 14.17350,   0.00000, 0.00000, -45.00000);
	CreateObject(10031, 969.26093, -1725.34937, 16.90000,   0.00000, 0.00000, 0.00000);
	CreateObject(3471, 952.18237, -1718.70667, 13.81740,   0.00000, 0.00000, 90.00000);
	CreateObject(3471, 961.51563, -1718.70667, 13.81740,   0.00000, 0.00000, 90.00000);
	CreateObject(2726, 958.34241, -1718.33508, 12.99790,   0.00000, 0.00000, 0.00000);
	CreateObject(2726, 955.24237, -1718.33508, 12.99790,   0.00000, 0.00000, 0.00000);
	CreateObject(3461, 962.14252, -1714.71216, 14.03720,   0.00000, 0.00000, 0.00000);
	CreateObject(3461, 951.55029, -1714.71216, 14.03720,   0.00000, 0.00000, 180.00000);
	CreateObject(1569, 937.67468, -1721.83972, 12.54416,   0.00000, 0.00000, 0.00000);
	CreateObject(1569, 940.67578, -1721.83374, 12.54420,   0.00000, 0.00000, 180.00000);
	CreateObject(3034, 946.22961, -1721.80627, 14.74060,   0.00000, 0.00000, 180.00000);
	CreateObject(1568, 942.80408, -1651.60938, 12.53850,   0.00000, 0.00000, 0.00000);
	CreateObject(1568, 955.35468, -1651.60938, 12.53850,   0.00000, 0.00000, 0.00000);
	CreateObject(1568, 967.07501, -1651.60938, 12.53850,   0.00000, 0.00000, 0.00000);

	obj = CreateObject(19375, 956.84290, -1712.90039, 12.55910,   0.00000, 90.00000, 0.00000);
	SetObjectMaterial(obj, 0, 9494, "chinatownsfe", "ws_carparknew2", 0xFFFFFFFF);
	obj = CreateObject(19376, 956.84290, -1722.53528, 12.55910,   0.00000, 90.00000, 0.00000);
	SetObjectMaterial(obj, 0, 8463, "vgseland", "triadcarpet2", 0xFFFFFFFF);
	return 1;
}

public OnGameModeExit()
{
	return 1;
}

public OnPlayerRequestClass(playerid, classid)
{
	SetPlayerPos(playerid, 1958.3783, 1343.1572, 15.3746);
	SetPlayerCameraPos(playerid, 1958.3783, 1343.1572, 15.3746);
	SetPlayerCameraLookAt(playerid, 1958.3783, 1343.1572, 15.3746);
	return 1;
}

public OnPlayerConnect(playerid)
{
	RemoveBuildingForPlayer(playerid, 6208, 954.2734, -1720.7969, 20.7734, 0.25);
	RemoveBuildingForPlayer(playerid, 726, 958.0391, -1678.0547, 10.7422, 0.25);
	RemoveBuildingForPlayer(playerid, 729, 940.9297, -1668.8594, 11.3203, 0.25);
	RemoveBuildingForPlayer(playerid, 6205, 954.2734, -1720.7969, 20.7734, 0.25);
	RemoveBuildingForPlayer(playerid, 615, 968.2266, -1665.6875, 12.2109, 0.25);
	return 1;
}

public OnPlayerDisconnect(playerid, reason)
{
	return 1;
}

public OnPlayerSpawn(playerid)
{
	return 1;
}

public OnPlayerDeath(playerid, killerid, reason)
{
	return 1;
}

public OnVehicleSpawn(vehicleid)
{
	return 1;
}

public OnVehicleDeath(vehicleid, killerid)
{
	return 1;
}

public OnPlayerText(playerid, text[])
{
	return 1;
}

public OnPlayerCommandText(playerid, cmdtext[])
{
	if (strcmp("/mycommand", cmdtext, true, 10) == 0)
	{
		// Do something here
		return 1;
	}
	return 0;
}

public OnPlayerEnterVehicle(playerid, vehicleid, ispassenger)
{
	return 1;
}

public OnPlayerExitVehicle(playerid, vehicleid)
{
	return 1;
}

public OnPlayerStateChange(playerid, newstate, oldstate)
{
	return 1;
}

public OnPlayerEnterCheckpoint(playerid)
{
	return 1;
}

public OnPlayerLeaveCheckpoint(playerid)
{
	return 1;
}

public OnPlayerEnterRaceCheckpoint(playerid)
{
	return 1;
}

public OnPlayerLeaveRaceCheckpoint(playerid)
{
	return 1;
}

public OnRconCommand(cmd[])
{
	return 1;
}

public OnPlayerRequestSpawn(playerid)
{
	return 1;
}

public OnObjectMoved(objectid)
{
	return 1;
}

public OnPlayerObjectMoved(playerid, objectid)
{
	return 1;
}

public OnPlayerPickUpPickup(playerid, pickupid)
{
	return 1;
}

public OnVehicleMod(playerid, vehicleid, componentid)
{
	return 1;
}

public OnVehiclePaintjob(playerid, vehicleid, paintjobid)
{
	return 1;
}

public OnVehicleRespray(playerid, vehicleid, color1, color2)
{
	return 1;
}

public OnPlayerSelectedMenuRow(playerid, row)
{
	return 1;
}

public OnPlayerExitedMenu(playerid)
{
	return 1;
}

public OnPlayerInteriorChange(playerid, newinteriorid, oldinteriorid)
{
	return 1;
}

public OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
	return 1;
}

public OnRconLoginAttempt(ip[], password[], success)
{
	return 1;
}

public OnPlayerUpdate(playerid)
{
	return 1;
}

public OnPlayerStreamIn(playerid, forplayerid)
{
	return 1;
}

public OnPlayerStreamOut(playerid, forplayerid)
{
	return 1;
}

public OnVehicleStreamIn(vehicleid, forplayerid)
{
	return 1;
}

public OnVehicleStreamOut(vehicleid, forplayerid)
{
	return 1;
}

public OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
	return 1;
}

public OnPlayerClickPlayer(playerid, clickedplayerid, source)
{
	return 1;
}
