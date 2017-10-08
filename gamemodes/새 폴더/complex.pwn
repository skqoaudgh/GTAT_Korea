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
	AddPlayerClass(0,1868.1858, -1674.1515, 14.1046,95.6418,0,0,0,0,0,0);
	SetWorldTime(12);
	new obj;
	
	// 사무실벽
	obj = CreateObject(19463, 1831.74683, -1641.52356, 13.63050,   0.00000, 0.00000, 0.00000);
	SetObjectMaterial(obj, 0, 16051, "oldwest", "des_adobewall3", 0xFFFFFFFF);
	obj = CreateObject(19463, 1831.74585, -1645.08105, 13.63150,   0.00000, 0.00000, 0.00000);
	SetObjectMaterial(obj, 0, 16051, "oldwest", "des_adobewall3", 0xFFFFFFFF);
	obj = CreateObject(19463, 1836.47412, -1649.81775, 13.63250,   0.00000, 0.00000, 90.00000);
	SetObjectMaterial(obj, 0, 16051, "oldwest", "des_adobewall3", 0xFFFFFFFF);
	
	// 기본 바깥 벽
	obj = CreateObject(19377, 1870.90942, -1627.12512, 17.74320,   0.00000, 0.00000, 0.00000);
	SetObjectMaterial(obj, 0, 5717, "sunrise11_lawn", "citywall1", 0xFFFFFFFF);
	obj = CreateObject(19377, 1870.90845, -1636.75903, 17.74320,   0.00000, 0.00000, 0.00000);
	SetObjectMaterial(obj, 0, 5717, "sunrise11_lawn", "citywall1", 0xFFFFFFFF);
	obj = CreateObject(19377, 1870.90942, -1646.39307, 17.74320,   0.00000, 0.00000, 0.00000);
	SetObjectMaterial(obj, 0, 5717, "sunrise11_lawn", "citywall1", 0xFFFFFFFF);
	obj = CreateObject(19377, 1870.90845, -1656.02710, 17.74320,   0.00000, 0.00000, 0.00000);
	SetObjectMaterial(obj, 0, 5717, "sunrise11_lawn", "citywall1", 0xFFFFFFFF);
	obj = CreateObject(19377, 1875.63794, -1622.39624, 17.74320,   0.00000, 0.00000, 90.00000);
	SetObjectMaterial(obj, 0, 5717, "sunrise11_lawn", "citywall1", 0xFFFFFFFF);
	obj = CreateObject(19377, 1885.27002, -1622.39514, 17.74320,   0.00000, 0.00000, 90.00000);
	SetObjectMaterial(obj, 0, 5717, "sunrise11_lawn", "citywall1", 0xFFFFFFFF);
	obj = CreateObject(19377, 1894.90344, -1622.39624, 17.74320,   0.00000, 0.00000, 90.00000);
	SetObjectMaterial(obj, 0, 5717, "sunrise11_lawn", "citywall1", 0xFFFFFFFF);
	obj = CreateObject(19377, 1904.53760, -1622.39514, 17.74320,   0.00000, 0.00000, 90.00000);
	SetObjectMaterial(obj, 0, 5717, "sunrise11_lawn", "citywall1", 0xFFFFFFFF);
	obj = CreateObject(19377, 1914.17114, -1622.39624, 17.74320,   0.00000, 0.00000, 90.00000);
	SetObjectMaterial(obj, 0, 5717, "sunrise11_lawn", "citywall1", 0xFFFFFFFF);
	obj = CreateObject(19377, 1923.80371, -1622.39514, 17.74320,   0.00000, 0.00000, 90.00000);
	SetObjectMaterial(obj, 0, 5717, "sunrise11_lawn", "citywall1", 0xFFFFFFFF);
	obj = CreateObject(19377, 1875.63708, -1660.75525, 17.74320,   0.00000, 0.00000, 90.00000);
	SetObjectMaterial(obj, 0, 5717, "sunrise11_lawn", "citywall1", 0xFFFFFFFF);
	obj = CreateObject(19377, 1928.53186, -1627.12341, 17.74320,   0.00000, 0.00000, 0.00000);
	SetObjectMaterial(obj, 0, 5717, "sunrise11_lawn", "citywall1", 0xFFFFFFFF);
	
	obj = CreateObject(19377, 1931.59302, -1647.41931, 17.74320,   0.00000, 0.00000, 0.00000);
	SetObjectMaterial(obj, 0, 6290, "railtunn1_law2", "ws_tunnelwall2", 0xFFFFFFFF);
	obj = CreateObject(19377, 1926.86401, -1642.69067, 17.74320,   0.00000, 0.00000, 90.00000);
	SetObjectMaterial(obj, 0, 6290, "railtunn1_law2", "ws_tunnelwall2", 0xFFFFFFFF);
	obj = CreateObject(19377, 1917.23010, -1642.69165, 17.74320,   0.00000, 0.00000, 90.00000);
	SetObjectMaterial(obj, 0, 6290, "railtunn1_law2", "ws_tunnelwall2", 0xFFFFFFFF);
	obj = CreateObject(19377, 1931.59204, -1657.05396, 17.74320,   0.00000, 0.00000, 0.00000);
	SetObjectMaterial(obj, 0, 6290, "railtunn1_law2", "ws_tunnelwall2", 0xFFFFFFFF);
	obj = CreateObject(19377, 1931.59094, -1666.68701, 17.74320,   0.00000, 0.00000, 0.00000);
	SetObjectMaterial(obj, 0, 6290, "railtunn1_law2", "ws_tunnelwall2", 0xFFFFFFFF);
	obj = CreateObject(19377, 1931.59192, -1676.31995, 17.74320,   0.00000, 0.00000, 0.00000);
	SetObjectMaterial(obj, 0, 6290, "railtunn1_law2", "ws_tunnelwall2", 0xFFFFFFFF);
	obj = CreateObject(19377, 1931.59290, -1685.95300, 17.74320,   0.00000, 0.00000, 0.00000);
	SetObjectMaterial(obj, 0, 6290, "railtunn1_law2", "ws_tunnelwall2", 0xFFFFFFFF);
	obj = CreateObject(19377, 1931.59192, -1695.58606, 17.74320,   0.00000, 0.00000, 0.00000);
	SetObjectMaterial(obj, 0, 6290, "railtunn1_law2", "ws_tunnelwall2", 0xFFFFFFFF);
	obj = CreateObject(19377, 1931.59290, -1705.21912, 17.74320,   0.00000, 0.00000, 0.00000);
	SetObjectMaterial(obj, 0, 6290, "railtunn1_law2", "ws_tunnelwall2", 0xFFFFFFFF);
	obj = CreateObject(19377, 1931.59192, -1714.85205, 17.74320,   0.00000, 0.00000, 0.00000);
	SetObjectMaterial(obj, 0, 6290, "railtunn1_law2", "ws_tunnelwall2", 0xFFFFFFFF);
	obj = CreateObject(19377, 1931.59290, -1724.48511, 17.74320,   0.00000, 0.00000, 0.00000);
	SetObjectMaterial(obj, 0, 6290, "railtunn1_law2", "ws_tunnelwall2", 0xFFFFFFFF);
	obj = CreateObject(19377, 1926.86475, -1729.21472, 17.74320,   0.00000, 0.00000, 90.00000);
	SetObjectMaterial(obj, 0, 6290, "railtunn1_law2", "ws_tunnelwall2", 0xFFFFFFFF);
	obj = CreateObject(19377, 1917.23010, -1729.21375, 17.74320,   0.00000, 0.00000, 90.00000);
	SetObjectMaterial(obj, 0, 6290, "railtunn1_law2", "ws_tunnelwall2", 0xFFFFFFFF);
	
	// 기본 안 벽
	obj = CreateObject(19376, 1880.36646, -1656.02686, 17.74320,   0.00000, 0.00000, 0.00000);
	SetObjectMaterial(obj, 0, 6048, "mall_law", "stonemall_law", 0xFFFFFFFF);
	obj = CreateObject(19376, 1880.36646, -1646.39331, 17.74320,   0.00000, 0.00000, 0.00000);
	SetObjectMaterial(obj, 0, 6048, "mall_law", "stonemall_law", 0xFFFFFFFF);
	obj = CreateObject(19376, 1880.36646, -1636.75903, 17.74320,   0.00000, 0.00000, 0.00000);
	SetObjectMaterial(obj, 0, 6048, "mall_law", "stonemall_law", 0xFFFFFFFF);
	obj = CreateObject(19376, 1923.80286, -1631.85437, 17.74320,   0.00000, 0.00000, 90.00000);
	SetObjectMaterial(obj, 0, 6048, "mall_law", "stonemall_law", 0xFFFFFFFF);
	obj = CreateObject(19376, 1914.16956, -1631.85437, 17.74320,   0.00000, 0.00000, 90.00000);
	SetObjectMaterial(obj, 0, 6048, "mall_law", "stonemall_law", 0xFFFFFFFF);
	obj = CreateObject(19376, 1904.53601, -1631.85437, 17.74320,   0.00000, 0.00000, 90.00000);
	SetObjectMaterial(obj, 0, 6048, "mall_law", "stonemall_law", 0xFFFFFFFF);
	obj = CreateObject(19376, 1894.90161, -1631.85437, 17.74320,   0.00000, 0.00000, 90.00000);
	SetObjectMaterial(obj, 0, 6048, "mall_law", "stonemall_law", 0xFFFFFFFF);
	obj = CreateObject(19376, 1885.26758, -1631.85437, 17.74320,   0.00000, 0.00000, 90.00000);
	SetObjectMaterial(obj, 0, 6048, "mall_law", "stonemall_law", 0xFFFFFFFF);
	
	obj = CreateObject(19376, 1912.50134, -1647.42029, 17.74320,   0.00000, 0.00000, 0.00000);
	SetObjectMaterial(obj, 0, 9906, "sfe_builda", "sl_dwntwallvic1", 0xFFFFFFFF);
	obj = CreateObject(19376, 1912.50232, -1657.05396, 17.74320,   0.00000, 0.00000, 0.00000);
	SetObjectMaterial(obj, 0, 9906, "sfe_builda", "sl_dwntwallvic1", 0xFFFFFFFF);
	obj = CreateObject(19376, 1912.50134, -1666.68701, 17.74320,   0.00000, 0.00000, 0.00000);
	SetObjectMaterial(obj, 0, 9906, "sfe_builda", "sl_dwntwallvic1", 0xFFFFFFFF);
	obj = CreateObject(19376, 1912.50232, -1676.31995, 17.74320,   0.00000, 0.00000, 0.00000);
	SetObjectMaterial(obj, 0, 9906, "sfe_builda", "sl_dwntwallvic1", 0xFFFFFFFF);
	obj = CreateObject(19376, 1912.50232, -1695.58606, 17.74320,   0.00000, 0.00000, 0.00000);
	SetObjectMaterial(obj, 0, 9906, "sfe_builda", "sl_dwntwallvic1", 0xFFFFFFFF);
	obj = CreateObject(19376, 1912.50134, -1705.21912, 17.74320,   0.00000, 0.00000, 0.00000);
	SetObjectMaterial(obj, 0, 9906, "sfe_builda", "sl_dwntwallvic1", 0xFFFFFFFF);
	obj = CreateObject(19376, 1912.50232, -1714.85205, 17.74320,   0.00000, 0.00000, 0.00000);
	SetObjectMaterial(obj, 0, 9906, "sfe_builda", "sl_dwntwallvic1", 0xFFFFFFFF);
	obj = CreateObject(19376, 1912.50134, -1724.48511, 17.74320,   0.00000, 0.00000, 0.00000);
	SetObjectMaterial(obj, 0, 9906, "sfe_builda", "sl_dwntwallvic1", 0xFFFFFFFF);
	obj = CreateObject(19376, 1907.78760, -1680.72827, 17.74320,   0.00000, 0.00000, 90.00000);
	SetObjectMaterial(obj, 0, 9906, "sfe_builda", "sl_dwntwallvic1", 0xFFFFFFFF);
	obj = CreateObject(19376, 1907.78760, -1691.11279, 17.74320,   0.00000, 0.00000, 90.00000);
	SetObjectMaterial(obj, 0, 9906, "sfe_builda", "sl_dwntwallvic1", 0xFFFFFFFF);
	
	// 2층 바닥
	obj = CreateObject(19463, 1875.63721, -1661.37195, 16.73670,   0.00000, 90.00000, 90.00000);
	SetObjectMaterial(obj, 0, 5150, "wiresetc_las2", "metpat64", 0xFFFFFFFF);
	obj = CreateObject(19463, 1882.20349, -1658.30554, 16.73770,   0.00000, 90.00000, 180.00000);
	SetObjectMaterial(obj, 0, 5150, "wiresetc_las2", "metpat64", 0xFFFFFFFF);
	obj = CreateObject(19463, 1882.20349, -1648.67188, 16.73670,   0.00000, 90.00000, 180.00000);
	SetObjectMaterial(obj, 0, 5150, "wiresetc_las2", "metpat64", 0xFFFFFFFF);
	obj = CreateObject(19463, 1882.20447, -1639.03748, 16.73570,   0.00000, 90.00000, 180.00000);
	SetObjectMaterial(obj, 0, 5150, "wiresetc_las2", "metpat64", 0xFFFFFFFF);
	obj = CreateObject(19463, 1885.27002, -1633.69067, 16.73670,   0.00000, 90.00000, 90.00000);
	SetObjectMaterial(obj, 0, 5150, "wiresetc_las2", "metpat64", 0xFFFFFFFF);
	obj = CreateObject(19463, 1894.90295, -1633.69165, 16.73570,   0.00000, 90.00000, 90.00000);
	SetObjectMaterial(obj, 0, 5150, "wiresetc_las2", "metpat64", 0xFFFFFFFF);
	obj = CreateObject(19463, 1904.53662, -1633.69067, 16.73670,   0.00000, 90.00000, 90.00000);
	SetObjectMaterial(obj, 0, 5150, "wiresetc_las2", "metpat64", 0xFFFFFFFF);
	obj = CreateObject(19463, 1914.16956, -1633.69165, 16.73570,   0.00000, 90.00000, 90.00000);
	SetObjectMaterial(obj, 0, 5150, "wiresetc_las2", "metpat64", 0xFFFFFFFF);
	obj = CreateObject(19463, 1923.00317, -1633.69275, 16.73670,   0.00000, 90.00000, 90.00000);
	SetObjectMaterial(obj, 0, 5150, "wiresetc_las2", "metpat64", 0xFFFFFFFF);
	obj = CreateObject(19463, 1910.66260, -1647.42126, 16.73670,   0.00000, 90.00000, 0.00000);
	SetObjectMaterial(obj, 0, 5150, "wiresetc_las2", "metpat64", 0xFFFFFFFF);
	obj = CreateObject(19463, 1910.66260, -1657.05530, 16.73670,   0.00000, 90.00000, 0.00000);
	SetObjectMaterial(obj, 0, 5150, "wiresetc_las2", "metpat64", 0xFFFFFFFF);
	obj = CreateObject(19463, 1910.66260, -1666.69043, 16.73670,   0.00000, 90.00000, 0.00000);
	SetObjectMaterial(obj, 0, 5150, "wiresetc_las2", "metpat64", 0xFFFFFFFF);
	obj = CreateObject(19463, 1910.66260, -1724.48364, 16.73670,   0.00000, 90.00000, 0.00000);
	SetObjectMaterial(obj, 0, 5150, "wiresetc_las2", "metpat64", 0xFFFFFFFF);
	obj = CreateObject(19463, 1910.66260, -1714.84875, 16.73670,   0.00000, 90.00000, 0.00000);
	SetObjectMaterial(obj, 0, 5150, "wiresetc_las2", "metpat64", 0xFFFFFFFF);
	obj = CreateObject(19463, 1910.66260, -1705.21436, 16.73670,   0.00000, 90.00000, 0.00000);
	SetObjectMaterial(obj, 0, 5150, "wiresetc_las2", "metpat64", 0xFFFFFFFF);
	obj = CreateObject(19463, 1910.66260, -1676.32495, 16.73670,   0.00000, 90.00000, 0.00000);
	SetObjectMaterial(obj, 0, 5150, "wiresetc_las2", "metpat64", 0xFFFFFFFF);
	obj = CreateObject(19463, 1910.66260, -1695.57996, 16.73670,   0.00000, 90.00000, 0.00000);
	SetObjectMaterial(obj, 0, 5150, "wiresetc_las2", "metpat64", 0xFFFFFFFF);
	obj = CreateObject(19463, 1888.77087, -1661.37183, 16.73570,   0.00000, 90.00000, 90.00000);
	SetObjectMaterial(obj, 0, 5150, "wiresetc_las2", "metpat64", 0xFFFFFFFF);
	obj = CreateObject(19463, 1898.40625, -1661.37183, 16.73570,   0.00000, 90.00000, 90.00000);
	SetObjectMaterial(obj, 0, 5150, "wiresetc_las2", "metpat64", 0xFFFFFFFF);
	obj = CreateObject(19463, 1907.90771, -1661.62219, 16.73470,   0.00000, 90.00000, 87.00000);
	SetObjectMaterial(obj, 0, 5150, "wiresetc_las2", "metpat64", 0xFFFFFFFF);
	
	// 옥상
	obj = CreateObject(19379, 1875.63818, -1655.59290, 22.90550,   0.00000, 90.00000, 90.00000);
	SetObjectMaterial(obj, 0, 18265, "w_town3cs_t", "ws_rooftarmac1", 0xFFFFFFFF);
	obj = CreateObject(19379, 1875.63818, -1645.09155, 22.90550,   0.00000, 90.00000, 90.00000);
	SetObjectMaterial(obj, 0, 18265, "w_town3cs_t", "ws_rooftarmac1", 0xFFFFFFFF);
	obj = CreateObject(19379, 1875.63818, -1634.59045, 22.90550,   0.00000, 90.00000, 90.00000);
	SetObjectMaterial(obj, 0, 18265, "w_town3cs_t", "ws_rooftarmac1", 0xFFFFFFFF);
	obj = CreateObject(19379, 1875.63831, -1627.55884, 22.90650,   0.00000, 90.00000, 90.00000);
	SetObjectMaterial(obj, 0, 18265, "w_town3cs_t", "ws_rooftarmac1", 0xFFFFFFFF);
	obj = CreateObject(19379, 1885.70618, -1627.12573, 22.90650,   0.00000, 90.00000, 0.00000);
	SetObjectMaterial(obj, 0, 18265, "w_town3cs_t", "ws_rooftarmac1", 0xFFFFFFFF);
	obj = CreateObject(19379, 1896.20691, -1627.12573, 22.90650,   0.00000, 90.00000, 0.00000);
	SetObjectMaterial(obj, 0, 18265, "w_town3cs_t", "ws_rooftarmac1", 0xFFFFFFFF);
	obj = CreateObject(19379, 1906.70825, -1627.12573, 22.90650,   0.00000, 90.00000, 0.00000);
	SetObjectMaterial(obj, 0, 18265, "w_town3cs_t", "ws_rooftarmac1", 0xFFFFFFFF);
	obj = CreateObject(19379, 1917.20947, -1627.12573, 22.90650,   0.00000, 90.00000, 0.00000);
	SetObjectMaterial(obj, 0, 18265, "w_town3cs_t", "ws_rooftarmac1", 0xFFFFFFFF);
	obj = CreateObject(19379, 1923.37036, -1627.12573, 22.90550,   0.00000, 90.00000, 0.00000);
	SetObjectMaterial(obj, 0, 18265, "w_town3cs_t", "ws_rooftarmac1", 0xFFFFFFFF);
	obj = CreateObject(19379, 1917.23047, -1647.85327, 22.90550,   0.00000, 90.00000, 90.00000);
	SetObjectMaterial(obj, 0, 18265, "w_town3cs_t", "ws_rooftarmac1", 0xFFFFFFFF);
	obj = CreateObject(19379, 1926.86377, -1647.85327, 22.90550,   0.00000, 90.00000, 90.00000);
	SetObjectMaterial(obj, 0, 18265, "w_town3cs_t", "ws_rooftarmac1", 0xFFFFFFFF);
	obj = CreateObject(19379, 1917.23047, -1658.35449, 22.90550,   0.00000, 90.00000, 90.00000);
	SetObjectMaterial(obj, 0, 18265, "w_town3cs_t", "ws_rooftarmac1", 0xFFFFFFFF);
	obj = CreateObject(19379, 1917.23047, -1668.85535, 22.90550,   0.00000, 90.00000, 90.00000);
	SetObjectMaterial(obj, 0, 18265, "w_town3cs_t", "ws_rooftarmac1", 0xFFFFFFFF);
	obj = CreateObject(19379, 1917.23047, -1679.35669, 22.90550,   0.00000, 90.00000, 90.00000);
	SetObjectMaterial(obj, 0, 18265, "w_town3cs_t", "ws_rooftarmac1", 0xFFFFFFFF);
	obj = CreateObject(19379, 1917.23047, -1689.85840, 22.90550,   0.00000, 90.00000, 90.00000);
	SetObjectMaterial(obj, 0, 18265, "w_town3cs_t", "ws_rooftarmac1", 0xFFFFFFFF);
	obj = CreateObject(19379, 1917.23047, -1700.35986, 22.90550,   0.00000, 90.00000, 90.00000);
	SetObjectMaterial(obj, 0, 18265, "w_town3cs_t", "ws_rooftarmac1", 0xFFFFFFFF);
	obj = CreateObject(19379, 1917.23047, -1710.86096, 22.90550,   0.00000, 90.00000, 90.00000);
	SetObjectMaterial(obj, 0, 18265, "w_town3cs_t", "ws_rooftarmac1", 0xFFFFFFFF);
	obj = CreateObject(19379, 1917.23047, -1721.36255, 22.90550,   0.00000, 90.00000, 90.00000);
	SetObjectMaterial(obj, 0, 18265, "w_town3cs_t", "ws_rooftarmac1", 0xFFFFFFFF);
	obj = CreateObject(19379, 1917.23047, -1724.05151, 22.90650,   0.00000, 90.00000, 90.00000);
	SetObjectMaterial(obj, 0, 18265, "w_town3cs_t", "ws_rooftarmac1", 0xFFFFFFFF);
	obj = CreateObject(19379, 1926.86194, -1724.05151, 22.90650,   0.00000, 90.00000, 90.00000);
	SetObjectMaterial(obj, 0, 18265, "w_town3cs_t", "ws_rooftarmac1", 0xFFFFFFFF);
	obj = CreateObject(19379, 1926.86194, -1721.36255, 22.90550,   0.00000, 90.00000, 90.00000);
	SetObjectMaterial(obj, 0, 18265, "w_town3cs_t", "ws_rooftarmac1", 0xFFFFFFFF);
	obj = CreateObject(19379, 1926.86194, -1710.86096, 22.90650,   0.00000, 90.00000, 90.00000);
	SetObjectMaterial(obj, 0, 18265, "w_town3cs_t", "ws_rooftarmac1", 0xFFFFFFFF);
	obj = CreateObject(19379, 1926.86194, -1700.35986, 22.90650,   0.00000, 90.00000, 90.00000);
	SetObjectMaterial(obj, 0, 18265, "w_town3cs_t", "ws_rooftarmac1", 0xFFFFFFFF);
	obj = CreateObject(19379, 1926.86194, -1689.85840, 22.90650,   0.00000, 90.00000, 90.00000);
	SetObjectMaterial(obj, 0, 18265, "w_town3cs_t", "ws_rooftarmac1", 0xFFFFFFFF);
	obj = CreateObject(19379, 1926.86194, -1679.35669, 22.90650,   0.00000, 90.00000, 90.00000);
	SetObjectMaterial(obj, 0, 18265, "w_town3cs_t", "ws_rooftarmac1", 0xFFFFFFFF);
	obj = CreateObject(19379, 1926.86194, -1668.85535, 22.90650,   0.00000, 90.00000, 90.00000);
	SetObjectMaterial(obj, 0, 18265, "w_town3cs_t", "ws_rooftarmac1", 0xFFFFFFFF);
	obj = CreateObject(19379, 1926.86194, -1658.35449, 22.90650,   0.00000, 90.00000, 90.00000);
	SetObjectMaterial(obj, 0, 18265, "w_town3cs_t", "ws_rooftarmac1", 0xFFFFFFFF);
	obj = CreateObject(19379, 1907.78882, -1685.91956, 22.90650,   0.00000, 90.00000, 90.00000);
	SetObjectMaterial(obj, 0, 18265, "w_town3cs_t", "ws_rooftarmac1", 0xFFFFFFFF);

	// 문, 창문
	obj = CreateObject(19361, 1880.36755, -1658.33154, 14.29350,   0.00000, 0.00000, 0.00000);
	SetObjectMaterial(obj, 0, 8849, "vgeretail1", "casinoshop31_256", 0xFFFFFFFF);
	obj = CreateObject(19361, 1880.36755, -1655.12073, 14.29350,   0.00000, 0.00000, 0.00000);
    SetObjectMaterial(obj, 0, 8567, "vgsebuild02", "casinoshop32_256", 0xFFFFFFFF);

	obj = CreateObject(19361, 1880.36755, -1634.92908, 14.29350,   0.00000, 0.00000, 0.00000);
	SetObjectMaterial(obj, 0, 6328, "sunset04_law2", "gymshop2_LAe", 0xFFFFFFFF);
	obj = CreateObject(19361, 1880.36755, -1638.14050, 14.29350,   0.00000, 0.00000, 0.00000);
	SetObjectMaterial(obj, 0, 6328, "sunset04_law2", "gymshop1_LAe", 0xFFFFFFFF);
	
	obj = CreateObject(19361, 1880.36755, -1648.16431, 14.29350,   0.00000, 0.00000, 0.00000);
	SetObjectMaterial(obj, 0, 10925, "shopszz_sfse", "ws_shopfront1b", 0xFFFFFFFF);
	obj = CreateObject(19361, 1880.36755, -1644.95239, 14.29350,   0.00000, 0.00000, 0.00000);
	SetObjectMaterial(obj, 0, 10925, "shopszz_sfse", "ws_shopfront1a", 0xFFFFFFFF);

    obj = CreateObject(19361, 1887.97034, -1631.85535, 14.29350,   0.00000, 0.00000, 90.00000);
    SetObjectMaterial(obj, 0, 4600, "theatrelan2", "wolf1 copy", 0xFFFFFFFF);

    obj = CreateObject(19361, 1893.10974, -1631.85535, 14.29350,   0.00000, 0.00000, 90.00000);
    SetObjectMaterial(obj, 0, 4850, "oldshops_las", "sanpshop2", 0xFFFFFFFF);
    
	obj = CreateObject(19361, 1904.07507, -1631.85535, 14.29350,   0.00000, 0.00000, 90.00000);
	SetObjectMaterial(obj, 0, 4850, "oldshops_las", "sl_fudstore2", 0xFFFFFFFF);
	obj = CreateObject(19361, 1907.28650, -1631.85535, 14.29350,   0.00000, 0.00000, 90.00000);
	SetObjectMaterial(obj, 0, 4850, "oldshops_las", "sl_fudstore1", 0xFFFFFFFF);

    obj = CreateObject(19361, 1913.61646, -1631.85535, 14.29350,   0.00000, 0.00000, 90.00000);
    SetObjectMaterial(obj, 0, 4600, "theatrelan2", "wolf1 copy", 0xFFFFFFFF);
    
    obj = CreateObject(19361, 1919.94568, -1631.85535, 14.29350,   0.00000, 0.00000, 90.00000);
    SetObjectMaterial(obj, 0, 8849, "vgeretail1", "casinoshop31_256", 0xFFFFFFFF);
    obj = CreateObject(19361, 1923.15723, -1631.85535, 14.29350,   0.00000, 0.00000, 90.00000);
    SetObjectMaterial(obj, 0, 8567, "vgsebuild02", "casinoshop32_256", 0xFFFFFFFF);
		// 2층
	obj = CreateObject(19361, 1880.36755, -1657.75366, 18.57350,   0.00000, 0.00000, 0.00000);
	SetObjectMaterial(obj, 0, 10925, "shopszz_sfse", "ws_shopfront1a", 0xFFFFFFFF);
	obj = CreateObject(19361, 1880.36755, -1654.54346, 18.57350,   0.00000, 0.00000, 0.00000);
    SetObjectMaterial(obj, 0, 10925, "shopszz_sfse", "ws_shopfront1b", 0xFFFFFFFF);
    
	obj = CreateObject(19361, 1880.36755, -1646.37488, 18.57350,   0.00000, 0.00000, 0.00000);
	SetObjectMaterial(obj, 0, 6328, "sunset04_law2", "gymshop1_LAe", 0xFFFFFFFF);
	obj = CreateObject(19361, 1880.36755, -1643.16394, 18.57350,   0.00000, 0.00000, 0.00000);
	SetObjectMaterial(obj, 0, 6328, "sunset04_law2", "gymshop2_LAe", 0xFFFFFFFF);
	
	obj = CreateObject(19361, 1880.36755, -1636.95374, 18.57350,   0.00000, 0.00000, 0.00000);
	SetObjectMaterial(obj, 0, 4600, "theatrelan2", "wolf1 copy", 0xFFFFFFFF);
	
	obj = CreateObject(19361, 1886.60217, -1631.85535, 18.57350,   0.00000, 0.00000, 90.00000);
	SetObjectMaterial(obj, 0, 10980, "mission3z_sfse", "ws_ed_zeroshop", 0xFFFFFFFF);
	
	obj = CreateObject(19361, 1892.50342, -1631.85535, 18.57350,   0.00000, 0.00000, 90.00000);
	SetObjectMaterial(obj, 0, 8507, "shop09", "sidewalkmarket01_128", 0xFFFFFFFF);
	obj = CreateObject(19361, 1895.71423, -1631.85535, 18.57350,   0.00000, 0.00000, 90.00000);
	SetObjectMaterial(obj, 0, 8507, "shop09", "sidewalkmarket02_128", 0xFFFFFFFF);

    obj = CreateObject(19361, 1908.11523, -1631.85535, 18.57350,   0.00000, 0.00000, 90.00000);
	SetObjectMaterial(obj, 0, 4600, "theatrelan2", "wolf1 copy", 0xFFFFFFFF);
	
	obj = CreateObject(19361, 1914.21875, -1631.85535, 18.57350,   0.00000, 0.00000, 90.00000);
	SetObjectMaterial(obj, 0, 6328, "sunset04_law2", "gymshop2_LAe", 0xFFFFFFFF);
	obj = CreateObject(19361, 1917.43030, -1631.85535, 18.57350,   0.00000, 0.00000, 90.00000);
    SetObjectMaterial(obj, 0, 6328, "sunset04_law2", "gymshop1_LAe", 0xFFFFFFFF);
    
	obj = CreateObject(19361, 1923.80042, -1631.85535, 18.57350,   0.00000, 0.00000, 90.00000);
    SetObjectMaterial(obj, 0, 6328, "sunset04_law2", "downtshop2_LAn", 0xFFFFFFFF);
    
	// 메인건물 정문
	obj = CreateObject(19378, 1903.05945, -1685.45691, 17.74320,   0.00000, 0.00000, 0.00000);
	SetObjectMaterial(obj, 0, 9906, "sfe_builda", "sl_dwntwallvic1", 0xFFFFFFFF);
	obj = CreateObject(19378, 1903.06030, -1686.38403, 17.74320,   0.00000, 0.00000, 0.00000);
	SetObjectMaterial(obj, 0, 9906, "sfe_builda", "sl_dwntwallvic1", 0xFFFFFFFF);
	
	//
	CreateObject(19538, 1860.52954, -1682.04846, 12.54850,   0.00000, 0.00000, 90.00000);
	CreateObject(19538, 1902.07129, -1682.04272, 12.54750,   0.00000, 0.00000, 90.00000);
	CreateObject(18282, 1839.06787, -1637.51355, 12.74840,   0.00000, 0.00000, 90.00000);
	CreateObject(1566, 1844.73621, -1636.83899, 13.89970,   0.00000, 0.00000, 180.00000);
	CreateObject(1372, 1833.67175, -1649.17639, 12.54500,   0.00000, 0.00000, 180.00000);
	CreateObject(2676, 1834.02954, -1647.67505, 12.64770,   0.00000, 0.00000, -20.00000);
	CreateObject(1362, 1835.09814, -1645.35864, 13.14510,   0.00000, 0.00000, 0.00000);
	CreateObject(970, 1847.45178, -1623.31091, 13.10300,   0.00000, 0.00000, 0.00000);
	CreateObject(970, 1851.62976, -1623.31091, 13.10300,   0.00000, 0.00000, 0.00000);
	CreateObject(994, 1849.68506, -1623.84583, 135468.00000,   0.00000, 0.00000, 0.00000);
	CreateObject(8849, 1846.94629, -1678.26318, 16.18840,   0.00000, 0.00000, 270.00000);
	CreateObject(6965, 1875.84021, -1698.34717, 15.54620,   0.00000, 0.00000, 0.00000);
	CreateObject(6964, 1875.84021, -1698.34717, 11.68870,   0.00000, 0.00000, 0.00000);
	CreateObject(19121, 1831.85608, -1652.87537, 13.10460,   0.00000, 0.00000, 0.00000);
	CreateObject(19121, 1831.85608, -1650.37549, 13.10460,   0.00000, 0.00000, 0.00000);
	CreateObject(19121, 1831.85608, -1655.57544, 13.10460,   0.00000, 0.00000, 0.00000);
	CreateObject(19121, 1831.85608, -1658.27515, 13.10460,   0.00000, 0.00000, 0.00000);
	CreateObject(19121, 1831.85608, -1660.87537, 13.10460,   0.00000, 0.00000, 0.00000);
	CreateObject(19121, 1855.75378, -1661.67004, 13.10460,   0.00000, 0.00000, 0.00000);
	CreateObject(19121, 1858.25378, -1661.67004, 13.10460,   0.00000, 0.00000, 0.00000);
	CreateObject(19121, 1860.75378, -1661.67004, 13.10460,   0.00000, 0.00000, 0.00000);
	CreateObject(19121, 1863.25378, -1661.67004, 13.10460,   0.00000, 0.00000, 0.00000);
	CreateObject(19121, 1865.75378, -1661.67004, 13.10460,   0.00000, 0.00000, 0.00000);
	CreateObject(19121, 1868.25378, -1661.67004, 13.10460,   0.00000, 0.00000, 0.00000);
	CreateObject(8615, 1869.90369, -1658.95825, 15.09880,   0.00000, 0.00000, 270.00000);
	CreateObject(7909, 1870.50403, -1635.91919, 19.03960,   0.00000, 0.00000, 270.00000);
	CreateObject(8615, 1899.39478, -1636.36389, 15.09880,   0.00000, 0.00000, 0.00000);
	CreateObject(3850, 1872.55627, -1663.11658, 17.36420,   0.00000, 0.00000, 90.00000);
	CreateObject(3850, 1876.01917, -1663.11658, 17.36420,   0.00000, 0.00000, 90.00000);
	CreateObject(3850, 1879.48145, -1663.11658, 17.36420,   0.00000, 0.00000, 90.00000);
	CreateObject(3850, 1882.94397, -1663.11658, 17.36420,   0.00000, 0.00000, 90.00000);
	CreateObject(3850, 1885.69104, -1635.43762, 17.36420,   0.00000, 0.00000, 90.00000);
	CreateObject(3850, 1889.15369, -1635.43762, 17.36420,   0.00000, 0.00000, 90.00000);
	CreateObject(3850, 1892.61597, -1635.43762, 17.36420,   0.00000, 0.00000, 90.00000);
	CreateObject(3850, 1896.07874, -1635.43762, 17.36420,   0.00000, 0.00000, 90.00000);
	CreateObject(3850, 1899.54114, -1635.43762, 17.36420,   0.00000, 0.00000, 90.00000);
	CreateObject(3850, 1905.30420, -1635.43762, 17.36420,   0.00000, 0.00000, 90.00000);
	CreateObject(3850, 1908.76709, -1635.43762, 17.36420,   0.00000, 0.00000, 90.00000);
	CreateObject(3850, 1912.22998, -1635.43762, 17.36420,   0.00000, 0.00000, 90.00000);
	CreateObject(3850, 1915.69226, -1635.43762, 17.36420,   0.00000, 0.00000, 90.00000);
	CreateObject(3850, 1919.15454, -1635.43762, 17.36420,   0.00000, 0.00000, 90.00000);
	CreateObject(3850, 1922.61658, -1635.43762, 17.36420,   0.00000, 0.00000, 90.00000);
	CreateObject(3850, 1926.07874, -1635.43762, 17.36420,   0.00000, 0.00000, 90.00000);
	CreateObject(3850, 1927.80554, -1633.70972, 17.36420,   0.00000, 0.00000, 0.00000);
	CreateObject(3850, 1908.92676, -1644.34717, 17.36420,   0.00000, 0.00000, 0.00000);
	CreateObject(3850, 1910.66235, -1642.61255, 17.36420,   0.00000, 0.00000, 90.00000);
	CreateObject(3850, 1908.92676, -1647.81006, 17.36420,   0.00000, 0.00000, 0.00000);
	CreateObject(3850, 1908.92676, -1651.27295, 17.36420,   0.00000, 0.00000, 0.00000);
	CreateObject(3850, 1908.92676, -1654.73596, 17.36420,   0.00000, 0.00000, 0.00000);
	CreateObject(3850, 1883.95020, -1637.17261, 17.36420,   0.00000, 0.00000, 0.00000);
	CreateObject(3850, 1883.95020, -1640.63513, 17.36420,   0.00000, 0.00000, 0.00000);
	CreateObject(3850, 1883.95020, -1644.09766, 17.36420,   0.00000, 0.00000, 0.00000);
	CreateObject(3850, 1883.95020, -1647.56042, 17.36420,   0.00000, 0.00000, 0.00000);
	CreateObject(3850, 1883.95020, -1651.02295, 17.36420,   0.00000, 0.00000, 0.00000);
	CreateObject(3850, 1883.95020, -1654.48596, 17.36420,   0.00000, 0.00000, 0.00000);
	CreateObject(3850, 1908.92676, -1678.91174, 17.36420,   0.00000, 0.00000, 0.00000);
	CreateObject(3850, 1908.92676, -1675.44910, 17.36420,   0.00000, 0.00000, 0.00000);
	CreateObject(3850, 1908.92676, -1671.98608, 17.36420,   0.00000, 0.00000, 0.00000);
	CreateObject(3850, 1908.92676, -1668.52344, 17.36420,   0.00000, 0.00000, 0.00000);
	CreateObject(3850, 1908.92676, -1665.06116, 17.36420,   0.00000, 0.00000, 0.00000);
	CreateObject(3850, 1883.95020, -1657.94836, 17.36420,   0.00000, 0.00000, 0.00000);
	CreateObject(10763, 1851.08459, -1715.99780, 36.52080,   0.00000, 0.00000, -45.00000);
	CreateObject(3850, 1910.66113, -1729.29102, 17.36420,   0.00000, 0.00000, 90.00000);
	CreateObject(3850, 1908.92590, -1727.56470, 17.36420,   0.00000, 0.00000, 0.00000);
	CreateObject(3850, 1908.92590, -1724.10254, 17.36420,   0.00000, 0.00000, 0.00000);
	CreateObject(3850, 1908.92590, -1720.64026, 17.36420,   0.00000, 0.00000, 0.00000);
	CreateObject(3850, 1908.92590, -1717.17761, 17.36420,   0.00000, 0.00000, 0.00000);
	CreateObject(3850, 1908.92590, -1713.71460, 17.36420,   0.00000, 0.00000, 0.00000);
	CreateObject(3850, 1908.92590, -1710.25183, 17.36420,   0.00000, 0.00000, 0.00000);
	CreateObject(3850, 1908.92590, -1703.32678, 17.36420,   0.00000, 0.00000, 0.00000);
	CreateObject(3850, 1908.92590, -1699.86475, 17.36420,   0.00000, 0.00000, 0.00000);
	CreateObject(3850, 1908.92590, -1696.40259, 17.36420,   0.00000, 0.00000, 0.00000);
	CreateObject(3850, 1908.92590, -1692.93958, 17.36420,   0.00000, 0.00000, 0.00000);
	CreateObject(8615, 1907.99475, -1655.66284, 15.09880,   0.00000, 0.00000, 270.00000);
	CreateObject(8615, 1907.99475, -1704.35535, 15.09880,   0.00000, 0.00000, 270.00000);
	CreateObject(3850, 1907.18018, -1663.20801, 17.36420,   0.00000, 0.00000, 87.00000);
	CreateObject(3850, 1903.72070, -1663.11658, 17.36420,   0.00000, 0.00000, 90.00000);
	CreateObject(3850, 1886.40698, -1663.11658, 17.36420,   0.00000, 0.00000, 90.00000);
	CreateObject(3850, 1889.86963, -1663.11658, 17.36420,   0.00000, 0.00000, 90.00000);
	CreateObject(3850, 1893.33191, -1663.11658, 17.36420,   0.00000, 0.00000, 90.00000);
	CreateObject(3850, 1896.79504, -1663.11658, 17.36420,   0.00000, 0.00000, 90.00000);
	CreateObject(3850, 1900.25769, -1663.11658, 17.36420,   0.00000, 0.00000, 90.00000);
	CreateObject(3850, 1885.68494, -1659.67615, 17.36420,   0.00000, 0.00000, 90.00000);
	CreateObject(3850, 1889.14734, -1659.67615, 17.36420,   0.00000, 0.00000, 90.00000);
	CreateObject(3850, 1892.60986, -1659.67615, 17.36420,   0.00000, 0.00000, 90.00000);
	CreateObject(3850, 1896.07251, -1659.67615, 17.36420,   0.00000, 0.00000, 90.00000);
	CreateObject(3850, 1899.53528, -1659.67615, 17.36420,   0.00000, 0.00000, 90.00000);
	CreateObject(3850, 1902.99792, -1659.70715, 17.36420,   0.00000, 0.00000, 89.00000);
	CreateObject(3850, 1906.45789, -1659.82898, 17.36420,   0.00000, 0.00000, 87.00000);
	CreateObject(3172, 1838.48071, -1687.51416, 12.54050,   0.00000, 0.00000, 180.00000);
	CreateObject(3171, 1844.90588, -1680.38733, 12.54340,   0.00000, 0.00000, 90.00000);
	CreateObject(3171, 1852.36328, -1680.38733, 12.54340,   0.00000, 0.00000, 90.00000);
	CreateObject(3172, 1847.14758, -1700.95044, 12.54050,   0.00000, 0.00000, 180.00000);
	CreateObject(19121, 1928.45276, -1632.10547, 13.10460,   0.00000, 0.00000, 0.00000);
	CreateObject(19121, 1928.45276, -1634.60547, 13.10460,   0.00000, 0.00000, 0.00000);
	CreateObject(19121, 1928.45276, -1637.10547, 13.10460,   0.00000, 0.00000, 0.00000);
	CreateObject(19121, 1928.45276, -1639.60547, 13.10460,   0.00000, 0.00000, 0.00000);
	CreateObject(19121, 1928.45276, -1642.10547, 13.10460,   0.00000, 0.00000, 0.00000);
	CreateObject(8428, 1874.43469, -1737.61719, 15.65570,   0.00000, 0.00000, 90.00000);
	CreateObject(758, 1867.32532, -1699.41943, 12.53020,   0.00000, 0.00000, 0.00000);
	CreateObject(758, 1868.01379, -1702.23999, 12.53020,   0.00000, 0.00000, 10.00000);
	CreateObject(758, 1869.61182, -1704.42285, 12.53020,   0.00000, 0.00000, 20.00000);
	CreateObject(758, 1871.28247, -1706.15918, 12.53020,   0.00000, 0.00000, 30.00000);
	CreateObject(758, 1873.42603, -1707.04492, 12.53020,   0.00000, 0.00000, 40.00000);
	CreateObject(758, 1875.78271, -1707.52820, 12.53020,   0.00000, 0.00000, 50.00000);
	CreateObject(758, 1877.62708, -1707.14441, 12.53020,   0.00000, 0.00000, 80.00000);
	CreateObject(758, 1879.89734, -1706.36377, 12.53020,   0.00000, 0.00000, 90.00000);
	CreateObject(758, 1881.89734, -1705.17383, 12.53020,   0.00000, 0.00000, 110.00000);
	CreateObject(758, 1883.29077, -1703.29700, 12.53020,   0.00000, 0.00000, 130.00000);
	CreateObject(758, 1884.39038, -1701.20898, 12.53020,   0.00000, 0.00000, 140.00000);
	CreateObject(758, 1884.88318, -1698.94385, 12.53020,   0.00000, 0.00000, 160.00000);
	CreateObject(758, 1884.83362, -1696.70398, 12.53020,   0.00000, 0.00000, 170.00000);
	CreateObject(758, 1884.31445, -1694.91138, 12.53020,   0.00000, 0.00000, 180.00000);
	CreateObject(758, 1883.07410, -1693.05066, 12.53020,   0.00000, 0.00000, 200.00000);
	CreateObject(758, 1881.65979, -1691.53125, 12.53020,   0.00000, 0.00000, 210.00000);
	CreateObject(758, 1879.60522, -1690.38159, 12.53020,   0.00000, 0.00000, 230.00000);
	CreateObject(758, 1877.52063, -1689.72913, 12.53020,   0.00000, 0.00000, 240.00000);
	CreateObject(758, 1875.37317, -1689.37610, 12.53020,   0.00000, 0.00000, 250.00000);
	CreateObject(758, 1873.01648, -1689.79907, 12.53020,   0.00000, 0.00000, 270.00000);
	CreateObject(758, 1870.90857, -1690.80640, 12.53020,   0.00000, 0.00000, 280.00000);
	CreateObject(758, 1869.14063, -1692.34094, 12.53020,   0.00000, 0.00000, 300.00000);
	CreateObject(758, 1867.93188, -1694.34692, 12.53020,   0.00000, 0.00000, 310.00000);
	CreateObject(758, 1867.21497, -1696.85339, 12.53020,   0.00000, 0.00000, 330.00000);
	CreateObject(8168, 1896.90112, -1738.68665, 14.39650,   0.00000, 0.00000, 107.00000);
	CreateObject(19121, 1899.52332, -1734.93530, 13.10460,   0.00000, 0.00000, 0.00000);
	CreateObject(19121, 1902.02332, -1733.93530, 13.10460,   0.00000, 0.00000, 0.00000);
	CreateObject(19121, 1904.52332, -1732.93530, 13.10460,   0.00000, 0.00000, 0.00000);
	CreateObject(19121, 1907.02332, -1731.93530, 13.10460,   0.00000, 0.00000, 0.00000);
	CreateObject(19121, 1909.52332, -1730.93530, 13.10460,   0.00000, 0.00000, 0.00000);
	CreateObject(19121, 1912.02332, -1729.93530, 13.10460,   0.00000, 0.00000, 0.00000);
	CreateObject(3034, 1912.41431, -1651.27820, 18.46290,   0.00000, 0.00000, 270.00000);
	CreateObject(1535, 1912.46521, -1654.93384, 16.81290,   0.00000, 0.00000, 90.00000);
	CreateObject(3034, 1912.41431, -1668.60364, 18.46290,   0.00000, 0.00000, 270.00000);
	CreateObject(1535, 1912.46521, -1672.21631, 16.81290,   0.00000, 0.00000, 90.00000);
	CreateObject(1535, 1912.46521, -1700.37427, 16.81290,   0.00000, 0.00000, 90.00000);
	CreateObject(3034, 1912.41431, -1702.39368, 18.46290,   0.00000, 0.00000, 270.00000);
	CreateObject(1535, 1912.46521, -1720.97290, 16.81290,   0.00000, 0.00000, 90.00000);
	CreateObject(3034, 1912.41431, -1722.95313, 18.46290,   0.00000, 0.00000, 270.00000);
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
	RemoveBuildingForPlayer(playerid, 5544, 1873.7422, -1682.4766, 34.7969, 0.25);
	RemoveBuildingForPlayer(playerid, 1524, 1837.6641, -1640.3828, 13.7578, 0.25);
	RemoveBuildingForPlayer(playerid, 620, 1855.7188, -1741.5391, 10.8047, 0.25);
	RemoveBuildingForPlayer(playerid, 620, 1879.5078, -1741.4844, 10.8047, 0.25);
	RemoveBuildingForPlayer(playerid, 620, 1908.2188, -1741.4844, 10.8047, 0.25);
	RemoveBuildingForPlayer(playerid, 712, 1929.5781, -1736.9063, 21.3906, 0.25);
	RemoveBuildingForPlayer(playerid, 620, 1931.0391, -1726.3281, 10.8047, 0.25);
	RemoveBuildingForPlayer(playerid, 620, 1832.3828, -1694.3125, 9.7188, 0.25);
	RemoveBuildingForPlayer(playerid, 1537, 1837.4375, -1683.9688, 12.3047, 0.25);
	RemoveBuildingForPlayer(playerid, 1533, 1837.4375, -1683.9531, 12.3047, 0.25);
	RemoveBuildingForPlayer(playerid, 1537, 1837.4375, -1686.9844, 12.3125, 0.25);
	RemoveBuildingForPlayer(playerid, 620, 1832.8984, -1670.7656, 9.7188, 0.25);
	RemoveBuildingForPlayer(playerid, 1533, 1837.4375, -1677.9219, 12.2969, 0.25);
	RemoveBuildingForPlayer(playerid, 1537, 1837.4375, -1680.9531, 12.2969, 0.25);
	RemoveBuildingForPlayer(playerid, 1533, 1837.4375, -1680.9375, 12.2969, 0.25);
	RemoveBuildingForPlayer(playerid, 5408, 1873.7422, -1682.4766, 34.7969, 0.25);
	RemoveBuildingForPlayer(playerid, 620, 1931.0391, -1702.2891, 10.8047, 0.25);
	RemoveBuildingForPlayer(playerid, 712, 1929.5781, -1694.4609, 21.3906, 0.25);
	RemoveBuildingForPlayer(playerid, 620, 1931.0391, -1667.0313, 10.8047, 0.25);
	RemoveBuildingForPlayer(playerid, 620, 1931.0391, -1637.8984, 10.8047, 0.25);
	RemoveBuildingForPlayer(playerid, 620, 1855.7188, -1623.2813, 10.8047, 0.25);
	RemoveBuildingForPlayer(playerid, 620, 1879.5078, -1623.1016, 10.8047, 0.25);
	RemoveBuildingForPlayer(playerid, 620, 1908.2188, -1622.9844, 10.8047, 0.25);
	RemoveBuildingForPlayer(playerid, 712, 1929.5781, -1627.6250, 21.3906, 0.25);
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
