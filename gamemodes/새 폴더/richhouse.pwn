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
	AddPlayerClass(0,2249.6665,-1062.3809,830.8828,95.6418,0,0,0,0,0,0);
	SetWorldTime(12);
	new obj;
	
	//문 턱
	obj = CreateObject(19433, 2223.65259, -1058.23401, 829.10352,   90.00000, 0.00000, 90.00000);
	SetObjectMaterial(obj, 0, 17001, "factorycuntw", "redmetal", 0xFFFFFFFF);
	obj = CreateObject(19433, 2226.19263, -1058.23499, 829.10254,   90.00000, 0.00000, 90.00000);
	SetObjectMaterial(obj, 0, 17001, "factorycuntw", "redmetal", 0xFFFFFFFF);
	obj = CreateObject(19433, 2226.19263, -1058.05603, 829.10254,   90.00000, 0.00000, 90.00000);
	SetObjectMaterial(obj, 0, 17001, "factorycuntw", "redmetal", 0xFFFFFFFF);
	obj = CreateObject(19433, 2223.65259, -1058.05603, 829.10352,   90.00000, 0.00000, 90.00000);
    SetObjectMaterial(obj, 0, 17001, "factorycuntw", "redmetal", 0xFFFFFFFF);
	obj = CreateObject(19433, 2221.13013, -1058.23474, 831.62354,   0.00000, 0.00000, 90.00000);
    SetObjectMaterial(obj, 0, 17001, "factorycuntw", "redmetal", 0xFFFFFFFF);
	obj = CreateObject(19433, 2221.13013, -1058.05566, 831.62354,   0.00000, 0.00000, 90.00000);
    SetObjectMaterial(obj, 0, 17001, "factorycuntw", "redmetal", 0xFFFFFFFF);
	obj = CreateObject(19433, 2228.70996, -1058.23474, 831.62354,   0.00000, 0.00000, 90.00000);
    SetObjectMaterial(obj, 0, 17001, "factorycuntw", "redmetal", 0xFFFFFFFF);
	obj = CreateObject(19433, 2228.70996, -1058.05566, 831.62354,   0.00000, 0.00000, 90.00000);
    SetObjectMaterial(obj, 0, 17001, "factorycuntw", "redmetal", 0xFFFFFFFF);
	obj = CreateObject(19433, 2223.65259, -1058.23401, 834.16345,   90.00000, 0.00000, 90.00000);
	SetObjectMaterial(obj, 0, 17001, "factorycuntw", "redmetal", 0xFFFFFFFF);
	obj = CreateObject(19433, 2223.65259, -1058.05603, 834.16345,   90.00000, 0.00000, 90.00000);
	SetObjectMaterial(obj, 0, 17001, "factorycuntw", "redmetal", 0xFFFFFFFF);
	obj = CreateObject(19433, 2226.19263, -1058.05505, 834.16455,   90.00000, 0.00000, 90.00000);
	SetObjectMaterial(obj, 0, 17001, "factorycuntw", "redmetal", 0xFFFFFFFF);
	obj = CreateObject(19433, 2226.19263, -1058.23499, 834.16455,   90.00000, 0.00000, 90.00000);
	SetObjectMaterial(obj, 0, 17001, "factorycuntw", "redmetal", 0xFFFFFFFF);
	obj = CreateObject(19433, 2242.36987, -1058.23254, 829.10254,   90.00000, 0.00000, 90.00000);
	SetObjectMaterial(obj, 0, 17001, "factorycuntw", "redmetal", 0xFFFFFFFF);
	obj = CreateObject(19433, 2242.36987, -1058.05762, 829.10254,   90.00000, 0.00000, 90.00000);
	SetObjectMaterial(obj, 0, 17001, "factorycuntw", "redmetal", 0xFFFFFFFF);
	obj = CreateObject(19433, 2242.36987, -1066.28577, 829.10254,   90.00000, 0.00000, 90.00000);
	SetObjectMaterial(obj, 0, 17001, "factorycuntw", "redmetal", 0xFFFFFFFF);
	obj = CreateObject(19433, 2242.36987, -1066.46167, 829.10254,   90.00000, 0.00000, 90.00000);
	SetObjectMaterial(obj, 0, 17001, "factorycuntw", "redmetal", 0xFFFFFFFF);
	obj = CreateObject(19433, 2216.42578, -1060.16675, 829.10352,   90.00000, 0.00000, 0.00000);
	SetObjectMaterial(obj, 0, 17001, "factorycuntw", "redmetal", 0xFFFFFFFF);

	//주방바닥
	obj = CreateObject(19379, 2224.76538, -1052.01819, 829.79883,   0.00000, 90.00000, 0.00000);
	SetObjectMaterial(obj, 0, 10412, "hotel1", "ws_stationfloor", 0xFFFFFFFF);
	obj = CreateObject(19379, 2224.76538, -1053.50793, 829.79785,   0.00000, 90.00000, 0.00000);
	SetObjectMaterial(obj, 0, 10412, "hotel1", "ws_stationfloor", 0xFFFFFFFF);

	//기본 벽
	obj = CreateObject(19378, 2230.09985, -1052.05310, 829.88281,   0.00000, 0.00000, 0.00000);
	SetObjectMaterial(obj, 0, 16150, "ufo_bar", "GEwhite1_64", 0xFFFFFFFF);
	obj = CreateObject(19378, 2225.25244, -1047.19141, 829.88281,   0.00000, 0.00000, 90.00000);
	SetObjectMaterial(obj, 0, 16150, "ufo_bar", "GEwhite1_64", 0xFFFFFFFF);
	obj = CreateObject(19378, 2230.09888, -1056.67639, 829.88281,   0.00000, 0.00000, 0.00000);
	SetObjectMaterial(obj, 0, 16150, "ufo_bar", "GEwhite1_64", 0xFFFFFFFF);
	obj = CreateObject(19378, 2220.36841, -1053.25305, 829.88281,   0.00000, 0.00000, 0.00000);
	SetObjectMaterial(obj, 0, 16150, "ufo_bar", "GEwhite1_64", 0xFFFFFFFF);
	obj = CreateObject(19378, 2220.36743, -1051.73425, 829.88281,   0.00000, 0.00000, 0.00000);
	SetObjectMaterial(obj, 0, 16150, "ufo_bar", "GEwhite1_64", 0xFFFFFFFF);
	obj = CreateObject(19378, 2217.11401, -1058.23572, 829.88281,   0.00000, 0.00000, 90.00000);
	SetObjectMaterial(obj, 0, 16150, "ufo_bar", "GEwhite1_64", 0xFFFFFFFF);
	obj = CreateObject(19378, 2217.11401, -1058.05469, 829.88281,   0.00000, 0.00000, 90.00000);
	SetObjectMaterial(obj, 0, 16150, "ufo_bar", "GEwhite1_64", 0xFFFFFFFF);
	obj = CreateObject(19378, 2232.72583, -1058.23572, 829.88281,   0.00000, 0.00000, 90.00000);
	SetObjectMaterial(obj, 0, 16150, "ufo_bar", "GEwhite1_64", 0xFFFFFFFF);
	obj = CreateObject(19378, 2232.72583, -1058.05469, 829.88281,   0.00000, 0.00000, 90.00000);
	SetObjectMaterial(obj, 0, 16150, "ufo_bar", "GEwhite1_64", 0xFFFFFFFF);
	obj = CreateObject(19378, 2234.46411, -1047.19043, 829.88281,   0.00000, 0.00000, 90.00000);
	SetObjectMaterial(obj, 0, 16150, "ufo_bar", "GEwhite1_64", 0xFFFFFFFF);
	obj = CreateObject(19378, 2244.05957, -1047.18945, 829.88281,   0.00000, 0.00000, 90.00000);
	SetObjectMaterial(obj, 0, 16150, "ufo_bar", "GEwhite1_64", 0xFFFFFFFF);
	obj = CreateObject(19378, 2243.98486, -1056.67639, 829.88281,   0.00000, 0.00000, 0.00000);
	SetObjectMaterial(obj, 0, 16150, "ufo_bar", "GEwhite1_64", 0xFFFFFFFF);
	obj = CreateObject(19378, 2248.74805, -1058.23669, 829.88281,   0.00000, 0.00000, 90.00000);
	SetObjectMaterial(obj, 0, 16150, "ufo_bar", "GEwhite1_64", 0xFFFFFFFF);
	obj = CreateObject(19378, 2239.17676, -1058.05566, 837.73181,   0.00000, 0.00000, 90.00000);
	SetObjectMaterial(obj, 0, 16150, "ufo_bar", "GEwhite1_64", 0xFFFFFFFF);
	obj = CreateObject(19378, 2239.17676, -1058.23474, 837.73083,   0.00000, 0.00000, 90.00000);
	SetObjectMaterial(obj, 0, 16150, "ufo_bar", "GEwhite1_64", 0xFFFFFFFF);
	obj = CreateObject(19378, 2236.06592, -1058.05664, 825.68274,   0.00000, 0.00000, 90.00000);
	SetObjectMaterial(obj, 0, 16150, "ufo_bar", "GEwhite1_64", 0xFFFFFFFF);
	obj = CreateObject(19378, 2236.06592, -1058.23474, 825.68274,   0.00000, 0.00000, 90.00000);
	SetObjectMaterial(obj, 0, 16150, "ufo_bar", "GEwhite1_64", 0xFFFFFFFF);
	obj = CreateObject(19378, 2243.98584, -1047.75476, 829.88281,   0.00000, 0.00000, 0.00000);
	SetObjectMaterial(obj, 0, 16150, "ufo_bar", "GEwhite1_64", 0xFFFFFFFF);
	obj = CreateObject(19378, 2250.92578, -1063.14258, 829.88281,   0.00000, 0.00000, 0.00000);
	SetObjectMaterial(obj, 0, 16150, "ufo_bar", "GEwhite1_64", 0xFFFFFFFF);
	obj = CreateObject(19378, 2248.74805, -1066.28296, 829.88281,   0.00000, 0.00000, 90.00000);
	SetObjectMaterial(obj, 0, 16150, "ufo_bar", "GEwhite1_64", 0xFFFFFFFF);
	obj = CreateObject(19378, 2242.42114, -1066.28503, 837.73083,   0.00000, 0.00000, 90.00000);
	SetObjectMaterial(obj, 0, 16150, "ufo_bar", "GEwhite1_64", 0xFFFFFFFF);
	obj = CreateObject(19378, 2237.63037, -1071.01416, 829.88281,   0.00000, 0.00000, 0.00000);
	SetObjectMaterial(obj, 0, 16150, "ufo_bar", "GEwhite1_64", 0xFFFFFFFF);
	obj = CreateObject(19378, 2237.63135, -1080.45618, 829.88281,   0.00000, 0.00000, 0.00000);
	SetObjectMaterial(obj, 0, 16150, "ufo_bar", "GEwhite1_64", 0xFFFFFFFF);
	obj = CreateObject(19378, 2207.60620, -1058.23474, 829.88281,   0.00000, 0.00000, 90.00000);
	SetObjectMaterial(obj, 0, 16150, "ufo_bar", "GEwhite1_64", 0xFFFFFFFF);
	obj = CreateObject(19378, 2209.17407, -1063.06726, 829.88281,   0.00000, 0.00000, 0.00000);
	SetObjectMaterial(obj, 0, 16150, "ufo_bar", "GEwhite1_64", 0xFFFFFFFF);
	obj = CreateObject(19378, 2209.17310, -1072.67078, 829.88281,   0.00000, 0.00000, 0.00000);
	SetObjectMaterial(obj, 0, 16150, "ufo_bar", "GEwhite1_64", 0xFFFFFFFF);
	obj = CreateObject(19378, 2214.07446, -1077.34167, 829.88281,   0.00000, 0.00000, 90.00000);
	SetObjectMaterial(obj, 0, 16150, "ufo_bar", "GEwhite1_64", 0xFFFFFFFF);
	obj = CreateObject(19378, 2223.55200, -1077.34265, 829.88281,   0.00000, 0.00000, 90.00000);
	SetObjectMaterial(obj, 0, 16150, "ufo_bar", "GEwhite1_64", 0xFFFFFFFF);
	obj = CreateObject(19378, 2233.10962, -1077.34167, 829.88281,   0.00000, 0.00000, 90.00000);
	SetObjectMaterial(obj, 0, 16150, "ufo_bar", "GEwhite1_64", 0xFFFFFFFF);
	obj = CreateObject(19378, 2216.42773, -1072.52673, 829.88281,   0.00000, 0.00000, 0.00000);
	SetObjectMaterial(obj, 0, 16150, "ufo_bar", "GEwhite1_64", 0xFFFFFFFF);
	obj = CreateObject(19378, 2211.55225, -1067.80029, 829.88281,   0.00000, 0.00000, 90.00000);
	SetObjectMaterial(obj, 0, 16150, "ufo_bar", "GEwhite1_64", 0xFFFFFFFF);
	obj = CreateObject(19378, 2216.42676, -1069.45959, 829.88281,   0.00000, 0.00000, 0.00000);
	SetObjectMaterial(obj, 0, 16150, "ufo_bar", "GEwhite1_64", 0xFFFFFFFF);
	obj = CreateObject(19439, 2224.86719, -1050.74683, 834.00476,   0.00000, 90.00000, 0.00000);
	SetObjectMaterial(obj, 0, 16150, "ufo_bar", "GEwhite1_64", 0xFFFFFFFF);
	obj = CreateObject(19397, 2242.36987, -1058.23572, 831.62927,   0.00000, 0.00000, 90.00000);
	SetObjectMaterial(obj, 0, 16150, "ufo_bar", "GEwhite1_64", 0xFFFFFFFF);
	obj = CreateObject(19397, 2216.42676, -1059.89722, 831.62927,   0.00000, 0.00000, 0.00000);
	SetObjectMaterial(obj, 0, 16150, "ufo_bar", "GEwhite1_64", 0xFFFFFFFF);
	obj = CreateObject(19397, 2242.36987, -1066.28394, 831.62927,   0.00000, 0.00000, 90.00000);
	SetObjectMaterial(obj, 0, 16150, "ufo_bar", "GEwhite1_64", 0xFFFFFFFF);
	obj = CreateObject(19397, 2242.37036, -1058.05469, 831.62927,   0.00000, 0.00000, 90.00000);
	SetObjectMaterial(obj, 0, 16150, "ufo_bar", "GEwhite1_64", 0xFFFFFFFF);
	obj = CreateObject(19366, 2216.42773, -1063.09937, 831.62927,   0.00000, 0.00000, 0.00000);
	SetObjectMaterial(obj, 0, 16150, "ufo_bar", "GEwhite1_64", 0xFFFFFFFF);
	obj = CreateObject(19366, 2239.20410, -1066.28589, 831.62927,   0.00000, 0.00000, 90.00000);
	SetObjectMaterial(obj, 0, 16150, "ufo_bar", "GEwhite1_64", 0xFFFFFFFF);
	obj = CreateObject(19366, 2216.42676, -1059.89722, 835.12927,   0.00000, 0.00000, 0.00000);
	SetObjectMaterial(obj, 0, 16150, "ufo_bar", "GEwhite1_64", 0xFFFFFFFF);
	obj = CreateObject(19366, 2216.42773, -1063.09937, 835.12927,   0.00000, 0.00000, 0.00000);
	SetObjectMaterial(obj, 0, 16150, "ufo_bar", "GEwhite1_64", 0xFFFFFFFF);

	//기본 바닥 19380 -> 19375)
	obj = CreateObject(19375, 2224.81909, -1062.98730, 829.79980,   0.00000, 90.00000, 0.00000);
	SetObjectMaterial(obj, 0, 10871, "blacksky_sfse", "ws_slatetiles", 0xFFFFFFFF);
	obj = CreateObject(19375, 2235.25293, -1062.98730, 829.79785,   0.00000, 90.00000, 0.00000);
    SetObjectMaterial(obj, 0, 10871, "blacksky_sfse", "ws_slatetiles", 0xFFFFFFFF);
	obj = CreateObject(19375, 2245.61694, -1062.98730, 829.79688,   0.00000, 90.00000, 0.00000);
    SetObjectMaterial(obj, 0, 10871, "blacksky_sfse", "ws_slatetiles", 0xFFFFFFFF);
	obj = CreateObject(19375, 2232.52417, -1072.47461, 829.79889,   0.00000, 90.00000, 0.00000);
	SetObjectMaterial(obj, 0, 10871, "blacksky_sfse", "ws_slatetiles", 0xFFFFFFFF);
	obj = CreateObject(19375, 2224.81909, -1072.47461, 829.80090,   0.00000, 90.00000, 0.00000);
	SetObjectMaterial(obj, 0, 10871, "blacksky_sfse", "ws_slatetiles", 0xFFFFFFFF);
	obj = CreateObject(19375, 2214.48755, -1062.98730, 829.79883,   0.00000, 90.00000, 0.00000);
	SetObjectMaterial(obj, 0, 10871, "blacksky_sfse", "ws_slatetiles", 0xFFFFFFFF);
	obj = CreateObject(19375, 2214.48755, -1072.47461, 829.79779,   0.00000, 90.00000, 0.00000);
	SetObjectMaterial(obj, 0, 10871, "blacksky_sfse", "ws_slatetiles", 0xFFFFFFFF);

	//주방의자
	obj = CreateObject(2123, 2225.68408, -1053.54175, 830.49377,   0.00000, 0.00000, 90.00000);
	SetObjectMaterial(obj, 1, 10412, "hotel1", "carpet_red_256", 0xFFFFFFFF);
	obj = CreateObject(2123, 2224.00122, -1053.51599, 830.49377,   0.00000, 0.00000, 90.00000);
	SetObjectMaterial(obj, 1, 10412, "hotel1", "carpet_red_256", 0xFFFFFFFF);
	obj = CreateObject(2123, 2224.00122, -1056.03857, 830.49377,   0.00000, 0.00000, 270.00000);
	SetObjectMaterial(obj, 1, 10412, "hotel1", "carpet_red_256", 0xFFFFFFFF);
	obj = CreateObject(2123, 2225.58423, -1056.03857, 830.49377,   0.00000, 0.00000, 270.00000);
	SetObjectMaterial(obj, 1, 10412, "hotel1", "carpet_red_256", 0xFFFFFFFF);

	//냉장고 손잡이
	obj = CreateObject(19916, 2228.78345, -1047.43921, 830.01392,   0.00000, 0.00000, 0.00000);
	SetObjectMaterial(obj, 0, 16150, "ufo_bar", "GEwhite1_64", 0xFFFFFFFF);

	//서재 바닥
	obj = CreateObject(19375, 2235.26221, -1053.54578, 829.79590,   0.00000, 90.00000, 0.00000);
	SetObjectMaterial(obj, 0, 13007, "sw_bankint", "woodfloor1", 0xFFFFFFFF);
	obj = CreateObject(19375, 2235.26221, -1050.85291, 829.79492,   0.00000, 90.00000, 0.00000);
    SetObjectMaterial(obj, 0, 13007, "sw_bankint", "woodfloor1", 0xFFFFFFFF);
	obj = CreateObject(19375, 2245.76294, -1053.54578, 829.79590,   0.00000, 90.00000, 0.00000);
    SetObjectMaterial(obj, 0, 13007, "sw_bankint", "woodfloor1", 0xFFFFFFFF);
	obj = CreateObject(19375, 2245.76294, -1050.85291, 829.79492,   0.00000, 90.00000, 0.00000);
    SetObjectMaterial(obj, 0, 13007, "sw_bankint", "woodfloor1", 0xFFFFFFFF);

	//화장실 바닥 (19381 -> 19375)
	obj = CreateObject(19375, 2245.63550, -1071.19617, 829.79895,   0.00000, 90.00000, 0.00000);
	SetObjectMaterial(obj, 0, 11301, "carshow_sfse", "ws_officy_ceiling", 0xFFFFFFFF);
	obj = CreateObject(19375, 2242.84424, -1071.19617, 829.80005,   0.00000, 90.00000, 0.00000);
	SetObjectMaterial(obj, 0, 11301, "carshow_sfse", "ws_officy_ceiling", 0xFFFFFFFF);

	//화장실 벽
	obj = CreateObject(19376, 2250.85547, -1071.16443, 829.88428,   0.00000, 0.00000, 0.00000);
	SetObjectMaterial(obj, 0, 6328, "sunset04_law2", "LAredwall", 0xFFFFFFFF);
	obj = CreateObject(19376, 2246.04736, -1075.00586, 829.88428,   0.00000, 0.00000, 90.00000);
	SetObjectMaterial(obj, 0, 6328, "sunset04_law2", "LAredwall", 0xFFFFFFFF);
	obj = CreateObject(19376, 2248.74805, -1066.46362, 829.88281,   0.00000, 0.00000, 90.00000);
	SetObjectMaterial(obj, 0, 6328, "sunset04_law2", "LAredwall", 0xFFFFFFFF);
	obj = CreateObject(19376, 2237.65503, -1071.16101, 829.88428,   0.00000, 0.00000, 0.00000);
	SetObjectMaterial(obj, 0, 6328, "sunset04_law2", "LAredwall", 0xFFFFFFFF);
	obj = CreateObject(19376, 2242.42114, -1066.46155, 837.73083,   0.00000, 0.00000, 90.00000);
	SetObjectMaterial(obj, 0, 6328, "sunset04_law2", "LAredwall", 0xFFFFFFFF);
	obj = CreateObject(19360, 2242.34937, -1072.96436, 831.62927,   0.00000, 0.00000, 90.00000);
	SetObjectMaterial(obj, 0, 6328, "sunset04_law2", "LAredwall", 0xFFFFFFFF);
	obj = CreateObject(19360, 2239.20410, -1066.46362, 831.62927,   0.00000, 0.00000, 90.00000);
	SetObjectMaterial(obj, 0, 6328, "sunset04_law2", "LAredwall", 0xFFFFFFFF);
	obj = CreateObject(19360, 2243.99463, -1068.09668, 831.62927,   0.00000, 0.00000, 0.00000);
	SetObjectMaterial(obj, 0, 6328, "sunset04_law2", "LAredwall", 0xFFFFFFFF);
	obj = CreateObject(19360, 2243.99463, -1073.65686, 831.62927,   0.00000, 0.00000, 0.00000);
	SetObjectMaterial(obj, 0, 6328, "sunset04_law2", "LAredwall", 0xFFFFFFFF);
	obj = CreateObject(19360, 2239.17920, -1072.96338, 831.62927,   0.00000, 0.00000, 90.00000);
	SetObjectMaterial(obj, 0, 6328, "sunset04_law2", "LAredwall", 0xFFFFFFFF);
	obj = CreateObject(19360, 2243.99463, -1068.09668, 835.12927,   0.00000, 0.00000, 0.00000);
	SetObjectMaterial(obj, 0, 6328, "sunset04_law2", "LAredwall", 0xFFFFFFFF);
	obj = CreateObject(19360, 2243.99463, -1073.65686, 835.12927,   0.00000, 0.00000, 0.00000);
	SetObjectMaterial(obj, 0, 6328, "sunset04_law2", "LAredwall", 0xFFFFFFFF);
	obj = CreateObject(19360, 2239.17920, -1072.96338, 835.12927,   0.00000, 0.00000, 90.00000);
	SetObjectMaterial(obj, 0, 6328, "sunset04_law2", "LAredwall", 0xFFFFFFFF);
	obj = CreateObject(19360, 2242.34937, -1072.96436, 835.12927,   0.00000, 0.00000, 90.00000);
	SetObjectMaterial(obj, 0, 6328, "sunset04_law2", "LAredwall", 0xFFFFFFFF);
	obj = CreateObject(19360, 2243.99536, -1071.30298, 835.12927,   0.00000, 0.00000, 0.00000);
	SetObjectMaterial(obj, 0, 6328, "sunset04_law2", "LAredwall", 0xFFFFFFFF);
	obj = CreateObject(19390, 2242.36987, -1066.46265, 831.62927,   0.00000, 0.00000, 90.00000);
	SetObjectMaterial(obj, 0, 6328, "sunset04_law2", "LAredwall", 0xFFFFFFFF);
	obj = CreateObject(19390, 2243.99536, -1071.30298, 831.62927,   0.00000, 0.00000, 0.00000);
	SetObjectMaterial(obj, 0, 6328, "sunset04_law2", "LAredwall", 0xFFFFFFFF);

	//화장실 거울
	obj = CreateObject(19466, 2237.75244, -1068.60461, 831.88263,   0.00000, 0.00000, 0.00000);
	SetObjectMaterial(obj, 0, 16150, "ufo_bar", "GEwhite1_64", 0xFFFFFFFF);

	//화장실 욕조 타일
	obj = CreateObject(19458, 2250.68457, -1076.36731, 829.19165,   0.00000, 0.00000, 0.00000);
	SetObjectMaterial(obj, 0, 2435, "cj_ff_counters", "CJ_Laminate1", 0xFFFFFFFF);
	obj = CreateObject(19458, 2252.32764, -1074.82776, 829.19067,   0.00000, 0.00000, 90.00000);
	SetObjectMaterial(obj, 0, 2435, "cj_ff_counters", "CJ_Laminate1", 0xFFFFFFFF);

	//티비
	obj = CreateObject(19443, 2227.28271, -1077.33801, 832.18451,   90.00000, 0.00000, 90.00000);
	SetObjectMaterial(obj, 0, 1676, "wshxrefpump", "black64", 0xFFFFFFFF);

	//부엌 천장 전등
	obj = CreateObject(2073, 2224.86719, -1054.76636, 833.69458,   0.00000, 0.00000, 0.00000);
	SetObjectMaterial(obj, 0, 4981, "wiresetc2_las", "lasunion2", 0xFFFFFFFF);
	obj = CreateObject(2073, 2225.86719, -1054.76636, 833.69458,   0.00000, 0.00000, 0.00000);
	SetObjectMaterial(obj, 0, 4981, "wiresetc2_las", "lasunion2", 0xFFFFFFFF);
	obj = CreateObject(2073, 2223.86719, -1054.76636, 833.69458,   0.00000, 0.00000, 0.00000);
	SetObjectMaterial(obj, 0, 4981, "wiresetc2_las", "lasunion2", 0xFFFFFFFF);
	obj = CreateObject(2073, 2226.86719, -1054.76636, 833.69458,   0.00000, 0.00000, 0.00000);
	SetObjectMaterial(obj, 0, 4981, "wiresetc2_las", "lasunion2", 0xFFFFFFFF);
	obj = CreateObject(2073, 2222.86719, -1054.76636, 833.69458,   0.00000, 0.00000, 0.00000);
	SetObjectMaterial(obj, 0, 4981, "wiresetc2_las", "lasunion2", 0xFFFFFFFF);
	
	//천장
	CreateObject(19377, 2225.53271, -1051.96375, 834.07629,   0.00000, 90.00000, 0.00000);
	CreateObject(19377, 2235.96631, -1051.99548, 834.07532,   0.00000, 90.00000, 0.00000);
	CreateObject(19377, 2246.45902, -1051.96375, 834.07428,   0.00000, 90.00000, 0.00000);
	CreateObject(19377, 2246.48682, -1061.59155, 834.07330,   0.00000, 90.00000, 0.00000);
	CreateObject(19377, 2236.02100, -1061.61768, 834.07233,   0.00000, 90.00000, 0.00000);
	CreateObject(19377, 2225.53271, -1061.59155, 834.07428,   0.00000, 90.00000, 0.00000);
	CreateObject(19377, 2246.48682, -1070.92224, 834.07428,   0.00000, 90.00000, 0.00000);
	CreateObject(19377, 2235.99072, -1070.92224, 834.07532,   0.00000, 90.00000, 0.00000);
	CreateObject(19377, 2225.53271, -1070.92224, 834.07629,   0.00000, 90.00000, 0.00000);
	CreateObject(19377, 2225.53271, -1080.42822, 834.07727,   0.00000, 90.00000, 0.00000);
	CreateObject(19377, 2235.99072, -1080.42822, 834.07831,   0.00000, 90.00000, 0.00000);
	CreateObject(19377, 2215.15063, -1063.08728, 834.07330,   0.00000, 90.00000, 0.00000);
	CreateObject(19377, 2215.52173, -1072.61572, 834.07532,   0.00000, 90.00000, 0.00000);
	CreateObject(19377, 2204.92261, -1062.89905, 834.07428,   0.00000, 90.00000, 0.00000);

	//기타
	CreateObject(2140, 2222.88379, -1047.77441, 829.88391,   0.00000, 0.00000, 0.00000);
	CreateObject(2138, 2221.90430, -1047.77344, 829.88245,   0.00000, 0.00000, 0.00000);
	CreateObject(2305, 2220.95972, -1047.76978, 829.88684,   0.00000, 0.00000, 90.00000);
	CreateObject(2135, 2226.83154, -1047.77344, 829.88525,   0.00000, 0.00000, 0.00000);
	CreateObject(2138, 2227.81348, -1047.77441, 829.88342,   0.00000, 0.00000, 0.00000);
	CreateObject(2140, 2228.79004, -1047.77441, 829.88391,   0.00000, 0.00000, 0.00000);
	CreateObject(2138, 2220.95972, -1048.75220, 829.88354,   0.00000, 0.00000, 90.00000);
	CreateObject(2138, 2220.95874, -1049.73584, 829.88245,   0.00000, 0.00000, 90.00000);
	CreateObject(2138, 2220.95972, -1050.71558, 829.88342,   0.00000, 0.00000, 90.00000);
	CreateObject(2822, 2223.81250, -1047.65491, 830.93396,   0.00000, 0.00000, 90.00000);
	CreateObject(2136, 2223.86694, -1047.77441, 829.88721,   0.00000, 0.00000, 0.00000);
	CreateObject(2138, 2223.88354, -1047.77441, 829.88245,   0.00000, 0.00000, 0.00000);
	CreateObject(2138, 2224.86450, -1047.77344, 829.88245,   0.00000, 0.00000, 0.00000);
	CreateObject(2138, 2225.86548, -1047.77441, 829.88342,   0.00000, 0.00000, 0.00000);
	CreateObject(11718, 2225.57739, -1047.63098, 830.94446,   0.00000, 0.00000, 30.00000);
	CreateObject(19586, 2225.81299, -1047.89575, 830.95178,   0.00000, 0.00000, 120.00000);
	CreateObject(19581, 2227.13599, -1048.19946, 830.98999,   0.00000, 0.00000, 180.00000);
	CreateObject(19582, 2227.14697, -1047.74255, 830.98999,   0.00000, 0.00000, 0.00000);
	CreateObject(1510, 2226.53101, -1047.73254, 830.92004,   0.00000, 0.00000, 0.00000);
	CreateObject(1510, 2226.83105, -1047.73254, 830.92004,   0.00000, 0.00000, 0.00000);
	CreateObject(1510, 2227.11108, -1047.73254, 830.92004,   0.00000, 0.00000, 0.00000);
	CreateObject(1510, 2226.53101, -1047.48254, 830.92004,   0.00000, 0.00000, 0.00000);
	CreateObject(1510, 2226.83105, -1047.48254, 830.92004,   0.00000, 0.00000, 0.00000);
	CreateObject(1510, 2227.11108, -1047.48254, 830.92004,   0.00000, 0.00000, 0.00000);
	CreateObject(19585, 2226.31372, -1047.47998, 831.15344,   0.00000, 0.00000, 90.00000);
	CreateObject(19561, 2220.78174, -1048.69849, 830.93481,   0.00000, 0.00000, 90.00000);
	CreateObject(19561, 2220.98120, -1048.68945, 830.93481,   0.00000, 0.00000, 90.00000);
	CreateObject(19570, 2220.86914, -1049.00793, 830.93481,   0.00000, 0.00000, 0.00000);
	CreateObject(957, 2223.75537, -1050.75256, 833.88501,   0.00000, 0.00000, 0.00000);
	CreateObject(957, 2225.98657, -1050.75256, 833.88501,   0.00000, 0.00000, 0.00000);
	CreateObject(957, 2224.88672, -1050.75256, 833.88501,   0.00000, 0.00000, 0.00000);
	CreateObject(3398, 2226.52271, -1050.90186, 8398842.00000,   0.00000, 0.00000, 0.00000);
	CreateObject(2723, 2223.93750, -1052.21753, 830.25378,   0.00000, 0.00000, 0.00000);
	CreateObject(2723, 2224.93042, -1052.20227, 830.25378,   0.00000, 0.00000, 0.00000);
	CreateObject(2723, 2225.96045, -1052.17334, 830.25378,   0.00000, 0.00000, 0.00000);
	CreateObject(16101, 2226.45166, -1050.73926, 831.08606,   0.00000, 0.00000, 0.00000);
	CreateObject(16101, 2223.20386, -1050.75867, 831.08606,   0.00000, 0.00000, 0.00000);
	CreateObject(19824, 2223.45825, -1050.76416, 831.09216,   0.00000, 0.00000, 0.00000);
	CreateObject(19818, 2223.36890, -1050.99817, 831.17334,   0.00000, 0.00000, 0.00000);
	CreateObject(19818, 2223.50659, -1050.99817, 831.17334,   0.00000, 0.00000, 0.00000);
	CreateObject(2357, 2224.86719, -1054.76636, 830.28723,   0.00000, 0.00000, 0.00000);
	CreateObject(2868, 2222.99023, -1054.81140, 830.69568,   0.00000, 0.00000, 0.00000);
	CreateObject(14455, 2235.24756, -1047.22473, 831.53381,   0.00000, 0.00000, 180.00000);
	CreateObject(14455, 2241.00879, -1047.22473, 831.53381,   0.00000, 0.00000, 180.00000);
	CreateObject(1428, 2235.33301, -1047.71045, 830.97546,   0.00000, 0.00000, 0.00000);
	CreateObject(3857, 2237.06470, -1058.15063, 829.88000,   0.00000, 0.00000, 45.00000);
	CreateObject(1491, 2243.11328, -1058.12695, 829.88342,   0.00000, 0.00000, 180.00000);
	CreateObject(2205, 2238.42749, -1052.42944, 829.88342,   0.00000, 0.00000, 180.00000);
	CreateObject(2205, 2239.38501, -1050.11438, 829.88342,   0.00000, 0.00000, 270.00000);
	CreateObject(2206, 2230.93848, -1051.65039, 829.88245,   0.00000, 0.00000, 90.00000);
	CreateObject(2206, 2230.93848, -1054.50305, 829.88245,   0.00000, 0.00000, 90.00000);
	CreateObject(2190, 2237.77124, -1052.80103, 830.81836,   0.00000, 0.00000, 180.00000);
	CreateObject(2190, 2230.56714, -1053.47632, 830.81836,   0.00000, 0.00000, 90.00000);
	CreateObject(2202, 2230.96948, -1056.51331, 829.88330,   0.00000, 0.00000, 90.00000);
	CreateObject(2356, 2232.19434, -1053.45959, 829.88354,   0.00000, 0.00000, 220.00000);
	CreateObject(2356, 2231.56299, -1050.71948, 829.88354,   0.00000, 0.00000, 90.00000);
	CreateObject(2813, 2231.11792, -1052.41602, 830.81628,   0.00000, 0.00000, 90.00000);
	CreateObject(2816, 2230.91870, -1051.86975, 830.81836,   0.00000, 0.00000, 90.00000);
	CreateObject(2826, 2230.94800, -1051.05481, 830.81799,   0.00000, 0.00000, 180.00000);
	CreateObject(2827, 2230.96118, -1050.04321, 830.81799,   0.00000, 0.00000, 270.00000);
	CreateObject(2855, 2239.37427, -1049.98730, 830.81885,   0.00000, 0.00000, 270.00000);
	CreateObject(11705, 2239.32080, -1051.56250, 830.81873,   0.00000, 0.00000, 270.00000);
	CreateObject(19808, 2237.98828, -1052.16125, 830.82874,   0.00000, 0.00000, 180.00000);
	CreateObject(19624, 2239.59741, -1050.82312, 830.90881,   90.00000, 0.00000, 40.00000);
	CreateObject(19808, 2231.24048, -1053.64148, 830.82874,   0.00000, 0.00000, 90.00000);
	CreateObject(2253, 2236.83008, -1052.53613, 831.07800,   0.00000, 0.00000, 0.00000);
	CreateObject(14455, 2247.49731, -1047.22473, 831.53381,   0.00000, 0.00000, 180.00000);
	CreateObject(1428, 2235.33301, -1047.71045, 830.97546,   0.00000, 0.00000, 0.00000);
	CreateObject(1428, 2241.13281, -1047.71045, 830.97546,   0.00000, 0.00000, 0.00000);
	CreateObject(1671, 2237.65088, -1051.27808, 830.34279,   0.00000, 0.00000, 0.00000);
	CreateObject(1491, 2241.58374, -1066.38721, 829.88342,   0.00000, 0.00000, 0.00000);
	CreateObject(2154, 2237.99414, -1068.09167, 829.88757,   0.00000, 0.00000, 90.00000);
	CreateObject(11707, 2239.47412, -1066.59290, 831.15869,   0.00000, 0.00000, 0.00000);
	CreateObject(1208, 2238.09424, -1070.37195, 829.88757,   0.00000, 0.00000, 270.00000);
	CreateObject(1208, 2238.09424, -1071.15137, 829.88757,   0.00000, 0.00000, 270.00000);
	CreateObject(2350, 2239.25366, -1069.08545, 830.24756,   0.00000, 0.00000, 0.00000);
	CreateObject(2152, 2237.99512, -1069.46411, 829.88806,   0.00000, 0.00000, 90.00000);
	CreateObject(2817, 2239.71582, -1069.15259, 829.88733,   0.00000, 0.00000, 90.00000);
	CreateObject(2750, 2238.29907, -1069.70947, 830.98975,   90.00000, 0.00000, 180.00000);
	CreateObject(19873, 2238.23877, -1068.74902, 831.00000,   0.00000, 0.00000, 0.00000);
	CreateObject(2435, 2247.41797, -1074.50903, 829.88647,   0.00000, 0.00000, 270.00000);
	CreateObject(2435, 2247.41895, -1073.59204, 829.88745,   0.00000, 0.00000, 270.00000);
	CreateObject(2435, 2247.41797, -1072.67334, 829.88635,   0.00000, 0.00000, 270.00000);
	CreateObject(2435, 2250.32764, -1071.57776, 829.88745,   0.00000, 0.00000, 180.00000);
	CreateObject(2435, 2249.40503, -1071.57874, 829.88647,   0.00000, 0.00000, 180.00000);
	CreateObject(2435, 2248.48071, -1071.57776, 829.88745,   0.00000, 0.00000, 180.00000);
	CreateObject(2434, 2247.56714, -1071.57666, 829.88525,   0.00000, 0.00000, 180.00000);
	CreateObject(2528, 2250.27539, -1069.65222, 829.88635,   0.00000, 0.00000, 270.00000);
	CreateObject(2522, 2248.87842, -1067.07556, 829.88794,   0.00000, 0.00000, 0.00000);
	CreateObject(1723, 2228.41504, -1070.43921, 829.88312,   0.00000, 0.00000, -20.00000);
	CreateObject(1724, 2231.58960, -1072.86584, 829.88361,   0.00000, 0.00000, 270.00000);
	CreateObject(1723, 2224.34644, -1071.11438, 829.88312,   0.00000, 0.00000, 20.00000);
	CreateObject(1724, 2223.48535, -1073.87683, 829.88361,   0.00000, 0.00000, 90.00000);
	CreateObject(2251, 2227.28418, -1073.40442, 831.23163,   0.00000, 0.00000, 0.00000);
	CreateObject(19173, 2227.28271, -1077.25500, 832.22150,   0.00000, 0.00000, 0.00000);
	CreateObject(2311, 2226.66089, -1073.46033, 829.88940,   0.00000, 0.00000, 0.00000);
	CreateObject(2229, 2228.64136, -1077.53223, 831.48633,   0.00000, 0.00000, 180.00000);
	CreateObject(2229, 2225.29858, -1077.53223, 831.48633,   0.00000, 0.00000, 180.00000);
	CreateObject(1788, 2227.90747, -1077.49536, 831.51898,   0.00000, 0.00000, 0.00000);
	CreateObject(1787, 2227.25952, -1077.48535, 831.51898,   0.00000, 0.00000, 0.00000);
	CreateObject(1790, 2226.60083, -1077.48083, 831.51898,   0.00000, 0.00000, 0.00000);
	CreateObject(2069, 2227.27002, -1070.21863, 829.94122,   0.00000, 0.00000, 0.00000);
	CreateObject(1724, 2218.22852, -1073.98560, 829.88361,   0.00000, 0.00000, 140.00000);
	CreateObject(1724, 2217.42627, -1071.29761, 829.88361,   0.00000, 0.00000, 40.00000);
	CreateObject(2069, 2216.94263, -1072.32007, 829.94122,   0.00000, 0.00000, 0.00000);
	CreateObject(1822, 2218.47974, -1072.77173, 829.88904,   0.00000, 0.00000, 0.00000);
	CreateObject(1667, 2218.74561, -1072.49426, 830.45471,   0.00000, 0.00000, 0.00000);
	CreateObject(1667, 2218.74854, -1071.97571, 830.45471,   0.00000, 0.00000, 0.00000);
	CreateObject(1669, 2218.94214, -1072.21167, 830.52789,   0.00000, 0.00000, 0.00000);
	CreateObject(1491, 2216.41406, -1059.11169, 829.88342,   0.00000, 0.00000, 270.00000);
	CreateObject(2566, 2213.87183, -1065.18909, 830.44598,   0.00000, 0.00000, 180.00000);
	CreateObject(1433, 2215.64014, -1065.24915, 830.06512,   0.00000, 0.00000, 0.00000);
	CreateObject(1811, 2215.64014, -1063.95923, 830.44568,   0.00000, 0.00000, 90.00000);
	CreateObject(1811, 2215.64014, -1066.59204, 830.44568,   0.00000, 0.00000, 270.00000);
	CreateObject(1731, 2216.18433, -1065.24915, 831.03021,   0.00000, 0.00000, 0.00000);
	CreateObject(2200, 2241.61841, -1072.83923, 829.88770,   0.00000, 0.00000, 180.00000);
	CreateObject(1742, 2209.14014, -1063.52771, 829.88470,   0.00000, 0.00000, 90.00000);
	CreateObject(1741, 2210.75195, -1060.74255, 829.88672,   0.00000, 0.00000, 90.00000);
	CreateObject(2088, 2210.72339, -1062.31055, 829.88593,   0.00000, 0.00000, 90.00000);
	CreateObject(1742, 2209.47266, -1063.52673, 829.88373,   0.00000, 0.00000, 90.00000);
	CreateObject(1567, 2211.09766, -1058.32764, 829.88611,   0.00000, 0.00000, 0.00000);
	CreateObject(1567, 2214.12378, -1058.29565, 829.88507,   0.00000, 0.00000, 180.00000);
	CreateObject(2069, 2209.65039, -1064.41980, 829.94122,   0.00000, 0.00000, 0.00000);
	CreateObject(2817, 2246.99097, -1073.92810, 829.88733,   0.00000, 0.00000, 90.00000);
	CreateObject(2817, 2248.57715, -1071.14905, 829.88733,   0.00000, 0.00000, 0.00000);
	CreateObject(2836, 2241.81885, -1057.80042, 829.88416,   0.00000, 0.00000, 0.00000);
	CreateObject(16101, 2230.08057, -1066.25293, 829.86609,   0.00000, 0.00000, 0.00000);
	CreateObject(2834, 2214.35034, -1066.55603, 829.88489,   0.00000, 0.00000, 90.00000);
	CreateObject(2834, 2211.36816, -1066.55603, 829.88489,   0.00000, 0.00000, 90.00000);
	CreateObject(16101, 2223.92285, -1066.25293, 829.86609,   0.00000, 0.00000, 180.00000);
	CreateObject(3857, 2233.91382, -1066.25244, 831.88348,   0.00000, 0.00000, 45.00000);
	CreateObject(3857, 2220.08789, -1066.25244, 831.88348,   0.00000, 0.00000, 45.00000);
	CreateObject(16101, 2237.45557, -1066.25293, 829.86609,   0.00000, 0.00000, 180.00000);
	CreateObject(16101, 2216.58984, -1066.25293, 829.86609,   0.00000, 0.00000, 0.00000);
	CreateObject(640, 2233.91382, -1066.74438, 830.58197,   0.00000, 0.00000, 90.00000);
	CreateObject(640, 2220.08789, -1066.74438, 830.58197,   0.00000, 0.00000, 90.00000);
	CreateObject(627, 2217.49390, -1076.32776, 831.68372,   0.00000, 0.00000, 0.00000);
	CreateObject(627, 2236.51074, -1076.32776, 831.68372,   0.00000, 0.00000, 0.00000);
	CreateObject(1744, 2249.72144, -1075.07764, 831.09613,   0.00000, 0.00000, 180.00000);
	CreateObject(2161, 2230.19751, -1060.95898, 831.84027,   0.00000, 0.00000, 90.00000);
	CreateObject(2257, 2212.37622, -1067.66626, 832.26331,   0.00000, 0.00000, 180.00000);
	CreateObject(2280, 2220.96899, -1054.91907, 831.71777,   0.00000, 0.00000, 90.00000);
	CreateObject(2281, 2221.02026, -1053.45361, 831.21777,   0.00000, 0.00000, 90.00000);
	CreateObject(2265, 2235.45483, -1058.83484, 832.00763,   0.00000, 0.00000, 0.00000);
	CreateObject(2268, 2234.22070, -1058.83179, 832.64758,   0.00000, 0.00000, 0.00000);
	CreateObject(2263, 2233.03589, -1058.84766, 831.72693,   0.00000, 0.00000, 0.00000);
	CreateObject(2269, 2231.73120, -1058.81982, 832.57434,   0.00000, 0.00000, 0.00000);
	CreateObject(2266, 2236.79614, -1058.83691, 832.55328,   0.00000, 0.00000, 0.00000);
	CreateObject(2256, 2216.59619, -1063.92273, 831.81781,   0.00000, 0.00000, 90.00000);
	CreateObject(2161, 2230.19751, -1060.15906, 830.48029,   0.00000, 0.00000, 90.00000);
	CreateObject(1506, 2250.88184, -1063.14258, 829.88409,   0.00000, 0.00000, 90.00000);
	CreateObject(1736, 2250.52441, -1062.37073, 833.38202,   0.00000, 0.00000, 270.00000);
	CreateObject(1738, 2237.98389, -1072.22534, 830.48712,   0.00000, 0.00000, 90.00000);
	CreateObject(2131, 2245.32837, -1058.74512, 829.88080,   0.00000, 0.00000, 0.00000);
	CreateObject(2833, 2250.77173, -1062.88525, 829.88391,   0.00000, 0.00000, 90.00000);
	CreateObject(2011, 2250.33838, -1065.69568, 829.88416,   0.00000, 0.00000, 0.00000);
	CreateObject(19603, 2249.93604, -1074.13281, 830.05939,   0.00000, 0.00000, 0.00000);
	CreateObject(2254, 2247.14624, -1066.14185, 832.15582,   0.00000, 0.00000, 180.00000);
	CreateObject(2131, 2244.58105, -1060.48718, 829.88080,   0.00000, 0.00000, 90.00000);
	CreateObject(1744, 2247.79126, -1058.16052, 830.67468,   0.00000, 0.00000, 0.00000);
	CreateObject(2239, 2250.25293, -1058.81055, 829.88190,   0.00000, 0.00000, 0.00000);
	CreateObject(2196, 2238.12085, -1052.61938, 830.81842,   0.00000, 0.00000, 130.00000);
	CreateObject(1657, 2237.98999, -1050.77551, 833.48297,   0.00000, 0.00000, 0.00000);
	CreateObject(2026, 2227.28418, -1073.40442, 833.98120,   0.00000, 0.00000, 0.00000);
	CreateObject(2026, 2218.47974, -1072.77173, 833.98120,   0.00000, 0.00000, 0.00000);
	CreateObject(2026, 2231.20288, -1053.57263, 833.98120,   0.00000, 0.00000, 0.00000);
	CreateObject(2026, 2231.20288, -1050.81140, 833.98120,   0.00000, 0.00000, 0.00000);
	CreateObject(2239, 2230.57593, -1058.72925, 829.88190,   0.00000, 0.00000, 0.00000);
	CreateObject(2026, 2237.98999, -1050.77551, 833.78119,   0.00000, 0.00000, 0.00000);
	CreateObject(2026, 2234.28418, -1073.40442, 833.98120,   0.00000, 0.00000, 0.00000);
	CreateObject(19439, 2224.86719, -1050.74683, 831.00476,   0.00000, 90.00000, 0.00000);
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
