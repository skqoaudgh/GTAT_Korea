/*

* 스탯 오류 수정
* 디싱크 기능 추가

*/

#include <a_samp>
#include <Color>
#include <dudb>
#include <Authentication>
#include <mapandreas>
#include <uf>
#include <Gundrop>
#include <3DTryg>
#include <progress2>

#pragma unused ret_memcpy

#define MODE_VERSION "1.5.5"
#define MODE_LANGUAGE "KOREAN"
#define MODE_MAPNAME "GTA:T Korea"
#define MODE_URL "cafe.daum.net/sampkor"

#define M_P MAX_PLAYERS
#define SCM SendClientMessage
#define SCMToAll SendClientMessageToAll
#define MAX_TEAM    10
#define MAX_ZONE 227
#define DialogID_Position(%1)			1000 + %1
#define DialogID_Weapon(%1)				1050 + %1
#define DialogID_Userdata(%1)			1100 + %1
#define DialogID_Lobby(%1)				1150 + %1
#define DialogID_Config(%1)				1200 + %1
#define DialogID_Team(%1)				1250 + %1

#define User_File	"GTAT/User/%s.txt"
#define Zone_File	"GTAT/Zone/%d.txt"
#define Team_File	"GTAT/Team/%d.txt"

new Dialog_List[MAX_TEAM];
new Dialog_Select;

new pITERATION[M_P];
new pITER_INDEX[M_P];
new NUM_PLAYERS = 0;

new Text:TD_GTAT[5];
new Text:TD_Setting[5];
new Text:TD_SiteURL;
new Text:TD_Zone[2];
new Text:TD_Spec[2];
new Text:TD_Time;
new Text:TD_RequestBG[2];
new Text:TD_Stat[M_P];
new Text:TD_LevelBar[M_P];
new Text:TD_Level[M_P];

new LevelPoint[M_P];

new bool:ChangeMap;

new StatTimer[M_P];
new Slot[M_P];

new DualTimer[M_P];

new PlayTime;

enum tInfo
{
	Used,
    Color,
    Kill,
	Name[56],
	Leader[MAX_PLAYER_NAME]
}
new TeamInfo[MAX_TEAM][tInfo];

enum pInfo
{
	pPassword[32],
	pWeapons[4],
	pWeaponID[4],
	pAmmo[4],
	pWeaponKill[12],
	pKill,
	pDeath,
	Float:pHP,
	pInterior,
	pVirtualWorld,
	pPoint,
	pTeam,
	pSkin,
	pLevel,
	
	FPS2,
	DLlast,
	Text3D:DmgLabel,
	pHits,
	LastDamage,
	IJustLost,
	Bar:LevelBar,
	bool:pCanSync,
	bool:pSynced
};
new PlayerInfo[M_P][pInfo];
new bool:gPlayerLogged[M_P];
new bool:gPlayerSpawned[M_P];
new PlayerIP[64];

enum wInfo
{
	wName[17],
	wID,
	wAmount
}

new WeaponInfo[][wInfo] =
{
    {"Fist", 0, 1},
	{"Chainsaw", 9, 1},
	{"Grenade", 16, 5},
	{"Molotov", 18, 5},
	{"Silenced Pistol", 23, 200},
	{"Desert Eagle", 24, 100},
	{"Shotgun", 25, 50},
	{"Combat Shotgun", 27, 100},
	{"MP5", 29, 300},
	{"AK47", 30, 400},
	{"M4", 31, 400},
	{"Sniper Rifle", 34, 20}
};

new ZoneID = 0;
new GangZone[MAX_ZONE];
new ZoneOwner[MAX_ZONE];
new EnterZone[M_P];

new DualID[M_P];
new Dualed[M_P];

enum KSinfo
{
	SpreeName[15],
	Kill
}
new KllingSpree[][KSinfo] = {
{"Respect Spree", 2},
{"Playa", 4},
{"Homie", 6},
{"Jacker", 8},
{"Gangster", 10},
{"Criminal", 13},
{"High Roller", 15},
{"God Father", 18}
};
new Kills[M_P];
new KillStat[M_P];

new bool:ToggleWar[M_P];
new ProtectTimer[M_P];

new bool:Spectate[M_P];
new SpecTarget[M_P];

new bool:SpawnType[M_P];

new SelectedTeam;

new Text3D:PingLabels[M_P]; // Diagnostics label
new Text:DamageTexts[M_P];
new dmg_update_timer[M_P];

new bool:Protection[M_P];

enum SAZONE_MAIN
{
	SAZONE_NAME[38],
	Float:SAZONE_AREA[4]
};
static const gSANZones[][SAZONE_MAIN] = { // 이것은 자신의위치를 나타내는 것입니다
	//	NAME                            	 	AREA (Xmin,    Ymin,   Xmax,   Ymax)
	{"The Big Ear, Bone County",	                {-410.00,1403.30,-137.90,1681.20}},
	{"Angel Pine, Whetstone",	                    {-2324.90,-2584.20,-1964.20,-2212.10}},
	{"Arco del Oeste, Bone County",                 {-901.10,2221.80,-592.00,2571.90}},
	{"Battery Point, San Fierro",               	{-2741.00,1268.40,-2533.00,1490.40}},
	{"Bayside, Tierra Robada",                     	{-2741.00,2175.10,-2353.10,2722.70}},
	{"Bayside Marina, Tierra Robada",              	{-2353.10,2275.70,-2153.10,2475.70}},
	{"Beacon Hill, Flint County",                 	{-399.60,-1075.5,-319.00,-977.50}},
	{"Blackfield, Las Venturas",                  	{964.30,1203.20,1197.30,1403.20}},
	{"Blackfield, Las Venturas",                  	{964.30,1403.20,1197.30,1726.20}},
	{"Blueberry, Red County",                   	{104.50,-220.10,349.60,152.20}},
	{"Caligula's Palace, Las Venturas",           	{2087.30,1543.20,2437.30,1703.20}},
	{"Caligula's Palace, Las Venturas",           	{2137.40,1703.20,2437.30,1783.20}},
	{"Calton Heights, San Fierro",              	{-2274.10,744.10,-1982.30,1358.90}},
	{"Chinatown, San Fierro",                   	{-2274.10,578.30,-2078.60,744.10}},
	{"City Hall, San Fierro",                   	{-2867.80,277.40,-2593.40,458.40}},
	{"Come-A-Lot, Las Venturas",                  	{2087.30,943.20,2623.10,1203.20}},
	{"Commerce, Los Santos",                    	{1323.90,-1842.20,1701.90,-1722.20}},
	{"Commerce, Los Santos",                    	{1323.90,-1722.20,1440.90,-1577.50}},
	{"Commerce, Los Santos",                    	{1370.80,-1577.50,1463.90,-1384.90}},
	{"Commerce, Los Santos",                    	{1463.90,-1577.50,1667.90,-1430.80}},
	{"Commerce, Los Santos",                    	{1583.50,-1722.20,1758.90,-1577.50}},
	{"Commerce, Los Santos",                    	{1667.90,-1577.50,1812.60,-1430.80}},
	{"Conference Center, Los Santos",           	{1046.10,-1804.20,1323.90,-1722.20}},
	{"Conference Center, Los Santos",           	{1073.20,-1842.20,1323.90,-1804.20}},
	{"Dillimore, Red County",                   	{580.70,-674.80,861.00,-404.70}},
	{"Doherty, San Fierro",                     	{-2270.00,-324.10,-1794.90,-222.50}},
	{"Doherty, San Fierro",                     	{-2173.00,-222.50,-1794.90,265.20}},
	{"Downtown, San Fierro",                    	{-1982.30,744.10,-1871.70,1274.20}},
	{"Downtown, San Fierro",            	        {-2078.60,578.30,-1499.80,744.20}},
	{"Downtown, San Fierro",            	        {-1993.20,265.20,-1794.90,578.30}},
	{"Downtown, Los Santos",       	 				{1463.90,-1430.80,1724.70,-1290.80}},
	{"Downtown, Los Santos",         				{1724.70,-1430.80,1812.60,-1250.90}},
	{"Downtown, Los Santos",         				{1463.90,-1290.80,1724.70,-1150.80}},
	{"Downtown, Los Santos",         				{1370.80,-1384.90,1463.90,-1170.80}},
	{"Downtown, Los Santos",         				{1724.70,-1250.90,1812.60,-1150.80}},
	{"Downtown, Los Santos",         				{1370.80,-1170.80,1463.90,-1130.80}},
	{"Downtown, Los Santos",         				{1378.30,-1130.80,1463.90,-1026.30}},
	{"Downtown, Los Santos",         				{1391.00,-1026.30,1463.90,-926.90}},
	{"Downtown, Los Santos",         				{1507.50,-1385.20,1582.50,-1325.30}},
	{"East Beach, Los Santos",                  	{2632.80,-1852.80,2959.30,-1668.10}},
	{"East Beach, Los Santos",                  	{2632.80,-1668.10,2747.70,-1393.40}},
	{"East Beach, Los Santos",                  	{2747.70,-1668.10,2959.30,-1498.60}},
	{"East Beach, Los Santos",                  	{2747.70,-1498.60,2959.30,-1120.00}},
	{"East Los Santos",             				{2421.00,-1628.50,2632.80,-1454.30}},
	{"East Los Santos",             				{2222.50,-1628.50,2421.00,-1494.00}},
	{"East Los Santos",             				{2266.20,-1494.00,2381.60,-1372.00}},
	{"East Los Santos",             				{2381.60,-1494.00,2421.00,-1454.30}},
	{"East Los Santos",             				{2281.40,-1372.00,2381.60,-1135.00}},
	{"East Los Santos",             				{2381.60,-1454.30,2462.10,-1135.00}},
	{"East Los Santos",             				{2462.10,-1454.30,2581.70,-1135.00}},
	{"Easter Basin, San Fierro",                	{-1794.90,249.90,-1242.90,578.30}},
	{"Easter Basin, San Fierro",                	{-1794.90,-50.00,-1499.80,249.90}},
	{"El Corona, Los Santos",                   	{1812.60,-2179.20,1970.60,-1852.80}},
	{"El Corona, Los Santos",                   	{1692.60,-2179.20,1812.60,-1842.20}},
	{"El Quebrados, Tierra Robada",               	{-1645.20,2498.50,-1372.10,2777.80}},
	{"Fallen Tree, Red County",                 	{-792.20,-698.50,-452.40,-380.00}},
	{"Fern Ridge, Red County",                  	{508.10,-139.20,1306.60,119.50}},
	{"Financial, San Fierro",                   	{-1871.70,744.10,-1701.30,1176.40}},
	{"Flint Range, Flint County",                 	{-594.10,-1648.50,-187.70,-1276.60}},
	{"Fort Carson, Tierra Robada",                 	{-376.20,826.30,123.70,1220.40}},
	{"Foster Valley, San Fierro",               	{-2270.00,-430.20,-2178.60,-324.10}},
	{"Foster Valley, San Fierro",               	{-2178.60,-599.80,-1794.90,-324.10}},
	{"Foster Valley, San Fierro",               	{-2178.60,-1115.50,-1794.90,-599.80}},
	{"Foster Valley, San Fierro",               	{-2178.60,-1250.90,-1794.90,-1115.50}},
	{"Ganton, Los Santos",                      	{2222.50,-1852.80,2632.80,-1722.30}},
	{"Ganton, Los Santos",                      	{2222.50,-1722.30,2632.80,-1628.50}},
	{"Garcia, San Fierro",                      	{-2411.20,-222.50,-2173.00,265.20}},
	{"Garcia, San Fierro",                      	{-2395.10,-222.50,-2354.00,-204.70}},
	{"Glen Park, Los Santos",                   	{1812.60,-1449.60,1996.90,-1350.70}},
	{"Glen Park, Los Santos",                   	{1812.60,-1100.80,1994.30,-973.30}},
	{"Glen Park, Los Santos",                   	{1812.60,-1350.70,2056.80,-1100.80}},
	{"Hampton Barns, Red County",               	{603.00,264.30,761.90,366.50}},
	{"Harry Gold Parkway, Las Venturas",          	{1777.30,863.20,1817.30,2342.80}},
	{"Hashbury, San Fierro",                    	{-2593.40,-222.50,-2411.20,54.70}},
	{"Hilltop Farm, San Fierro",                	{967.30,-450.30,1176.70,-217.90}},
	{"Idlewood, Los Santos",                    	{1812.60,-1852.80,1971.60,-1742.30}},
	{"Idlewood, Los Santos",                    	{1812.60,-1742.30,1951.60,-1602.30}},
	{"Idlewood, Los Santos",                    	{1951.60,-1742.30,2124.60,-1602.30}},
	{"Idlewood, Los Santos",                    	{1812.60,-1602.30,2124.60,-1449.60}},
	{"Idlewood, Los Santos",                    	{2124.60,-1742.30,2222.50,-1494.00}},
	{"Idlewood, Los Santos",                    	{1971.60,-1852.80,2222.50,-1742.30}},
	{"Jefferson, Los Santos",                   	{1996.90,-1449.60,2056.80,-1350.70}},
	{"Jefferson, Los Santos",                   	{2124.60,-1494.00,2266.20,-1449.60}},
	{"Jefferson, Los Santos",                   	{2056.80,-1372.00,2281.40,-1210.70}},
	{"Jefferson, Los Santos",                   	{2056.80,-1210.70,2185.30,-1126.30}},
	{"Jefferson, Los Santos",                   	{2185.30,-1210.70,2281.40,-1154.50}},
	{"Jefferson, Los Santos",                   	{2056.80,-1449.60,2266.20,-1372.00}},
	{"Juniper Hill, San Fierro",                	{-2533.00,578.30,-2274.10,968.30}},
	{"Juniper Hollow, San Fierro",              	{-2533.00,968.30,-2274.10,1358.90}},
	{"King's, San Fierro",                      	{-2329.30,458.40,-1993.20,578.30}},
	{"King's, San Fierro",                      	{-2411.20,265.20,-1993.20,373.50}},
	{"King's, San Fierro",                      	{-2253.50,373.50,-1993.20,458.40}},
	{"Las Barrancas, Tierra Robada",               	{-926.10,1398.70,-719.20,1634.60}},
	{"Las Brujas, Tierra Robada",                  	{-365.10,2123.00,-208.50,2217.60}},
	{"Las Payasadas, Tierra Robada",               	{-354.30,2580.30,-133.60,2816.80}},
	{"Last Dime Motel, Las Venturas",             	{1823.00,596.30,1997.20,823.20}},
	{"Leafy Hollow, Las Venturas",                	{-1166.90,-1856.00,-815.60,-1602.00}},
	{"Linden Side, Las Venturas",                 	{2749.90,943.20,2923.30,1198.90}},
	{"Linden Station, Las Venturas",              	{2749.90,1198.90,2923.30,1548.90}},
	{"Little Mexico, Los Santos",               	{1701.90,-1842.20,1812.60,-1722.20}},
	{"Little Mexico, Los Santos",               	{1758.90,-1722.20,1812.60,-1577.50}},
	{"Los Flores, San Fierro",                  	{2581.70,-1454.30,2632.80,-1393.40}},
	{"Los Flores, San Fierro",                  	{2581.70,-1393.40,2747.70,-1135.00}},
	{"Marina, Los Santos",                      	{647.70,-1804.20,851.40,-1577.50}},
	{"Marina, Los Santos",                      	{647.70,-1577.50,807.90,-1416.20}},
	{"Marina, Los Santos",                      	{807.90,-1577.50,926.90,-1416.20}},
	{"Market, Los Santos",                      	{787.40,-1416.20,1072.60,-1310.20}},
	{"Market, Los Santos",                      	{952.60,-1310.20,1072.60,-1130.80}},
	{"Market, Los Santos",                      	{1072.60,-1416.20,1370.80,-1130.80}},
	{"Market, Los Santos",                      	{926.90,-1577.50,1370.80,-1416.20}},
	{"Market Station, Los Santos",              	{787.40,-1410.90,866.00,-1310.20}},
	{"Missionary Hill, San Fierro",             	{-2994.40,-811.20,-2178.60,-430.20}},
	{"Montgomery, Red County",                  	{1119.50,119.50,1451.40,493.30}},
	{"Mulholland, Los Santos",                  	{1414.00,-768.00,1667.60,-452.40}},
	{"Mulholland, Los Santos",                  	{1269.10,-768.00,1414.00,-452.40}},
	{"Mulholland, Los Santos",                  	{1357.00,-926.90,1463.90,-768.00}},
	{"Mulholland, Los Santos",                  	{1318.10,-910.10,1357.00,-768.00}},
	{"Mulholland, Los Santos",                  	{1169.10,-910.10,1318.10,-768.00}},
	{"Mulholland, Los Santos",                  	{768.60,-954.60,952.60,-860.60}},
	{"Mulholland, Los Santos",                  	{687.80,-860.60,911.80,-768.00}},
	{"Mulholland, Los Santos",                  	{1096.40,-910.10,1169.10,-768.00}},
	{"Mulholland, Los Santos",                  	{952.60,-937.10,1096.40,-860.60}},
	{"Mulholland, Los Santos",                  	{911.80,-860.60,1096.40,-768.00}},
	{"North Rock, Red County",                  	{2285.30,-768.00,2770.50,-269.70}},
	{"Ocean Docks, Los Santos",                 	{2373.70,-2697.00,2809.20,-2330.40}},
	{"Ocean Docks, Los Santos",                 	{2201.80,-2418.30,2324.00,-2095.00}},
	{"Ocean Docks, Los Santos",                 	{2324.00,-2302.30,2703.50,-2145.10}},
	{"Ocean Docks, Los Santos",                 	{2089.00,-2394.30,2201.80,-2235.80}},
	{"Ocean Docks, Los Santos",                 	{2703.50,-2302.30,2959.30,-2126.90}},
	{"Ocean Docks, Los Santos",                 	{2324.00,-2145.10,2703.50,-2059.20}},
	{"Ocean Flats, San Fierro",                 	{-2994.40,277.40,-2867.80,458.40}},
	{"Ocean Flats, San Fierro",                 	{-2994.40,-222.50,-2593.40,277.40}},
	{"Ocean Flats, San Fierro",                 	{-2994.40,-430.20,-2831.80,-222.50}},
	{"Octane Springs, Bone County",              	{338.60,1228.50,664.30,1655.00}},
	{"Old Venturas Strip, Las Venturas",          	{2162.30,2012.10,2685.10,2202.70}},
	{"Palisades, San Fierro",                   	{-2994.40,458.40,-2741.00,1339.60}},
	{"Palomino Creek, Red County",              	{2160.20,-149.00,2576.90,228.30}},
	{"Paradiso, San Fierro",                    	{-2741.00,793.40,-2533.00,1268.40}},
	{"Pershing Square, Los Santos",             	{1440.90,-1722.20,1583.50,-1577.50}},
	{"Pirates in Men's Pants, Las Venturas",      	{1817.30,1469.20,2027.40,1703.20}},
	{"Playa del Seville, Los Santos",           	{2703.50,-2126.90,2959.30,-1852.80}},
	{"Prickle Pine, Las Venturas",                	{1534.50,2583.20,1848.40,2863.20}},
	{"Prickle Pine, Las Venturas",                	{1117.40,2507.20,1534.50,2723.20}},
	{"Prickle Pine, Las Venturas",                	{1938.80,2624.20,2121.40,2861.50}},
	{"Queens,  San Fierro",                      	{-2533.00,458.40,-2329.30,578.30}},
	{"Queens,  San Fierro",                      	{-2593.40,54.70,-2411.20,458.40}},
	{"Queens,  San Fierro",                      	{-2411.20,373.50,-2253.50,458.40}},
	{"Randolph Ind. Estate, Las Venturas",        	{1558.00,596.30,1823.00,823.20}},
	{"Redsands East, Las Venturas",               	{1817.30,2011.80,2106.70,2202.70}},
	{"Redsands East, Las Venturas",               	{1817.30,2202.70,2011.90,2342.80}},
	{"Redsands East, Las Venturas",               	{1848.40,2342.80,2011.90,2478.40}},
	{"Redsands West, Las Venturas",               	{1236.60,1883.10,1777.30,2142.80}},
	{"Redsands West, Las Venturas",               	{1297.40,2142.80,1777.30,2243.20}},
	{"Redsands West, Las Venturas",               	{1377.30,2243.20,1704.50,2433.20}},
	{"Redsands West, Las Venturas",               	{1704.50,2243.20,1777.30,2342.80}},
	{"Regular Tom, Bone County",                 	{-405.70,1712.80,-276.70,1892.70}},
	{"Richman, Los Santos",                     	{647.50,-1118.20,787.40,-954.60}},
	{"Richman, Los Santos",                     	{647.50,-954.60,768.60,-860.60}},
	{"Richman, Los Santos",                     	{225.10,-1369.60,334.50,-1292.00}},
	{"Richman, Los Santos",                     	{225.10,-1292.00,466.20,-1235.00}},
	{"Richman, Los Santos",                     	{72.60,-1404.90,225.10,-1235.00}},
	{"Richman, Los Santos",                     	{72.60,-1235.00,321.30,-1008.10}},
	{"Richman, Los Santos",                     	{321.30,-1235.00,647.50,-1044.00}},
	{"Richman, Los Santos",                     	{321.30,-1044.00,647.50,-860.60}},
	{"Richman, Los Santos",                     	{321.30,-860.60,687.80,-768.00}},
	{"Roca Escalante, Las Venturas",              	{2237.40,2202.70,2536.40,2542.50}},
	{"Roca Escalante, Las Venturas",              	{2536.40,2202.70,2625.10,2442.50}},
	{"Rodeo, Los Santos",                       	{72.60,-1684.60,225.10,-1544.10}},
	{"Rodeo, Los Santos",                       	{72.60,-1544.10,225.10,-1404.90}},
	{"Rodeo, Los Santos",                       	{225.10,-1684.60,312.80,-1501.90}},
	{"Rodeo, Los Santos",                       	{225.10,-1501.90,334.50,-1369.60}},
	{"Rodeo, Los Santos",                       	{334.50,-1501.90,422.60,-1406.00}},
	{"Rodeo, Los Santos",                       	{312.80,-1684.60,422.60,-1501.90}},
	{"Rodeo, Los Santos",                       	{422.60,-1684.60,558.00,-1570.20}},
	{"Rodeo, Los Santos",                       	{558.00,-1684.60,647.50,-1384.90}},
	{"Rodeo, Los Santos",                       	{466.20,-1570.20,558.00,-1385.00}},
	{"Rodeo, Los Santos",                       	{422.60,-1570.20,466.20,-1406.00}},
	{"Rodeo, Los Santos",                       	{466.20,-1385.00,647.50,-1235.00}},
	{"Rodeo, Los Santos",                       	{334.50,-1406.00,466.20,-1292.00}},
	{"Royal Casino, Las Venturas",                 	{2087.30,1383.20,2437.30,1543.20}},
	{"Santa Flora, San Fierro",                 	{-2741.00,458.40,-2533.00,793.40}},
	{"Spinybed, Las Venturas",                    	{2121.40,2663.10,2498.20,2861.50}},
	{"Starfish Casino, Las Venturas",             	{2437.30,1783.20,2685.10,2012.10}},
	{"Starfish Casino, Las Venturas",             	{2437.30,1858.10,2495.00,1970.80}},
	{"Starfish Casino, Las Venturas",             	{2162.30,1883.20,2437.30,2012.10}},
	{"Temple, Los Santos",                      	{1252.30,-1130.80,1378.30,-1026.30}},
	{"Temple, Los Santos",                      	{1252.30,-1026.30,1391.00,-926.90}},
	{"Temple, Los Santos",                      	{1252.30,-926.90,1357.00,-910.10}},
	{"Temple, Los Santos",                      	{952.60,-1130.80,1096.40,-937.10}},
	{"Temple, Los Santos",                      	{1096.40,-1130.80,1252.30,-1026.30}},
	{"Temple, Los Santos",                      	{1096.40,-1026.30,1252.30,-910.10}},
	{"The Camel's Toe, Las Venturas",             	{2087.30,1203.20,2640.40,1383.20}},
	{"The Clown's Pocket, Las Venturas",          	{2162.30,1783.20,2437.30,1883.20}},
	{"The Emerald Isle, Las Venturas",            	{2011.90,2202.70,2237.40,2508.20}},
	{"The Farm, Flint County",                    	{-1209.60,-1317.10,-908.10,-787.30}},
	{"Four Dragons Casino, Las Venturas",         	{1817.30,863.20,2027.30,1083.20}},
	{"The High Roller, Las Venturas",             	{1817.30,1283.20,2027.30,1469.20}},
	{"The Pink Swan, Red County",               	{1817.30,1083.20,2027.30,1283.20}},
	{"The Sherman Dam, Las Venturas",             	{-968.70,1929.40,-481.10,2155.20}},
	{"The Strip, Las Venturas",                   	{2027.40,863.20,2087.30,1703.20}},
	{"The Strip, Las Venturas",                   	{2106.70,1863.20,2162.30,2202.70}},
	{"The Strip, Las Venturas",                   	{2027.40,1783.20,2162.30,1863.20}},
	{"The Strip, Las Venturas",                   	{2027.40,1703.20,2137.40,1783.20}},
	{"The Visage, Las Venturas",                  	{1817.30,1863.20,2106.70,2011.80}},
	{"The Visage, Las Venturas",                  	{1817.30,1703.20,2027.40,1863.20}},
	{"Unity Station, Los Santos",               	{1692.60,-1971.80,1812.60,-1932.80}},
	{"Valle Ocultado, Los Santos",              	{-936.60,2611.40,-715.90,2847.90}},
	{"Verdant Bluffs, Los Santos",              	{1073.20,-2006.70,1249.60,-1842.20}},
	{"Verdant Bluffs, Los Santos",              	{1249.60,-2179.20,1692.60,-1842.20}},
	{"Verdant Meadows, Bone County",             	{37.00,2337.10,435.90,2677.90}},
	{"Verona Beach, Los Santos",                	{930.20,-2006.70,1073.20,-1804.20}},
	{"Verona Beach, Los Santos",                	{851.40,-1804.20,1046.10,-1577.50}},
	{"Verona Beach, Los Santos",                	{1161.50,-1722.20,1323.90,-1577.50}},
	{"Verona Beach, Los Santos",                	{1046.10,-1722.20,1161.50,-1577.50}},
	{"Vinewood, Los Santos",                    	{787.40,-1310.20,952.60,-1130.80}},
	{"Vinewood, Los Santos",                    	{787.40,-1130.80,952.60,-954.60}},
	{"Vinewood, Los Santos",                    	{647.50,-1227.20,787.40,-1118.20}},
	{"Vinewood, Los Santos",                    	{647.70,-1416.20,787.40,-1227.20}},
	{"Whitewood Estates, Las Venturas",           	{883.30,1726.20,1098.30,2507.20}},
	{"Whitewood Estates, Las Venturas",           	{1098.30,1726.20,1197.30,2243.20}},
	{"Willowfield, Los Santos",                 	{1970.60,-2179.20,2089.00,-1852.80}},
	{"Willowfield, Los Santos",                 	{2089.00,-2235.80,2201.80,-1989.90}},
	{"Willowfield, Los Santos",                 	{2089.00,-1989.90,2324.00,-1852.80}},
	{"Willowfield, Los Santos",                 	{2201.80,-2095.00,2324.00,-1989.90}},
	{"Willowfield, Los Santos",                 	{2541.70,-1941.40,2703.50,-1852.80}},
	{"Willowfield, Los Santos",                 	{2324.00,-2059.20,2541.70,-1852.80}},
	{"Willowfield, Los Santos",                 	{2541.70,-2059.20,2703.50,-1941.40}}
};

enum pconfig
{
	ZoneTextdraw,
	DamageTextdraw,
	MaplogoTextdraw,
	HitSound,
	SpawnProtectionTime,
	TimeTextdraw,
	StatTime,
	WeaponGet[12]
};
new PlayerVariable[M_P][pconfig];

enum sconfig
{
	RoundTime
};
new ServerVariable[sconfig];

forward SpawnPlayerEx(playerid);
forward EnableSync(playerid);
forward SyncPlayer(playerid);
forward SaveZoneInfo(Zoneid,owner);
forward BasicTimer();
forward SetPlayerSpawn(playerid);
forward SpawnPlayerProtection(playerid, toggle);
forward OnPlayerSave(playerid);
forward OnTeamSave(teamid);
forward OnTeamLoad(teamid);
forward OnPlayerRegister(playerid, password[]);
forward OnPlayerLogin(playerid,password[]);
forward ResetDual(playerid, targetid);
forward ChangeZone();
forward LoadZoneInfo(Zoneid);
forward DestroyPickuped(playerid);
forward Spectating(playerid, targetid, bool: toogle);
forward CreatePingLabels();
forward HideDamage(playerid, hits);
forward ResetPlayerHits(playerid, hits);
forward ResetDmgLabel(playerid);
forward DestroyObjectEx(objectid);
forward ShowPlayerConfigDialog(playerid);
forward HideStats(showid, playerid);
forward ShowServerConfigDialog(playerid);
forward SaveConfigInfo();
forward LoadConfigInfo();
forward ShowTeamMakingDialog(playerid);
forward ShowTeamListDialog(playerid);
forward ShowPlayerWeaponDialog(playerid);

stock OnWeaponDropPickup(playerid, pickupid)
{
    new world = GetPlayerVirtualWorld(playerid);
    new Float:hp;
    GetPlayerHealth(playerid, hp);
	for(new i=0; i<MAX_PLAYERS; i++)
	{
		for(new a=0; a<13; a++)
		{
		    if(WeaponDrop[i][a] == pickupid && WeaponData[i][a][2] == world)
		    {
		        for(new j=0; j<13; j++)
		        {
		        	if(WeaponData[i][a][0] == WeaponInfo[j][wID] && PlayerVariable[playerid][WeaponGet][j] == 1)
		        	{
				        WeaponDrop[i][a] = -1;
				        DestroyPickup(pickupid);
				        GivePlayerWeapon(playerid, WeaponData[i][a][0], WeaponData[i][a][1]);
				    	WeaponData[i][a][0] = -1;
				    	WeaponData[i][a][1] = -1;
					}
				}
		    }
		}
		if(WeaponDrop[i][13] == pickupid)
		{
	        WeaponDrop[i][13] = -1;
	        DestroyPickup(pickupid);
		    GivePlayerMoney(playerid, WeaponData[i][13][0]);
	    	WeaponData[i][13][0] = -1;
	    	WeaponData[i][13][1] = -1;
		}

		if(WeaponDrop[i][14] == pickupid)
		{
	        WeaponDrop[i][14] = -1;
	        DestroyPickup(pickupid);
		    SetPlayerHealth(playerid,hp+20);
	    	WeaponData[i][14][0] = -1;
	    	WeaponData[i][14][1] = -1;
		}
	}

	return 1;
}

stock IsPlayerLeader(playerid)
{
	for(new i=1; i<MAX_TEAM; i++)
	{
		if(!strcmp(PlayerName(playerid), TeamInfo[i][Name]))
		return 1;
	}
	return 0;
}

stock ResetTeamInfo(teamid)
{
	TeamInfo[teamid][Used] = 0;
	TeamInfo[teamid][Kill] = 0;
	TeamInfo[teamid][Color] = -87;
	strmid(TeamInfo[teamid][Name], "No_Name", 0, strlen("No_Name"), 255);
	strmid(TeamInfo[teamid][Leader], "No_Leader", 0, strlen("No_Leader"), 255);
}

stock IsPlayerInZone(playerid, gangzone)
{
	new Float:X,Float:Y,Float:Z;
	GetPlayerPos(playerid, X, Y, Z);
	if(X >= gSANZones[gangzone][SAZONE_AREA][0] && X <= gSANZones[gangzone][SAZONE_AREA][2] && Y >= gSANZones[gangzone][SAZONE_AREA][1] && Y <= gSANZones[gangzone][SAZONE_AREA][3]) return 1;
	else return 0;
}

stock ResetPlayerVariable(playerid)
{
	new Temp[pInfo];
    PlayerInfo[playerid] = Temp;
    
    PlayerInfo[playerid][pCanSync] = true;
    PlayerInfo[playerid][pSynced] = false;
	PlayerInfo[playerid][pWeapons][0] = WeaponInfo[6][wID];
	PlayerInfo[playerid][pAmmo][0] = WeaponInfo[6][wAmount];
	PlayerInfo[playerid][pWeaponID][0] = 6;
	PlayerInfo[playerid][pWeapons][1] = WeaponInfo[5][wID];
	PlayerInfo[playerid][pAmmo][1] = WeaponInfo[5][wAmount];
	PlayerInfo[playerid][pWeaponID][1] = 5;
	PlayerInfo[playerid][pWeapons][2] = WeaponInfo[10][wID];
	PlayerInfo[playerid][pAmmo][2] = WeaponInfo[10][wAmount];
	PlayerInfo[playerid][pWeaponID][2] = 10;
	
	gPlayerLogged[playerid] = false;
	gPlayerSpawned[playerid] = false;
	Kills[playerid] = 0;
	KillStat[playerid] = 0;
 	SpawnType[playerid] = true;
 	ToggleWar[playerid] = false;
	Spectate[playerid] = false;
    Protection[playerid] = false;

	PlayerVariable[playerid][ZoneTextdraw] = 1;
	PlayerVariable[playerid][DamageTextdraw] = true;
	PlayerVariable[playerid][MaplogoTextdraw] = true;
	PlayerVariable[playerid][TimeTextdraw] = true;
	PlayerVariable[playerid][HitSound] = true;
	PlayerVariable[playerid][SpawnProtectionTime] = 3;
	PlayerVariable[playerid][StatTime] = 10;
	PlayerVariable[playerid][WeaponGet] = 1;
}

stock RandomSpawn(playerid)
{
    new diffX;
    new diffY;
    new Float:randX, Float:randY, Float:randZ;
	diffX = floatround(gSANZones[ZoneID][SAZONE_AREA][2] - gSANZones[ZoneID][SAZONE_AREA][0], floatround_floor);
	diffY = floatround(gSANZones[ZoneID][SAZONE_AREA][3] - gSANZones[ZoneID][SAZONE_AREA][1], floatround_floor);

	randX = gSANZones[ZoneID][SAZONE_AREA][0] + random(diffX);
	randY = gSANZones[ZoneID][SAZONE_AREA][1] + random(diffY);
	MapAndreas_FindZ_For2DCoord(randX, randY, randZ);
	SetPlayerPos(playerid, randX, randY, randZ+0.5);
}

stock GetBattlePlayer(playerid)
{
	new number = 0;
	for(new i=0; i<NUM_PLAYERS; i++)
	{
	    #define j pITERATION[i]
	    if(j != playerid && ToggleWar[j] == true)
			number ++;
        #undef j
	}
	return number;
}
stock strcpy(dest[],src[])
{
	new i = 0;
	while((dest[i] = src[i]))
		i++;
}

stock ini_GetKey( line[] )
{
	new keyRes[128];
	keyRes[0] = 0;
    if( strfind( line , "=" , true ) == -1 ) return keyRes;
    strmid( keyRes , line , 0 , strfind( line , "=" , true ) , sizeof( keyRes) );
    return keyRes;
}

stock ini_GetValue( line[] )
{
	new valRes[128];
	valRes[0]=0;
	if( strfind( line ,  "=" , true ) == -1 ) return valRes;
	strmid( valRes , line , strfind( line , "=" , true )+1 , strlen( line ) , sizeof( valRes ) );
	return valRes;
}

stock stringslice_c(const string[],index,separator=' ')
{
	new
		sliceidx,
		bool:copye,bool:find,
		result[256],idx
	;
	for(new i,t=strlen(string); i<t; i++)
	{
		if(!copye)
			if(find)
			{
				if(string[i] == separator)
				{
					sliceidx ++;
					find = false;
				}
			} else {
				if(string[i] != separator)
				{
					if(sliceidx == index)
						copye = true;
					find = true;
				}
			}
		if(copye)
			result[idx++] = string[i];
	}
	return result;
}

stock stringslice(const string[],stringindex)
{
	new stringstart;
	new stringnum;
	new stringlength;
	new result[25];
	for(stringnum=0;stringnum<=stringindex && stringlength<=strlen(string);++stringnum)
	{
		if(stringnum>0) stringlength++;
		stringstart=stringlength;
		while(stringlength<=strlen(string) && string[stringlength]!=' ' && string[stringlength]!=EOS)
		{
			stringlength++;
		}
	}
	stringnum=0;
	stringlength=stringlength-stringstart;
	while(stringnum<=stringlength && stringnum<=sizeof(result))
	{
		result[stringnum]=string[stringnum+stringstart];
		stringnum++;
	}
	result[stringlength]=EOS;
	return result;
}

stock PlayerName(playerid)
{
	new playername[MAX_PLAYER_NAME];
	GetPlayerName(playerid, playername, sizeof(playername));
	return playername;
}

stock ClearChatbox(playerid, lines)
{
	if(IsPlayerConnected(playerid))
	{
		for(new i=0; i<lines; i++)
		{
			SCM(playerid, COLOR_WHITE, " ");
		}
	}
	return 1;
}

stock split(const strsrc[], strdest[][], delimiter)
{
	new i, li;
	new aNum;
	new len;
	while(i <= strlen(strsrc)){
	    if(strsrc[i]==delimiter || i==strlen(strsrc)){
	        len = strmid(strdest[aNum], strsrc, li, i, 128);
	        strdest[aNum][len] = 0;
	        li = i+1;
	        aNum++;
		}
		i++;
	}
	return 1;
}

stock FIX_valstr(dest[], value, bool:pack = false)
{
    // format can't handle cellmin properly
    static const cellmin_value[] = !"-2147483648";

    if (value == cellmin)
        pack && strpack(dest, cellmin_value, 12) || strunpack(dest, cellmin_value, 12);
    else
        format(dest, 12, "%d", value), pack && strpack(dest, dest, 12);
}
#define valstr FIX_valstr

stock ShowStats(showid, playerid)
{
	new Hour, Minute, Second;
	gettime(Hour, Minute, Second);
	
	new string[256];
	new temp[512];
	new Float:Ratio=floatdiv(PlayerInfo[playerid][pKill],PlayerInfo[playerid][pDeath]);
	
	format(temp,sizeof(temp)," ~w~Stats of ~r~%s~n~",PlayerName(playerid));
	strcat(string,temp);
	format(temp,sizeof(temp)," ~w~Kills: ~y~%d ~w~Deaths: ~y~%d ~w~Ratio: ~y~%.4f~n~",PlayerInfo[playerid][pKill],PlayerInfo[playerid][pDeath],Ratio);
	strcat(string,temp);
	format(temp,sizeof(temp)," ~w~Gained Point: ~y~%d~n~",PlayerInfo[playerid][pPoint]);
	strcat(string,temp);
	format(temp,sizeof(temp)," %s~n~",GetMostWeaponStr(playerid));
	strcat(string,temp);
	format(temp,sizeof(temp)," ~w~Current Time: ~y~%02d:%02d:%02d",Hour, Minute, Second);
	strcat(string,temp);
	
	TextDrawSetString(TD_Stat[playerid], string);
	TextDrawShowForPlayer(showid, TD_Stat[playerid]);
	KillTimer(StatTimer[showid]);
	StatTimer[showid] = SetTimerEx("HideStats", PlayerVariable[playerid][StatTime]*1000, 0, "i", showid, playerid);
	return 1;
}

stock GetMostWeaponStr(playerid)
{
	new str[128];
	new MAX = PlayerInfo[playerid][pWeaponKill][0], id;
	for(new i=1; i<12; i++)
	{
	    if(MAX < PlayerInfo[playerid][pWeaponKill][i])
	    {
			MAX = PlayerInfo[playerid][pWeaponKill][i];
			id = i;
		}
	}
	if(PlayerInfo[playerid][pWeaponKill][id] == 0)
	    format(str,sizeof(str),"~w~Favorite Weapon: ~y~No Kills Yet");
	else
		format(str,sizeof(str),"~w~Favorite Weapon: ~y~%s (%d Kills)", WeaponInfo[id][wName], MAX);
	return str;
}

stock SendTeamMessage(team, color, text[])
{
	for(new i=0; i<NUM_PLAYERS; i++)
	{
	    #define j pITERATION[i]
	    if(PlayerInfo[j][pTeam] == team)
			SCM(j, color, text);
        #undef j
	}
}

stock OnPlayerHealthChange(playerid, Float:newhealth)
{
	if (PlayerInfo[playerid][pHP] > newhealth && Protection[playerid] == false)
	{
		new object;
		object = CreateObject(1240, 0, 0, 0, 0, 0, 0);
		AttachObjectToPlayer(object, playerid, 0, 0, 1.35, 0, 0, 0);
		SetTimerEx("DestroyObjectEx", 200, false, "i", object);
	}
	return 1;
}


main()
{
	print("\n--------------------------------------------------------------------");
	print(" \t\tGTA:T Korea Mode On");
	print(" \t\t\t이 모드의 저작권은 'Cada'에게 있습니다.");
	print("--------------------------------------------------------------------\n");
	
	Authentication("skqoaudgh.dothome.co.kr",0);
}

public OnGameModeInit()
{
	new string[56];
    
    format(string,sizeof(string),"GTAT:Korea v%s",MODE_VERSION);
	SetGameModeText(string);
	format(string,sizeof(string),"language %s",MODE_LANGUAGE);
	SendRconCommand(string);
	format(string,sizeof(string),"mapname %s",MODE_MAPNAME);
	SendRconCommand(string);
	format(string,sizeof(string),"weburl %s",MODE_URL);
	SendRconCommand(string);
	
	SetWeather(10);
	SetWorldTime(15);
	
	MapAndreas_Init(MAP_ANDREAS_MODE_MINIMAL);
	UsePlayerPedAnims();
	DisableInteriorEnterExits();
	CreatePingLabels();
	OnWeaponDropInit();
	TeamInfo[0][Color] = -87;
	
	LoadConfigInfo();
	for(new i=0; i<MAX_ZONE; i++)
	{
	    GangZone[i] = GangZoneCreate(gSANZones[i][SAZONE_AREA][0],gSANZones[i][SAZONE_AREA][1],gSANZones[i][SAZONE_AREA][2],gSANZones[i][SAZONE_AREA][3]);
        LoadZoneInfo(i);
	}
	format(TeamInfo[0][Name],56,"NO-ONE TEAM");
	
	for(new i=1; i<MAX_TEAM; i++)
		OnTeamLoad(i);
	
	SetTimer("BasicTimer",1000,1);
	
	for(new i=0; i<74; i++)
		AddPlayerClass(i, 0.0, 0.0, 0.0, 0.0, 0, 0, 0, 0, 0, 0);
	for(new i=75; i<312; i++)
		AddPlayerClass(i, 0.0, 0.0, 0.0, 0.0, 0, 0, 0, 0, 0, 0);

	CreateObject(19074, 1903.18604, 698.42468, 1005.52058,   0.00000, 0.00000, 0.00000);
	
	AddStaticPickup(1239, 1, -785.0139, 500.2697, 1371.7422, -1);
	
	TD_GTAT[0] = TextDrawCreate(142.628540, 402.653198, "Grand");
	TextDrawLetterSize(TD_GTAT[0], 0.300000, 1.500000);
	TextDrawAlignment(TD_GTAT[0], 1);
	TextDrawColor(TD_GTAT[0], -1);
	TextDrawSetOutline(TD_GTAT[0], 1);
	TextDrawBackgroundColor(TD_GTAT[0], 51);
	TextDrawFont(TD_GTAT[0], 1);
	TextDrawSetProportional(TD_GTAT[0], 1);

	TD_GTAT[1] = TextDrawCreate(154.590438, 413.393280, "theft");
	TextDrawLetterSize(TD_GTAT[1], 0.300000, 1.500000);
	TextDrawAlignment(TD_GTAT[1], 1);
	TextDrawColor(TD_GTAT[1], -1);
	TextDrawSetOutline(TD_GTAT[1], 1);
	TextDrawBackgroundColor(TD_GTAT[1], 51);
	TextDrawFont(TD_GTAT[1], 1);
	TextDrawSetProportional(TD_GTAT[1], 1);

	TD_GTAT[2] = TextDrawCreate(142.171493, 423.206604, "Auto");
	TextDrawLetterSize(TD_GTAT[2], 0.300000, 1.500000);
	TextDrawAlignment(TD_GTAT[2], 1);
	TextDrawColor(TD_GTAT[2], -1);
	TextDrawSetOutline(TD_GTAT[2], 1);
	TextDrawBackgroundColor(TD_GTAT[2], 51);
	TextDrawFont(TD_GTAT[2], 1);
	TextDrawSetProportional(TD_GTAT[2], 1);

	TD_GTAT[3] = TextDrawCreate(189.257232, 403.153289, "Korea");
	TextDrawLetterSize(TD_GTAT[3], 0.500000, 2.000000);
	TextDrawAlignment(TD_GTAT[3], 1);
	TextDrawColor(TD_GTAT[3], -16776961);
	TextDrawSetOutline(TD_GTAT[3], 1);
	TextDrawBackgroundColor(TD_GTAT[3], 51);
	TextDrawFont(TD_GTAT[3], 0);
	TextDrawSetProportional(TD_GTAT[3], 1);

	TD_GTAT[4] = TextDrawCreate(180.114181, 424.059967, "Tournament");
	TextDrawLetterSize(TD_GTAT[4], 0.300000, 1.500000);
	TextDrawAlignment(TD_GTAT[4], 1);
	TextDrawColor(TD_GTAT[4], -16776961);
	TextDrawSetOutline(TD_GTAT[4], 1);
	TextDrawBackgroundColor(TD_GTAT[4], 51);
	TextDrawFont(TD_GTAT[4], 1);
	TextDrawSetProportional(TD_GTAT[4], 1);

	TD_Setting[0] = TextDrawCreate(356.666687, 334.313437, "usebox");
	TextDrawLetterSize(TD_Setting[0], 0.000000, 6.218147);
	TextDrawTextSize(TD_Setting[0], 260.857147, 0.000000);
	TextDrawAlignment(TD_Setting[0], 1);
	TextDrawUseBox(TD_Setting[0], true);
	TextDrawBoxColor(TD_Setting[0], 102);
	
	TD_Setting[1] = TextDrawCreate(308.514373, 350.720031, "Set SpawnPosition"); 
	TextDrawTextSize(TD_Setting[1],10.000000, 100.000000);
 	TextDrawLetterSize(TD_Setting[1], 0.250000, 1.250000);
	TextDrawAlignment(TD_Setting[1], 2);
	TextDrawColor(TD_Setting[1], -5963521);
	TextDrawSetOutline(TD_Setting[1], 1);
	TextDrawBackgroundColor(TD_Setting[1], 51);
	TextDrawFont(TD_Setting[1], 1);
	TextDrawSetProportional(TD_Setting[1], 1);
	TextDrawSetSelectable(TD_Setting[1], 1);

	TD_Setting[2] = TextDrawCreate(308.114227, 365.640014, "Set SpawnWeapon");
	TextDrawTextSize(TD_Setting[2],10.000000, 100.000000);
 	TextDrawLetterSize(TD_Setting[2], 0.250000, 1.250000);
	TextDrawAlignment(TD_Setting[2], 2);
	TextDrawColor(TD_Setting[2], -5963521);
	TextDrawSetOutline(TD_Setting[2], 1);
	TextDrawBackgroundColor(TD_Setting[2], 51);
	TextDrawFont(TD_Setting[2], 1);
	TextDrawSetProportional(TD_Setting[2], 1);
	TextDrawSetSelectable(TD_Setting[2], 1);

	TD_Setting[3] = TextDrawCreate(308.114227, 380.559997, "Set Configurations");
	TextDrawTextSize(TD_Setting[3],10.000000, 100.000000);
 	TextDrawLetterSize(TD_Setting[3], 0.250000, 1.250000);
	TextDrawAlignment(TD_Setting[3], 2);
	TextDrawColor(TD_Setting[3], -5963521);
	TextDrawSetOutline(TD_Setting[3], 1);
	TextDrawBackgroundColor(TD_Setting[3], 51);
	TextDrawFont(TD_Setting[3], 1);
	TextDrawSetProportional(TD_Setting[3], 1);
	TextDrawSetSelectable(TD_Setting[3], 1);

	TD_Setting[4] = TextDrawCreate(308.514373, 335.800031, "Spawn Saved Skin");
	TextDrawTextSize(TD_Setting[4],10.000000, 100.000000);
 	TextDrawLetterSize(TD_Setting[4], 0.250000, 1.250000);
	TextDrawAlignment(TD_Setting[4], 2);
	TextDrawColor(TD_Setting[4], -5963521);
	TextDrawSetOutline(TD_Setting[4], 1);
	TextDrawBackgroundColor(TD_Setting[4], 51);
	TextDrawFont(TD_Setting[4], 1);
	TextDrawSetProportional(TD_Setting[4], 1);
	TextDrawSetSelectable(TD_Setting[4], 1);
	
	TD_SiteURL = TextDrawCreate(8.333349, 428.006530, "cafe.daum.net/sampkor");
	TextDrawLetterSize(TD_SiteURL, 0.300000, 1.500000);
	TextDrawAlignment(TD_SiteURL, 1);
	TextDrawColor(TD_SiteURL, -5963521);
	TextDrawSetOutline(TD_SiteURL, 1);
	TextDrawBackgroundColor(TD_SiteURL, 51);
	TextDrawFont(TD_SiteURL, 1);
	TextDrawSetProportional(TD_SiteURL, 1);

	TD_Zone[0] = TextDrawCreate(636.190551, 415.146545, "Zone:");
	TextDrawLetterSize(TD_Zone[0], 0.300000, 1.500000);
	TextDrawAlignment(TD_Zone[0], 3);
	TextDrawColor(TD_Zone[0], -1);
	TextDrawSetShadow(TD_Zone[0], 0);
	TextDrawSetOutline(TD_Zone[0], 1);
	TextDrawBackgroundColor(TD_Zone[0], 51);
	TextDrawFont(TD_Zone[0], 1);
	TextDrawSetProportional(TD_Zone[0], 1);

	TD_Zone[1] = TextDrawCreate(636.571289, 428.373260, gSANZones[0][SAZONE_NAME]);
	TextDrawLetterSize(TD_Zone[1], 0.600000, 1.799999);
	TextDrawAlignment(TD_Zone[1], 3);
	TextDrawColor(TD_Zone[1], -1378294017);
	TextDrawSetShadow(TD_Zone[1], 0);
	TextDrawSetOutline(TD_Zone[1], 1);
	TextDrawBackgroundColor(TD_Zone[1], 51);
	TextDrawFont(TD_Zone[1], 1);
	TextDrawSetProportional(TD_Zone[1], 1);

	TD_Spec[0] = TextDrawCreate(5.333312, 241.493286, "Next Player: ~g~Num6");
	TextDrawLetterSize(TD_Spec[0], 0.200000, 1.500000);
	TextDrawAlignment(TD_Spec[0], 1);
	TextDrawColor(TD_Spec[0], -1);
	TextDrawSetOutline(TD_Spec[0], 1);
	TextDrawBackgroundColor(TD_Spec[0], 51);
	TextDrawFont(TD_Spec[0], 2);
	TextDrawSetProportional(TD_Spec[0], 1);

	TD_Spec[1] = TextDrawCreate(5.333342, 253.866668, "Prev Player: ~g~Num4");
	TextDrawLetterSize(TD_Spec[1], 0.200000, 1.500000);
	TextDrawAlignment(TD_Spec[1], 1);
	TextDrawColor(TD_Spec[1], -1);
	TextDrawSetOutline(TD_Spec[1], 1);
	TextDrawBackgroundColor(TD_Spec[1], 51);
	TextDrawFont(TD_Spec[1], 2);
	TextDrawSetProportional(TD_Spec[1], 1);

	for(new i,t=GetMaxPlayers(); i<t; i++)
	{
		DamageTexts[i] = TextDrawCreate(525.0, 330.0,"-");
		TextDrawAlignment(DamageTexts[i],0);
		TextDrawFont(DamageTexts[i],3);
		TextDrawLetterSize(DamageTexts[i],0.45,1.40);
		TextDrawSetOutline(DamageTexts[i],1);
		TextDrawSetShadow(DamageTexts[i],1);
		TextDrawBackgroundColor(DamageTexts[i],0x000000FF);
		TextDrawSetProportional(DamageTexts[i],1);
		TextDrawColor(DamageTexts[i], 0xFF0000FF);

		TD_Stat[i] = TextDrawCreate(41.999950, 283.013336, "Stats of Name");
		TextDrawLetterSize(TD_Stat[i], 0.199999, 1.062932);
		TextDrawTextSize(TD_Stat[i], 180.000000, 0.000000);
		TextDrawAlignment(TD_Stat[i], 1);
		TextDrawColor(TD_Stat[i], -1);
		TextDrawUseBox(TD_Stat[i], 1);
		TextDrawBoxColor(TD_Stat[i], 96);
		TextDrawSetShadow(TD_Stat[i], 0);
		TextDrawSetOutline(TD_Stat[i], 1);
		TextDrawBackgroundColor(TD_Stat[i], 255);
		TextDrawFont(TD_Stat[i], 1);
		TextDrawSetProportional(TD_Stat[i], 1);
		TextDrawSetShadow(TD_Stat[i], 0);

		TD_LevelBar[i] = TextDrawCreate(588.676818, 59.433361, "0/100");
		TextDrawLetterSize(TD_LevelBar[i], 0.184380, 0.575999);
		TextDrawAlignment(TD_LevelBar[i], 3);
		TextDrawColor(TD_LevelBar[i], -1);
		TextDrawSetShadow(TD_LevelBar[i], 0);
		TextDrawSetOutline(TD_LevelBar[i], 0);
		TextDrawBackgroundColor(TD_LevelBar[i], 255);
		TextDrawFont(TD_LevelBar[i], 1);
		TextDrawSetProportional(TD_LevelBar[i], 1);
		TextDrawSetShadow(TD_LevelBar[i], 0);
		PlayerInfo[i][LevelBar] = CreateProgressBar(547.5, 59.5, 62.5, 5.4, 0xFFA600FF, 100.0, BAR_DIRECTION_RIGHT, 0x000000FF);
		
		TD_Level[i] = TextDrawCreate(547.261901, 45.386768, "Level: 0");
		TextDrawLetterSize(TD_Level[i], 0.202666, 1.070933);
		TextDrawAlignment(TD_Level[i], 1);
		TextDrawColor(TD_Level[i], -1);
		TextDrawSetShadow(TD_Level[i], 0);
		TextDrawSetOutline(TD_Level[i], 1);
		TextDrawBackgroundColor(TD_Level[i], 255);
		TextDrawFont(TD_Level[i], 3);
		TextDrawSetProportional(TD_Level[i], 1);
		TextDrawSetShadow(TD_Level[i], 0);
	}
	
	TD_Time = TextDrawCreate(554.676086, 19.546667, "00:00");
	TextDrawLetterSize(TD_Time, 0.352000, 2.012265);
	TextDrawAlignment(TD_Time, 1);
	TextDrawColor(TD_Time, 255);
	TextDrawSetShadow(TD_Time, 0);
	TextDrawSetOutline(TD_Time, 0);
	TextDrawBackgroundColor(TD_Time, 255);
	TextDrawFont(TD_Time, 2);
	TextDrawSetProportional(TD_Time, 1);
	TextDrawSetShadow(TD_Time, 0);
	

	TD_RequestBG[0] = TextDrawCreate(0.476174, 400.412902, " ");
	TextDrawLetterSize(TD_RequestBG[0], 0.400000, 1.600000);
	TextDrawTextSize(TD_RequestBG[0], 643.000000, 0.000000);
	TextDrawUseBox(TD_RequestBG[0], 1);
	TextDrawBoxColor(TD_RequestBG[0], -1378294017);
	
	TD_RequestBG[1] = TextDrawCreate(-2.571452, 404.026275, "l");
	TextDrawLetterSize(TD_RequestBG[1], 0.402285, 5.731733);
	TextDrawTextSize(TD_RequestBG[1], 639.000000, 0.000000);
	TextDrawUseBox(TD_RequestBG[1], 1);
	TextDrawBoxColor(TD_RequestBG[1], 96);
	return 1;
}

public OnGameModeExit()
{
	for(new i=1; i<MAX_TEAM; i++)
    	OnTeamSave(i);
    SaveConfigInfo();
    
 	OnWeaponDropExit();
	return 1;
}

public OnPlayerRequestClass(playerid, classid)
{
	gPlayerSpawned[playerid] = false;
	
	SetPlayerPos(playerid, -2384.8484,-584.4088,132.1172);
	SetPlayerFacingAngle(playerid, 272.7505);
	SetPlayerCameraPos(playerid, -2379.0386,-581.3090,133.6117);
	SetPlayerCameraLookAt(playerid, -2384.8484,-584.4088,132.1172);
	SetPlayerSpecialAction(playerid,random(4)+5);
	for(new i=0; i<5; i++)
		TextDrawShowForPlayer(playerid, TD_Setting[i]);
    SelectTextDraw(playerid, 0x00FF00FF);

    TextDrawShowForPlayer(playerid, TD_SiteURL);
	for(new i=0; i<5; i++)
		TextDrawShowForPlayer(playerid, TD_GTAT[i]);
		
	for(new i=0; i<2; i++)
	{
		TextDrawHideForPlayer(playerid, TD_Zone[i]);
		TextDrawShowForPlayer(playerid,TD_RequestBG[i]);
	}
	
	TextDrawHideForPlayer(playerid, TD_Time);
		
	return 1;
}

public OnPlayerConnect(playerid)
{
	new string[128], File[32];
	format(string, sizeof(string), "[!] %s(%d) 접속", PlayerName(playerid), playerid);
	SCMToAll(COLOR_GREY, string);
	//-----
    format(File, sizeof(File),User_File,PlayerName(playerid));
    if(!fexist(File) && !IsPlayerNPC(playerid))
        ShowPlayerDialog(playerid,DialogID_Userdata(0),DIALOG_STYLE_PASSWORD,""#C_ORANGE"계정 생성",""C_WHITE"계정이 존재하지 않습니다.\n\n"C_WHITE"계정 생성을 위해 새로운 비밀번호를 입력하세요.","다음","퇴장");
    else
        ShowPlayerDialog(playerid,DialogID_Userdata(1),DIALOG_STYLE_PASSWORD,""#C_ORANGE"로그인",""C_WHITE"계정이 존재합니다.\n\n"C_WHITE"로그인을 위해 비밀번호를 입력하세요.","다음","퇴장");
	//-----
	SetPlayerColor(playerid, COLOR_GREY);
	
	for(new i=0; i<MAX_ZONE; i++)
    	GangZoneShowForPlayer(playerid, GangZone[i], TeamInfo[ZoneOwner[i]][Color]);
		
	EnableStuntBonusForPlayer(playerid, 0);
    ResetPlayerVariable(playerid);
    
	pITERATION[NUM_PLAYERS] = playerid;
	pITER_INDEX[playerid] = NUM_PLAYERS;
	NUM_PLAYERS++;

	return 1;
}

public OnPlayerDisconnect(playerid, reason)
{
    OnPlayerSave(playerid);
    
	new string[128];
	switch(reason)
	{
	    case 0:	format(string, sizeof(string), "[!] %s(%d) 비정상 종료", PlayerName(playerid), playerid);
	    case 1:	format(string, sizeof(string), "[!] %s(%d) 로그아웃", PlayerName(playerid), playerid);
	    case 2:	format(string, sizeof(string), "[!] %s(%d) 킥/밴", PlayerName(playerid), playerid);
	}
	SCMToAll(COLOR_GREY, string);
	
	ResetPlayerVariable(playerid);
	
	NUM_PLAYERS--;
	pITERATION[pITER_INDEX[playerid]] = pITERATION[NUM_PLAYERS];
	pITER_INDEX[pITERATION[ NUM_PLAYERS ]] = pITER_INDEX[playerid];
	return 1;
}

public OnPlayerSpawn(playerid)
{
	PlayerInfo[playerid][pSkin] = GetPlayerSkin(playerid);
	SetPlayerSpawn(playerid);
	return 1;
}

public OnPlayerDeath(playerid, killerid, reason)
{
	new string[256];
	SendDeathMessage(killerid, playerid, reason);
	
	OnWeaponDrop(playerid);
  	if(killerid != INVALID_PLAYER_ID)
  	{
		PlayerInfo[killerid][pKill] ++;
		Kills[killerid] ++;
		SetPlayerScore(killerid, PlayerInfo[killerid][pPoint]);
		PlayerInfo[killerid][pPoint] += Kills[playerid]+1;
	}
	
	PlayerInfo[playerid][pDeath] ++;
	Kills[playerid] = 0;
	
	if(Dualed[playerid] == 2)
	{
	    SetPlayerSpawn(DualID[playerid]);
	    ResetDual(playerid, DualID[playerid]);
	    
	    format(string, sizeof(string), "[듀얼] %s(%d)가 %s(%d)을 듀얼에서 이겼습니다.", PlayerName(DualID[playerid]), DualID[playerid], PlayerName(playerid), playerid);
	    SCMToAll(COLOR_LIGHTGREEN,string);
	}
	
	if(Kills[killerid] == KllingSpree[KillStat[killerid]][Kill])
	{
	    KillStat[killerid] ++;
	    format(string,sizeof(string),"~w~> ~r~%s ~w~<",KllingSpree[KillStat[killerid]][SpreeName]);
	    GameTextForPlayer(killerid, string, 3000, 5);
	    PlayerInfo[killerid][pPoint] += KillStat[killerid];
	    if(KillStat[killerid] == 8)
	    {
	        KillStat[killerid] = 0;
	        format(string,sizeof(string),"[!] %s(%d)가 God Father 칭호에 도달하였습니다!!",PlayerName(killerid),killerid);
			SCMToAll(COLOR_LIGHTRED,string);
	    }
	    
	}
	switch(GetPlayerWeapon(killerid))
	{
	    case 0: PlayerInfo[killerid][pWeaponKill][0] ++;
	    case 9: PlayerInfo[killerid][pWeaponKill][1] ++;
	    case 16: PlayerInfo[killerid][pWeaponKill][2] ++;
	    case 18: PlayerInfo[killerid][pWeaponKill][3] ++;
	    case 23: PlayerInfo[killerid][pWeaponKill][4] ++;
	    case 24: PlayerInfo[killerid][pWeaponKill][5] ++;
	    case 25: PlayerInfo[killerid][pWeaponKill][6] ++;
	    case 27: PlayerInfo[killerid][pWeaponKill][7] ++;
	    case 29: PlayerInfo[killerid][pWeaponKill][8] ++;
	    case 30: PlayerInfo[killerid][pWeaponKill][9] ++;
	    case 31: PlayerInfo[killerid][pWeaponKill][10] ++;
	    case 34: PlayerInfo[killerid][pWeaponKill][11] ++;
	}
	return 1;
}

public OnPlayerPickUpPickup(playerid, pickupid)
{
    OnWeaponDropPickup(playerid, pickupid);
	return 1;
}

public OnPlayerText(playerid, text[])
{
	new string[512];
	format(string,sizeof(string),"%s(%d): %s",PlayerName(playerid), playerid, text);
	SCMToAll(GetPlayerColor(playerid), string);
	return 0;
}

public OnPlayerCommandText(playerid, cmdtext[])
{
    new string[512];
	new cmd[256];
	new idx;
	new tmp[256];
	new length = 0,talk[256];
	cmd = strtok(cmdtext, idx);

	if(IsPlayerAdmin(playerid))
	{
	
		if(strcmp("/서버설정",cmd,true) == 0)
		{
		    ShowServerConfigDialog(playerid);
		    return 1;
		}
		
		if(strcmp("/맵변경",cmd,true) == 0)
		{
			ChangeZone();
			return 1;
		}
		
		if(strcmp("/팀생성",cmd,true) == 0)
		{
		    ShowTeamMakingDialog(playerid);
			return 1;
		}

		if(strcmp("/팀해체",cmd,true) == 0)
		{
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp))
				return SCM(playerid, COLOR_GREY, "* 사용법: /팀해체 [팀 번호]");
			new teamid = strval(tmp);
			if(teamid > MAX_TEAM || teamid < 0)
			    return SCM(playerid, COLOR_GREY, "[!] 부적절한 팀 번호 입니다.");

			format(string,sizeof(string),"[!] 당신은 %s(%d)팀을 해체시켰습니다.", TeamInfo[teamid][Name], teamid);
			SCM(playerid, COLOR_SYSTEM, string);
			ResetTeamInfo(teamid);
			return 1;
		}
		
		if(strcmp("/리더설정",cmd,true) == 0 || strcmp("/팀설정",cmd,true) == 0 || strcmp("/리더",cmd,true) == 0|| strcmp("/팀장설정",cmd,true) == 0 )
		{
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp))
				return SCM(playerid, COLOR_GREY, "* 사용법: /리더설정 [플레이어 번호] [팀 번호]");
			new targetid = strval(tmp);
			if(!IsPlayerConnected(targetid))
			    return SCM(playerid, COLOR_GREY, "[!] 접속하지 않은 플레이어 입니다.");
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp))
				return SCM(playerid, COLOR_GREY, "* 사용법: /리더설정 [플레이어 번호] [팀 번호]");
			new teamid = strval(tmp);
			if(teamid > MAX_TEAM || teamid < 0)
			    return SCM(playerid, COLOR_GREY, "[!] 부적절한 팀 번호 입니다.");
			if(teamid == 0)
			{
			    PlayerInfo[targetid][pTeam] = 0;
				format(string,sizeof(string),"[!] 당신은 %s(%d)의 리더 권한을 회수하였습니다.", PlayerName(targetid), targetid);
				SCM(playerid, COLOR_SYSTEM, string);
				SCM(targetid, COLOR_SYSTEM, "[!] 당신의 리더 권환이 회수되었습니다.");
				return 1;
			}
			PlayerInfo[targetid][pTeam] = teamid;
            strmid(TeamInfo[teamid][Leader], PlayerName(targetid), 0, strlen(PlayerName(targetid)), 255);
            OnTeamSave(teamid);
            
			format(string,sizeof(string),"[!] 당신은 %d번 팀의 리더를 %s(%d)로 설정하였습니다.",teamid, PlayerName(targetid), targetid);
			SCM(playerid, COLOR_SYSTEM, string);
			format(string,sizeof(string),"[!] 당신은 %d번 팀의 리더가 되었습니다.",teamid);
			SCM(targetid, COLOR_SYSTEM, string);
			return 1;
		}

		if(strcmp("/팀색깔",cmd,true) == 0)
		{
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp))
				return SCM(playerid, COLOR_GREY, "* 사용법: /팀색깔 [팀 번호] [색깔코드(RGBA]");
			new teamid = strval(tmp);
			if(teamid > MAX_TEAM || teamid < 0)
			    return SCM(playerid, COLOR_GREY, "[!] 부적절한 팀 번호 입니다.");
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp))
				return SCM(playerid, COLOR_GREY, "* 사용법: /리더설정 [플레이어 번호] [색깔코드(RGBA]");
			new colorid = strval(tmp);
			    
			TeamInfo[teamid][Color] = colorid;
			OnTeamSave(teamid);
			
			format(string,sizeof(string),"[!] 당신은 %d번 팀의 색깔을 %d로 설정하였습니다.",teamid, colorid);
			SCM(playerid, COLOR_SYSTEM, string);
			return 1;
	 	}
	 	
		if(strcmp("/팀이름",cmd,true) == 0 || strcmp("/teamname",cmd,true) == 0 || strcmp("/팀네임",cmd,true) == 0 || strcmp("/tn",cmd,true) == 0)
		{
			new teamid;
			cmd = strtok(cmdtext,idx);
			if(!strlen(cmd))
				return SCM(playerid,COLOR_GREY,"* 사용법: /팀이름 [팀 번호] [이름]");
			teamid = strval(cmd);
			cmd = strtok(cmdtext,idx);
			if(!strlen(cmd))
				return SCM(playerid,COLOR_GREY,"* 사용법: /팀이름 [팀 번호] [이름]");
			if(teamid > MAX_TEAM || teamid < 0)
			    return SCM(playerid, COLOR_GREY, "[!] 부적절한 팀 번호 입니다.");

			length += strlen(stringslice(cmdtext,0)) + strlen(stringslice(cmdtext,1)) + 2;
			strmid(talk,cmdtext,length,strlen(cmdtext),sizeof(string));
			
			strmid(TeamInfo[teamid][Name],talk,0,strlen(talk),sizeof(talk));
			OnTeamSave(teamid);
			
			format(string,sizeof(string),"[!] 당신은 %d번 팀의 이름을 %s로 설정하였습니다.",teamid, TeamInfo[teamid][Name]);
			SCM(playerid, COLOR_SYSTEM, string);
			print(string);
			return 1;
	 	}

 	
		if(strcmp("/hextoint",cmd,true) == 0 || strcmp("/코드보기",cmd,true) == 0 || strcmp("/code",cmd,true) == 0 || strcmp("/코드",cmd,true) == 0)
		{
			cmd = strtok(cmdtext,idx);
			if(!strlen(cmd))
				return SCM(playerid,COLOR_GREY,"* 사용법: /코드보기 [16진수 색깔코드]");
			new text[256];
			strcpy(text,stringslice_c(cmdtext,1));
			
			format(string,sizeof(string),"* %s -> %d",text,HexToInt(text));
			SCM(playerid,COLOR_SYSTEM,string);
			return 1;
		}
		
 	
		if(strcmp("/test",cmd,true) == 0)
		{
			format(string,sizeof(string)," %d",PlayerVariable[playerid][StatTime]);
			SCM(playerid,COLOR_SYSTEM,string);
	        
		    return 1;
		}
		
		if(strcmp("/test2",cmd,true) == 0)
		{
			TextDrawShowForPlayer(playerid, TD_Stat[playerid]);
		    return 1;
		}

		if(strcmp("/testt",cmd,true) == 0)  // 로비
		{
			format(string,sizeof(string)," %d",GetBattlePlayer(playerid));
			SCM(playerid,COLOR_SYSTEM,string);
	        
	        if(SpawnType[playerid] == true) SCM(playerid,COLOR_SYSTEM,"spawn");
	        if(ToggleWar[playerid] == true) SCM(playerid,COLOR_SYSTEM,"ToggleWar");
		    return 1;
		}

		if(strcmp("/test3",cmd,true) == 0)  // 로비
		{
			format(string,sizeof(string)," %s",TeamInfo[1][Name]);
			SCM(playerid,COLOR_SYSTEM,string);
		    return 1;
		}



		if(strcmp("/test4",cmd,true) == 0)
		{
		    OnWeaponDrop(playerid);
		    return 1;
		}
		
		if(strcmp(cmd, "/ahelp", true)==0 || strcmp(cmd, "/acmd", true)==0 || strcmp(cmd, "/acmds", true)==0)
		{
		    SCM(playerid, COLOR_PASTEL_GREEN,"		Server Admin Commands");
		    SCM(playerid, COLOR_WHITE,"[!] Server - /서버설정 /맵변경");
		    SCM(playerid, COLOR_WHITE,"[!] Team - /팀생성 /팀장설정 /팀이름 /팀색깔");
		    SCM(playerid, COLOR_WHITE,"[!] ETC - /코드(보기)");
		    return 1;
		}
	}
	
	//-----
	if(strcmp(cmd, "/help", true)==0 || strcmp(cmd, "/?", true)==0 || strcmp(cmd, "/cmd", true)==0 || strcmp(cmd, "/cmds", true)==0)
	{
        SCM(playerid, COLOR_PASTEL_GREEN,"		Server User Commands");
		SCM(playerid, COLOR_WHITE,"[!] User - /config /kill /stat (/re)spawn (/l)obby");
	    SCM(playerid, COLOR_WHITE,"[!] User - /spec /dual (/s)ync");
	    SCM(playerid, COLOR_WHITE,"[!] Team - /팀목록 /팀접속 /팀초대 /팀추방");
	    SCM(playerid, COLOR_WHITE,"[!] Chat - /pm (/t)eam");
	    return 1;
	}

	if(strcmp(cmd, "/config", true)==0 || strcmp(cmd, "/설정", true)==0 || strcmp(cmd, "/myconfig", true)==0 || strcmp(cmd, "/myconfigs", true)==0 || strcmp(cmd, "/configs", true)==0 || strcmp(cmd, "/개인설정", true)==0)
	{
	    ShowPlayerConfigDialog(playerid);
		return 1;
	}

	if(strcmp(cmd, "/s", true)==0 || strcmp(cmd, "/sync", true)==0)
	{
	    SyncPlayer(playerid);
	    return 1;
	}


	if(strcmp(cmd, "/kill", true)==0 || strcmp(cmd, "/자살", true)==0)
	{
	    SetPlayerHealth(playerid,-999);
	    return 1;
	}
	
	if(strcmp(cmd, "/t", true)==0 || strcmp(cmd, "/team", true)==0)
	{
	    if(PlayerInfo[playerid][pTeam] == 0)
	        return SCM(playerid, COLOR_GREY, "[!] 팀에 속해있어야 사용할 수 있습니다.");
		cmd = strtok(cmdtext,idx);
		if(!strlen(cmd))
			return SCM(playerid,COLOR_GREY,"* 사용법: (/t)eam [할 말]");
		length += strlen(stringslice(cmdtext,0)) + 1;
		strmid(talk,cmdtext,length,strlen(cmdtext),sizeof(string));
		format(string,sizeof(string),"[Team Chat] [%d팀] %s (%d): %s",PlayerInfo[playerid][pTeam],PlayerName(playerid),playerid,talk);
		SendTeamMessage(PlayerInfo[playerid][pTeam],TeamInfo[PlayerInfo[playerid][pTeam]][Color],string);
		printf("[Team Chat] %s: %s",PlayerName(playerid),talk);
		return 1;
 	}


	if(strcmp("/팀목록",cmd,true) == 0)
	{
	    ShowTeamListDialog(playerid);
		return 1;
	}
		
	if(strcmp("/팀접속",cmd,true) == 0 || strcmp("/팀원",cmd,true) == 0 || strcmp("/팀원목록",cmd,true) == 0)
	{
	    format(string,sizeof(string),"* 현재 접속한 당신의 팀원 목록 [%s(%d) 팀]",TeamInfo[PlayerInfo[playerid][pTeam]][Name], PlayerInfo[playerid][pTeam]);
		SCM(playerid,COLOR_SYSTEM,string);
		
		for(new i=0; i<NUM_PLAYERS; i++)
		{
		    #define j pITERATION[i]
		    if(PlayerInfo[j][pTeam] == PlayerInfo[playerid][pTeam])
		    {
		        format(string,sizeof(string)," %s (id: %d)",PlayerName(j),j);
		        SCM(playerid,COLOR_IVORY,string);
		    }
	        #undef j
		}
		return 1;
	}
	
	if(strcmp("/팀초대",cmd,true) == 0)
	{
	    if(!IsPlayerLeader(playerid))
	        return SCM(playerid, COLOR_GREY, "[!] 팀의 리더만 사용할 수 있습니다.");
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp))
			return SCM(playerid, COLOR_GREY, "* 사용법: /팀초대 [플레이어 번호]");
		new targetid = strval(tmp);
		if(!IsPlayerConnected(targetid) || targetid == playerid)
		    return SCM(playerid, COLOR_GREY, "[!] 부적절한 플레이어 입니다.");

		PlayerInfo[targetid][pTeam] = PlayerInfo[playerid][pTeam];
		format(string,sizeof(string),"[!] 당신은 %s(%d)을 팀으로 초대하였습니다.", PlayerName(targetid), targetid);
		SCM(playerid, COLOR_SYSTEM, string);
		format(string,sizeof(string),"[!] 당신은 %s(%d)팀의 일원이 되었습니다.",TeamInfo[PlayerInfo[playerid][pTeam]][Name],PlayerInfo[playerid][pTeam]);
		SCM(targetid, COLOR_SYSTEM, string);
		return 1;
	}

	if(strcmp("/팀추방",cmd,true) == 0)
	{
	    if(!IsPlayerLeader(playerid))
	        return SCM(playerid, COLOR_GREY, "[!] 팀의 리더만 사용할 수 있습니다.");
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp))
			return SCM(playerid, COLOR_GREY, "* 사용법: /팀추방 [플레이어 번호]");
		new targetid = strval(tmp);
		if(!IsPlayerConnected(targetid) || targetid == playerid)
		    return SCM(playerid, COLOR_GREY, "[!] 부적절한 플레이어 입니다.");

		PlayerInfo[targetid][pTeam] = PlayerInfo[playerid][pTeam];
		format(string,sizeof(string),"[!] 당신은 %s(%d)을 팀에서 추방시켰습니다.", PlayerName(targetid), targetid);
		SCM(playerid, COLOR_SYSTEM, string);
		SCM(targetid, COLOR_SYSTEM, "[!] 당신은 리더에 의해 팀에서 추방당했습니다.");
		return 1;
	}
	
	if(strcmp(cmd, "/spec", true)==0 || strcmp(cmd, "/spectate", true)==0 || strcmp(cmd, "/관전", true)==0 || strcmp(cmd, "/위성", true)==0)
	{
	    tmp = strtok(cmdtext, idx);
	    new targetid;
		if(!strlen(tmp) && Spectate[playerid] == false)
			return SCM(playerid, COLOR_GREY, "* 사용법: (/spec)tate [플레이어 번호]");
	    targetid = strval(tmp);
		if(!IsPlayerConnected(targetid) || ToggleWar[targetid] == false || Spectate[targetid] == true || targetid == playerid)
		    return SCM(playerid, COLOR_GREY, "[!] 관전할 수 없는 플레이어 입니다.");

		Spectating(playerid, targetid, Spectate[playerid]);

	    return 1;
	}
	
	if(strcmp(cmd, "/stat", true)==0 || strcmp(cmd, "/stats", true)==0 || strcmp(cmd, "/스탯", true)==0)
	{
	    tmp = strtok(cmdtext, idx);
	    new targetid;
		if(!strlen(tmp))
			return ShowStats(playerid,playerid);

	    targetid = strval(tmp);
		if(!IsPlayerConnected(targetid))
		    return SCM(playerid, COLOR_GREY, "[!] 접속하지 않은 플레이어 입니다.");

		ShowStats(playerid, targetid);
	    return 1;
	}

	if(strcmp(cmd, "/리스폰", true)==0 || strcmp(cmd, "/re", true)==0 || strcmp(cmd, "/리폰", true)==0)
	{
		if(ToggleWar[playerid] == false)
			return SCM(playerid, COLOR_GREY,"[!] 체력이 80 이상이어야 사용할 수 있습니다.");
		KillTimer(ProtectTimer[playerid]);
		Protection[playerid] = false;
		SetPlayerSpawn(playerid);
	    return 1;
	}
	
	if(strcmp(cmd, "/lounge", true)==0 || strcmp(cmd, "/lobby", true)==0 || strcmp(cmd, "/로비", true)==0 || strcmp(cmd, "/l", true)==0)
	{
		if(ToggleWar[playerid] == true)
		{
			if(PlayerInfo[playerid][pHP] < 80)
				return SCM(playerid, COLOR_GREY,"[!] 체력이 80 이상이어야 사용할 수 있습니다.");
			KillTimer(ProtectTimer[playerid]);
			Protection[playerid] = false;
            ToggleWar[playerid] = false;
            SetPlayerPos(playerid, -795.0203,490.3264,1376.1953);
            SetPlayerInterior(playerid, 1);
            SetPlayerVirtualWorld(playerid, 0);
			SetPlayerHealth(playerid, 100);
			ResetPlayerWeapons(playerid);
			SCM(playerid,COLOR_ORANGE,"[!] 로비에 입장하였습니다.");
		}
		else
		{
		    ToggleWar[playerid] = true;
		    SetPlayerSpawn(playerid);
		}
	    return 1;
	}

	if(strcmp("/dual",cmd,true) == 0 || strcmp("/듀얼",cmd,true) == 0)
	{
		if(PlayerInfo[playerid][pHP] < 80)
		    return SCM(playerid, COLOR_GREY, "[!] 체력이 80 이상이어야 사용할 수 있습니다.");
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp))
			return SCM(playerid, COLOR_GREY, "* 사용법: /dual [플레이어 번호]");
		new targetid = strval(tmp);
		if(!IsPlayerConnected(targetid))
			return SCM(playerid,COLOR_GREY,"[!] 접속하지 않은 플레이어 입니다.");
		if(targetid == playerid)
			return SCM(playerid,COLOR_GREY,"[!] 자기 자신에게 듀얼 신청을 할 수 없습니다.");
		if(Dualed[targetid] != 0)
		    return SCM(playerid,COLOR_GREY,"[!] 상대방은 이미 듀얼 신청을 받았거나 듀얼을 진행 중 입니다.");
		if(PlayerInfo[targetid][pHP] < 80)
		    return SCM(playerid, COLOR_GREY, "[!] 상대방의 체력이 부족해 듀얼을 할 수 없습니다.");
		//-----
		format(string, sizeof(string), "[듀얼] %s(%d)에게 듀얼을 신청하였습니다.", PlayerName(targetid), targetid);
		SCM(playerid, COLOR_LIGHTGREEN, string);
		format(string, sizeof(string), "[듀얼] %s(%d)으로부터 듀얼 신청을 받았습니다. (/수락)", PlayerName(playerid), playerid);
		SCM(targetid, COLOR_LIGHTGREEN, string);
		Dualed[playerid] = 1;
		Dualed[targetid] = 1;
		DualID[targetid] = playerid;

		KillTimer(DualTimer[playerid]);
		DualTimer[playerid] = SetTimerEx("ResetDual", 5000, 0, "i", playerid, targetid);
		return 1;
	}


	if(strcmp("/수락",cmd,true) == 0)
	{
	    if(Dualed[playerid] != 1)
	        return SCM(playerid,COLOR_GREY,"[!] 당신은 듀얼 신청을 받지 않았습니다.");
		if(PlayerInfo[playerid][pHP] < 80)
		    return SCM(playerid, COLOR_GREY, "[!] 체력이 80 이상이어야 사용할 수 있습니다.");
		SetPlayerPos(playerid, 1911.3623,706.5203,1004.0306);
		SetPlayerInterior(playerid, 1);
		SetPlayerVirtualWorld(playerid, 1);
		Dualed[playerid] = 2;
		PlayerInfo[playerid][pInterior] = GetPlayerInterior(playerid);
		PlayerInfo[playerid][pVirtualWorld] = GetPlayerVirtualWorld(playerid);
		
		SetPlayerPos(DualID[playerid], 1894.7308,689.9119,1004.0306);
		SetPlayerInterior(DualID[playerid], 1);
		SetPlayerVirtualWorld(DualID[playerid], 1);
		Dualed[DualID[playerid]] = 2;
		PlayerInfo[DualID[playerid]][pInterior] = GetPlayerInterior(DualID[playerid]);
		PlayerInfo[DualID[playerid]][pVirtualWorld] = GetPlayerVirtualWorld(DualID[playerid]);
	    return 1;
	}

	if(strcmp("/pm",cmd,true) == 0)
	{
		new receiverid;
		cmd = strtok(cmdtext,idx);
		if(!strlen(cmd))
			return SCM(playerid,COLOR_GREY,"* 사용법: /pm [플레이어 번호] [할 말]");
		receiverid = strval(cmd);
		cmd = strtok(cmdtext,idx);
		if(!strlen(cmd))
			return SCM(playerid,COLOR_GREY,"* 사용법: /pm [플레이어 번호] [할 말]");
		if(!IsPlayerConnected(receiverid))
			return SCM(playerid,COLOR_GREY,"[!] 접속하지 않은 플레이어 입니다.");
		if(playerid == receiverid)
			return SCM(playerid,COLOR_GREY,"[!] 자기 자신에게 귓속말을 보낼 수 없습니다.");
		length += strlen(stringslice(cmdtext,0)) + strlen(stringslice(cmdtext,1)) + 2;
		strmid(talk,cmdtext,length,strlen(cmdtext),sizeof(string));
		format(string,sizeof(string),"[PM] >> %s(%d): %s",PlayerName(receiverid),receiverid,talk);
		SCM(playerid,COLOR_YELLOW,string);
		format(string,sizeof(string),"[PM] ** %s(%d): %s",PlayerName(playerid),playerid,talk);
		SCM(receiverid,COLOR_YELLOW,string);
		format(string,sizeof(string),"[%s -> %s]: %s",PlayerName(playerid),PlayerName(receiverid),talk);
		print(string);
		return 1;
 	}
 	
	return 0;
}

public OnPlayerStateChange(playerid, newstate, oldstate)
{
	return 1;
}

public OnPlayerRequestSpawn(playerid)
{
	return 1;
}

public OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
	if(newkeys == KEY_FIRE)
	{
		if(ToggleWar[playerid] == false)
		{
		    TogglePlayerControllable(playerid,0);
		    TogglePlayerControllable(playerid,1);
			SetPlayerHealth(playerid, PlayerInfo[playerid][pHP] - 25);
			SCM(playerid, COLOR_RED,"[!] 로비에서는 공격할 수 없습니다!");
		}
	}

	if(newkeys == KEY_SECONDARY_ATTACK)
	{
		if(GetPlayerDistanceToPoint(playerid,-785.0139,500.2697) <= 0.5)
		{
			ShowPlayerDialog(playerid, DialogID_Lobby(0), DIALOG_STYLE_LIST, ""#C_ORANGE"설정할 항목을 선택하세요.", ""#C_WHITE"스폰 장소\n무기\n개인 설정\n로비 나가기", "확인", "취소");
		}
	}

	if(Spectate[playerid] == true)
	{
		new Bad_Count = 200;
		if(newkeys == KEY_ANALOG_LEFT) // PREV
		{
		    do
			{
		        SpecTarget[playerid] --;
		        Bad_Count --;
		        if(SpecTarget[playerid]<0) SpecTarget[playerid] = GetMaxPlayers();
				if(Bad_Count < 0)
				{
					SpecTarget[playerid] ++;
					return 1;
				}
		    } while(!IsPlayerConnected(SpecTarget[playerid]) || ToggleWar[SpecTarget[playerid]] == false || SpecTarget[playerid] == playerid);
            Spectating(playerid, SpecTarget[playerid], false);
		}
		
		if(newkeys == KEY_ANALOG_RIGHT) // NEXT
		{
		    do
			{
		        SpecTarget[playerid] ++;
		        Bad_Count --;
		        if(SpecTarget[playerid]>GetMaxPlayers()) SpecTarget[playerid] = 0;
		        if(Bad_Count < 0)
				{
					SpecTarget[playerid] --;
					return 1;
				}
		    } while(!IsPlayerConnected(SpecTarget[playerid]) || ToggleWar[SpecTarget[playerid]] == false || SpecTarget[playerid] == playerid);
            Spectating(playerid, SpecTarget[playerid], false);
		}
	}
	
	if(newkeys == 160 && (!GetPlayerWeapon(playerid) || GetPlayerWeapon(playerid) == 1) && !IsPlayerInAnyVehicle(playerid) && gPlayerSpawned[playerid])
	{
	    SyncPlayer(playerid);
	    return 1;
	}
	
	return 1;
}

public OnPlayerUpdate(playerid)
{
	new drunk2 = GetPlayerDrunkLevel(playerid);
	if(drunk2 < 100)
	{
	    SetPlayerDrunkLevel(playerid,2000);
	}
	else
	{
	    if(PlayerInfo[playerid][DLlast] != drunk2)
	    {
	        new fps = PlayerInfo[playerid][DLlast] - drunk2;
	        if((fps > 0) && (fps < 200))
			PlayerInfo[playerid][FPS2] = fps;
			PlayerInfo[playerid][DLlast] = drunk2;
		}
	}

	new Float:PlayerHealth;
	GetPlayerHealth(playerid,PlayerHealth);
	SetPlayerMoney(playerid,-floatround(PlayerHealth));

	if(PlayerInfo[playerid][pHP] > PlayerHealth)
	{
	    PlayerInfo[playerid][IJustLost] = floatround((PlayerInfo[playerid][pHP]) - (PlayerHealth));
		if(PlayerInfo[playerid][pHits] == 0)
		{
			PlayerInfo[playerid][LastDamage] = floatround((PlayerInfo[playerid][pHP]) - (PlayerHealth));
		}
		else
		{
			PlayerInfo[playerid][LastDamage] += floatround((PlayerInfo[playerid][pHP]) - (PlayerHealth));
		}

	    PlayerInfo[playerid][pHits] ++;


	    SetTimerEx("ResetPlayerHits",1600, false, "ii", playerid, PlayerInfo[playerid][pHits]);
	    new string[256];
		if(PlayerInfo[playerid][pHits] == 1)
		    format(string,256,"~w~%d Hit ~n~~r~%d dmg", PlayerInfo[playerid][pHits],PlayerInfo[playerid][LastDamage]);
		else
		    format(string,256,"~w~%d Hits ~n~~r~%d dmg", PlayerInfo[playerid][pHits],PlayerInfo[playerid][LastDamage]);

	    TextDrawSetString(DamageTexts[playerid], string);
	    
	    if(PlayerVariable[playerid][DamageTextdraw] == 1)
	    	TextDrawShowForPlayer(playerid,DamageTexts[playerid]);

    	new diff_hpmsg[70];

		if(PlayerInfo[playerid][pHits] < 3) format(diff_hpmsg, sizeof(diff_hpmsg), "{33CC00}%d {FFFFFF}Hits, {FF3300}-%d", PlayerInfo[playerid][pHits], PlayerInfo[playerid][LastDamage]);
    	else if(PlayerInfo[playerid][pHits] <= 7) format(diff_hpmsg, sizeof(diff_hpmsg), "{FFFF00}%d {FFFFFF}Hits, {FF3300}-%d", PlayerInfo[playerid][pHits], PlayerInfo[playerid][LastDamage]);
    	else format(diff_hpmsg, sizeof(diff_hpmsg), "{FF3300}%d {FFFFFF}Hits, {FF3300}-%d", PlayerInfo[playerid][pHits], PlayerInfo[playerid][LastDamage]);

        Update3DTextLabelText(PlayerInfo[playerid][DmgLabel], COLOR_WHITE, diff_hpmsg);
		Attach3DTextLabelToPlayer(PlayerInfo[playerid][DmgLabel], playerid, 0.0, 0.0, 0.7);

		SetTimerEx("ResetDmgLabel", 2000, 0, "d", playerid);

	    KillTimer(dmg_update_timer[playerid]);
	    dmg_update_timer[playerid] = SetTimerEx("HideDamage",1500,false,"ii",playerid, PlayerInfo[playerid][pHits]);
	}
	if(PlayerHealth != PlayerInfo[playerid][pHP])
	{
		OnPlayerHealthChange(playerid,PlayerHealth);
    	PlayerInfo[playerid][pHP] = PlayerHealth;
	}
	return 1;
}

public OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
	new WeaponList[256], WeaponUsed[sizeof(WeaponList)];
	new string[256];
	if(dialogid == DialogID_Lobby(0))
	{
	    if(response)
	    {
	        switch(listitem)
	        {
	            case 0:
	                ShowPlayerDialog(playerid, DialogID_Position(0), DIALOG_STYLE_LIST, ""#C_ORANGE"스폰 장소를 선택하세요.", ""#C_WHITE"플레이어 근처(기본)\n임의의 좌표\n로비", "확인", "취소");
				case 1:
				    ShowPlayerDialog(playerid, DialogID_Weapon(0), DIALOG_STYLE_LIST, ""#C_ORANGE"슬롯을 선택하세요.", ""#C_WHITE"1번 슬롯\n2번 슬롯\n3번 슬롯\n4번 슬롯", "다음", "취소");
				case 2:
				    ShowPlayerConfigDialog(playerid);
				case 3:
				{
				    ToggleWar[playerid] = true;
					SpawnType[playerid] = true;
					SetPlayerSpawn(playerid);
				}
			}
		}
 	}
	    
	else if(dialogid == DialogID_Position(0))
	{
	    if(response)
	    {
	        switch(listitem)
	        {
	            case 0:
	            {
					SCM(playerid,COLOR_SYSTEM,"[!] 이제부터 플레이어 근처에서 스폰됩니다.");
					SpawnType[playerid] = true;  // 스폰타입
					ToggleWar[playerid] = true; // 로비
	            }
	            case 1:
	            {
					SCM(playerid,COLOR_SYSTEM,"[!] 이제부터 전장의 임의의 좌표에서 스폰됩니다.");
					SpawnType[playerid] = false;
					ToggleWar[playerid] = true;
	            }
	            case 2:
	            {
					SCM(playerid,COLOR_SYSTEM,"[!] 이제부터 로비에서 스폰됩니다.");
					SpawnType[playerid] = false;
					ToggleWar[playerid] = false;
	            }
	        }
	    }
 	}
 	
	else if(dialogid == DialogID_Weapon(0))
	{
	    if(response)
	    {
			Slot[playerid] = listitem;
			for(new i=0; i<sizeof(WeaponInfo); i++)
			{
		        if(i != PlayerInfo[playerid][pWeaponID][listitem])
                    strmid(WeaponUsed[i], " ", 0, strlen(" "), 255);
				else
		    		strmid(WeaponUsed[i], "(선택됨)", 0, strlen("(선택됨)"), 255);
		    		
				format(WeaponList, sizeof(WeaponList), "%s\n%s "#C_LIGHTBLUE"%s", WeaponList, WeaponInfo[i][wName], WeaponUsed[i]);
			}
	    	ShowPlayerDialog(playerid, DialogID_Weapon(1), DIALOG_STYLE_LIST, ""#C_ORANGE"무기를 선택하세요.", WeaponList, "다음", "취소");
		}
	}
	
	else if(dialogid == DialogID_Weapon(1))
	{
	    if(response)
	    {
	    	PlayerInfo[playerid][pWeapons][Slot[playerid]] = WeaponInfo[listitem][wID];
	    	PlayerInfo[playerid][pAmmo][Slot[playerid]] = WeaponInfo[listitem][wAmount];
	    	PlayerInfo[playerid][pWeaponID][Slot[playerid]] = listitem;
        	ShowPlayerDialog(playerid, DialogID_Weapon(0), DIALOG_STYLE_LIST, ""#C_ORANGE"슬롯을 선택하세요.", "1번 슬롯\n2번 슬롯\n3번 슬롯\n4번 슬롯", "다음", "취소");
		}
		else ShowPlayerDialog(playerid, DialogID_Weapon(0), DIALOG_STYLE_LIST, ""#C_ORANGE"슬롯을 선택하세요.", "1번 슬롯\n2번 슬롯\n3번 슬롯\n4번 슬롯", "다음", "취소");
	}

  	else if(dialogid == DialogID_Userdata(0)) // 가입 다이얼로그
    {
        if(response)
		{
			if(!strlen(inputtext))
			{
        		ShowPlayerDialog(playerid,DialogID_Userdata(0),DIALOG_STYLE_PASSWORD,""#C_ORANGE"계정 생성",""C_WHITE"계정이 존재하지 않습니다.\n\n"C_WHITE"계정 생성을 위해 새로운 비밀번호를 입력하세요.","다음","퇴장");
				return 1;
			}
			OnPlayerRegister(playerid,inputtext);
			OnPlayerLogin(playerid,inputtext);
			ResetPlayerVariable(playerid);
		}
		else
		{
		    Kick(playerid);
		}
    }
    else if(dialogid == DialogID_Userdata(1)) // 로그인 다이얼로그
    {
        if(response)
		{
	        if(!strlen(inputtext))
			{
       		 	ShowPlayerDialog(playerid,DialogID_Userdata(1),DIALOG_STYLE_PASSWORD,""#C_ORANGE"로그인",""C_RED"잘못된 비밀번호 입니다.\n\n"C_WHITE"다시 비밀번호를 입력하세요.","다음","퇴장");
				return 1;
			}
			OnPlayerLogin(playerid,inputtext);
		}
		else
		{
		    Kick(playerid);
		}
    }


	else if(dialogid == DialogID_Config(0))
	{
	    if(response)
	    {
			switch(listitem)
			{
			    case 1:
			    {
			        if(PlayerVariable[playerid][ZoneTextdraw] == 1)
			            PlayerVariable[playerid][ZoneTextdraw] = 0;
					else
					    PlayerVariable[playerid][ZoneTextdraw] = 1;
			    }
			    case 2:
			    {
			        if(PlayerVariable[playerid][DamageTextdraw] == 1)
			            PlayerVariable[playerid][DamageTextdraw] = 0;
					else
					    PlayerVariable[playerid][DamageTextdraw] = 1;
			    }
			    case 3:
			    {
			        if(PlayerVariable[playerid][MaplogoTextdraw] == 1)
			            PlayerVariable[playerid][MaplogoTextdraw] = 0;
					else
					    PlayerVariable[playerid][MaplogoTextdraw] = 1;
			    }
			    case 4:
			    {
			        if(PlayerVariable[playerid][TimeTextdraw] == 1)
			            PlayerVariable[playerid][TimeTextdraw] = 0;
					else
					    PlayerVariable[playerid][TimeTextdraw] = 1;
			    }
			    case 6:
			    {
			        if(PlayerVariable[playerid][HitSound] == 1)
			            PlayerVariable[playerid][HitSound] = 0;
					else
					    PlayerVariable[playerid][HitSound] = 1;
			    }
			    case 7:
			    {
                    ShowPlayerDialog(playerid, DialogID_Config(1), DIALOG_STYLE_INPUT, ""#C_ORANGE"스폰보호 시간 설정", ""#C_IVORY"설정하고싶은 스폰보호 시간을 초 단위로 입력하세요."#C_RED"(1~10 사이)", "확인", "취소");
				}
			    case 8:
			    {
                    ShowPlayerDialog(playerid, DialogID_Config(4), DIALOG_STYLE_INPUT, ""#C_ORANGE"스탯표기 시간 설정", ""#C_IVORY"설정하고싶은 스탯표기 시간을 초 단위로 입력하세요."#C_RED"(1~20 사이)", "확인", "취소");
				}
				case 9:
				{
					ShowPlayerWeaponDialog(playerid);
				}
			}
			if(listitem != 7 && listitem != 8 && listitem != 9)
				ShowPlayerConfigDialog(playerid);
	    }
	}
	
	else if(dialogid == DialogID_Config(1))
	{
	    if(response)
	    {
	        new value = strval(inputtext);
	        if(value < 1 || value > 10)
	        {
				SCM(playerid, COLOR_GREY,"[!] 1에서 10 사이의 값을 입력해주세요!");
	            ShowPlayerDialog(playerid, DialogID_Config(1), DIALOG_STYLE_INPUT, ""#C_ORANGE"스폰보호 시간 설정", ""#C_IVORY"설정하고싶은 스폰보호 시간을 초 단위로 입력하세요.  "#C_RED"(1~10 사이)", "확인", "취소");
				return 1;
			}
			PlayerVariable[playerid][SpawnProtectionTime] = value;
			ShowPlayerConfigDialog(playerid);
		}
	    else
	    	ShowPlayerConfigDialog(playerid);
	}
	
	else if(dialogid == DialogID_Config(2))
	{
	    if(response)
	    {
			switch(listitem)
			{
			    case 0:
			    {
			        ShowPlayerDialog(playerid, DialogID_Config(3), DIALOG_STYLE_INPUT, ""#C_ORANGE"라운드 시간 설정", ""#C_IVORY"설정하고싶은 라운드 시간을 초 단위로 입력하세요."#C_RED"(1~1800 사이)", "확인", "취소");
			    }
			}
			if(listitem != 0)
			    ShowServerConfigDialog(playerid);
		}
	}
	
	else if(dialogid == DialogID_Config(3))
	{
	    if(response)
	    {
	        new value = strval(inputtext);
	        if(value < 1 || value > 1800)
	        {
				SCM(playerid, COLOR_GREY,"[!] 1에서 1800 사이의 값을 입력해주세요!");
	            ShowPlayerDialog(playerid, DialogID_Config(3), DIALOG_STYLE_INPUT, ""#C_ORANGE"라운드 시간 설정", ""#C_IVORY"설정하고싶은 라운드 시간을 초 단위로 입력하세요.  "#C_RED"(1~1800 사이)", "확인", "취소");
				return 1;
			}
			ServerVariable[RoundTime] = value;
			ShowServerConfigDialog(playerid);
		}
	    else
	    	ShowPlayerConfigDialog(playerid);
	}
	
	else if(dialogid == DialogID_Config(4))
	{
	    if(response)
	    {
	        new value = strval(inputtext);
	        if(value < 1 || value > 20)
	        {
				SCM(playerid, COLOR_GREY,"[!] 1에서 20 사이의 값을 입력해주세요!");
	            ShowPlayerDialog(playerid, DialogID_Config(4), DIALOG_STYLE_INPUT, ""#C_ORANGE"스탯표기 시간 설정", ""#C_IVORY"설정하고싶은 스탯표기 시간을 초 단위로 입력하세요.  "#C_RED"(1~20 사이)", "확인", "취소");
				return 1;
			}
			PlayerVariable[playerid][StatTime] = value;
			ShowPlayerConfigDialog(playerid);
		}
	    else
	    	ShowPlayerConfigDialog(playerid);
	}

	else if(dialogid == DialogID_Config(5))
	{
	    if(response)
	    {
	        if(PlayerVariable[playerid][WeaponGet][listitem+1] == 1)
	   			PlayerVariable[playerid][WeaponGet][listitem+1] = 0;
			else
			    PlayerVariable[playerid][WeaponGet][listitem+1] = 1;

            ShowPlayerWeaponDialog(playerid);
	    }
	    else
	        ShowPlayerConfigDialog(playerid);
	}
	
	else if(dialogid == DialogID_Team(0))
	{
	    if(response)
	    {
			switch(listitem)
			{
			    case 0:
			    {
			        ShowPlayerDialog(playerid, DialogID_Team(1), DIALOG_STYLE_INPUT, ""#C_ORANGE"팀 이름 설정", ""#C_IVORY"팀 이름을 입력하세요."#C_RED"(20자 내)", "확인", "취소");
			    }
			    case 1:
			    {
			        ShowPlayerDialog(playerid, DialogID_Team(2), DIALOG_STYLE_INPUT, ""#C_ORANGE"팀 리더 설정", ""#C_IVORY"팀 리더의 이름을 입력하세요.", "확인", "취소");
			    }
			    case 2:
			    {
			        ShowPlayerDialog(playerid, DialogID_Team(3), DIALOG_STYLE_LIST, ""#C_ORANGE"팀 색깔 설정", ""#C_RED"빨간색\n"#C_PINK"분홍색\n"#C_ORANGE"주황색\n"#C_YELLOW"노란색\n"#C_LIGHTGREEN"연두색\n"#C_GREEN"초록색\n"#C_LIGHTBLUE"하늘색\n"#C_BLUE"파란색\n"#C_BROWN"갈색\n"#C_VIOLET"보라색\n색깔코드 입력", "확인", "취소");
			    }
				case 3:
				{
				    TeamInfo[SelectedTeam][Used] = 1;
				    SCM(playerid,COLOR_SKYBLUE,"[!] 성공적으로 팀을 생성하였습니다.");
				}
			}
		}
		else
		    ResetTeamInfo(SelectedTeam);
	}
	
	else if(dialogid == DialogID_Team(1))
	{
	    if(response)
	    {
	        if(strlen(inputtext) >= 20)
	        {
	            SCM(playerid, COLOR_GREY,"[!] 20자 내로 입력해주세요!");
	            ShowPlayerDialog(playerid, DialogID_Team(1), DIALOG_STYLE_INPUT, ""#C_ORANGE"팀 이름 설정", ""#C_IVORY"팀 이름을 입력하세요."#C_RED"(20자 내)", "확인", "취소");
	            return 1;
			}
			strmid(TeamInfo[SelectedTeam][Name], inputtext, 0, strlen(inputtext), 255);
	    }
	    ShowTeamMakingDialog(playerid);
	}
	
	else if(dialogid == DialogID_Team(2))
	{
	    if(response)
	    {
			strmid(TeamInfo[SelectedTeam][Leader], inputtext, 0, strlen(inputtext), 255);
	    }
	    ShowTeamMakingDialog(playerid);
	}
	
	else if(dialogid == DialogID_Team(3))
	{
	    if(response)
	    {
			switch(listitem)
			{
			    case 0: TeamInfo[SelectedTeam][Color] = 0xFF0000A9;
			    case 1: TeamInfo[SelectedTeam][Color] = 0xFFC0CBA9;
			    case 2: TeamInfo[SelectedTeam][Color] = 0xFF9900A9;
			    case 3: TeamInfo[SelectedTeam][Color] = 0xFFFF00A9;
			    case 4: TeamInfo[SelectedTeam][Color] = 0xCBFEA9A9;
			    case 5: TeamInfo[SelectedTeam][Color] = 0x00FF00A9;
			    case 6: TeamInfo[SelectedTeam][Color] = 0x33CCFFA9;
			    case 7: TeamInfo[SelectedTeam][Color] = 0x0000FFA9;
			    case 8: TeamInfo[SelectedTeam][Color] = 0xA52A2AA9;
			    case 9: TeamInfo[SelectedTeam][Color] = 0xEE82EEA9;
			    case 10: ShowPlayerDialog(playerid, DialogID_Team(4), DIALOG_STYLE_INPUT, ""#C_ORANGE"팀 색깔 설정", ""#C_IVORY"팀 색깔 코드를 RGBA 형식으로 입력하세요.", "확인", "취소");
			}
	    }
		if(listitem != 10)
		    ShowTeamMakingDialog(playerid);
	}
	
	else if(dialogid == DialogID_Team(4))
	{
	    if(response)
	    {
			TeamInfo[SelectedTeam][Color] = strval(inputtext);
	    }
	    ShowTeamMakingDialog(playerid);
	}
	
	else if(dialogid == DialogID_Team(5))
	{
		if(response)
		{
			if(IsPlayerAdmin(playerid))
			{
		    	Dialog_Select = Dialog_List[listitem];
		    	ShowPlayerDialog(playerid, DialogID_Team(6), DIALOG_STYLE_LIST, ""#C_ORANGE"수정할 항목을 선택하세요.", ""#C_WHITE"> 팀 이름\n> 팀 리더\n> 팀 색깔", "확인", "취소");
		    }
		}
	}

	else if(dialogid == DialogID_Team(6))
	{
	    if(response)
	    {
			switch(listitem)
			{
			    case 0:
			    {
			        ShowPlayerDialog(playerid, DialogID_Team(7), DIALOG_STYLE_INPUT, ""#C_ORANGE"팀 이름 수정", ""#C_IVORY"팀 이름을 입력하세요."#C_RED"(20자 내)", "확인", "취소");
			    }
			    case 1:
			    {
			        ShowPlayerDialog(playerid, DialogID_Team(8), DIALOG_STYLE_INPUT, ""#C_ORANGE"팀 리더 수정", ""#C_IVORY"팀 리더의 이름을 입력하세요.", "확인", "취소");
			    }
			    case 2:
			    {
			        ShowPlayerDialog(playerid, DialogID_Team(9), DIALOG_STYLE_LIST, ""#C_ORANGE"팀 색깔 수정", ""#C_RED"빨간색\n"#C_PINK"분홍색\n"#C_ORANGE"주황색\n"#C_YELLOW"노란색\n"#C_LIGHTGREEN"연두색\n"#C_GREEN"초록색\n"#C_LIGHTBLUE"하늘색\n"#C_BLUE"파란색\n"#C_BROWN"갈색\n"#C_VIOLET"보라색\n색깔코드 입력", "확인", "취소");
			    }
			}
		}
		else
			ShowTeamListDialog(playerid);
	}
	
	else if(dialogid == DialogID_Team(7))
	{
	    if(response)
	    {
	        if(strlen(inputtext) >= 20)
	        {
	            SCM(playerid, COLOR_GREY,"[!] 20자 내로 입력해주세요!");
	            ShowPlayerDialog(playerid, DialogID_Team(1), DIALOG_STYLE_INPUT, ""#C_ORANGE"팀 이름 수정", ""#C_IVORY"팀 이름을 입력하세요."#C_RED"(20자 내)", "확인", "취소");
	            return 1;
			}
	        strmid(TeamInfo[Dialog_Select][Name], inputtext, 0, strlen(inputtext), 255);
		    format(string,sizeof(string),"[!] 팀 이름을 [%s]로 변경하였습니다.",inputtext);
		    SCM(playerid, COLOR_SKYBLUE, string);
	    }
	    ShowTeamListDialog(playerid);
	}

	else if(dialogid == DialogID_Team(8))
	{
	    if(response)
	    {
	        strmid(TeamInfo[Dialog_Select][Leader], inputtext, 0, strlen(inputtext), 255);
		    format(string,sizeof(string),"[!] 팀 리더을 [%s]로 변경하였습니다.",inputtext);
		    SCM(playerid, COLOR_SKYBLUE, string);
	    }
	    ShowTeamListDialog(playerid);
	}

	else if(dialogid == DialogID_Team(9))
	{
	    if(response)
	    {
			switch(listitem)
			{
			    case 0: TeamInfo[Dialog_Select][Color] = 0xFF0000A9;
			    case 1: TeamInfo[Dialog_Select][Color] = 0xFFC0CBA9;
			    case 2: TeamInfo[Dialog_Select][Color] = 0xFF9900A9;
			    case 3: TeamInfo[Dialog_Select][Color] = 0xFFFF00A9;
			    case 4: TeamInfo[Dialog_Select][Color] = 0xCBFEA9A9;
			    case 5: TeamInfo[Dialog_Select][Color] = 0x00FF00A9;
			    case 6: TeamInfo[Dialog_Select][Color] = 0x33CCFFA9;
			    case 7: TeamInfo[Dialog_Select][Color] = 0x0000FFA9;
			    case 8: TeamInfo[Dialog_Select][Color] = 0xA52A2AA9;
			    case 9: TeamInfo[Dialog_Select][Color] = 0xEE82EEA9;
			    case 10: ShowPlayerDialog(playerid, DialogID_Team(10), DIALOG_STYLE_INPUT, ""#C_ORANGE"팀 색깔 수정", ""#C_IVORY"팀 색깔 코드를 RGBA 형식으로 입력하세요.", "확인", "취소");
			}
	    }
	    if(listitem != 10)
	        ShowTeamListDialog(playerid);
	}

	else if(dialogid == DialogID_Team(10))
	{
	    if(response)
	    {
			TeamInfo[Dialog_Select][Color] = strval(inputtext);
	    }
	    ShowTeamListDialog(playerid);
	}
	
	return 1;
}

public OnPlayerClickTextDraw(playerid, Text:clickedid)
{
	if(clickedid == TD_Setting[1]) // 포지션
	{
		ShowPlayerDialog(playerid, DialogID_Position(0), DIALOG_STYLE_LIST, ""#C_ORANGE"스폰 장소를 선택하세요.", ""#C_WHITE"플레이어 근처(기본)\n임의의 좌표\n로비", "확인", "취소");
	}
	
	else if(clickedid == TD_Setting[2]) // 무기
	{
	    ShowPlayerDialog(playerid, DialogID_Weapon(0), DIALOG_STYLE_LIST, ""#C_ORANGE"슬롯을 선택하세요.", ""#C_WHITE"1번 슬롯\n2번 슬롯\n3번 슬롯\n4번 슬롯", "다음", "취소");
	}

	else if(clickedid == TD_Setting[3]) // config
		ShowPlayerConfigDialog(playerid);

	else if(clickedid == TD_Setting[4]) // spawn with skin
	{
	    SetSpawnInfo(playerid, NO_TEAM, PlayerInfo[playerid][pSkin], 0.0, 0.0, 0.0, 0.0, 0, 0, 0, 0, 0, 0);
	    SpawnPlayer(playerid);
	}
	return 1;
}

public OnPlayerTakeDamage(playerid, issuerid, Float: amount, weaponid)
{
	if(playerid != INVALID_PLAYER_ID && issuerid != INVALID_PLAYER_ID)
	    if(PlayerVariable[issuerid][HitSound] == 1)
			PlayerPlaySound(issuerid, 17802, 0.0, 0.0, 0.0);
    	
	return 1;
}

public SetPlayerSpawn(playerid)
{
    StopAudioStreamForPlayer(playerid);
	PlayerPlaySound(playerid, 0, 0, 0, 0);
	if(PlayerInfo[playerid][pTeam] == 0)
    	SetPlayerColor(playerid, COLOR_WHITE);
	else
	   SetPlayerColor(playerid, TeamInfo[PlayerInfo[playerid][pTeam]][Color]);

	for(new i=0; i<5; i++)
		TextDrawHideForPlayer(playerid, TD_Setting[i]);
	for(new i=0; i<2; i++)
	    TextDrawHideForPlayer(playerid,TD_RequestBG[i]);
		
	if(PlayerVariable[playerid][ZoneTextdraw] == 1)
		for(new i=0; i<2; i++)
			TextDrawShowForPlayer(playerid, TD_Zone[i]);
	else
		for(new i=0; i<2; i++)
			TextDrawHideForPlayer(playerid, TD_Zone[i]);
			
	if(PlayerVariable[playerid][MaplogoTextdraw] == 1)
		for(new i=0; i<5; i++)
			TextDrawShowForPlayer(playerid, TD_GTAT[i]);
	else
		for(new i=0; i<5; i++)
			TextDrawHideForPlayer(playerid, TD_GTAT[i]);

	if(PlayerVariable[playerid][TimeTextdraw] == 1)
		TextDrawShowForPlayer(playerid, TD_Time);
	else
		TextDrawHideForPlayer(playerid, TD_Time);

    ShowProgressBarForPlayer(playerid,PlayerInfo[playerid][LevelBar]);
    TextDrawShowForPlayer(playerid,TD_LevelBar[playerid]);
    TextDrawShowForPlayer(playerid,TD_Level[playerid]);

	CancelSelectTextDraw(playerid);

	if(PlayerInfo[playerid][pSynced] == false)
	{
		if(ToggleWar[playerid] == true)
		{
		    if(SpawnType[playerid] == false || GetBattlePlayer(playerid) == 0 || ChangeMap == false)
		    {
		        RandomSpawn(playerid);
			}
			else
			{
			    new Float:randX,Float:randY,Float:randZ;
			    new Float:CurX,Float:CurY;
				new randP = -1, Bad_Count = -1;
				new randRadius = random(20) + 5;
				new randAngle = random(360);
				do
				{
					randP = random(GetMaxPlayers());
					if(++Bad_Count > 200)
					{
					    RandomSpawn(playerid);
					    gPlayerSpawned[playerid] = true;
				        return 1;
					}
				}
				while(!IsPlayerConnected(randP) || !ToggleWar[randP] || randP == playerid || !gPlayerSpawned[randP]);

				GetPlayerPos(randP, CurX, CurY, randZ);
				GetPointInFront2D(CurX, CurY, randAngle, randRadius, randX, randY);
		        MapAndreas_FindZ_For2DCoord(randX, randY, randZ);
		        SetPlayerPos(playerid, randX, randY, randZ+0.5);
			}
			SetPlayerInterior(playerid, 0);
			SetPlayerVirtualWorld(playerid, 0);
			SpawnPlayerProtection(playerid, 1);
			Protection[playerid] = true;
		}
		else
		{
	        SetPlayerPos(playerid, -795.0203,490.3264,1376.1953);
	        SetPlayerInterior(playerid, 1);
	        SetPlayerVirtualWorld(playerid, 0);
			SetPlayerHealth(playerid, 100);
			ResetPlayerWeapons(playerid);
		}
	}
	gPlayerSpawned[playerid] = true;
	PlayerInfo[playerid][pSynced] = false;
	return 1;
}

public SpawnPlayerProtection(playerid, toggle)
{
	if(toggle == 1)
	{
		SetPlayerHealth(playerid, 9999);
		KillTimer(ProtectTimer[playerid]);
		ProtectTimer[playerid] = SetTimerEx("SpawnPlayerProtection", 3000, 0, "i", playerid, 0);
	}
	else
	{
	    Protection[playerid] = false;
	    SetPlayerHealth(playerid, 100);
	    for(new i=0; i<4; i++)
	        GivePlayerWeapon(playerid, PlayerInfo[playerid][pWeapons][i], PlayerInfo[playerid][pAmmo][i]);
	}
	return 1;
}



public OnPlayerRegister(playerid, password[])
{
	new file[32];
    format(file, sizeof(file),User_File,PlayerName(playerid));
    new File: hFile = fopen(file, io_write);
	if(hFile)
	{
		strmid(PlayerInfo[playerid][pPassword], password, 0, strlen(password), 255);
		new var[32];
		format(var, 64, "Password=%s\n", PlayerInfo[playerid][pPassword]);fwrite(hFile, var);
        format(var, 64, "Kill=%d\n",PlayerInfo[playerid][pKill]);fwrite(hFile, var);
        format(var, 64, "Death=%d\n",PlayerInfo[playerid][pDeath]);fwrite(hFile, var);
        format(var, 64, "Point=%d\n",PlayerInfo[playerid][pPoint]);fwrite(hFile, var);
		format(var, 64, "Team=%d\n",PlayerInfo[playerid][pTeam]);fwrite(hFile, var);
		format(var, 64, "Point=%d\n",PlayerInfo[playerid][pPoint]);fwrite(hFile, var);
		format(var, 64, "Skin=%d\n",PlayerInfo[playerid][pSkin]);fwrite(hFile, var);
		format(var, 64, "Level=%d\n",PlayerInfo[playerid][pLevel]);fwrite(hFile, var);
		for(new i=0; i<4; i++)
        {
            format(var, 64, "Weapons[%d]=%d\n",i,PlayerInfo[playerid][pWeapons][i]);fwrite(hFile, var);
            format(var, 64, "WeaponID[%d]=%d\n",i,PlayerInfo[playerid][pWeaponID][i]);fwrite(hFile, var);
            format(var, 64, "Ammo[%d]=%d\n",i,PlayerInfo[playerid][pAmmo][i]);fwrite(hFile, var);
        }
        for(new i=0; i<12; i++)
        {
			format(var, 64, "WeaponKill[%d]=%d\n",i,PlayerInfo[playerid][pWeaponKill][i]);fwrite(hFile, var);
			format(var, 64, "TGWeaponGet[%d]=%d\n",i,PlayerVariable[playerid][WeaponGet][i]);fwrite(hFile, var);
		}
		
        format(var, 64, "TGZoneTextdraw=%d\n",PlayerVariable[playerid][ZoneTextdraw]);fwrite(hFile, var);
        format(var, 64, "TGDamageTextdraw=%d\n",PlayerVariable[playerid][DamageTextdraw]);fwrite(hFile, var);
        format(var, 64, "TGMaplogoTextdraw=%d\n",PlayerVariable[playerid][MaplogoTextdraw]);fwrite(hFile, var);
        format(var, 64, "TGHitSound=%d\n",PlayerVariable[playerid][HitSound]);fwrite(hFile, var);
        format(var, 64, "TGSpawnProtectionTime=%d\n",PlayerVariable[playerid][SpawnProtectionTime]);fwrite(hFile, var);
        format(var, 64, "TGTimeTextdraw=%d\n",PlayerVariable[playerid][TimeTextdraw]);fwrite(hFile, var);
        format(var, 64, "TGStatTime=%d\n",PlayerVariable[playerid][StatTime]);fwrite(hFile, var);

		fclose(hFile);
		GetPlayerIp(playerid,PlayerIP,sizeof(PlayerIP));
        printf("[System] %s(id:%d) 계정 생성 [IP:%s]",PlayerName(playerid),playerid,PlayerIP);
	}
	return 1;
}

public OnPlayerLogin(playerid,password[])
{
    new file[64],string[56];
    format(file, sizeof(file),User_File,PlayerName(playerid));
    new File: UserFile = fopen(file, io_read);
    if(UserFile)
    {
	    new PassData[256];
	    new keytmp[256], valtmp[256];
	    fread(UserFile ,PassData ,sizeof(PassData));
	    keytmp = ini_GetKey(PassData);
	    if(strcmp(keytmp, "Password" ,true) == 0)
		{
			valtmp = ini_GetValue(PassData);
			strmid(PlayerInfo[playerid][pPassword], valtmp, 0, strlen(valtmp)-1, 255);
		}
		if(strcmp(PlayerInfo[playerid][pPassword],password, true ) == 0 )
		{
		    new key[256],val[256],Data[256];
		    while(fread(UserFile, Data, sizeof(Data)))
			{
				key = ini_GetKey(Data);
				ResetPlayerMoney(playerid);
                if(strcmp(key, "Kill", true) == 0) {val = ini_GetValue(Data); PlayerInfo[playerid][pKill] = strval(val);}
                if(strcmp(key, "Death", true) == 0) {val = ini_GetValue(Data); PlayerInfo[playerid][pDeath] = strval(val);}
                if(strcmp(key, "Point", true) == 0) {val = ini_GetValue(Data); PlayerInfo[playerid][pPoint] = strval(val); SetPlayerScore(playerid, PlayerInfo[playerid][pPoint]);}
				if(strcmp(key, "Team", true) == 0) {val = ini_GetValue(Data); PlayerInfo[playerid][pTeam] = strval(val);}
				if(strcmp(key, "Point", true) == 0) {val = ini_GetValue(Data); PlayerInfo[playerid][pPoint] = strval(val);}
				if(strcmp(key, "Skin", true) == 0) {val = ini_GetValue(Data); PlayerInfo[playerid][pSkin] = strval(val);}
				if(strcmp(key, "Level", true) == 0) {val = ini_GetValue(Data); PlayerInfo[playerid][pLevel] = strval(val);}
		        for(new i=0; i<4; i++)
		        {
		            format(string,sizeof(string),"Weapons[%d]",i);
		            if(strcmp(key, string, true) == 0) {val = ini_GetValue(Data); PlayerInfo[playerid][pWeapons][i] = strval(val);}
		            format(string,sizeof(string),"WeaponID[%d]",i);
		            if(strcmp(key, string, true) == 0) {val = ini_GetValue(Data); PlayerInfo[playerid][pWeaponID][i] = strval(val);}
		            format(string,sizeof(string),"Ammo[%d]",i);
		            if(strcmp(key, string, true) == 0) {val = ini_GetValue(Data); PlayerInfo[playerid][pAmmo][i] = strval(val);}
		        }
        		for(new i=0; i<12; i++)
        		{
        		    format(string,sizeof(string),"WeaponKill[%d]",i);
            		if(strcmp(key, string, true) == 0) {val = ini_GetValue(Data); PlayerInfo[playerid][pWeaponKill][i] = strval(val);}
            		
        		    format(string,sizeof(string),"TGWeaponGet[%d]",i);
            		if(strcmp(key, string, true) == 0) {val = ini_GetValue(Data); PlayerVariable[playerid][WeaponGet][i] = strval(val);}
				}
				
				if(strcmp(key, "TGZoneTextdraw", true) == 0) {val = ini_GetValue(Data); PlayerVariable[playerid][ZoneTextdraw] = strval(val);}
				if(strcmp(key, "TGDamageTextdraw", true) == 0) {val = ini_GetValue(Data); PlayerVariable[playerid][DamageTextdraw] = strval(val);}
				if(strcmp(key, "TGMaplogoTextdraw", true) == 0) {val = ini_GetValue(Data); PlayerVariable[playerid][MaplogoTextdraw] = strval(val);}
				if(strcmp(key, "TGHitSound", true) == 0) {val = ini_GetValue(Data); PlayerVariable[playerid][HitSound] = strval(val);}
				if(strcmp(key, "TGSpawnProtectionTime", true) == 0) {val = ini_GetValue(Data); PlayerVariable[playerid][SpawnProtectionTime] = strval(val);}
				if(strcmp(key, "TGTimeTextdraw", true) == 0) {val = ini_GetValue(Data); PlayerVariable[playerid][TimeTextdraw] = strval(val);}
				if(strcmp(key, "TGStatTime", true) == 0) {val = ini_GetValue(Data); PlayerVariable[playerid][StatTime] = strval(val);}
			}
			format(string,sizeof(string),"%d",PlayerVariable[playerid][StatTime]);
			SCM(playerid,COLOR_GREY,string);
				
			ClearChatbox(playerid, 10);
			gPlayerLogged[playerid] = true;
			PlayerPlaySound(playerid,1057,0.0,0.0,0.0);
			PlayAudioStreamForPlayer(playerid, "https://www.dropbox.com/s/v6d1sp4hgvj4yww/GTAT-KOREA-INTRO.mp3?dl=1");
			ToggleWar[playerid] = true;
			GetPlayerIp(playerid,PlayerIP,sizeof(PlayerIP));
			printf("[System] %s(id:%d) 로그인 [IP:%s]",PlayerName(playerid),playerid,PlayerIP);
			fclose(UserFile);
			
			SetTimerEx("OnPlayerSave", 30000, 1, "i", playerid);
			for(new i=0; i<5; i++)
				TextDrawShowForPlayer(playerid, TD_Setting[i]);
		}
		else
		{
       		ShowPlayerDialog(playerid,DialogID_Userdata(1),DIALOG_STYLE_PASSWORD,""#C_ORANGE"로그인",""C_RED"잘못된 비밀번호 입니다.\n\n"C_WHITE"다시 비밀번호를 입력하세요.","다음","퇴장");
			fclose(UserFile);
		}
    }
	return 1;
}

public OnPlayerSave(playerid)
{
	if(gPlayerLogged[playerid] == true)
	{
		new file[64];
	    format(file, sizeof(file),User_File,PlayerName(playerid));
	    new File: hFile = fopen(file, io_write);
		if(hFile)
		{
		    new var[64];
			format(var, 64, "Password=%s\n", PlayerInfo[playerid][pPassword]);fwrite(hFile, var);
            format(var, 64, "Kill=%d\n",PlayerInfo[playerid][pKill]);fwrite(hFile, var);
            format(var, 64, "Death=%d\n",PlayerInfo[playerid][pDeath]);fwrite(hFile, var);
            format(var, 64, "Point=%d\n",PlayerInfo[playerid][pPoint]);fwrite(hFile, var);
			format(var, 64, "Team=%d\n",PlayerInfo[playerid][pTeam]);fwrite(hFile, var);
			format(var, 64, "Point=%d\n",PlayerInfo[playerid][pPoint]);fwrite(hFile, var);
			format(var, 64, "Skin=%d\n",PlayerInfo[playerid][pSkin]);fwrite(hFile, var);
			format(var, 64, "Level=%d\n",PlayerInfo[playerid][pLevel]);fwrite(hFile, var);
			for(new i=0; i<4; i++)
	        {
	            format(var, 64, "Weapons[%d]=%d\n",i,PlayerInfo[playerid][pWeapons][i]);fwrite(hFile, var);
	            format(var, 64, "WeaponID[%d]=%d\n",i,PlayerInfo[playerid][pWeaponID][i]);fwrite(hFile, var);
	            format(var, 64, "Ammo[%d]=%d\n",i,PlayerInfo[playerid][pAmmo][i]);fwrite(hFile, var);
	        }
	        for(new i=0; i<12; i++)
	        {
				format(var, 64, "WeaponKill[%d]=%d\n",i,PlayerInfo[playerid][pWeaponKill][i]);fwrite(hFile, var);
				format(var, 64, "TGWeaponGet[%d]=%d\n",i,PlayerVariable[playerid][WeaponGet][i]);fwrite(hFile, var);
			}

            format(var, 64, "TGZoneTextdraw=%d\n",PlayerVariable[playerid][ZoneTextdraw]);fwrite(hFile, var);
            format(var, 64, "TGDamageTextdraw=%d\n",PlayerVariable[playerid][DamageTextdraw]);fwrite(hFile, var);
            format(var, 64, "TGMaplogoTextdraw=%d\n",PlayerVariable[playerid][MaplogoTextdraw]);fwrite(hFile, var);
            format(var, 64, "TGHitSound=%d\n",PlayerVariable[playerid][HitSound]);fwrite(hFile, var);
            format(var, 64, "TGSpawnProtectionTime=%d\n",PlayerVariable[playerid][SpawnProtectionTime]);fwrite(hFile, var);
            format(var, 64, "TGTimeTextdraw=%d\n",PlayerVariable[playerid][TimeTextdraw]);fwrite(hFile, var);
            format(var, 64, "TGStatTime=%d\n",PlayerVariable[playerid][StatTime]);fwrite(hFile, var);
			fclose(hFile);
		}
	}
	return 1;
}

public OnTeamSave(teamid)
{
	new file[64];
    format(file, sizeof(file),Team_File,teamid);
    new File: tFile = fopen(file, io_write);
	if(tFile)
	{
	    new var[64];
	    format(var, 64, "Used=%d\n", TeamInfo[teamid][Used]);fwrite(tFile, var);
		format(var, 64, "Color=%d\n", TeamInfo[teamid][Color]);fwrite(tFile, var);
		format(var, 64, "Name=%s\n", TeamInfo[teamid][Name]);fwrite(tFile, var);
		format(var, 64, "Leader=%s\n", TeamInfo[teamid][Leader]);fwrite(tFile, var);
		fclose(tFile);
	}
	return 1;
}

public OnTeamLoad(teamid)
{
    new file[32];
    format(file, sizeof(file),Team_File,teamid);
    new File: tFile = fopen(file, io_read);
    if(tFile)
    {
	    new key[256],val[256],Data[256];
	    while(fread(tFile, Data, sizeof(Data)))
		{
			key = ini_GetKey(Data);
			if(strcmp(key, "Used", true) == 0) {val = ini_GetValue(Data); TeamInfo[teamid][Used] = strval(val);}
			if(strcmp(key, "Color", true) == 0) {val = ini_GetValue(Data); TeamInfo[teamid][Color] = strval(val);}
			if(strcmp(key, "Name", true) == 0) {val = ini_GetValue(Data); strmid(TeamInfo[teamid][Name], val, 0, strlen(val)-1, 255);}
			if(strcmp(key, "Leader", true) == 0) {val = ini_GetValue(Data); strmid(TeamInfo[teamid][Leader], val, 0, strlen(val)-1, 255);}
		}
		fclose(tFile);
    }
	return 1;
}

public BasicTimer()
{
    new pPing[100], tmp1[30], tmp2[30];
	new string[128];

	for(new i=0; i<NUM_PLAYERS; i++)
	{
	    #define j pITERATION[i]
		if(PlayerInfo[j][FPS2]-1 < 26) format(tmp1, sizeof(tmp1), "{FF0000}%d", PlayerInfo[j][FPS2]-1);
	    else if(PlayerInfo[j][FPS2]-1 < 45) format(tmp1, sizeof(tmp1), "{FFFF00}%d", PlayerInfo[j][FPS2]-1);
	    else format(tmp1, sizeof(tmp1), "{33CC00}%d", PlayerInfo[j][FPS2]-1);

	    new p = GetPlayerPing(j);

	    if(p < 100) format(tmp2, sizeof(tmp2), "{33CC00}%d", p);
	    else if(p < 175)  format(tmp2, sizeof(tmp2), "{FFFF00}%d", p);
	    else format(tmp2, sizeof(tmp2), "{FF0000}%d", p);

		format(pPing, sizeof(pPing), "{33CC00}Ping: %s\n {33CC00}FPS: %s", tmp2, tmp1);
	    Update3DTextLabelText(PingLabels[j], GetPlayerColor(j), pPing);
	   	Attach3DTextLabelToPlayer(PingLabels[j], i, 0, 0, -0.7);

	    GetPlayerHealth(j, PlayerInfo[j][pHP]);
	    if(PlayerInfo[j][pHP] > 100)
			SetPlayerHealth(j, 100);
			
		for(new g=0; g<MAX_ZONE; g++)
		{
        	if(IsPlayerInZone(j,g) && EnterZone[j] != g)
        	{
        	    format(string,sizeof(string),"ZoneOwner[g]:%d",ZoneOwner[g]);
        	    SCMToAll(0xffffffff,string);
				format(string,sizeof(string),"~w~Welcome to Zone~n~of ~r~%s!",TeamInfo[ZoneOwner[g]][Name]);
        	    GameTextForPlayer(j,string,5000,1);
        	    EnterZone[j] = g;
        	}
		}

		LevelPoint[j] = PlayerInfo[j][pPoint] - PlayerInfo[j][pLevel]*100;
  		SetProgressBarValue(PlayerInfo[j][LevelBar],LevelPoint[j]);
  		format(string,sizeof(string),"%d/100",LevelPoint[j]);
  		TextDrawSetString(TD_LevelBar[j],string);

  		if(LevelPoint[j] >= 100)
  		{
  		    PlayerInfo[j][pLevel] ++;
  		    TextDrawSetString(TD_Level[j],PlayerInfo[j][pLevel]);
			format(string,sizeof(string),"[!] 레벨이 올랐습니다! (현재레벨: %d)",PlayerInfo[j][pLevel]);
  		    SCM(j,COLOR_ORANGE,string);
  		    
  		}

  		TextDrawShowForPlayer(j,TD_LevelBar[j]);
        #undef j
	}
 	
 	if(PlayTime > 0)
	{
	    PlayTime --;
	    format(string,sizeof(string),"%02d:%02d",PlayTime/60,PlayTime%60);
        TextDrawSetString(TD_Time, string);
        if(PlayTime <= 10 && PlayTime >= 0)
        {
            format(string,sizeof(string),"~r~%d",PlayTime);
            GameTextForAll(string, 1000, 4);
			for(new i=0; i<NUM_PLAYERS; i++)
			{
			    #define j pITERATION[i]
                PlayerPlaySound(j, 1057, 0.0, 0.0, 0.0);
		        #undef j
			}
        }
        if(PlayTime <= 0)
			ChangeZone();
	}
 	
 	
}

public ResetDual(playerid, targetid)
{
	DualID[playerid] = -1;
    Dualed[playerid] = 0;
    SetPlayerInterior(playerid, PlayerInfo[playerid][pInterior]);
    SetPlayerVirtualWorld(playerid, PlayerInfo[playerid][pVirtualWorld]);
	DualID[targetid] = -1;
    Dualed[targetid] = 0;
    SetPlayerInterior(targetid, PlayerInfo[targetid][pInterior]);
    SetPlayerVirtualWorld(targetid, PlayerInfo[targetid][pVirtualWorld]);
}

public ChangeZone()
{
	new string[256];
	new BestTeam = 0;
	ChangeMap = true;
	PlayTime = ServerVariable[RoundTime];

    for(new i = 1; i<MAX_TEAM; i++)
        if(TeamInfo[BestTeam][Kill] < TeamInfo[i][Kill])
            BestTeam = i;

    for(new i = 1; i<MAX_TEAM; i++)
        TeamInfo[i][Kill] = 0;

	for(new i=0; i<NUM_PLAYERS; i++)
	{
	    #define j pITERATION[i]
        GangZoneShowForPlayer(j, GangZone[ZoneID], TeamInfo[BestTeam][Color]);
    	if(PlayerInfo[j][pTeam] == BestTeam)
    	    PlayerInfo[j][pPoint] += 5;
        #undef j
	}
	
	ZoneOwner[ZoneID] = BestTeam;
	SaveZoneInfo(ZoneID,BestTeam);
	
	if(BestTeam != 0)
	{
		format(string,sizeof(string), "[!] 이번 구역 전쟁의 승리팀은 %s(%d)팀 입니다!",TeamInfo[BestTeam][Name],BestTeam);
		SCMToAll(COLOR_LIGHTBLUE,string);
		SCMToAll(COLOR_LIGHTBLUE, "[!] 승리한 팀원에게는 5 포인트가 지급되었습니다.\n");
	}
	else
	{
	    SCMToAll(COLOR_LIGHTBLUE,"[!] 이번 구역 전쟁의 승리팀은 중립팀입니다!");
	    SCMToAll(COLOR_LIGHTBLUE,"[!] 중립팀에게는 승리 포인트가 지급되지 않습니다.");
	}
	
	// 새로운 맵 불러오기
    ZoneID = random(MAX_ZONE);
    TextDrawSetString(TD_Zone[1], gSANZones[ZoneID][SAZONE_NAME]);

	for(new i=0; i<NUM_PLAYERS; i++)
	{
	    #define j pITERATION[i]
	    if(ToggleWar[j] == true && Dualed[j] == 0 && Spectate[j] == false && Dualed[j] != 2)
	    	SetPlayerSpawn(j);
        #undef j
	}
    SCMToAll(COLOR_SYSTEM, "[!] 맵이 변경되었습니다. 새로운 전장에서 미쳐 날뛰어 보세요!");
	return 1;
}

public SaveZoneInfo(Zoneid,owner)
{
	new file[64];
    format(file, sizeof(file),Zone_File,Zoneid);
    new File: hFile = fopen(file,io_write);
	if(hFile)
	{
	    new var[64];
		format(var, 64, "Owner=%d\n", owner);fwrite(hFile, var);
		fclose(hFile);
	}
	return 1;
}

public LoadZoneInfo(Zoneid)
{
	new file[64];
    format(file, sizeof(file),Zone_File,Zoneid);
    new File: hFile = fopen(file,io_read);
	if(hFile)
    {
	    new key[256],val[256],Data[256];
	    while(fread(hFile, Data, sizeof(Data)))
		{
			key = ini_GetKey(Data);
			if(strcmp(key, "Owner", true) == 0) {val = ini_GetValue(Data); ZoneOwner[Zoneid] = strval(val); }
		}
		fclose(hFile);
    }
	return 1;
}
public SaveConfigInfo()
{
	new file[32];
    format(file, sizeof(file),"GTAT/Config.txt");
    new File: hFile = fopen(file,io_write);
	if(hFile)
	{
	    new var[64];
		format(var, 64, "RoundTime=%d\n", ServerVariable[RoundTime]);fwrite(hFile, var);
		fclose(hFile);
	}
	return 1;
}

public LoadConfigInfo()
{
    new file[32];
    format(file, sizeof(file),"GTAT/Config.txt");
    new File: tFile = fopen(file, io_read);
    if(tFile)
    {
	    new key[256],val[256],Data[256];
	    while(fread(tFile, Data, sizeof(Data)))
		{
			key = ini_GetKey(Data);
			if(strcmp(key, "RoundTime", true) == 0) {val = ini_GetValue(Data); ServerVariable[RoundTime] = strval(val); PlayTime = ServerVariable[RoundTime];}
		}
		fclose(tFile);
    }
	return 1;
}

public Spectating(playerid, targetid, bool: toogle)
{
	if(!toogle)
	{
	    Spectate[playerid] = true;
	    SpecTarget[playerid] = targetid;
		TogglePlayerSpectating(playerid, 1);
		PlayerSpectatePlayer(playerid, targetid);
		for(new i=0; i<2; i++)
			TextDrawShowForPlayer(playerid, TD_Spec[i]);
	}
	else
	{
	    Spectate[playerid] = false;
		for(new i=0; i<2; i++)
			TextDrawHideForPlayer(playerid, TD_Spec[i]);
        TogglePlayerSpectating(playerid, 0);
		SetPlayerSpawn(playerid);
	}
}

public CreatePingLabels()
{
	for(new i = 0; i < GetMaxPlayers(); i++)
	{
		PingLabels[i] = Create3DTextLabel("-", COLOR_RED, 0.0, 0.0, 0.0, 30.0, 0, true);
		PlayerInfo[i][DmgLabel] = Create3DTextLabel("-", COLOR_ORANGE, 0.0, 0.0, 0.0, 30.0, 0, true);
	}
}

public HideDamage(playerid, hits)
{
	if (PlayerInfo[playerid][pHits] == hits) {
		TextDrawHideForPlayer(playerid,DamageTexts[playerid]);
		//Update3DTextLabelText(Player[playerid][DmgLabel], COLOR_WHITE, "\n");
	}
}

public ResetPlayerHits(playerid, hits)
{
	if(PlayerInfo[playerid][pHits] == hits)
    PlayerInfo[playerid][pHits] = 0;
}

public ResetDmgLabel(playerid) {
    Update3DTextLabelText(PlayerInfo[playerid][DmgLabel], COLOR_WHITE, " ");
}

public DestroyObjectEx(objectid)
{
    DestroyObject(objectid);
    return 1;
}

public ShowPlayerConfigDialog(playerid)
{
	new string[1000];
	new str[32];
	strcat(string,""#C_IVORY"  옵션\t\t\t"#C_IVORY"상태\n"#C_IVORY"텍스트드로우\t\t\t\n");

	if(PlayerVariable[playerid][ZoneTextdraw] == 1)
	    strcat(string,"> 구역 텍스트드로우\t\t\t"#C_PASTEL_GREEN"ON\n");
	else
	    strcat(string,"> 구역 텍스트드로우\t\t\t"#C_PASTEL_RED"OFF\n");

	if(PlayerVariable[playerid][DamageTextdraw] == 1)
	    strcat(string,"> 데미지 텍스트드로우\t\t\t"#C_PASTEL_GREEN"ON\n");
	else
	    strcat(string,"> 데미지 텍스트드로우\t\t\t"#C_PASTEL_RED"OFF\n");

	if(PlayerVariable[playerid][MaplogoTextdraw] == 1)
	    strcat(string,"> GTA:T 로고 텍스트드로우\t\t\t"#C_PASTEL_GREEN"ON\n");
	else
	    strcat(string,"> GTA:T 로고 텍스트드로우\t\t\t"#C_PASTEL_RED"OFF\n");

	if(PlayerVariable[playerid][TimeTextdraw] == 1)
	    strcat(string,"> 시간 텍스트드로우\t\t\t"#C_PASTEL_GREEN"ON\n");
	else
	    strcat(string,"> 시간 텍스트드로우\t\t\t"#C_PASTEL_RED"OFF\n");
	    
	strcat(string,""#C_IVORY"Features\n");

	if(PlayerVariable[playerid][HitSound] == 1)
	    strcat(string,"> 히트 사운드\t\t\t"#C_PASTEL_GREEN"ON\n");
	else
	    strcat(string,"> 히트 사운드\t\t\t"#C_PASTEL_RED"OFF\n");

	strcat(string,"> 스폰보호 시간\t\t\t"#C_YELLOW"");
	format(str,sizeof(str),"%d\n",PlayerVariable[playerid][SpawnProtectionTime]);
	strcat(string,str);

	strcat(string,"> 스탯 표기 시간\t\t\t"#C_YELLOW"");
	format(str,sizeof(str),"%d\n",PlayerVariable[playerid][StatTime]);
	strcat(string,str);
	
	strcat(string,"> 무기 획득 설정\t\t\t"#C_YELLOW"-");
	
	ShowPlayerDialog(playerid, DialogID_Config(0), DIALOG_STYLE_TABLIST_HEADERS, ""#C_ORANGE"설정할 항목을 선택하세요.", string , "확인", "뒤로");
}

public ShowServerConfigDialog(playerid)
{
	new string[1000];
	new str[32];
	strcat(string,""#C_IVORY"  옵션\t\t\t"#C_IVORY"상태\n");
	strcat(string,"> 라운드 시간\t\t\t"#C_YELLOW"");
	format(str,sizeof(str),"%d",ServerVariable[RoundTime]);
	strcat(string,str);
	
    ShowPlayerDialog(playerid, DialogID_Config(2), DIALOG_STYLE_TABLIST_HEADERS, ""#C_ORANGE"설정할 항목을 선택하세요.", string , "확인", "뒤로");
}

public ShowTeamMakingDialog(playerid)
{
	new string[1000];
	new str[32];
	for(new i=1; i<MAX_TEAM; i++)
	{
		if(TeamInfo[i][Used] == 0)
		{
			SelectedTeam = i;
	    	break;
		}
	}
	strcat(string,"> 팀 이름\t\t\t"#C_YELLOW"");
	format(str,sizeof(str),"%s\n",TeamInfo[SelectedTeam][Name]);
	strcat(string,str);

	strcat(string,"> 팀 리더\t\t\t"#C_YELLOW"");
	format(str,sizeof(str),"%s\n",TeamInfo[SelectedTeam][Leader]);
	strcat(string,str);
	
	strcat(string,"> 팀 색깔\t\t\t"#C_YELLOW"");
	format(str,sizeof(str),"%x\n",TeamInfo[SelectedTeam][Color]);
	strcat(string,str);
	
	strcat(string,"> "#C_RED"팀 생성");
	
	ShowPlayerDialog(playerid, DialogID_Team(0), DIALOG_STYLE_LIST, ""#C_ORANGE"팀 생성", string , "확인", "뒤로");
}

public ShowTeamListDialog(playerid)
{
	new string[1000];
	new str[256], idx;
	
	format(string,sizeof(string),"  "#C_IVORY"번호\t"#C_IVORY"이름\t\t"#C_IVORY"리더\t\t"#C_IVORY"죽인 수\n");
	for(new i=1; i<MAX_TEAM; i++)
	{
		if(TeamInfo[i][Used] == 1)
		{
		    Dialog_List[idx++] = i;
		    format(str,sizeof(str),"> %d번\t%s\t\t%s\t\t%d\n",i,TeamInfo[i][Name],TeamInfo[i][Leader],TeamInfo[i][Kill]);
		    strcat(string,str);
		}
	}
	ShowPlayerDialog(playerid, DialogID_Team(5), DIALOG_STYLE_TABLIST_HEADERS, ""#C_ORANGE"팀 목록", string , "확인", "뒤로");
}

public ShowPlayerWeaponDialog(playerid)
{
	new string[1000];
	strcat(string,""#C_IVORY"  무기\t\t\t"#C_IVORY"상태\n");

	if(PlayerVariable[playerid][WeaponGet][1] == 1)
	    strcat(string,"> Chainsaw\t\t\t"#C_PASTEL_GREEN"ON\n");
	else
	    strcat(string,"> Chainsaw\t\t\t"#C_PASTEL_RED"OFF\n");
	    
	if(PlayerVariable[playerid][WeaponGet][2] == 1)
	    strcat(string,"> Grenade\t\t\t"#C_PASTEL_GREEN"ON\n");
	else
	    strcat(string,"> Grenade\t\t\t"#C_PASTEL_RED"OFF\n");

	if(PlayerVariable[playerid][WeaponGet][3] == 1)
	    strcat(string,"> Molotov\t\t\t"#C_PASTEL_GREEN"ON\n");
	else
	    strcat(string,"> Molotov\t\t\t"#C_PASTEL_RED"OFF\n");

	if(PlayerVariable[playerid][WeaponGet][4] == 1)
	    strcat(string,"> Silenced Pistol\t\t\t"#C_PASTEL_GREEN"ON\n");
	else
	    strcat(string,"> Silenced Pistol\t\t\t"#C_PASTEL_RED"OFF\n");

	if(PlayerVariable[playerid][WeaponGet][5] == 1)
	    strcat(string,"> Desert Eagle\t\t\t"#C_PASTEL_GREEN"ON\n");
	else
	    strcat(string,"> Desert Eagle\t\t\t"#C_PASTEL_RED"OFF\n");

	if(PlayerVariable[playerid][WeaponGet][6] == 1)
	    strcat(string,"> Shotgun\t\t\t"#C_PASTEL_GREEN"ON\n");
	else
	    strcat(string,"> Shotgun\t\t\t"#C_PASTEL_RED"OFF\n");

	if(PlayerVariable[playerid][WeaponGet][7] == 1)
	    strcat(string,"> Combat Shotgun\t\t\t"#C_PASTEL_GREEN"ON\n");
	else
	    strcat(string,"> Combat Shotgun\t\t\t"#C_PASTEL_RED"OFF\n");

	if(PlayerVariable[playerid][WeaponGet][8] == 1)
	    strcat(string,"> MP5\t\t\t"#C_PASTEL_GREEN"ON\n");
	else
	    strcat(string,"> MP5\t\t\t"#C_PASTEL_RED"OFF\n");
	    
	if(PlayerVariable[playerid][WeaponGet][9] == 1)
	    strcat(string,"> AK47\t\t\t"#C_PASTEL_GREEN"ON\n");
	else
	    strcat(string,"> AK47\t\t\t"#C_PASTEL_RED"OFF\n");
	    
	if(PlayerVariable[playerid][WeaponGet][10] == 1)
	    strcat(string,"> M4\t\t\t"#C_PASTEL_GREEN"ON\n");
	else
	    strcat(string,"> M4\t\t\t"#C_PASTEL_RED"OFF\n");
	    
	if(PlayerVariable[playerid][WeaponGet][11] == 1)
	    strcat(string,"> Sniper Rifle\t\t\t"#C_PASTEL_GREEN"ON\n");
	else
	    strcat(string,"> Sniper Rifle\t\t\t"#C_PASTEL_RED"OFF\n");
	    
	ShowPlayerDialog(playerid, DialogID_Config(5), DIALOG_STYLE_TABLIST_HEADERS, ""#C_ORANGE"설정할 항목을 선택하세요.", string , "확인", "뒤로");
}

public HideStats(showid, playerid)
{
    TextDrawHideForPlayer(showid, TD_Stat[playerid]);
}

public EnableSync(playerid)
{
	PlayerInfo[playerid][pCanSync] = true;
	PlayerInfo[playerid][pSynced] = false;
}

public SyncPlayer(playerid)
{
	if(PlayerInfo[playerid][pCanSync] == false || IsPlayerInAnyVehicle(playerid))
		return SCM(playerid, COLOR_GREY, "[!] 지금은 사용할 수 없습니다.");

    PlayerInfo[playerid][pSynced] = true;
	PlayerInfo[playerid][pCanSync] = false;
	SetTimerEx("EnableSync",10000,false,"i",playerid);

	if(Spectate[playerid])
	    return 0;

	new bool:IsPlayerSpecing[M_P];
	for(new i=0; i<NUM_PLAYERS; i++)
	{
	    #define j pITERATION[i]
	    if(GetPlayerState(j) == PLAYER_STATE_SPECTATING && SpecTarget[j] == playerid) {
			IsPlayerSpecing[j] = true;
		}
		#undef j
	}

	new PlayerWeapons[2][13];
	for(new i = 0; i < 13; i++)
	{
	    if(i == 0 || i == 1) {
	   		GetPlayerWeaponData(playerid,i,PlayerWeapons[0][i],PlayerWeapons[1][i]);
	   		if(PlayerWeapons[1][i] > 1) { PlayerWeapons[1][i] = 1; }
	    }	else {
	   		GetPlayerWeaponData(playerid,i,PlayerWeapons[0][i],PlayerWeapons[1][i]);
		}
	}

	new Float:Velocity[3];
	GetPlayerVelocity(playerid, Velocity[0], Velocity[1], Velocity[2]);

	ClearAnimations(playerid);

	new Float:PlayerPos[3];
	GetPlayerPos(playerid,PlayerPos[0],PlayerPos[1],PlayerPos[2]);
	new Float:health = 0;
	GetPlayerHealth(playerid,health);
	new TheInterior, VirtualWorld;
	new Float:Angle;
	GetPlayerFacingAngle(playerid, Angle);
	TheInterior = GetPlayerInterior(playerid);
	VirtualWorld = GetPlayerVirtualWorld(playerid);

	SpawnPlayerEx(playerid);
	
	SetPlayerTeam(playerid, NO_TEAM);
	SetPlayerHealth(playerid,health);
	SetPlayerInterior(playerid,TheInterior);
	SetPlayerVirtualWorld(playerid,VirtualWorld);
	SetPlayerVelocity(playerid, Velocity[0], Velocity[1], Velocity[2]);
	SetPlayerPos(playerid,PlayerPos[0],PlayerPos[1],PlayerPos[2]);
	SetPlayerFacingAngle(playerid,Angle);
	for(new i = 0; i < 13; i++)
	{
	    if(PlayerWeapons[0][i] > 0){
		    GivePlayerWeapon(playerid,PlayerWeapons[0][i],PlayerWeapons[1][i]);
		}
	}
	for(new i=0; i<NUM_PLAYERS; i++)
	{
	    #define j pITERATION[i]
	    if(IsPlayerSpecing[j] == true) {
			SetTimerEx("Spectating",250,false,"ii",j,playerid,false);
		}
		#undef j
	}

	if(ToggleWar[playerid] == false)
		TogglePlayerControllable(playerid, false);
	return 1;
}

public SpawnPlayerEx(playerid) {
	RemovePlayerFromVehicle(playerid);
	if(GetPlayerState(playerid) == PLAYER_STATE_SPECTATING) { Spectating(playerid, playerid, true); TogglePlayerSpectating(playerid, false); }

	SpawnPlayer(playerid);
	return 1;
}

