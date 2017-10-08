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
	AddPlayerClass(0,1144.6184, -2047.9220, 1081.9097,95.6418,0,0,0,0,0,0);
	SetWorldTime(12);
	new obj;

	
	CreateObject(19943, 1149.20605, -2052.12207, 1079.70923,   0.00000, 0.00000, 0.00000);
	CreateObject(19943, 1143.10437, -2052.12207, 1079.70923,   0.00000, 0.00000, 0.00000);
	CreateObject(19943, 1149.20605, -2045.12207, 1079.70923,   0.00000, 0.00000, 0.00000);
	CreateObject(19943, 1143.10437, -2045.12207, 1079.70923,   0.00000, 0.00000, 0.00000);
	CreateObject(19943, 1143.10437, -2038.12207, 1079.70923,   0.00000, 0.00000, 0.00000);
	CreateObject(19943, 1149.20605, -2038.12207, 1079.70923,   0.00000, 0.00000, 0.00000);
	CreateObject(18981, 1161.18054, -2019.94177, 1091.71143,   0.00000, 0.00000, 0.00000);
	CreateObject(11726, 1146.19031, -2048.59351, 1085.86316,   0.00000, 0.00000, 45.00000);
	CreateObject(11726, 1146.19031, -2041.72754, 1085.86316,   0.00000, 0.00000, 45.00000);
	CreateObject(11726, 1146.19031, -2030.54382, 1085.86316,   0.00000, 0.00000, 45.00000);
	CreateObject(11726, 1137.19031, -2048.59351, 1085.86316,   0.00000, 0.00000, 45.00000);
	CreateObject(11726, 1155.19031, -2048.59351, 1085.86316,   0.00000, 0.00000, 45.00000);
	CreateObject(11726, 1155.19031, -2041.72754, 1085.86316,   0.00000, 0.00000, 45.00000);
	CreateObject(11726, 1137.19031, -2041.72754, 1085.86316,   0.00000, 0.00000, 45.00000);
	CreateObject(2842, 1146.52478, -2055.86841, 1079.70923,   0.00000, 0.00000, 0.00000);
	CreateObject(2842, 1144.69446, -2055.86841, 1079.70923,   0.00000, 0.00000, 0.00000);
	
	// 별
	obj = CreateObject(902, 1146.11353, -2021.21228, 1083.87427,   0.00000, 270.00000, 90.00000);
	SetObjectMaterial(obj, 0, 18245, "cw_junkyardmachin", "Was_scrpyd_light_yellow", 0xFFFFFFFF);
	obj = CreateObject(902, 1138.77429, -2025.40454, 1083.87427,   0.00000, 270.00000, 150.00000);
	SetObjectMaterial(obj, 0, 18245, "cw_junkyardmachin", "Was_scrpyd_light_yellow", 0xFFFFFFFF);
	obj = CreateObject(902, 1153.49841, -2025.42944, 1083.87427,   0.00000, 270.00000, 30.00000);
	SetObjectMaterial(obj, 0, 18245, "cw_junkyardmachin", "Was_scrpyd_light_yellow", 0xFFFFFFFF);
	
	// 벤치
	obj = CreateObject(1256, 1152.28137, -2038.60742, 1080.36023,   0.00000, 0.00000, 90.00000);
	SetObjectMaterial(obj, 0, 10412, "hotel1", "carpet_red_256", 0xFFFFFFFF);
	obj = CreateObject(1256, 1140.03174, -2038.60742, 1080.36023,   0.00000, 0.00000, 90.00000);
	SetObjectMaterial(obj, 0, 10412, "hotel1", "carpet_red_256", 0xFFFFFFFF);
	
	// 메인바닥
	obj = CreateObject(8419, 1149.00281, -2009.18848, 1067.98767,   0.00000, 0.00000, 0.00000);
	SetObjectMaterial(obj, 4, 8482, "csrspalace02", "marble01_128", 0xFFFFFFFF);

	// 바닥 무늬
	obj = CreateObject(19444, 1144.70569, -2052.08423, 1079.62537,   0.00000, 90.00000, 0.00000);
	SetObjectMaterial(obj, 0, 3922, "bistro", "Marble", 0xFFFFFFFF);
	obj = CreateObject(19444, 1147.49182, -2052.08325, 1079.62439,   0.00000, 90.00000, 0.00000);
	SetObjectMaterial(obj, 0, 3922, "bistro", "Marble", 0xFFFFFFFF);
	obj = CreateObject(19444, 1149.18835, -2050.34277, 1079.62341,   0.00000, 90.00000, 90.00000);
	SetObjectMaterial(obj, 0, 3922, "bistro", "Marble", 0xFFFFFFFF);
	obj = CreateObject(19444, 1149.18835, -2046.89856, 1079.62439,   0.00000, 90.00000, 90.00000);
	SetObjectMaterial(obj, 0, 3922, "bistro", "Marble", 0xFFFFFFFF);
	obj = CreateObject(19444, 1149.18835, -2043.39978, 1079.62537,   0.00000, 90.00000, 90.00000);
	SetObjectMaterial(obj, 0, 3922, "bistro", "Marble", 0xFFFFFFFF);
	obj = CreateObject(19444, 1149.18835, -2039.97778, 1079.62439,   0.00000, 90.00000, 90.00000);
	SetObjectMaterial(obj, 0, 3922, "bistro", "Marble", 0xFFFFFFFF);
	obj = CreateObject(19444, 1143.08911, -2043.39978, 1079.62537,   0.00000, 90.00000, 90.00000);
	SetObjectMaterial(obj, 0, 3922, "bistro", "Marble", 0xFFFFFFFF);
	obj = CreateObject(19444, 1143.08911, -2039.97778, 1079.62439,   0.00000, 90.00000, 90.00000);
	SetObjectMaterial(obj, 0, 3922, "bistro", "Marble", 0xFFFFFFFF);
	obj = CreateObject(19444, 1143.08911, -2046.89856, 1079.62439,   0.00000, 90.00000, 90.00000);
	SetObjectMaterial(obj, 0, 3922, "bistro", "Marble", 0xFFFFFFFF);
	obj = CreateObject(19444, 1143.08911, -2050.34277, 1079.62341,   0.00000, 90.00000, 90.00000);
	SetObjectMaterial(obj, 0, 3922, "bistro", "Marble", 0xFFFFFFFF);
	obj = CreateObject(19444, 1145.61926, -2045.11890, 1079.62634,   0.00000, 90.00000, 0.00000);
	SetObjectMaterial(obj, 0, 3922, "bistro", "Marble", 0xFFFFFFFF);
	obj = CreateObject(19444, 1146.71912, -2045.11890, 1079.62720,   0.00000, 90.00000, 0.00000);
	SetObjectMaterial(obj, 0, 3922, "bistro", "Marble", 0xFFFFFFFF);
	obj = CreateObject(19444, 1147.46069, -2038.18604, 1079.62720,   0.00000, 90.00000, 0.00000);
	SetObjectMaterial(obj, 0, 3922, "bistro", "Marble", 0xFFFFFFFF);
	obj = CreateObject(19444, 1144.84387, -2038.18604, 1079.62622,   0.00000, 90.00000, 0.00000);
	SetObjectMaterial(obj, 0, 3922, "bistro", "Marble", 0xFFFFFFFF);
	
	// 천장
	obj = CreateObject(8419, 1149.00281, -2009.18848, 1098.48767,   0.00000, 180.00000, 0.00000);
	SetObjectMaterial(obj, 4, 9239, "stuff2_sfn", "sl_whitewood01", 0xFFFFFFFF);
	
	// 문
	obj = CreateObject(19356, 1146.13403, -2055.91455, 1081.38745,   0.00000, 0.00000, 90.00000);
	SetObjectMaterial(obj, 0, 5408, "tempstuff_lae", "lasbevcit7", 0xFFFFFFFF);

	// 벽
	obj = CreateObject(19377, 1138.90137, -2033.88391, 1082.70984,   0.00000, 0.00000, 30.00000);
	SetObjectMaterial(obj, 0, 6336, "sunset02_law2", "concpanel_la", 0xFFFFFFFF);
	obj = CreateObject(19377, 1138.87427, -2025.50464, 1082.70984,   0.00000, 0.00000, -30.00000);
	SetObjectMaterial(obj, 0, 6336, "sunset02_law2", "concpanel_la", 0xFFFFFFFF);
	obj = CreateObject(19377, 1146.11353, -2021.31226, 1082.70984,   0.00000, 0.00000, -90.00000);
	SetObjectMaterial(obj, 0, 6336, "sunset02_law2", "concpanel_la", 0xFFFFFFFF);
	obj = CreateObject(19377, 1153.39844, -2025.52954, 1082.70984,   0.00000, 0.00000, -150.00000);
	SetObjectMaterial(obj, 0, 6336, "sunset02_law2", "concpanel_la", 0xFFFFFFFF);
	obj = CreateObject(19377, 1153.40271, -2033.90857, 1082.70984,   0.00000, 0.00000, -210.00000);
	SetObjectMaterial(obj, 0, 6336, "sunset02_law2", "concpanel_la", 0xFFFFFFFF);
	obj = CreateObject(19377, 1130.88733, -2051.30371, 1082.70984,   0.00000, 0.00000, 0.00000);
	SetObjectMaterial(obj, 0, 6336, "sunset02_law2", "concpanel_la", 0xFFFFFFFF);
	obj = CreateObject(19377, 1130.87122, -2041.68286, 1082.70984,   0.00000, 0.00000, 0.00000);
	SetObjectMaterial(obj, 0, 6336, "sunset02_law2", "concpanel_la", 0xFFFFFFFF);
	obj = CreateObject(19377, 1161.18164, -2051.30371, 1082.70984,   0.00000, 0.00000, 0.00000);
	SetObjectMaterial(obj, 0, 6336, "sunset02_law2", "concpanel_la", 0xFFFFFFFF);
	obj = CreateObject(19377, 1161.18262, -2041.66980, 1082.70984,   0.00000, 0.00000, 0.00000);
	SetObjectMaterial(obj, 0, 6336, "sunset02_law2", "concpanel_la", 0xFFFFFFFF);
	obj = CreateObject(19377, 1163.65210, -2055.91504, 1082.70984,   0.00000, 0.00000, 90.00000);
	SetObjectMaterial(obj, 0, 6336, "sunset02_law2", "concpanel_la", 0xFFFFFFFF);
	obj = CreateObject(19377, 1138.29114, -2055.91406, 1082.70984,   0.00000, 0.00000, 90.00000);
	SetObjectMaterial(obj, 0, 6336, "sunset02_law2", "concpanel_la", 0xFFFFFFFF);
	obj = CreateObject(19377, 1128.69165, -2055.91504, 1082.70984,   0.00000, 0.00000, 90.00000);
	SetObjectMaterial(obj, 0, 6336, "sunset02_law2", "concpanel_la", 0xFFFFFFFF);
	obj = CreateObject(19377, 1137.92078, -2038.12952, 1082.70984,   0.00000, 0.00000, 90.00000);
	SetObjectMaterial(obj, 0, 6336, "sunset02_law2", "concpanel_la", 0xFFFFFFFF);
	obj = CreateObject(19377, 1128.39392, -2038.12854, 1082.70984,   0.00000, 0.00000, 90.00000);
	SetObjectMaterial(obj, 0, 6336, "sunset02_law2", "concpanel_la", 0xFFFFFFFF);
	obj = CreateObject(19377, 1154.46741, -2038.12952, 1082.70984,   0.00000, 0.00000, 90.00000);
	SetObjectMaterial(obj, 0, 6336, "sunset02_law2", "concpanel_la", 0xFFFFFFFF);
	obj = CreateObject(19377, 1164.06970, -2038.12854, 1082.70984,   0.00000, 0.00000, 90.00000);
	SetObjectMaterial(obj, 0, 6336, "sunset02_law2", "concpanel_la", 0xFFFFFFFF);
	obj = CreateObject(19377, 1154.04102, -2055.91406, 1082.70984,   0.00000, 0.00000, 90.00000);
    SetObjectMaterial(obj, 0, 6336, "sunset02_law2", "concpanel_la", 0xFFFFFFFF);

	obj = CreateObject(19377, 1143.07715, -2057.69507, 1082.70984,   0.00000, 0.00000, 0.00000);
	SetObjectMaterial(obj, 0, 9239, "stuff2_sfn", "sl_whitewood01", 0xFFFFFFFF);
	obj = CreateObject(19377, 1149.19897, -2057.69507, 1082.70984,   0.00000, 0.00000, 0.00000);
	SetObjectMaterial(obj, 0, 9239, "stuff2_sfn", "sl_whitewood01", 0xFFFFFFFF);
	obj = CreateObject(19377, 1146.88953, -2055.91504, 1082.70984,   0.00000, 0.00000, 90.00000);
	SetObjectMaterial(obj, 0, 9239, "stuff2_sfn", "sl_whitewood01", 0xFFFFFFFF);
	// 메인, 입구 주변
	obj = CreateObject(11247, 1146.22375, -2038.51245, 1077.70557,   90.00000, 0.00000, 0.00000);
	SetObjectMaterial(obj, 0, 9239, "stuff2_sfn", "sl_whitewood01", 0xFFFFFFFF);
	obj = CreateObject(11247, 1146.03406, -2037.72156, 1077.70557,   90.00000, 0.00000, 180.00000);
	SetObjectMaterial(obj, 0, 9239, "stuff2_sfn", "sl_whitewood01", 0xFFFFFFFF);
	obj = CreateObject(19435, 1144.36584, -2038.22644, 1081.22083,   0.00000, 0.00000, 90.00000);
	SetObjectMaterial(obj, 0, 9239, "stuff2_sfn", "sl_whitewood01", 0xFFFFFFFF);
	obj = CreateObject(19435, 1147.90332, -2038.22644, 1081.22083,   0.00000, 0.00000, 90.00000);
	SetObjectMaterial(obj, 0, 9239, "stuff2_sfn", "sl_whitewood01", 0xFFFFFFFF);
	obj = CreateObject(19435, 1144.36584, -2038.22534, 1084.60852,   0.00000, 0.00000, 90.00000);
	SetObjectMaterial(obj, 0, 9239, "stuff2_sfn", "sl_whitewood01", 0xFFFFFFFF);
	obj = CreateObject(19435, 1147.90332, -2038.22534, 1084.60852,   0.00000, 0.00000, 90.00000);
	SetObjectMaterial(obj, 0, 9239, "stuff2_sfn", "sl_whitewood01", 0xFFFFFFFF);
	obj = CreateObject(19435, 1144.36584, -2038.22632, 1087.90845,   0.00000, 0.00000, 90.00000);
	SetObjectMaterial(obj, 0, 9239, "stuff2_sfn", "sl_whitewood01", 0xFFFFFFFF);
	obj = CreateObject(19435, 1147.90332, -2038.22632, 1087.90845,   0.00000, 0.00000, 90.00000);
	SetObjectMaterial(obj, 0, 9239, "stuff2_sfn", "sl_whitewood01", 0xFFFFFFFF);
	obj = CreateObject(19435, 1145.46313, -2038.22327, 1086.10852,   40.00000, 0.00000, 90.00000);
	SetObjectMaterial(obj, 0, 9239, "stuff2_sfn", "sl_whitewood01", 0xFFFFFFFF);
	obj = CreateObject(19435, 1146.79175, -2038.22424, 1086.10852,   -40.00000, 0.00000, 90.00000);
	SetObjectMaterial(obj, 0, 9239, "stuff2_sfn", "sl_whitewood01", 0xFFFFFFFF);

	// 동상 반석
	obj = CreateObject(19772, 1135.05042, -2053.21826, 1080.31030,   0.00000, 0.00000, 0.00000);
	SetObjectMaterial(obj, 0, 5174, "warehus_las2", "ws_alley_conc1", 0xFFFFFFFF);
	obj = CreateObject(19772, 1135.05042, -2049.21826, 1080.31030,   0.00000, 0.00000, 0.00000);
	SetObjectMaterial(obj, 0, 5174, "warehus_las2", "ws_alley_conc1", 0xFFFFFFFF);
	obj = CreateObject(19772, 1135.05042, -2045.21826, 1080.31030,   0.00000, 0.00000, 0.00000);
	SetObjectMaterial(obj, 0, 5174, "warehus_las2", "ws_alley_conc1", 0xFFFFFFFF);
	obj = CreateObject(19772, 1135.05042, -2041.21826, 1080.31030,   0.00000, 0.00000, 0.00000);
	SetObjectMaterial(obj, 0, 5174, "warehus_las2", "ws_alley_conc1", 0xFFFFFFFF);
	obj = CreateObject(19772, 1156.82422, -2053.21826, 1080.31030,   0.00000, 0.00000, 0.00000);
	SetObjectMaterial(obj, 0, 5174, "warehus_las2", "ws_alley_conc1", 0xFFFFFFFF);
	obj = CreateObject(19772, 1156.82422, -2049.21826, 1080.31030,   0.00000, 0.00000, 0.00000);
	SetObjectMaterial(obj, 0, 5174, "warehus_las2", "ws_alley_conc1", 0xFFFFFFFF);
	obj = CreateObject(19772, 1156.82422, -2045.21826, 1080.31030,   0.00000, 0.00000, 0.00000);
	SetObjectMaterial(obj, 0, 5174, "warehus_las2", "ws_alley_conc1", 0xFFFFFFFF);
	obj = CreateObject(19772, 1156.82422, -2041.21826, 1080.31030,   0.00000, 0.00000, 0.00000);
	SetObjectMaterial(obj, 0, 5174, "warehus_las2", "ws_alley_conc1", 0xFFFFFFFF);
	obj = CreateObject(19772, 1141.23120, -2026.76477, 1080.31030,   0.00000, 0.00000, -30.00000);
	SetObjectMaterial(obj, 0, 5174, "warehus_las2", "ws_alley_conc1", 0xFFFFFFFF);
	obj = CreateObject(19772, 1145.79395, -2024.34106, 1080.31030,   0.00000, 0.00000, 90.00000);
	SetObjectMaterial(obj, 0, 5174, "warehus_las2", "ws_alley_conc1", 0xFFFFFFFF);
	obj = CreateObject(19772, 1150.98462, -2026.75122, 1080.31030,   0.00000, 0.00000, 30.00000);
	SetObjectMaterial(obj, 0, 5174, "warehus_las2", "ws_alley_conc1", 0xFFFFFFFF);
	
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
