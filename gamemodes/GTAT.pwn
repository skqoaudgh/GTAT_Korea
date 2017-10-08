//DmgLabel 추가하기


#include <a_samp>
#include <Color>
#include <dudb>
#include <Authentication>
#include <mapandreas>

#pragma unused ret_memcpy

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

#define User_File	"GTAT/User/%s.txt"
#define Zone_File	"GTAT/Zone/%d.txt"
#define Team_File	"GTAT/Team/%d.txt"

new ConnectedPlayer = 0;

new Text:TD_GTAT[5];
new Text:TD_Setting[4];
new Text:TD_SiteURL;
new Text:TD_Zone[2];
new Text:TD_Spec[2];

new Slot[M_P];

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
	pLeader,
	
	FPS2,
	DLlast,
	Text3D:DmgLabel,
	pHits,
	LastDamage,
	IJustLost
};
new PlayerInfo[M_P][pInfo];
new bool:gPlayerLogged[M_P];
new bool:gPlayerSpanwed[M_P];
new PlayerIP[64];

enum wInfo
{
	wName[20],
	wID,
	wAmount
}

new WeaponPickup[] =
{
    341,
    -1,-1,-1,-1,-1,-1,
    342,
    -1,
    344,
	-1,-1,-1,-1,
	347,
	348,
	349,
	-1,
	351,
	-1,
	353,
	355,
	356,
	-1,-1,
	358
};
new WeaponInfo[][wInfo] =
{
    {"Fist", 0, 1},
	{"Chainsaw", 9, 1},
	{"Grenade", 16, 2},
	{"Molotov", 18, 2},
	{"Silenced Pistol", 23, 450},
	{"Desert Eagle", 24, 450},
	{"Shotgun", 25, 120},
	{"Combat Shotgun", 27, 225},
	{"MP5", 29, 1500},
	{"AK47", 30, 750},
	{"M4", 31, 750},
	{"Sniper Rifle", 34, 120}
};

new ZoneID = 0;
new GangZone[MAX_ZONE];
new ZoneOwner[MAX_ZONE];

new ChangeTimer;

new DualID[M_P];
new Dualed[M_P];

enum KSinfo
{
	SpreeName[20],
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

new Float:SpawnPos[20][4];
new DroppedWeapon[M_P][15][4];

new bool:ToggleWar[M_P];
new ProtectTimer[M_P];

new bool:Spectate[M_P];
new SpecTarget[M_P];

new TeamColor[MAX_TEAM];
new TeamKill[MAX_TEAM];

new bool:SpawnType[M_P] = false;

new lobby;

new Text3D:PingLabels[M_P]; // Diagnostics label
new Text:DamageTexts[M_P];
new dmg_update_timer[M_P];

new bool:Protection[M_P] = false;

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

stock ShowStats(playerid)
{
	new Hour, Minute, Second;
	gettime(Hour, Minute, Second);
	
	new string[128];
	new Ratio;
	if(PlayerInfo[playerid][pDeath] == 0) Ratio = 0;
	else Ratio = PlayerInfo[playerid][pKill]/PlayerInfo[playerid][pDeath];
	format(string, sizeof(string), "[ %s(%d) 님의 정보 ]", PlayerName(playerid), playerid);
	SCM(playerid, 0xADFF2FAA, string);
	format(string, sizeof(string), "[ Money: "#C_WHITE"%d "#C_STAT"]", GetPlayerMoney(playerid));
	SCM(playerid, 0x6FA7FB96, string);
	format(string, sizeof(string), "[ Point: "#C_WHITE"%d "#C_STAT"]", PlayerInfo[playerid][pPoint]);
	SCM(playerid, 0x6FA7FB96, string);
	format(string, sizeof(string), "[ Kill: "#C_WHITE"%d "#C_STAT"]", PlayerInfo[playerid][pKill]);
	SCM(playerid, 0x6FA7FB96, string);
	format(string, sizeof(string), "%s",GetMostWeaponStr(playerid));
	SCM(playerid, 0x6FA7FB96, string);
	format(string, sizeof(string), "[ Death: "#C_WHITE"%d "#C_STAT"]", PlayerInfo[playerid][pDeath]);
	SCM(playerid, 0x6FA7FB96, string);
	
	format(string, sizeof(string), "[ Ratio: "#C_WHITE"%0.3f "#C_STAT"]", Ratio);
	SCM(playerid, 0x6FA7FB96, string);
	format(string, sizeof(string), "[ Current Time: "#C_WHITE"%02d시 %02d분 %02d초"#C_STAT"]", Hour, Minute, Second);
	SCM(playerid, 0x6FA7FB96, string);
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
	format(str,sizeof(str),"[ Favorite Weapon: "#C_WHITE"%s (Kills: %d) "#C_STAT"]", WeaponInfo[id][wName], MAX);
	return str;
}

stock SendTeamMessage(team, color, text[])
{
	for(new j,t=GetMaxPlayers(); j<t; j++)
	    if(PlayerInfo[j][pTeam] == team)
			SCM(j, color, text);
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
	
	Authentication("skqoaudgh.dothome.co.kr",true);
}

public OnGameModeInit()
{
	SetGameModeText("GTAT:Korea");
	MapAndreas_Init(MAP_ANDREAS_MODE_MINIMAL);
	
	SetWeather(10);
	SetWorldTime(15);
	
	UsePlayerPedAnims();
	DisableInteriorEnterExits();
	LoadZoneInfo(0);
	CreatePingLabels();
	
	for(new i=0; i<MAX_ZONE; i++)
	{
	    GangZone[i] = GangZoneCreate(gSANZones[i][SAZONE_AREA][0],gSANZones[i][SAZONE_AREA][1],gSANZones[i][SAZONE_AREA][2],gSANZones[i][SAZONE_AREA][3]);
	}
	for(new i=0; i<MAX_TEAM; i++)
	{
	    TeamKill[i] = 0;
		OnTeamLoad(i);
	}
	
	SetTimer("BasicTimer",1000,1);
	ChangeTimer = SetTimer("ChangeZone",60000*10,0);
	
	AddPlayerClass(54, 0.0, 0.0, 0.0, 0.0, 0, 0, 0, 0, 0, 0);
	AddPlayerClass(55, 0.0, 0.0, 0.0, 0.0, 0, 0, 0, 0, 0, 0);
	AddPlayerClass(56, 0.0, 0.0, 0.0, 0.0, 0, 0, 0, 0, 0, 0);
	AddPlayerClass(57, 0.0, 0.0, 0.0, 0.0, 0, 0, 0, 0, 0, 0);
	AddPlayerClass(58, 0.0, 0.0, 0.0, 0.0, 0, 0, 0, 0, 0, 0);

	CreateObject(19074, 1903.18604, 698.42468, 1005.52058,   0.00000, 0.00000, 0.00000);
	
	lobby = CreatePickup(1239, 1, -785.0139, 500.2697, 1371.7422, -1);
	
	TD_GTAT[0] = TextDrawCreate(142.628540, 397.653198, "Grand");
	TextDrawLetterSize(TD_GTAT[0], 0.300000, 1.500000);
	TextDrawAlignment(TD_GTAT[0], 1);
	TextDrawColor(TD_GTAT[0], -1);
	TextDrawSetOutline(TD_GTAT[0], 1);
	TextDrawBackgroundColor(TD_GTAT[0], 51);
	TextDrawFont(TD_GTAT[0], 1);
	TextDrawSetProportional(TD_GTAT[0], 1);

	TD_GTAT[1] = TextDrawCreate(154.590438, 407.893280, "theft");
	TextDrawLetterSize(TD_GTAT[1], 0.300000, 1.500000);
	TextDrawAlignment(TD_GTAT[1], 1);
	TextDrawColor(TD_GTAT[1], -1);
	TextDrawSetOutline(TD_GTAT[1], 1);
	TextDrawBackgroundColor(TD_GTAT[1], 51);
	TextDrawFont(TD_GTAT[1], 1);
	TextDrawSetProportional(TD_GTAT[1], 1);

	TD_GTAT[2] = TextDrawCreate(142.171493, 417.706604, "Auto");
	TextDrawLetterSize(TD_GTAT[2], 0.300000, 1.500000);
	TextDrawAlignment(TD_GTAT[2], 1);
	TextDrawColor(TD_GTAT[2], -1);
	TextDrawSetOutline(TD_GTAT[2], 1);
	TextDrawBackgroundColor(TD_GTAT[2], 51);
	TextDrawFont(TD_GTAT[2], 1);
	TextDrawSetProportional(TD_GTAT[2], 1);

	TD_GTAT[3] = TextDrawCreate(189.257232, 397.653289, "Korea");
	TextDrawLetterSize(TD_GTAT[3], 0.500000, 2.000000);
	TextDrawAlignment(TD_GTAT[3], 1);
	TextDrawColor(TD_GTAT[3], -16776961);
	TextDrawSetOutline(TD_GTAT[3], 1);
	TextDrawBackgroundColor(TD_GTAT[3], 51);
	TextDrawFont(TD_GTAT[3], 0);
	TextDrawSetProportional(TD_GTAT[3], 1);

	TD_GTAT[4] = TextDrawCreate(180.114181, 418.559967, "Tournament");
	TextDrawLetterSize(TD_GTAT[4], 0.300000, 1.500000);
	TextDrawAlignment(TD_GTAT[4], 1);
	TextDrawColor(TD_GTAT[4], -16776961);
	TextDrawSetOutline(TD_GTAT[4], 1);
	TextDrawBackgroundColor(TD_GTAT[4], 51);
	TextDrawFont(TD_GTAT[4], 1);
	TextDrawSetProportional(TD_GTAT[4], 1);

	TD_Setting[0] = TextDrawCreate(356.666687, 349.233337, "usebox");
	TextDrawLetterSize(TD_Setting[0], 0.000000, 3.618147);
	TextDrawTextSize(TD_Setting[0], 260.857147, 0.000000);
	TextDrawAlignment(TD_Setting[0], 1);
	TextDrawUseBox(TD_Setting[0], true);
	TextDrawBoxColor(TD_Setting[0], 102);
	
	TD_Setting[1] = TextDrawCreate(308.514373, 350.720031, "Set Spawn Position");
	TextDrawTextSize(TD_Setting[1],10.000000, 100.000000);
 	TextDrawLetterSize(TD_Setting[1], 0.250000, 1.250000);
	TextDrawAlignment(TD_Setting[1], 2);
	TextDrawColor(TD_Setting[1], -5963521);
	TextDrawSetOutline(TD_Setting[1], 1);
	TextDrawBackgroundColor(TD_Setting[1], 51);
	TextDrawFont(TD_Setting[1], 1);
	TextDrawSetProportional(TD_Setting[1], 1);
	TextDrawSetSelectable(TD_Setting[1], 1);

	TD_Setting[2] = TextDrawCreate(308.114227, 368.640014, "Set Spawn Weapon");
	TextDrawTextSize(TD_Setting[2],10.000000, 100.000000);
 	TextDrawLetterSize(TD_Setting[2], 0.250000, 1.250000);
	TextDrawAlignment(TD_Setting[2], 2);
	TextDrawColor(TD_Setting[2], -5963521);
	TextDrawSetOutline(TD_Setting[2], 1);
	TextDrawBackgroundColor(TD_Setting[2], 51);
	TextDrawFont(TD_Setting[2], 1);
	TextDrawSetProportional(TD_Setting[2], 1);
	TextDrawSetSelectable(TD_Setting[2], 1);

	TD_Setting[3] = TextDrawCreate(308.114227, 386.640014, "Set Player Configuration");
	TextDrawTextSize(TD_Setting[3],10.000000, 100.000000);
 	TextDrawLetterSize(TD_Setting[3], 0.250000, 1.250000);
	TextDrawAlignment(TD_Setting[3], 2);
	TextDrawColor(TD_Setting[3], -5963521);
	TextDrawSetOutline(TD_Setting[3], 1);
	TextDrawBackgroundColor(TD_Setting[3], 51);
	TextDrawFont(TD_Setting[3], 1);
	TextDrawSetProportional(TD_Setting[3], 1);
	TextDrawSetSelectable(TD_Setting[3], 1);
	
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
	}
	return 1;
}

public OnGameModeExit()
{
	for(new i=0; i<MAX_TEAM; i++)
    	OnTeamSave(i);
	return 1;
}

public OnPlayerRequestClass(playerid, classid)
{
	SetPlayerPos(playerid, -2384.8484,-584.4088,132.1172);
	SetPlayerFacingAngle(playerid, 272.7505);
	SetPlayerCameraPos(playerid, -2379.0386,-581.3090,133.6117);
	SetPlayerCameraLookAt(playerid, -2384.8484,-584.4088,132.1172);
	for(new i=0; i<4; i++)
		TextDrawShowForPlayer(playerid, TD_Setting[i]);
    SelectTextDraw(playerid, 0x00FF00FF);
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
    	GangZoneShowForPlayer(playerid, GangZone[i], TeamColor[ZoneOwner[i]]);
    	
	for(new i=0; i<5; i++)
		TextDrawShowForPlayer(playerid, TD_GTAT[i]);
	for(new i=0; i<4; i++)
		TextDrawShowForPlayer(playerid, TD_Setting[i]);
    TextDrawShowForPlayer(playerid, TD_SiteURL);
	SelectTextDraw(playerid, 0x00FF00FF);
	
	EnableStuntBonusForPlayer(playerid, 0);
    for(new i=0; i<4; i++)
    {
		PlayerInfo[playerid][pWeapons][i] = 0;
		PlayerInfo[playerid][pWeaponID][i] = 0;
		PlayerInfo[playerid][pAmmo][i] = 0;
	}
	PlayerInfo[playerid][pWeapons][0] = WeaponInfo[6][wID];
	PlayerInfo[playerid][pAmmo][0] = WeaponInfo[6][wAmount];
	
    for(new i=0; i<12; i++)
		PlayerInfo[playerid][pWeaponKill][i] = 0;

	PlayerInfo[playerid][pKill] = 0;
	PlayerInfo[playerid][pDeath] = 0;
	PlayerInfo[playerid][pKill] = 0;
	PlayerInfo[playerid][pHP] = 0;
	PlayerInfo[playerid][pInterior] = 0;
	PlayerInfo[playerid][pVirtualWorld] = 0;
	PlayerInfo[playerid][pTeam] = 0;
	PlayerInfo[playerid][pLeader] = 0;
	PlayerInfo[playerid][pPoint] = 0;
	PlayerInfo[playerid][FPS2] = 0;
	PlayerInfo[playerid][DLlast] = 0;
	PlayerInfo[playerid][pHits] = 0;
	PlayerInfo[playerid][LastDamage] = 0;
	PlayerInfo[playerid][IJustLost] = 0;
	return 1;
}

public OnPlayerDisconnect(playerid, reason)
{
    OnPlayerSave(playerid);
    
	new string[128], Temp[pInfo];
	switch(reason)
	{
	    case 0:	format(string, sizeof(string), "[!] %s(%d) 비정상 종료", PlayerName(playerid), playerid);
	    case 1:	format(string, sizeof(string), "[!] %s(%d) 로그아웃", PlayerName(playerid), playerid);
	    case 2:	format(string, sizeof(string), "[!] %s(%d) 킥/밴", PlayerName(playerid), playerid);
	}
	SCMToAll(COLOR_GREY, string);

	PlayerInfo[playerid] = Temp;
	gPlayerLogged[playerid] = false;
	gPlayerSpanwed[playerid] = false;
	Kills[playerid] = 0;
	KillStat[playerid] = 0;
	ToggleWar[playerid] = false;
	Spectate[playerid] = false;
	return 1;
}

public OnPlayerSpawn(playerid)
{
	SetPlayerSpawn(playerid);
	return 1;
}

public OnPlayerDeath(playerid, killerid, reason)
{
	new string[256];
	new
		Float:DeathPos[3],
		weapons[15][2]
	;
	
	for(new i=0; i<2; i++)
		TextDrawHideForPlayer(playerid, TD_Zone[i]);
		
	SendDeathMessage(killerid, playerid, reason);
	gPlayerSpanwed[playerid] = false;
	
	PlayerInfo[killerid][pKill] ++;
	PlayerInfo[killerid][pPoint] ++;
	SetPlayerScore(playerid, PlayerInfo[playerid][pPoint]);
	Kills[killerid] ++;
	PlayerInfo[playerid][pDeath] ++;
	Kills[playerid] = 0;
	
	if(Dualed[playerid] == 2)
	{
	    SetPlayerSpawn(DualID[playerid]);
	    ResetDual(playerid, DualID[playerid]);
	    
	    format(string, sizeof(string), "[Dual] %s(%d) 님이 %s(%d) 님을 듀얼에서 이겼습니다!", PlayerName(DualID[playerid]), DualID[playerid], PlayerName(playerid), playerid);
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
	        format(string,sizeof(string),"[!] %s(%d) 님이 God Father 칭호에 도달하였습니다!!",PlayerName(killerid),killerid);
			SCMToAll(COLOR_LIGHTRED,string);
	    }
	    
	}
	
	for (new i = 0; i <= 14; i++)
		DestroyPickup(DroppedWeapon[playerid][i][2]);
		
	GetPlayerPos(playerid, DeathPos[0], DeathPos[1], DeathPos[2]);
	DroppedWeapon[playerid][14][2] = CreatePickup(1240, 8, DeathPos[0], DeathPos[1], DeathPos[2], 0);
	for (new i = 0; i <= 13; i++)
	{
	    GetPlayerWeaponData(playerid, i, weapons[i][0], weapons[i][1]);
	    if(weapons[i][0] != 0)
	    {
		    DroppedWeapon[playerid][i][0] = weapons[i][0];
		    DroppedWeapon[playerid][i][1] = weapons[i][1]/5;
		    switch(i)
		    {
		        case 1: DroppedWeapon[playerid][i][2] = CreatePickup(WeaponPickup[weapons[i][0]-9], 8, DeathPos[0]+0.8, DeathPos[1], DeathPos[2], 0);
		        case 2: DroppedWeapon[playerid][i][2] = CreatePickup(WeaponPickup[weapons[i][0]-9], 8, DeathPos[0]+0.8, DeathPos[1]+0.8, DeathPos[2], 0);
		        case 3: DroppedWeapon[playerid][i][2] = CreatePickup(WeaponPickup[weapons[i][0]-9], 8, DeathPos[0]-0.8, DeathPos[1]-0.8, DeathPos[2], 0);
		        case 4: DroppedWeapon[playerid][i][2] = CreatePickup(WeaponPickup[weapons[i][0]-9], 8, DeathPos[0]+1.3, DeathPos[1]+1.3, DeathPos[2], 0);
		        case 5: DroppedWeapon[playerid][i][2] = CreatePickup(WeaponPickup[weapons[i][0]-9], 8, DeathPos[0]-1.3, DeathPos[1]-1.3, DeathPos[2], 0);
                case 6: DroppedWeapon[playerid][i][2] = CreatePickup(WeaponPickup[weapons[i][0]-9], 8, DeathPos[0]+1.8, DeathPos[1]-0.8, DeathPos[2], 0);
		        case 8: DroppedWeapon[playerid][i][2] = CreatePickup(WeaponPickup[weapons[i][0]-9], 8, DeathPos[0]-0.8, DeathPos[1], DeathPos[2], 0);
			}

		    DroppedWeapon[playerid][i][3] = SetTimerEx("DestroyPickuped", 20000, 0, "i", playerid);
		}
	}
	
	switch(GetPlayerWeapon(playerid))
	{
	    case 0: PlayerInfo[playerid][pWeaponKill][0] ++;
	    case 9: PlayerInfo[playerid][pWeaponKill][1] ++; 
	    case 16: PlayerInfo[playerid][pWeaponKill][2] ++;
	    case 18: PlayerInfo[playerid][pWeaponKill][3] ++; 
	    case 23: PlayerInfo[playerid][pWeaponKill][4] ++;
	    case 24: PlayerInfo[playerid][pWeaponKill][5] ++;
	    case 25: PlayerInfo[playerid][pWeaponKill][6] ++;
	    case 27: PlayerInfo[playerid][pWeaponKill][7] ++;
	    case 29: PlayerInfo[playerid][pWeaponKill][8] ++;
	    case 30: PlayerInfo[playerid][pWeaponKill][9] ++;
	    case 31: PlayerInfo[playerid][pWeaponKill][10] ++;
	    case 34: PlayerInfo[playerid][pWeaponKill][11] ++;
	}
	return 1;
}

public DestroyPickuped(playerid)
{
	for (new i = 0; i <= 14; i++)
		DestroyPickup(DroppedWeapon[playerid][i][2]);
}


public OnPlayerPickUpPickup(playerid, pickupid)
{
	if(pickupid == lobby)
	{
		ShowPlayerDialog(playerid, DialogID_Lobby(0), DIALOG_STYLE_LIST, ""#C_ORANGE"설정할 항목을 선택하세요.", ""#C_WHITE"스폰 장소\n무기\n로비 나가기", "다음", "취소");
		SetPlayerPos(playerid, -782.3690, 501.3023, 1371.7490);
		return 1;
	}
	
	for(new j,t=GetMaxPlayers(); j<t; j++)
	{
		for (new i = 0; i <= 13; i++)
		{
			if(pickupid == DroppedWeapon[j][i][2])
			{
			    GivePlayerWeapon(playerid, DroppedWeapon[j][i][0], DroppedWeapon[j][i][1]);
				DestroyPickup(DroppedWeapon[j][i][2]);
			    break;
			}
		}
		if(pickupid == DroppedWeapon[j][14][2])
		{
		    SetPlayerHealth(playerid, PlayerInfo[j][pHP] + 30);
		    DestroyPickup(DroppedWeapon[j][14][2]);
		    break;
		}
	}
	

	
	return 1;
}

public OnPlayerText(playerid, text[])
{
	new string[512];
	format(string,sizeof(string),"%s (%d): %s",PlayerName(playerid), playerid, text);
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
		if(strcmp("/맵변경",cmd,true) == 0)
		{
			ChangeZone();
			return 1;
		}
		
		if(strcmp("/리더설정",cmd,true) == 0 || strcmp("/팀설정",cmd,true) == 0 || strcmp("/리더",cmd,true) == 0)
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
			    PlayerInfo[targetid][pLeader] = 0;
			    PlayerInfo[targetid][pTeam] = 0;
				format(string,sizeof(string),"[!] 당신은 %s(%d) 의 리더 권한을 회수하였습니다.", PlayerName(targetid), targetid);
				SCM(playerid, COLOR_SYSTEM, string);
				SCM(targetid, COLOR_SYSTEM, "[!] 당신의 리더 권환이 회수되었습니다.");
				return 1;
			}
			PlayerInfo[targetid][pLeader] = teamid;
			PlayerInfo[targetid][pTeam] = teamid;
			format(string,sizeof(string),"[!] 당신은 %d번 팀의 리더를 %s(%d) (으)로 설정하였습니다.",teamid, PlayerName(targetid), targetid);
			SCM(playerid, COLOR_SYSTEM, string);
			format(string,sizeof(string),"[!] 당신은 %d번 팀의 리더가 되었습니다.",teamid);
			SCM(targetid, COLOR_SYSTEM, string);
			return 1;
		}

		if(strcmp("/팀색깔",cmd,true) == 0)
		{
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp))
				return SCM(playerid, COLOR_GREY, "* 사용법: /팀색깔 [팀 번호] [색깔 코드]");
			new teamid = strval(tmp);
			if(teamid > MAX_TEAM || teamid < 0)
			    return SCM(playerid, COLOR_GREY, "[!] 부적절한 팀 번호 입니다.");
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp))
				return SCM(playerid, COLOR_GREY, "* 사용법: /리더설정 [플레이어 번호] [팀 번호]");
			new colorid = strval(tmp);
			    
			TeamColor[teamid] = colorid;
			OnTeamSave(teamid);
			format(string,sizeof(string),"[!] 당신은 %d번 팀의 색깔을 %d (으)로 설정하였습니다.",teamid, colorid);
			SCM(playerid, COLOR_SYSTEM, string);
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
			format(string,sizeof(string),"team:%d leader:%d",PlayerInfo[playerid][pTeam],PlayerInfo[playerid][pLeader]);
			SCM(playerid, COLOR_SYSTEM, string);
			
			format(string,sizeof(string),"color: %d",TeamColor[1]);
			SCM(playerid, COLOR_SYSTEM, string);

			TeamKill[1] = 4;
		    return 1;
		}
		
		if(strcmp("/test2",cmd,true) == 0)
		{
		    GangZoneShowForPlayer(playerid, GangZone[0], TeamColor[1]);
		    return 1;
		}
	}
	
	//-----
	if(strcmp(cmd, "/help", true)==0)
	{
	    SCM(playerid, COLOR_IVORY,"* /dual  /lounge  /stats  /spectate  /pm *");
	    SCM(playerid, COLOR_IVORY,"* /t /팀초대 /팀추방 /팀접속 *");
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
		SendTeamMessage(PlayerInfo[playerid][pTeam],TeamColor[PlayerInfo[playerid][pTeam]],string);
		printf("[Team Chat] %s: %s",PlayerName(playerid),talk);
		return 1;
 	}
 	
	if(strcmp("/팀접속",cmd,true) == 0)
	{
		SCM(playerid,COLOR_SYSTEM,"* 현재 접속한 당신의 팀원 목록 *");
		for(new i=0; i<MAX_PLAYERS; i++)
		{
			if(IsPlayerConnected(i))
			{
			    if(PlayerInfo[i][pTeam] == PlayerInfo[playerid][pTeam])
			    {
			        format(string,sizeof(string)," %s (id: %d)",PlayerName(i),i);
			        SCM(playerid,COLOR_IVORY,string);
			    }
			}
		}
		return 1;
	}
	
	if(strcmp("/팀초대",cmd,true) == 0)
	{
	    if(PlayerInfo[playerid][pLeader] == 0)
	        return SCM(playerid, COLOR_GREY, "[!] 팀의 리더만 사용할 수 있습니다.");
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp))
			return SCM(playerid, COLOR_GREY, "* 사용법: /팀초대 [플레이어 번호]");
		new targetid = strval(tmp);
		if(!IsPlayerConnected(targetid))
		    return SCM(playerid, COLOR_GREY, "[!] 접속하지 않은 플레이어 입니다.");

		PlayerInfo[targetid][pTeam] = PlayerInfo[playerid][pLeader];
		format(string,sizeof(string),"[!] 당신은 %s(%d) (을)를 팀으로 초대하였습니다.", PlayerName(targetid), targetid);
		SCM(playerid, COLOR_SYSTEM, string);
		format(string,sizeof(string),"[!] 당신은 %d번 팀의 일원이 되었습니다.",PlayerInfo[playerid][pLeader]);
		SCM(targetid, COLOR_SYSTEM, string);
		return 1;
	}

	if(strcmp("/팀추방",cmd,true) == 0)
	{
	    if(PlayerInfo[playerid][pLeader] == 0)
	        return SCM(playerid, COLOR_GREY, "[!] 팀의 리더만 사용할 수 있습니다.");
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp))
			return SCM(playerid, COLOR_GREY, "* 사용법: /팀추방 [플레이어 번호]");
		new targetid = strval(tmp);
		if(!IsPlayerConnected(targetid))
		    return SCM(playerid, COLOR_GREY, "[!] 접속하지 않은 플레이어 입니다.");

		PlayerInfo[targetid][pTeam] = PlayerInfo[playerid][pLeader];
		format(string,sizeof(string),"[!] 당신은 %s(%d) (을)를 팀에서 추방시켰습니다.", PlayerName(targetid), targetid);
		SCM(playerid, COLOR_SYSTEM, string);
		SCM(targetid, COLOR_SYSTEM, "[!] 당신은 리더에 의해 팀에서 추방당했습니다.");
		return 1;
	}
	
	if(strcmp(cmd, "/spec", true)==0 || strcmp(cmd, "/spectate", true)==0 || strcmp(cmd, "/관전", true)==0 || strcmp(cmd, "/위성", true)==0)
	{
	    tmp = strtok(cmdtext, idx);
	    new targetid;
		if(!strlen(tmp))
			return SCM(playerid, COLOR_GREY, "* 사용법: (/spec)tate [플레이어 번호]");
	    targetid = strval(tmp);
		if(!IsPlayerConnected(targetid))
		    return SCM(playerid, COLOR_GREY, "[!] 접속하지 않은 플레이어 입니다.");
		if(targetid == playerid)
		    return SCM(playerid, COLOR_GREY, "[!] 자기 자신을 관전할 순 없습니다.");
		Spectating(playerid, targetid, Spectate[playerid]);

	    return 1;
	}
	
	if(strcmp(cmd, "/stat", true)==0 || strcmp(cmd, "/stats", true)==0 || strcmp(cmd, "/스탯", true)==0)
	{
	    tmp = strtok(cmdtext, idx);
	    new targetid;
		if(!strlen(tmp))
			return ShowStats(targetid);
		else
		{
		    targetid = strval(tmp);
			if(!IsPlayerConnected(targetid))
			    return SCM(playerid, COLOR_GREY, "[!] 접속하지 않은 플레이어 입니다.");
		}
		ShowStats(targetid);
	    return 1;
	}

	if(strcmp(cmd, "/리스폰", true)==0 || strcmp(cmd, "/re", true)==0 || strcmp(cmd, "/리폰", true)==0)
	{
		if(ToggleWar[playerid] == true)
			return SCM(playerid, COLOR_GREY,"[!] 체력이 80 이상이어야 사용할 수 있습니다.");
		KillTimer(ProtectTimer[playerid]);
		Protection[playerid] = false;
		SetPlayerSpawn(playerid);
	    return 1;
	}
	
	if(strcmp(cmd, "/lounge", true)==0 || strcmp(cmd, "/lobby", true)==0 || strcmp(cmd, "/로비", true)==0)
	{
		if(ToggleWar[playerid] == false)
		{
			if(PlayerInfo[playerid][pHP] < 80)
				return SCM(playerid, COLOR_GREY,"[!] 체력이 80 이상이어야 사용할 수 있습니다.");
			KillTimer(ProtectTimer[playerid]);
			Protection[playerid] = false;
            ToggleWar[playerid] = true;
            SetPlayerPos(playerid, -795.0203,490.3264,1376.1953);
            SetPlayerInterior(playerid, 1);
            SetPlayerVirtualWorld(playerid, 0);
			SetPlayerHealth(playerid, 100);
			ResetPlayerWeapons(playerid);
			SCM(playerid,COLOR_ORANGE,"[!] 로비에 입장하였습니다.");
			ConnectedPlayer --;
		}
		else
		{
		    ToggleWar[playerid] = false;
		    SetPlayerSpawn(playerid);
		}
	    return 1;
	}

	if(strcmp("/dual",cmd,true) == 0)
	{
		if(gPlayerSpanwed[playerid] == false)
		    return SCM(playerid, COLOR_GREY, "[!] 체력이 80 이상이어야 사용할 수 있습니다.");
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp))
			return SCM(playerid, COLOR_GREY, "* 사용법: /dual [플레이어 번호]");
		new targetid = strval(tmp);
		if(!IsPlayerConnected(targetid))
			return SCM(playerid,COLOR_GREY,"[!] 접속하지 않은 플레이어 입니다.");
		if(Dualed[targetid] != 0)
		    return SCM(playerid,COLOR_GREY,"[!] 상대방은 이미 듀얼 신청을 받았거나 듀얼을 진행 중 입니다.");
		if(PlayerInfo[targetid][pHP] < 80)
		    return SCM(playerid, COLOR_GREY, "[!] 상대방의 체력이 부족해 듀얼을 할 수 없습니다.");
		//-----
		format(string, sizeof(string), "[듀얼] %s(%d) 님에게 듀얼을 신청하였습니다.", PlayerName(targetid), targetid);
		SCM(playerid, COLOR_LIGHTGREEN, string);
		format(string, sizeof(string), "[듀얼] %s(%d) 님으로부터 듀얼 신청을 받았습니다. (/수락)", PlayerName(playerid), playerid);
		SCM(playerid, COLOR_LIGHTGREEN, string);
		Dualed[playerid] = 1;
		Dualed[targetid] = 1;
		DualID[targetid] = playerid;

		SetTimerEx("ResetDual", 5000, 0, "i", playerid, targetid);
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
		if(ToggleWar[playerid] == true)
		{
		    TogglePlayerControllable(playerid,0);
		    TogglePlayerControllable(playerid,1);
			SetPlayerHealth(playerid, PlayerInfo[playerid][pHP] - 25);
			SCM(playerid, COLOR_RED,"[!] 로비에서는 공격할 수 없습니다!");
		}
	}
	
	if(Spectate[playerid] == true)
	{
		if(newkeys == KEY_ANALOG_LEFT) // PREV
		{
		    do
			{
		        SpecTarget[playerid] -=1;
		        if(SpecTarget[playerid]<0) SpecTarget[playerid] = GetMaxPlayers();
		    } while(IsPlayerConnected(SpecTarget[playerid]) && ToggleWar[playerid] == false && SpecTarget[playerid] != playerid);
            Spectating(playerid, SpecTarget[playerid], false);
		}
		
		if(newkeys == KEY_ANALOG_RIGHT) // NEXT
		{
		    do
			{
		        SpecTarget[playerid] +=1;
		        if(SpecTarget[playerid]>GetMaxPlayers()) SpecTarget[playerid] = 0;
		    } while(IsPlayerConnected(SpecTarget[playerid]) && ToggleWar[playerid] == false && SpecTarget[playerid] != playerid);
            Spectating(playerid, SpecTarget[playerid], false);
		}
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
	
	
	
	if(dialogid == DialogID_Config(0))
	{
	    if(response)
	    {
	    
	    }
	}
	
	else if(dialogid == DialogID_Lobby(0))
	{
	    if(response)
	    {
	        switch(listitem)
	        {
	            case 0:
	                ShowPlayerDialog(playerid, DialogID_Position(0), DIALOG_STYLE_LIST, ""#C_ORANGE"스폰 장소를 선택하세요.", ""#C_WHITE"임의의 좌표\n플레이어 근처\n로비", "다음", "취소");
				case 1:
				    ShowPlayerDialog(playerid, DialogID_Weapon(0), DIALOG_STYLE_LIST, ""#C_ORANGE"슬롯을 선택하세요.", ""#C_WHITE"1번 슬롯\n2번 슬롯\n3번 슬롯\n4번 슬롯", "다음", "취소");
				case 2:
				{
				    ToggleWar[playerid] = false;
					SpawnType[playerid] = false;
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
					SCM(playerid,COLOR_SYSTEM,"[!] 이제부터 전장의 임의의 좌표에서 스폰됩니다.");
					SpawnType[playerid] = false;
					ToggleWar[playerid] = false;
	            }
	            case 1:
	            {
	                if(ConnectedPlayer == 0)
	                {
	                    ShowPlayerDialog(playerid, DialogID_Position(0), DIALOG_STYLE_LIST, ""#C_ORANGE"스폰 장소를 선택하세요.", ""#C_WHITE"임의의 좌표\n플레이어 근처\n로비", "다음", "취소");
						SCM(playerid, COLOR_GREY, "[!] 전장에서 싸우고 있는 플레이어가 없습니다.");
						return 1;
					}
					SCM(playerid,COLOR_SYSTEM,"[!] 이제부터 플레이어 근처에서 스폰됩니다.");
					SpawnType[playerid] = true;
					ToggleWar[playerid] = false;
	            }
	            case 2:
	            {
					SCM(playerid,COLOR_SYSTEM,"[!] 이제부터 로비에서 스폰됩니다.");
					SpawnType[playerid] = false;
					ToggleWar[playerid] = true;
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
    
	return 1;
}

public OnPlayerClickTextDraw(playerid, Text:clickedid)
{
	new string[512];
	if(clickedid == TD_Setting[1]) // 포지션
	{
		ShowPlayerDialog(playerid, DialogID_Position(0), DIALOG_STYLE_LIST, ""#C_ORANGE"스폰 장소를 선택하세요.", ""#C_WHITE"임의의 좌표\n플레이어 근처\n로비", "다음", "취소");
	}
	
	else if(clickedid == TD_Setting[2]) // 무기
	{
	    ShowPlayerDialog(playerid, DialogID_Weapon(0), DIALOG_STYLE_LIST, ""#C_ORANGE"슬롯을 선택하세요.", ""#C_WHITE"1번 슬롯\n2번 슬롯\n3번 슬롯\n4번 슬롯", "다음", "취소");
	}
	
		        			   
	else if(clickedid == TD_Setting[3]) // config
	{
	    format(string, sizeof(string), " "#C_IVORY"  Option\t\t\t\t\t  Status\
										 Textdraws\n\
										 "#C_WHITE"Zone Textdraw\n\
										 Damage Textdraw\n\
										 Map Logo Textdraw\n\
										 "#C_IVORY"Features\n\
										 "#C_WHITE"Hit Sound\n\
										 Spawn Protection Time\n\
										 ");
	    ShowPlayerDialog(playerid, DialogID_Config(0), DIALOG_STYLE_TABLIST_HEADERS, ""#C_ORANGE"설정할 항목을 선택하세요.", string , "다음", "취소");
	}
	return 1;
}

public OnPlayerTakeDamage(playerid, issuerid, Float: amount, weaponid)
{
    PlayerPlaySound(playerid, 1131, 0, 0, 0);
    if(IsPlayerConnected(issuerid)) PlayerPlaySound(issuerid, 17802, 0.0, 0.0, 0.0);
    	
	return 1;
}

public SetPlayerSpawn(playerid)
{
    StopAudioStreamForPlayer(playerid);
	PlayerPlaySound(playerid, 0, 0, 0, 0);
	if(PlayerInfo[playerid][pTeam] == 0)
    	SetPlayerColor(playerid, COLOR_WHITE);
	else
	   SetPlayerColor(playerid, TeamColor[PlayerInfo[playerid][pTeam]]);

	for(new i=0; i<4; i++)
		TextDrawHideForPlayer(playerid, TD_Setting[i]);
	for(new i=0; i<2; i++)
		TextDrawShowForPlayer(playerid, TD_Zone[i]);
	CancelSelectTextDraw(playerid);

	if(ToggleWar[playerid] == false)
	{
	    new diffX;
	    new diffY;
	    new Float:randX, Float:randY, Float:randZ;
	    if(SpawnType[playerid] == false)
	    {
			diffX = floatround(gSANZones[ZoneID][SAZONE_AREA][2] - gSANZones[ZoneID][SAZONE_AREA][0], floatround_floor);
			diffY = floatround(gSANZones[ZoneID][SAZONE_AREA][3] - gSANZones[ZoneID][SAZONE_AREA][1], floatround_floor);
			
			randX = gSANZones[ZoneID][SAZONE_AREA][0] + random(diffX);
			randY = gSANZones[ZoneID][SAZONE_AREA][1] + random(diffY);
	        MapAndreas_FindZ_For2DCoord(randX, randY, randZ);
	        SetPlayerPos(playerid, randX, randY, randZ+0.5);
		}
		else
		{
			new randP;
			do randP = random(GetMaxPlayers());
			while(!IsPlayerConnected(randP));
			GetPlayerPos(randP, randX, randY, randZ);
			randX += random(10) + 5;
			randY += random(10) + 5;
	        MapAndreas_FindZ_For2DCoord(randX, randY, randZ);
	        SetPlayerPos(playerid, randX, randY, randZ+0.5);
		}
		SetPlayerInterior(playerid, 0);
		SetPlayerVirtualWorld(playerid, 0);
		SpawnPlayerProtection(playerid, 1);
		Protection[playerid] = true;
		gPlayerSpanwed[playerid] = true;
		ConnectedPlayer ++;
	}
	else
	{
        SetPlayerPos(playerid, -795.0203,490.3264,1376.1953);
        SetPlayerInterior(playerid, 1);
        SetPlayerVirtualWorld(playerid, 0);
		SetPlayerHealth(playerid, 100);
		ResetPlayerWeapons(playerid);
		ConnectedPlayer --;
	}
	return 1;
}

public SpawnPlayerProtection(playerid, toggle)
{
	if(toggle == 1)
	{
		ResetPlayerWeapons(playerid);
		SetPlayerHealth(playerid, 9999);
		KillTimer(ProtectTimer[playerid]);
		ProtectTimer[playerid] = SetTimerEx("SpawnPlayerProtection", 3000, 0, "i", playerid, 0);
	}
	else
	{
	    Protection[playerid] = false;
	    SetPlayerHealth(playerid, 100);
	    ResetPlayerWeapons(playerid);
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
		format(var, 32, "Password=%s\n", PlayerInfo[playerid][pPassword]);fwrite(hFile, var);
        format(var, 32, "Kill=%d\n",PlayerInfo[playerid][pKill]);fwrite(hFile, var);
        format(var, 32, "Death=%d\n",PlayerInfo[playerid][pDeath]);fwrite(hFile, var);
        format(var, 32, "Point=%d\n",PlayerInfo[playerid][pPoint]);fwrite(hFile, var);
        for(new i=0; i<12; i++)
        {
			format(var, 32, "WeaponKill[%d]=%d\n",i,PlayerInfo[playerid][pWeaponKill]);fwrite(hFile, var);
		}
		format(var, 32, "Team=%d\n",PlayerInfo[playerid][pTeam]);fwrite(hFile, var);
		format(var, 32, "Leader=%d\n",PlayerInfo[playerid][pLeader]);fwrite(hFile, var);
		format(var, 32, "Point=%d\n",PlayerInfo[playerid][pPoint]);fwrite(hFile, var);
		fclose(hFile);
		GetPlayerIp(playerid,PlayerIP,sizeof(PlayerIP));
        printf("[System] %s(id:%d) 계정 생성 [IP:%s]",PlayerName(playerid),playerid,PlayerIP);
	}
	return 1;
}

public OnPlayerLogin(playerid,password[])
{
    new file[32],string[56];
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
        		for(new i=0; i<12; i++)
        		{
        		    format(string,sizeof(string),"WeaponKill[%d]",i);
            		if(strcmp(key, string, true) == 0) {val = ini_GetValue(Data); PlayerInfo[playerid][pWeaponKill][i] = strval(val);}
				}
				if(strcmp(key, "Team", true) == 0) {val = ini_GetValue(Data); PlayerInfo[playerid][pTeam] = strval(val);}
				if(strcmp(key, "Leader", true) == 0) {val = ini_GetValue(Data); PlayerInfo[playerid][pLeader] = strval(val);}
				if(strcmp(key, "Point", true) == 0) {val = ini_GetValue(Data); PlayerInfo[playerid][pPoint] = strval(val);}
			}
			ClearChatbox(playerid, 10);
			gPlayerLogged[playerid] = true;
			PlayerPlaySound(playerid,1057,0.0,0.0,0.0);
			PlayAudioStreamForPlayer(playerid, "https://www.dropbox.com/s/v6d1sp4hgvj4yww/GTAT-KOREA-INTRO.mp3?dl=1");
			GetPlayerIp(playerid,PlayerIP,sizeof(PlayerIP));
			printf("[System] %s(id:%d) 로그인 [IP:%s]",PlayerName(playerid),playerid,PlayerIP);
			fclose(UserFile);
			
			SetTimerEx("OnPlayerSave", 30000, 1, "i", playerid);
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
	        for(new i=0; i<12; i++)
	        {
	            format(var, 64, "WeaponKill[%d]=%d\n",i,PlayerInfo[playerid][pWeaponKill]);fwrite(hFile, var);
			}
			format(var, 64, "Team=%d\n",PlayerInfo[playerid][pTeam]);fwrite(hFile, var);
			format(var, 64, "Leader=%d\n",PlayerInfo[playerid][pLeader]);fwrite(hFile, var);
			format(var, 64, "Point=%d\n",PlayerInfo[playerid][pPoint]);fwrite(hFile, var);
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
		format(var, 64, "TeamColor=%d\n", TeamColor[teamid]);fwrite(tFile, var);
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
			if(strcmp(key, "TeamColor", true) == 0) {val = ini_GetValue(Data); TeamColor[teamid] = strval(val);}
		}
		fclose(tFile);
    }
	return 1;
}

public BasicTimer()
{
    new pPing[100], tmp1[30], tmp2[30];

	for(new i,t=GetMaxPlayers(); i<t; i++)
	{
		if(PlayerInfo[i][FPS2]-1 < 26) format(tmp1, sizeof(tmp1), "{FF0000}%d", PlayerInfo[i][FPS2]-1);
	    else if(PlayerInfo[i][FPS2]-1 < 45) format(tmp1, sizeof(tmp1), "{FFFF00}%d", PlayerInfo[i][FPS2]-1);
	    else format(tmp1, sizeof(tmp1), "{33CC00}%d", PlayerInfo[i][FPS2]-1);

	    new p = GetPlayerPing(i);

	    if(p < 100) format(tmp2, sizeof(tmp2), "{33CC00}%d", p);
	    else if(p < 175)  format(tmp2, sizeof(tmp2), "{FFFF00}%d", p);
	    else format(tmp2, sizeof(tmp2), "{FF0000}%d", p);

		format(pPing, sizeof(pPing), "{33CC00}Ping: %s\n {33CC00}FPS: %s", tmp2, tmp1);
	    Update3DTextLabelText(PingLabels[i], GetPlayerColor(i), pPing);
	    Attach3DTextLabelToPlayer(PingLabels[i], i, 0, 0, -0.7);


	    GetPlayerHealth(i, PlayerInfo[i][pHP]);
	    if(PlayerInfo[i][pHP] > 100)
			SetPlayerHealth(i, 100);
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
	
	KillTimer(ChangeTimer);
	ChangeTimer = SetTimer("ChangeZone",60000*5,0);

    for(new i = 1; i<MAX_TEAM; i++)
        if(TeamKill[BestTeam] < TeamKill[i])
            BestTeam = i;
            
    for(new i = 1; i<MAX_TEAM; i++)
        TeamKill[i] = 0;
    
    for(new i,t=GetMaxPlayers(); i<t; i++)
    {
        GangZoneShowForPlayer(i, GangZone[ZoneID], TeamColor[BestTeam]);
    	if(PlayerInfo[i][pTeam] == BestTeam)
    	    PlayerInfo[i][pPoint] += 5;
	}

	format(string,sizeof(string),"bestteam: %d, ZoneID: %d",BestTeam,ZoneID);
	SCMToAll(COLOR_WHITE,string);
		
	ZoneOwner[ZoneID] = BestTeam;
	SaveZoneInfo(ZoneID,BestTeam);
	
	format(string,sizeof(string), "[!] 이번 구역 전쟁의 승리팀은 [%d 팀] 입니다!",BestTeam);
	SCMToAll(COLOR_LIGHTBLUE,string);
	SCMToAll(COLOR_LIGHTBLUE, "[!] 승리한 팀원에게는 5 포인트가 지급되었습니다.\n");
	
	// 새로운 맵 불러오기
    ZoneID = random(MAX_ZONE);
    TextDrawSetString(TD_Zone[1], gSANZones[ZoneID][SAZONE_NAME]);
    LoadZoneInfo(ZoneID);
    
	for(new i,t=GetMaxPlayers(); i<t; i++)
	    SetPlayerSpawn(i);
	    
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
		format(var, 64, "%d", owner);fwrite(hFile, var);
		fclose(hFile);
	}
	return 1;
}

public LoadZoneInfo(Zoneid)
{
	new
		splited[4][16],
		Float:pos[4]
	;
	new file[256];
    format(file, sizeof(file),Zone_File,Zoneid);
    new File: hfile = fopen(file, io_read);
    if(hfile)
    {
	    new Data[1024];
		for(new id=0; id<20; id++)
		{
		    fread(hfile, Data);
			split(Data,splited,',');
			for(new i=0; i<3; i++)
				pos[i] = floatstr(splited[i]);
			SpawnPos[id][0] = pos[0], SpawnPos[id][1] = pos[1], SpawnPos[id][2] = pos[2], SpawnPos[id][3] = pos[3];
		}
		fread(hfile, Data);
		ZoneOwner[Zoneid] = strval(Data);
		fclose(hfile);
	}
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
		SetPlayerSpawn(playerid);
	}
}

public CreatePingLabels()
{
	for(new i = 0; i < GetMaxPlayers(); i++)
	{
		PingLabels[i] = Create3DTextLabel("-", COLOR_RED, 0.0, 0.0, 0.0, 50.0, 0, true);
		PlayerInfo[i][DmgLabel] = Create3DTextLabel("-", COLOR_ORANGE, 0.0, 0.0, 0.0, 50.0, 0, true);
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
