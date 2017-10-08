 /*
 *
 *		[For a better future, Enthusiasm of Acu]
 *
 *			Acu's Useful Functions
 *			v1.2.34
 *
 *
 *		First Release:	2011/12/27
 *		Last Update:	2016/12/27
 *
 *
 *
 *		Coded by Acu 2006-2014 @ all right reserved.
 *			http://acu.pe.kr
 *			http://acu-server.net
 *			acu.pe.kr@gmail.com
 *			 twitter: @acu_world
 *
 *
 */
/*
native Kill(%1);
native TimeFix(%1);
native KEY_RELEASED(key);
native KEY_PRESSED(key);
native KEY_HOLDING(key);
native GetArgString(%1,%2);
native GetArgType(%1,%2);
native
native Wait(time);
native Crash();
native ClearConsole();
native GetTickDiff(newtick, oldtick);
native GetMinutesFromTimestamp(tick);
native
native IsPlayerInWater(playerid);
native IsPlayerAiming(playerid);
native IsPlayerSpawned(playerid);
native IsValidWeaponId(weaponid);
native IsNumeric(const string[]);
native IsFloat(const string[]);
native IsObjectInSphere(objectid,Float:x,Float:y,Float:z,Float:radius);
native
native GetPlayerNameEx(playerid,bool:except_underbar=false);
native GetPlayerIP(playerid);
native GetPlayerHealthA(playerid);
native GetPlayerArmourA(playerid);
native SetPlayerMoney(playerid,money);
native GetWeaponNameA(weaponid);
native GetPlayerSpeed(playerid);
native GetVehicleSpeed(vehicleid);
native SetVehicleSpeed(vehicleid,speed,bool:zeroz=false);
native GetPlayerIdByPartOfName(text[]);
native Float:GetDistanceBetweenPlayers(playerid,playerid2);
native Float:GetPlayerDistanceToPoint(playerid,{Float,_}:...);
native GetClosestPlayer(playerid,radius=9999.0);
native GetClosestVehicle(playerid,radius=9999.0);
native ResetPlayerWeapon(playerid,weaponid);
native GetVehicleName(modelid);
native GetWeaponObject(weaponid);
native ReturnUser(text[]);
native ConvertNumber(iValue, iDelim[2] = ".", szNum[15] = "", iSize = sizeof(szNum));
native PosCopy(Float:dest[],Float:x,Float:y,Float:z,Float:a);
native GetVehicleWheelPos(vehicleid,wheel,&Float:x,&Float:y,&Float:z);
native
native GetAngleBetweenPoints(Float:Ax,Float:Ay,Float:Bx,Float:By);
native Float:GetAngleDifference(Float:x1,Float:y1,Float:x2,Float:y2,Float:angle);
native GetDistanceBetweenPoints2D(Float:Ax,Float:Ay,Float:Bx,Float:By);
native GetDistanceBetweenPoints3D(Float:Ax,Float:Ay,Float:Az, Float:Bx,Float:By,Float:Bz);
native GetMiddlePos(Float:Ax,Float:Ay,Float:Bx,Float:By,&Float:Mx,&Float:My);
native GetXYInFrontOfPoint(&Float:X,&Float:Y,Float:angle,Float:distance,Float:direction=0.0);
native IsPlayerInArea(playerid,Float:MinX,Float:MaxX,Float:MinY,Float:MaxY);
native CrossProduct(Float:x1,Float:y1,Float:z1, Float:x2,Float:y2,Float:z2, &Float:x,&Float:y,&Float:z);
native VectorNormalize(&Float:x,&Float:y,&Float:z);
native IsNaN(Float:number);
native Float:floatquantize(Float:input,Float:step=45.0);
native
native PlaySoundForPlayer(playerid,soundid);
native PlaySoundForNearPlayer(playerid,soundid,Float:range=5.0);
native PlaySoundForAll(soundid);
native SendClientDialog(playerid,text[]);
native ClosePlayerDialog(playerid);
native FlashPlayerWantedLevel(playerid, times);
native SetPlayerLookAt(playerid,Float:x,Float:y);
native SetPlayerLookPlayer(playerid,playerid2);
native GivePlayerDamage(playerid,Float:amount);
native
native split(const strsrc[], strdest[][], delimiter = '|');
native strexist(input[]);
native strcpy(dest[],src[]);
native strcats({Float,_}:...);
native strreplace(const source[],const find[],const replace[]);
native strleft(source[],len);
native strright(source[],len);
native strtok(const string[],&index,separator=' ');
native stringslice(const string[],stringindex,separator=' ');
native stringslice_c(const string[],stringindex,separator=' ');
native strfloat(Float:convert_float);
native strblank(input[]);
native strupper(string[]);
native strlower(string[]);
native strtrim(string[],length,bool:ellipsis=false);
native strreverse(string[]);
native RemoveSpaceInString(string[]);
native GetStringSlices(string[]);
native StringToHex(input[]);
native Float:GetCharWidth(ch);
native Float:GetStringWidth(string[]);
native TrimStringLastChar(string[],ch = '\0');
native IntToString(input);
native IsCharKorean(ch);
native SliceStringAsLength(const input[],output[][],length);
native TrimLineBreak(string[]);
native GetThousandsSeparatedString(input);
native VersionCompare(src[],cmp[]);
native GetGreyOrNoColorString(input);
native
native ParsePosString(input[],&Float:x,&Float:y,&Float:z,&Float:angle,&interior,&virtual);
native
native ConvertTimeStringToSeconds(input[]);
native ConvertSecondsToTimeString(seconds);
native ConvertDateToDays(year,month,day,YEAR_OFFSET=2016);
native GetDaysOfMonth(year,month);
native IsLeapYear(year);
native IsTodayBetweenPeriods(start_y,start_m,start_d, end_y,end_m,end_d);
native
native INI_GetKeyAndValue(const string[],key[],value[]);
native
native ClearChatting(playerid);
native ClearChattingToAll();
native ClearDialog(playerid);
native ClearDialogToAll();
native SendClientMessageToPoint(color,text[],Float:x,Float:y,Float:z,Float:range);
native SendClientMessageToNearPlayer(playerid,const message[],distance,color1,color2,color3,color4,color5,bool:except_playerself=false);
native
native GetVehicleComponentInfo(componentid,name[],&categoryid);
native GetPairedComponentID(componentid);
native GetComponentCategoryName(categoryid);
native GetVehicleAvailableComponents(modelid,components[]); // components[43]
native GetVehicleComponentsPerCategory(modelid,categories[]); // categories[17]
native
native CreateExplosionCircle(Float:x,Float:y,Float:z,points,Float:radius);
native CreateExplosionEx(Float:x,Float:y,Float:z,Float:angle,Float:dist);
native
native hash_adler32(const string[]);
native
native utf8_fwrite(File:handle,const string[]);
native
native GetPVarStringA(playerid,varname[]);
native SetPVarInt_(playerid,varname[],int_value,array=0);
native Float:SetPVarFloat_(playerid,varname[],Float:float_value,array=0);
native SetPVarString_(playerid,varname[],string_value[],array=0);
native GetPVarInt_(playerid,varname[],array=0);
native Float:GetPVarFloat_(playerid,varname[],array=0);
native GetPVarString_(playerid,varname[],array=0);
native
native SetGVar(varname[],value[]);
native SetGVarInt(varname[],value);
native SetGVarFloat(varname[],Float:value);
native GetGVar(varname[]);
native GetGVarInt(varname[]);
native GetGVarFloat(varname[]);
native GetSVarStringA(varname[]);
native
native BitmapAdd(&bitmap,pos); // pos:0~
native BitmapSub(&bitmap,pos);
native BitmapCheck(bitmap,pos);
native BitmapPrint(bitmap);
native ParseBitmapString(input[]);
native GetBitmapString(bitmap,bool:split=false);
native
native AntiDeAMX();
*/

//-----/ Pre-Processing /
#if defined _Acu_included
	#endinput
#endif
#define _Acu_included
#pragma library Acu



//-----/ Pragma /
#pragma dynamic					20000000



//-----/ Defines /
	//--/ System Colors /
#define COLOR_ADMIN				0x2587CEFF // *Admin:
#define COLOR_DIALOG			0xA9C4E4FF
#define C_ADMIN					"{2587CE}"
#define C_DIALOG				"{A9C4E4}"
	//--/ Fade Colors /
#define COLOR_FADE1				0xE6E6E6FF // bright
#define COLOR_FADE2				0xC8C8C8FF
#define COLOR_FADE3				0xAAAAAAFF
#define COLOR_FADE4				0x8C8C8CFF
#define COLOR_FADE5				0x6E6E6EFF // dark
#define C_FADE1					"{E6E6E6}"
#define C_FADE2					"{C8C8C8}"
#define C_FADE3					"{AAAAAA}"
#define C_FADE4					"{8C8C8C}"
#define C_FADE5					"{6E6E6E}"
	//--/ Pastel Colors /
#define COLOR_PASTEL_BLACK		0x9A9691FF
#define COLOR_PASTEL_YELLOW		0xFAF5A4FF
#define COLOR_PASTEL_RED		0xFFB2BEFF
#define COLOR_PASTEL_MAGENTA	0xF9ABDDFF
#define COLOR_PASTEL_VIOLET		0xBA94DDFF
#define COLOR_PASTEL_BLUE		0x5DCEF0FF
#define COLOR_PASTEL_GREEN		0x6DE5D0FF
#define C_PASTEL_BLACK			"{9A9691}"
#define C_PASTEL_YELLOW			"{FAF5A4}"
#define C_PASTEL_RED			"{FFB2BE}"
#define C_PASTEL_MAGENTA		"{F9ABDD}"
#define C_PASTEL_VIOLET			"{BA94DD}"
#define C_PASTEL_BLUE			"{5DCEF0}"
#define C_PASTEL_GREEN			"{6DE5D0}"
	//--/ General Colors /
#define COLOR_WHITE				0xFFFFFFFF
#define COLOR_GREY 				0xAAAAAAFF
#define COLOR_BLACK				0x000000FF
#define COLOR_RED 				0xFF0000FF
#define COLOR_GREEN		  		0x00FF00FF
#define COLOR_BLUE		  		0x0000FFFF
#define COLOR_YELLOW			0xFFFF00FF
#define COLOR_CORAL				0xFFAB7BFF
#define COLOR_PINK				0xFFC0CBFF
#define COLOR_HOTPINK			0xFF69B4FF
#define COLOR_PURPLE			0xD1B9E3FF
#define COLOR_VIOLET			0xEE82EEFF
#define COLOR_ORANGE		  	0xFF9900FF
#define COLOR_SPRINGGREEN		0x00FF7FFF
#define COLOR_YELLOWGREEN		0x9ACD32FF
#define COLOR_LIGHTGREEN 		0xCBFEA9FF
#define COLOR_MEDIUMAQUA		0x83BFBFFF
#define COLOR_TAXIYELLOW	  	0xF0E68CFF
#define COLOR_SKYBLUE			0x9CEAFBFF
#define COLOR_LIGHTBLUE	  		0x33CCFFFF
#define COLOR_LIGHTPINK			0xFF8282FF
#define C_WHITE					"{FFFFFF}"
#define C_GREY 					"{AAAAAA}"
#define C_BLACK					"{000000}"
#define C_RED 					"{FF0000}"
#define C_GREEN		  			"{00FF00}"
#define C_BLUE		  			"{0000FF}"
#define C_YELLOW				"{FFFF00}"
#define C_CORAL					"{FFAB7B}"
#define C_PINK					"{FFC0CB}"
#define C_HOTPINK				"{FF69B4}"
#define C_PURPLE				"{D1B9E3}"
#define C_VIOLET				"{EE82EE}"
#define C_ORANGE		  		"{FF9900}"
#define C_SPRINGGREEN			"{00FF7F}"
#define C_YELLOWGREEN			"{9ACD32}"
#define C_LIGHTGREEN 			"{CBFEA9}"
#define C_MEDIUMAQUA			"{83BFBF}"
#define C_TAXIYELLOW	  		"{F0E68C}"
#define C_SKYBLUE				"{9CEAFB}"
#define C_LIGHTBLUE	  			"{33CCFF}"
	//--/ Lite Functions /
#define Kill(%1)				SetPlayerHealth(%1,-999)
#define TimeFix(%1)				floatround(floatmul(%1,0.91))
#define KEY_PRESSED(%0)			( !(oldkeys & (%0)) && (newkeys & (%0)) )
#define KEY_RELEASED(%0)		( (oldkeys & (%0)) && !(newkeys & (%0)) )
#define KEY_HOLDING(%0)			( newkeys & (%0) )
#define GetArgString(%1,%2)		do{ for(new Xx=0;;Xx++){ %2[Xx]=getarg(%1,Xx); if(getarg(%1,Xx)=='\0') break; } } while(FALSE)
#define GetArgType(%1,%2)		if(getarg(%1,1)) %2=0; else if(Float:getarg(%1)==floatstr(strfloat(Float:getarg(%1)))) %2 = 1; else %2 = 2





//==========/ Server-side Functions /===========================================
//-----/ Wait /-----------------------------------------------------------------
stock Wait(time)
{
	new stamp = tickcount();
	while (tickcount() - stamp < time) {}
	return 1;
}
//-----/ Crash /----------------------------------------------------------------
stock Crash()
{
	new File:hFile;
	hFile = fopen("crash/crash.txt",io_append); // 없는 파일을 열어서 널포인터 반환
	fwrite(hFile,"%s"); // 널포인터에 쓰기 시도하면 크래시 발생
	fclose(hFile);
	//SendRconCommand("exit");
	return 1;
}
//-----/ ClearConsole /---------------------------------------------------------
stock ClearConsole()
{
	for(new i; i<40; i++)
		printf("\n");
	return 1;
}
//-----/ GetTickDiff /----------------------------------------------------------
stock GetTickDiff(newtick, oldtick) // src: https://gist.github.com/ziggi/5d7d8dc42f54531feba7ae924c608e73
{
	if (oldtick < 0 && newtick >= 0) {
		return newtick - oldtick;
	} else if (oldtick >= 0 && newtick < 0 || oldtick > newtick) {
		return (cellmax - oldtick + 1) - (cellmin - newtick);
	}
	return newtick - oldtick;
}
//-----/ GetMinutesFromTimestamp /----------------------------------------------
stock GetMinutesFromTimestamp(tick)
{
	return tick / 1000000;
}





//==========/ Decision Functions /==============================================
//-----/ IsPlayerInWater /------------------------------------------------------
stock IsPlayerInWater(playerid)
{
	new anim = GetPlayerAnimationIndex(playerid);
	if (((anim >=  1538) && (anim <= 1542)) || (anim == 1544) || (anim == 1250) || (anim == 1062))
		return 1;
	return 0;
}
//-----/ IsPlayerAiming /-------------------------------------------------------
stock IsPlayerAiming(playerid)
{
	new anim = GetPlayerAnimationIndex(playerid);
	if (((anim >= 1160) && (anim <= 1163)) || (anim == 1167) || (anim == 1365) ||
		(anim == 1643) || (anim == 1453) || (anim == 220))
		return 1;
	return 0;
}
//-----/ IsPlayerSpawned /------------------------------------------------------
stock IsPlayerSpawned(playerid)
{
	if(GetPlayerState(playerid) == PLAYER_STATE_NONE)
		return false;
	if(GetPlayerState(playerid) == PLAYER_STATE_WASTED)
		return false;
	if(GetPlayerState(playerid) == PLAYER_STATE_SPECTATING)
		return false;
	return true;
}
//-----/ IsValidWeaponId /------------------------------------------------------
stock IsValidWeaponId(weaponid)
{
	if(weaponid == 19|| weaponid == 20|| weaponid == 21
		||weaponid > 46 || weaponid < 0)
		return 0;
	return 1;
}
//-----/ IsNumeric /------------------------------------------------------------
stock IsNumeric(const string[])
{
	for(new i=0,t=strlen(string); i<t; i++)
		if(string[i] < '0' || string[i] > '9')
			return false;
	return true;
}
//-----/ IsFloat /--------------------------------------------------------------
stock IsFloat(const string[])
{
	new bool:dot;
	for(new i,t=strlen(string); i<t; i++)
	{
		if(string[i] == '.')
		{
			if(dot) return 0;
			dot = true;
			continue;
		}
		if(string[i] >= '0' && string[i] <= '9')
			continue;
		return 0;
	}
	if(!dot)
		return 0;
	return 1;
}
//-----/ IsObjectInSphere /-----------------------------------------------------
stock IsObjectInSphere(objectid,Float:x,Float:y,Float:z,Float:radius)
{
	new Float:pos[3],Float:dist;
	GetObjectPos(objectid,pos[0],pos[1],pos[2]);
	dist = floatsqroot(floatpower(floatabs(floatsub(x,pos[0])),2)+ floatpower(floatabs(floatsub(y,pos[1])),2)+ floatpower(floatabs(floatsub(z,pos[2])),2));
	if(dist < radius)
		return 1;
	return 0;
}





//==========/ Vehicle Model Decision Functions /================================
/*
//-----/  /---------------------------------------------------------------------
stock IsVehicle(modelid)
{
	switch(modelid)
	{
		case : return 1;
		default: return 0;
	}
}
*/





//==========/ Setters & Getters /===============================================
//-----/ GetPlayerNameEx /------------------------------------------------------
stock GetPlayerNameEx(playerid,bool:except_underbar=false)
{
	new playername[32];
	GetPlayerName(playerid,playername,sizeof(playername));
	if(except_underbar)
		for(new i=0; i<sizeof(playername); i++)
			if(playername[i] == '_')
				playername[i] = ' ';
	return playername;
}
//-----/ GetPlayerIP /----------------------------------------------------------
stock GetPlayerIP(playerid)
{
	new ip[16];
	GetPlayerIp(playerid,ip,sizeof(ip));
	return ip;
}
//-----/ GetPlayerHealthA /-----------------------------------------------------
stock GetPlayerHealthA(playerid)
{
	if(IsPlayerConnected(playerid))
	{
		new Float:health;
		GetPlayerHealth(playerid,health);
		return floatround(health,floatround_floor);
	}
	return 0;
}
//-----/ GetPlayerArmourA /-----------------------------------------------------
stock GetPlayerArmourA(playerid)
{
	if(IsPlayerConnected(playerid))
	{
		new Float:armour;
		GetPlayerArmour(playerid,armour);
		return floatround(armour,floatround_floor);
	}
	return 0;
}
//-----/ SetPlayerMoney /-------------------------------------------------------
stock SetPlayerMoney(playerid,money)
{
	GivePlayerMoney(playerid,money-GetPlayerMoney(playerid));
	return 1;
}
//-----/ GetWeaponNameA /-------------------------------------------------------
stock GetWeaponNameA(weaponid)
{
	new weaponname[48];
	GetWeaponName(weaponid,weaponname,sizeof(weaponname));
	return weaponname;
}
//-----/ GetPlayerSpeed /-------------------------------------------------------
stock GetPlayerSpeed(playerid)
{
	new Float:v[3],Float:temp;
	if(IsPlayerInAnyVehicle(playerid))
		GetVehicleVelocity(GetPlayerVehicleID(playerid),v[0],v[1],v[2]);
	else
		GetPlayerVelocity(playerid,v[0],v[1],v[2]);
	temp = floatsqroot(floatpower(floatabs(v[0]),2.0) + floatpower(floatabs(v[1]),2.0) + floatpower(floatabs(v[2]),2.0)) * 136.666667;
	return floatround(temp);
}
//-----/ GetVehicleSpeed /------------------------------------------------------
stock GetVehicleSpeed(vehicleid)
{
	new Float:v[3],Float:temp;
	GetVehicleVelocity(vehicleid, v[0],v[1],v[2]);
	temp = floatsqroot(floatpower(floatabs(v[0]),2.0) + floatpower(floatabs(v[1]),2.0) + floatpower(floatabs(v[2]),2.0)) * 136.666667;
	return floatround(temp);
}
//-----/ SetVehicleSpeed /------------------------------------------------------
stock SetVehicleSpeed(vehicleid,speed,bool:zeroz=false)
{
	new
		Float:v[3],
		Float:current = GetVehicleSpeed(vehicleid),
		Float:ratio = current / speed,
		Float:angle
	;
	if(current && !zeroz)
	{
		GetVehicleVelocity(vehicleid, v[0],v[1],v[2]);
		for(new i; i<3; i++)
		{
			v[i] /= ratio;
			if(v[i] != v[i])
				v[i] = 0.0;
		}
	} else { //stopped
		GetVehicleZAngle(vehicleid,angle);
		v[0] = floatsin(-angle,degrees) / (136.666667/speed);
		v[1] = floatcos(-angle,degrees) / (136.666667/speed);
	 	v[2] = 0.0;
	}
	SetVehicleVelocity(vehicleid, v[0],v[1],v[2]);
	return 1;
}
//-----/ GetPlayerIdByPartOfName /----------------------------------------------
stock GetPlayerIdByPartOfName(text[])
{
	if(IsNumeric(text))
		return strval(text);
	for(new i=0,t=GetMaxPlayers(); i<t; i++)
		if(IsPlayerConnected(i) && strfind(GetPlayerNameA(i),text,true) != -1)
			return i;
	return INVALID_PLAYER_ID;
}
//-----/ GetPlayerDistanceToPoint /---------------------------------------------
stock Float:GetPlayerDistanceToPoint(playerid,{Float,_}:...)
{
	new num = numargs(),Float:pos[3];
	GetPlayerPos(playerid,pos[0],pos[1],pos[2]);
	if(num == 3)
		return floatsqroot(floatpower(floatabs(floatsub(pos[0],Float:getarg(1))),2)+floatpower(floatabs(floatsub(pos[1],Float:getarg(2))),2));
	else if(num == 4)
		return floatsqroot(floatpower(floatabs(floatsub(pos[0],Float:getarg(1))),2)+floatpower(floatabs(floatsub(pos[1],Float:getarg(2))),2)+floatpower(floatabs(floatsub(pos[2],Float:getarg(3))),2));
	return -1.0;
}
//-----/ GetDistanceBetweenPlayers /--------------------------------------------
stock Float:GetDistanceBetweenPlayers(playerid,playerid2)
{
	new Float:pos[3];
	GetPlayerPos(playerid,pos[0],pos[1],pos[2]);
	return GetPlayerDistanceFromPoint(playerid2,pos[0],pos[1],pos[2]);
}
//-----/ GetClosestPlayer /-----------------------------------------------------
stock GetClosestPlayer(playerid,Float:radius=9999.0)
{
	new
		Float:calc,
		destid
	;
	destid = INVALID_PLAYER_ID;
	for(new i=0; i<GetMaxPlayers(); i++)
		if(IsPlayerConnected(i) && GetPlayerState(i) != PLAYER_STATE_SPECTATING)
			if(playerid != i)
			{
				calc = GetDistanceBetweenPlayers(playerid,i);
				if(radius > calc && calc != -1.00)
				{
					radius = calc;
					destid = i;
				}
			}
	return destid;
}
//-----/ GetClosestVehicle /----------------------------------------------------
stock GetClosestVehicle(playerid,Float:radius=9999.0)
{
	new
		Float:calc,
		destid
	;
	destid = INVALID_VEHICLE_ID;
	for(new i=0; i<MAX_VEHICLES; i++)
		if(IsVehicleStreamedIn(i,playerid))
		{
			new Float:px,Float:py,Float:pz;
			GetPlayerPos(playerid,px,py,pz);
			calc = GetVehicleDistanceFromPoint(i,px,py,pz);
			if(radius > calc && calc != -1.00)
			{
				radius = calc;
				destid = i;
			}
		}
	return destid;
}
//-----/ ResetPlayerWeapon /----------------------------------------------------
stock ResetPlayerWeapon(playerid,weaponid)
{
	for(new i=0; i<13; i++)
	{
		new wp,wpa;
		GetPlayerWeaponData(playerid,i,wp,wpa);
		if(wp == weaponid)
		{
			GivePlayerWeapon(playerid,weaponid,0-wpa);
			return wpa;
		}
	}
}
//-----/ GetVehicleName /-------------------------------------------------------
stock GetVehicleName(modelid)
{
	new
		names[213][] = {
			"Landstalker","Bravura","Buffalo","Linerunner","Pereniel","Sentinel","Dumper","Firetruck","Trashmaster","Stretch","Manana","Infernus",
			"Voodoo","Pony","Mule","Cheetah","Ambulance","Leviathan","Moonbeam","Esperanto","Taxi","Washington","Bobcat","Mr Whoopee","BF Injection",
			"Hunter","Premier","Enforcer","Securicar","Banshee","Predator","Bus","Rhino","Barracks","Hotknife","Trailer","Previon","Coach","Cabbie",
			"Stallion","Rumpo","RC Bandit","Romero","Packer","Monster","Admiral","Squalo","Seasparrow","Pizzaboy","Tram","Trailer","Turismo","Speeder",
			"Reefer","Tropic","Flatbed","Yankee","Caddy","Solair","Berkleys RC Van","Skimmer","PCJ-600","Faggio","Freeway","RC Baron","RC Raider",
			"Glendale","Oceanic","Sanchez","Sparrow","Patriot","Quad","Coastguard","Dinghy","Hermes","Sabre","Rustler","ZR3 50","Walton","Regina",
			"Comet","BMX","Burrito","Camper","Marquis","Baggage","Dozer","Maverick","News Chopper","Rancher","FBI Rancher","Virgo","Greenwood",
			"Jetmax","Hotring","Sandking","Blista Compact","Police Maverick","Boxville","Benson","Mesa","RC Goblin","Hotring Racer A","Hotring Racer B",
			"Bloodring Banger","Rancher","Super GT","Elegant","Journey","Bike","Mountain Bike","Beagle","Cropdust","Stunt","Tanker","RoadTrain",
			"Nebula","Majestic","Buccaneer","Shamal","Hydra","FCR-900","NRG-500","HPV1000","Cement Truck","Tow Truck","Fortune","Cadrona","FBI Truck",
			"Willard","Forklift","Tractor","Combine","Feltzer","Remington","Slamvan","Blade","Freight","Streak","Vortex","Vincent","Bullet","Clover",
			"Sadler","Firetruck","Hustler","Intruder","Primo","Cargobob","Tampa","Sunrise","Merit","Utility","Nevada","Yosemite","Windsor","Monster A",
			"Monster B","Uranus","Jester","Sultan","Stratum","Elegy","Raindance","RC Tiger","Flash","Tahoma","Savanna","Bandito","Freight","Trailer",
			"Kart","Mower","Duneride","Sweeper","Broadway","Tornado","AT-400","DFT-30","Huntley","Stafford","BF-400","Newsvan","Tug","Trailer A","Emperor",
			"Wayfarer","Euros","Hotdog","Club","Trailer B","Trailer C","Andromada","Dodo","RC Cam","Launch","Police Car (LSPD)","Police Car (SFPD)",
			"Police Car (LVPD)","Police Ranger","Picador","S.W.A.T. Van","Alpha","Phoenix","Glendale","Sadler","Luggage Trailer A","Luggage Trailer B",
			"Stair Trailer","Boxville","Farm Plow","Utility Trailer"," "
		},
		result[64]
	;
	modelid -= 400;
	if(modelid >= 0 && modelid <= 211)
		strcpy(result,names[modelid]);
	return result;
}
//-----/ GetWeaponObject /------------------------------------------------------
stock GetWeaponObject(weaponid)
{
	switch(weaponid)
	{
		case 1:		 return 331;
		case 2..8:	 return 331+weaponid;
		case 9:		 return 341;
		case 10..15: return 311+weaponid;
		case 16..18: return 326+weaponid;
		case 22..29: return 324+weaponid;
		case 30,31:	 return 325+weaponid;
		case 32:	 return 372;
		case 33..45: return 324+weaponid;
		case 46:	 return 371;
		default:	 return 0;
	}
	return 0;
}
//-----/ ReturnUser /-----------------------------------------------------------
stock ReturnUser(text[])
{
	new pos = 0;
	while(text[pos] < 0x21)
	{
		if(text[pos] == 0)
			return INVALID_PLAYER_ID;
		pos++;
	}
	new userid = INVALID_PLAYER_ID;
	if(IsNumeric(text[pos]))
	{
		userid = strval(text[pos]);
		if(userid >= 0 && userid < GetMaxPlayers())
		{
			if(!IsPlayerConnected(userid))
				userid = INVALID_PLAYER_ID;
			else
				return userid;
		}
	}
	new len = strlen(text[pos]);
	new count = 0;
	new name[MAX_PLAYER_NAME];
	for(new i=0,t=GetMaxPlayers(); i<t; i++)
		if(IsPlayerConnected(i))
		{
			GetPlayerName(i,name,sizeof(name));
			if(strcmp(name,text[pos],true,len) == 0)
			{
				if(len == strlen(name))
					return i;
				else {
					count++;
					userid = i;
				}
			}
		}
	if(count != 1)
		userid = INVALID_PLAYER_ID;
	return userid;
}
//-----/ ConvertNumber /--------------------------------------------------------
stock ConvertNumber(iValue, iDelim[2] = ".", szNum[15] = "", iSize = sizeof(szNum))
{
	format(szNum, iSize, "%d", iValue < 0  -iValue : iValue);
	for(new i = strlen(szNum) - 3; i > 0; i -= 3)
		strins(szNum, iDelim, i, iSize);
	if(iValue < 0)
		strins(szNum, "-", 0, iSize);
	return szNum;
}
//-----/ PosCopy /--------------------------------------------------------------
stock PosCopy(Float:dest[],Float:x,Float:y,Float:z,Float:a)
{
	dest[0] = x;
	dest[1] = y;
	dest[2] = z;
	dest[3] = a;
}
//-----/ GetVehicleWheelPos /---------------------------------------------------
stock GetVehicleWheelPos(vehicleid,wheel,&Float:x,&Float:y,&Float:z)
{
	// wheel: 전륜 좌측을 0으로 하고 시계방향으로 증가
	new
		Float:a,
		Float:offset[3]
	;
	GetVehiclePos(vehicleid, x,y,z);
	GetVehicleZAngle(vehicleid, a);
	if(wheel == 0 || wheel == 1) // 전륜
		GetVehicleModelInfo(GetVehicleModel(vehicleid), VEHICLE_MODEL_INFO_WHEELSFRONT, offset[0],offset[1],offset[2]);
	else // 후륜
		GetVehicleModelInfo(GetVehicleModel(vehicleid), VEHICLE_MODEL_INFO_WHEELSREAR, offset[0],offset[1],offset[2]);
	z += offset[2]; // z-offset 반영
	GetXYInFrontOfPoint(x,y, a, offset[1]); // 차량 앞뒤 방향
	if(wheel == 0 || wheel == 3) // 좌측
		GetXYInFrontOfPoint(x,y, a, offset[0], 90.0); // 차량 좌우 방향
	else // 우측
		GetXYInFrontOfPoint(x,y, a, offset[0], -90.0); // 차량 좌우 방향
}





//==========/ XYZ Pos Functions /===============================================
//-----/ GetAngleBetweenPoints /------------------------------------------------
stock Float:GetAngleBetweenPoints(Float:Ax,Float:Ay,Float:Bx,Float:By)
{
	new Float:angle;
	angle = -atan2(Bx-Ax,By-Ay);
	return angle;
}
//-----/ GetAngleDifference /---------------------------------------------------
stock Float:GetAngleDifference(Float:x1,Float:y1,Float:x2,Float:y2,Float:angle)
{
	new
		Float:a = GetAngleBetweenPoints(x1,y1,x2,y2),
		Float:diff[2]
	;
	a = a < 0 ? a + 360 : a;
	diff[0] = a > angle ? a - angle : angle - a;
	if(angle < a) angle += 360.0;
	else a += 360.0;
	diff[1] = a > angle ? a - angle : angle - a;
	return diff[0] < diff[1] ? diff[0] : diff[1];
}
//-----/ GetDistanceBetweenPoints2D /-------------------------------------------
stock Float:GetDistanceBetweenPoints2D(Float:Ax,Float:Ay, Float:Bx,Float:By)
{
	new Float:Dx,Float:Dy;
	Dx = Ax - Bx;
	Dy = Ay - By;
	return floatsqroot(Dx*Dx + Dy*Dy);
}
//-----/ GetDistanceBetweenPoints3D /-------------------------------------------
stock Float:GetDistanceBetweenPoints3D(Float:Ax,Float:Ay,Float:Az, Float:Bx,Float:By,Float:Bz)
{
	new Float:Dx,Float:Dy,Float:Dz;
	Dx = Ax - Bx;
	Dy = Ay - By;
	Dz = Az - Bz;
	return floatsqroot(Dx*Dx + Dy*Dy + Dz*Dz);
}
//-----/ GetMiddlePos /---------------------------------------------------------
stock GetMiddlePos(Float:Ax,Float:Ay,Float:Bx,Float:By,&Float:Mx,&Float:My)
{
	Mx = floatdiv(Ax+Bx,2);
	My = floatdiv(Ay+By,2);
}
//-----/ GetXYInFrontOfPoint /--------------------------------------------------
stock GetXYInFrontOfPoint(&Float:X,&Float:Y,Float:angle,Float:distance,Float:direction=0.0)
{
	angle += direction;
	X += floatmul(floatsin(-angle,degrees),distance);
	Y += floatmul(floatcos(-angle,degrees),distance);
}
//-----/ IsPlayerInArea /-------------------------------------------------------
stock IsPlayerInArea(playerid,Float:MinX,Float:MaxX,Float:MinY,Float:MaxY)
{
	new Float:x,Float:y,Float:z;
	GetPlayerPos(playerid, x,y,z);
	#pragma unused z
	if(x >= MinX && x <= MaxX && y >= MinY && y <= MaxY)
		return 1;
	return 0;
}
//-----/ CrossProduct /---------------------------------------------------------
stock CrossProduct(Float:x1,Float:y1,Float:z1, Float:x2,Float:y2,Float:z2, &Float:x,&Float:y,&Float:z)
{
	x = y1*z2 - z1*y2;
	y = z1*x2 - x1*z2;
	z = x1*y2 - y1*x2;
}
//-----/ VectorNormalize /------------------------------------------------------
stock VectorNormalize(&Float:x,&Float:y,&Float:z)
{
	new Float:len = floatsqroot(x*x + y*y + z*z);
	x /= len;
	y /= len;
	z /= len;
}
//-----/ IsNaN /----------------------------------------------------------------
stock IsNaN(Float:number)
{
	return (number != number);
}
//-----/ floatquantize /--------------------------------------------------------
stock Float:floatquantize(Float:input,Float:step=45.0)
{
	new Float:a,Float:b,Float:c=360.0,Float:d;
	if(step > 0.0 && step < 360.0)
	{
		do {
			if(a > input)
				b = a - input;
			else
				b = input - a;
			if(b < c)
			{
				d = a;
				c = b;
			}
			a += step;
		} while(a < 360.0+step);
		return d < 360.0 ? d : d - 360.0;
	}
	return input;
}
//-----/ anglediff /------------------------------------------------------------
stock Float:anglediff(Float:a,Float:b)
{
	new Float:d;
	d = a>b ? a-b : b-a; // (d > 0)
	if(d > 180.0)
		d = 360 - d;
	return d;
}





//==========/ Custom Functions /================================================
//-----/ PlaySoundForPlayer /---------------------------------------------------
stock PlaySoundForPlayer(playerid,soundid)
{
	PlayerPlaySound(playerid,soundid,0,0,0);
	return 1;
}
//-----/ PlaySoundForNearPlayer /-----------------------------------------------
stock PlaySoundForNearPlayer(playerid,soundid,Float:range=5.0)
{
	new Float:pos[3];
	GetPlayerPos(playerid,pos[0],pos[1],pos[2]);
	for(new i; i<GetMaxPlayers(); i++)
		if(IsPlayerConnected(i))
			if(IsPlayerInRangeOfPoint(i,range,pos[0],pos[1],pos[2]))
				PlayerPlaySound(i,soundid,pos[0],pos[1],pos[2]);
	return 1;
}
//-----/ PlaySoundForAll /------------------------------------------------------
stock PlaySoundForAll(soundid)
{
	for(new i; i<GetMaxPlayers(); i++)
		if(IsPlayerConnected(i))
			PlayerPlaySound(i,soundid,0,0,0);
	return 1;
}
//-----/ SendClientDialog /-----------------------------------------------------
stock SendClientDialog(playerid,text[])
{
	if(strlen(text))
		ShowPlayerDialog(playerid,32766,DIALOG_STYLE_MSGBOX,"Message Box",text,"닫기","");
	return 1;
}
//-----/ ClosePlayerDialog /----------------------------------------------------
stock ClosePlayerDialog(playerid)
	return ShowPlayerDialog(playerid,-1,DIALOG_STYLE_MSGBOX," "," "," "," ");
//-----/ FlashPlayerWantedLevel /-----------------------------------------------
forward FlashPlayerWantedLevel(playerid, times);
public FlashPlayerWantedLevel(playerid, times)
{
	static flash;
	new levels = GetPlayerWantedLevel(playerid);
	if(times)
	{
		if(!flash)
		{
			flash=1;
			SetPlayerWantedLevel(playerid, 0);
		} else {
			flash=0;
			SetPlayerWantedLevel(playerid, levels);
		}
		SetTimerEx("FlashPlayerWantedLevel",500,0,"dd",playerid,times-1);
	} else SetPlayerWantedLevel(playerid, levels);
}
//-----/ SetPlayerLookAt /------------------------------------------------------
stock SetPlayerLookAt(playerid,Float:x,Float:y)
{
	new Float:Px,Float:Py,Float: Pa;
	GetPlayerPos(playerid, Px,Py,Pa);
	Pa = floatabs(atan((y-Py)/(x-Px)));
	if(x <= Px && y >= Py)
		Pa = floatsub(180, Pa);
	else if(x < Px && y < Py)
		Pa = floatadd(Pa, 180);
	else if(x >= Px && y <= Py)
		Pa = floatsub(360.0, Pa);
	Pa = floatsub(Pa, 90.0);
	if(Pa >= 360.0)
		Pa = floatsub(Pa, 360.0);
	SetPlayerFacingAngle(playerid, Pa);
	return 1;
}
//-----/ SetPlayerLookPlayer /--------------------------------------------------
stock SetPlayerLookPlayer(playerid,playerid2)
{
	new Float:pX,Float:pY,Float:pZ;
	GetPlayerPos(playerid2,pX,pY,pZ);
	SetPlayerLookAt(playerid,pX,pY);
}
//-----/ GivePlayerDamage /-----------------------------------------------------
stock GivePlayerDamage(playerid,Float:amount)
{
	new Float:hp,Float:ap;
	GetPlayerHealth(playerid,hp);
	GetPlayerArmour(playerid,ap);
	if(ap) SetPlayerHealth(playerid,hp-amount);
	else
	{
		if(ap < amount)
		{
			SetPlayerArmour(playerid,0.0);
			SetPlayerHealth(playerid,hp-(amount-ap));
		}
		else SetPlayerArmour(playerid,ap-amount);
	}
	return 1;
}





//==========/ String Functions /================================================
//-----/ split /----------------------------------------------------------------
stock split(const src[],dest[][],delimiter='|')
{
	new left,right,pieces;
	for(new i,t=strlen(src); i<=t; i++)
		if(src[i] == delimiter || i == t)
		{
			right = strmid(dest[pieces],src, left,i, t+1);
			dest[pieces++][right] = '\0';
			left = i+1;
		}
	return pieces;
}
//-----/ strexist /-------------------------------------------------------------
stock strexist(input[])
{
	if(input[0] != '\0')
		return 1;
	return 0;
}
//-----/ strcpy /---------------------------------------------------------------
stock strcpy(dest[],src[])
{
	new i = 0;
	while((dest[i] = src[i]))
		i++;
}
//-----/ strcats /--------------------------------------------------------------
stock strcats({Float,_}:...)
{
	new result[512];
	for(new i=0,j=numargs(); i<j; i++)
	{
		new semistr[512];
		GetArgString(i,semistr);
		strcat(result,semistr);
	}
	return result;
}
//-----/ strreplace /-----------------------------------------------------------
stock strreplace(source[],const find[],const replace[])
{
	new
		result[256],idx,
		idx_find, len_find = strlen(find), len_replace = strlen(replace)
	;
	for(new i,t=strlen(source); i<t; i++)
	{
		result[idx++] = source[i];
		if(source[i] == find[idx_find])
		{
			if(++idx_find == len_find)
			{
				idx -= len_find;
				for(new j; j<len_replace; j++)
					result[idx++] = replace[j];
				idx_find = 0;
			}
		} else idx_find = 0;
	}
	result[idx] = '\0';
	strcpy(source,result);
}
//-----/ strleft /--------------------------------------------------------------
stock strleft(source[],len)
{
	new result[512];
	strmid(result,source,0,len);
	return result;
}
//-----/ strright /-------------------------------------------------------------
stock strright(source[],len)
{
	new
		result[512],
		srclen = strlen(source)
	;
	strmid(result,source,srclen-len,srclen);
	return result;
}
//-----/ strtok /---------------------------------------------------------------
stock strtok(const string[],&index,separator=' ')
{
	new length = strlen(string);
	new offset = index;
	new result[256];
	while((index < length) && (string[index] != separator || (index+1 < length && string[index+1] == separator)) && ((index - offset) < (sizeof(result) - 1)))
	{
		if(string[index] == separator)
			result[index - offset] = EOS;
		else
			result[index - offset] = string[index];
		index++;
	}
	result[index - offset] = EOS;
	if((index < length) && (string[index] == separator))
		index++;
	return result;
}
//-----/ stringslice /----------------------------------------------------------
stock stringslice(const string[],index,separator=' ')
{
	new
		sliceidx,
		result[64],idx
	;
	for(new i,t=strlen(string); i<t; i++)
		if(string[i] == separator)
		{
			result[idx] = EOS;
			if(strlen(result))
			{
				if(sliceidx == index)
					return result;
				sliceidx++;
				idx = 0;
			}
		} else result[idx++] = string[i];
	result[idx] = EOS;
	if(sliceidx != index)
		result[0] = EOS;
	return result;
}
//-----/ stringslice_c /--------------------------------------------------------
stock stringslice_c(const string[],index,separator=' ')
{
	new
		sliceidx,
		bool:copy,bool:find,
		result[256],idx
	;
	for(new i,t=strlen(string); i<t; i++)
	{
		if(!copy)
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
						copy = true;
					find = true;
				}
			}
		if(copy)
			result[idx++] = string[i];
	}
	return result;
}
//-----/ strfloat /-------------------------------------------------------------
stock strfloat(Float:convert_float)
{
	new change[10];
	format(change,sizeof(change),"%f",convert_float);
	return change;
}
//-----/ strblank /-------------------------------------------------------------
stock strblank(input[])
{
	new string[1024];
	if(strlen(input))
		strcpy(string,input);
	else
		strcpy(string,"/Empty/");
	return string;
}
//-----/ strupper /-------------------------------------------------------------
stock strupper(string[])
{
	new offset = 'a'-'A';
	for(new i,t=strlen(string); i<t; i++)
		if(string[i] >= 'a' && string[i] <= 'z')
			string[i] -= offset;
}
//-----/ strlower /-------------------------------------------------------------
stock strlower(string[])
{
	new offset = 'a'-'A';
	for(new i,t=strlen(string); i<t; i++)
		if(string[i] >= 'A' && string[i] <= 'Z')
			string[i] += offset;
}
//-----/ strtrim /--------------------------------------------------------------
stock strtrim(string[],length,bool:ellipsis=false)
{
	if(ellipsis)
		for(new i=length-1; i>=length-3 && i>=0; i--)
			string[i] = '.';
	string[length] = '\0';
}
//-----/ strreverse /-----------------------------------------------------------
stock strreverse(string[])
{
	new ret[128],idx;
	for(new i=strlen(string)-1; i>=0; i--)
		ret[idx++] = string[i];
	ret[idx] = '\0';
	return ret;
	/*
	// 원본 변수 수정 방식
	new temp;
	for(new i,j=strlen(string),k=j/2; i<k; i++)
	{
		temp = string[i];
		string[i] = string[j-1-i];
		string[j-1-i] = temp;
	}
	*/
}
//-----/ RemoveSpaceInString /--------------------------------------------------
stock RemoveSpaceInString(string[])
{
	new result[256],idx,i;
	for(new t=strlen(string); i<t; i++)
	{
		if(string[i] == ' ')
			continue;
		result[idx++] = string[i];
	}
	result[idx] = '\0';
	return result;
}
//-----/ GetStringSlices /------------------------------------------------------
stock GetStringSlices(string[])
{
	new len = strlen(string), slices = 1;
	if(!len)
		return 0;
	for(new i,t=strlen(string); i<t; i++)
		if(string[i] == ' ')
			slices ++;
	return slices;
}
//-----/ StringToHex /----------------------------------------------------------
stock StringToHex(input[])
{
	new
		idx = strlen(input)-1,
		offset = 1,output
	;
	for(; idx>=0; idx--)
	{
		if(input[idx] >= 'A' && input[idx] <= 'Z')
		{
			output += (10+input[idx]-'A')*offset;
			offset *= 16;
		}
		else if(input[idx] >= 'a' && input[idx] <= 'z')
		{
			output += (10+input[idx]-'a')*offset;
			offset *= 16;
		}
		else if(input[idx] >= '0' && input[idx] <= '9')
		{
			output += (input[idx]-'0')*offset;
			offset *= 16;
		}
		else return 0;
	}
	return output;
}
//-----/ GetCharWidth /---------------------------------------------------------
stock Float:GetCharWidth(ch)
{
	//len < 14
	if(ch < 'a' || ch > 'z')
		return 0.0;
	switch(ch)
	{
		case 'i','j','l': return 1.0;
		case 'f','t': return 1.25;
		case 'r': return 1.5;
		case 'y': return 1.67;
		case 'a','c','k','s','x','z': return 2.0;
		case 'b','d','e','g','h','n','o','p','q','u','v': return 2.25;
		case 'w': return 2.71;
		case 'm': return 3.0;
	}
	return 0.0;
}
//-----/ GetStringWidth /-------------------------------------------------------
stock Float:GetStringWidth(string[])
{
	new len = strlen(string),Float:width;
	for(new i; i<len; i++)
		width += GetCharWidth(string[i]);
	return width;
}
//-----/ TrimStringLastChar /---------------------------------------------------
stock TrimStringLastChar(string[],ch = '\0')
{
	new i;
	while(string[i] != '\0')
		i++;
	if(i-- > 0)
		if(ch == '\0' || string[i] == ch)
			string[i] = '\0';
}
//-----/ IntToString /----------------------------------------------------------
stock IntToString(input)
{
	new string[128];
	format(string,sizeof(string),"%d",input);
	return string;
}
//-----/ IsCharKorean /---------------------------------------------------------
stock IsCharKorean(ch)
{
	if((ch & 0x80) == 0x80)
		return 1;
	return 0;
}
//-----/ SliceStringAsLength /--------------------------------------------------
stock SliceStringAsLength(const input[],output[][],length)
{
	new a,b;
	for(new i,t=strlen(input); i<t; i++)
	{
		if(IsCharKorean(input[i]))
		{
			if(b > length-3)
			{
				output[a][b] = '\0';
				a++;
				b = 0;
			}
			output[a][b++] = input[i++];
			output[a][b++] = input[i];
		} else {
			output[a][b++] = input[i];
		}
		if(b > length-2)
		{
			output[a][b] = '\0';
			a++;
			b = 0;
		}
	}
	output[a][b] = '\0';
	return a+1;
}
//-----/ TrimLineBreak /--------------------------------------------------------
stock TrimLineBreak(string[])
{
	for(new i,t=strlen(string); i<t; i++)
	{
		if(string[i] == '\r' || string[i] == '\n')
			string[i] = '\0';
	}
}
//-----/ GetThousandsSeparatedString /------------------------------------------
stock GetThousandsSeparatedString(input)
{
	new
		output[100],idx,
		bool:negative,
		temp
	;
	if(input == 0)
		strcpy(output,"0");
	else {
		if(input < 0)
		{
			negative = true;
			input *= -1;
		}
		while(input)
		{
			if((idx-3) % 4 == 0)
				output[idx++] = ',';
			output[idx++] = '0' + input%10;
			input /= 10;
		}
		if(negative)
			output[idx++] = '-';
		for(new i,t=idx/2; i<t; i++)
		{
			temp = output[i];
			output[i] = output[idx-1-i];
			output[idx-1-i] = temp;
		}
		output[idx] = '\0';
	}
	return output;
}
//-----/ VersionCompare /-------------------------------------------------------
stock VersionCompare(src[],cmp[])
{
	// src < cmp : return 1
	// src >= cmp : return 0
	new
		tmp[20],
		version[2][5],vidx
	;
	// parsing version
	for(new i; i<2; i++)
	{
		if(i == 0)
			strcpy(tmp,src);
		else
			strcpy(tmp,cmp);
		//-----
		vidx = 0;
		for(new j,t=strlen(tmp); j<t; j++)
		{
			if(tmp[j] >= '0' && tmp[j] <= '9')
			{
				if(version[i][vidx] > 0)
					version[i][vidx] *= 10;
				version[i][vidx] += tmp[j] - '0';
			}
			if(tmp[j] == '.')
				vidx++;
		}
	}
	//-----
	// compare version
	for(new i; i<5; i++)
	{
		if(version[0][i] < version[1][i])
			return 1;
		if(version[0][i] > version[1][i])
			return 0;
	}
	return 0;
}
//-----/ GetGreyOrNoColorString /-----------------------------------------------
stock GetGreyOrNoColorString(input)
{
	new string[9];
	if(input)
		strcpy(string,""C_GREY"");
	else
		strcpy(string,"");
	return string;
}





//==========/ String Parse Functions /==========================================
//-----/ ParsePosString /-------------------------------------------------------
stock ParsePosString(input[],&Float:x,&Float:y,&Float:z,&Float:angle=0.0,&interior=0,&virtual=0)
{
	new splited[6][16], pieces = split(input,splited,',');
	switch(pieces)
	{
		case 3: //x,y,z
		{
			x = floatstr(splited[0]);
			y = floatstr(splited[1]);
			z = floatstr(splited[2]);
		}
		case 4: //x,y,z,angle
		{
			x = floatstr(splited[0]);
			y = floatstr(splited[1]);
			z = floatstr(splited[2]);
			angle = floatstr(splited[3]);
		}
		case 5: //x,y,z,int,vw
		{
			x = floatstr(splited[0]);
			y = floatstr(splited[1]);
			z = floatstr(splited[2]);
			interior = strval(splited[3]);
			virtual = strval(splited[4]);
		}
		case 6: //x,y,z,angle,int,vw
		{
			x = floatstr(splited[0]);
			y = floatstr(splited[1]);
			z = floatstr(splited[2]);
			angle = floatstr(splited[3]);
			interior = strval(splited[4]);
			virtual = strval(splited[5]);
		}
	}
}





//==========/ Time Functions /==================================================
//-----/ ConvertTimeStringToSeconds /-------------------------------------------
stock ConvertTimeStringToSeconds(input[])
{
	new
		splited[20][32],pieces,
		number,unit[32],
		seconds
	;
	pieces = split(input,splited,' ');
	for(new i; i<pieces; i++)
	{
		number = 0;
		for(new j,t=strlen(splited[i]); j<t; j++)
		{
			if(splited[i][j] >= '0' && splited[i][j] <= '9')
			{
				number *= 10;
				number += splited[i][j] - '0';
			} else {
				strmid(unit,splited[i],j,t);
				if(!strcmp("초",unit))
					seconds += number;
				else if(!strcmp("분",unit))
					seconds += number*60;
				else if(!strcmp("시간",unit))
					seconds += number*3600;
				break;
			}
		}
	}
	return seconds;
}
//-----/ ConvertSecondsToTimeString /-------------------------------------------
stock ConvertSecondsToTimeString(seconds)
{
	new
		string[128],
		h,m,s
	;
	h = seconds / 3600;
	m = (seconds % 3600) / 60;
	s = seconds % 60;
	if(h) format(string,sizeof(string),"%s%d시간 ",string,h);
	if(m) format(string,sizeof(string),"%s%d분 ",string,m);
	if(s) format(string,sizeof(string),"%s%d초 ",string,s);
	if(!strlen(string))
		strcpy(string,"시간 없음");
	else
		string[strlen(string)-1] = '\0';
	return string;
}
//-----/ ConvertDateToDays /----------------------------------------------------
stock ConvertDateToDays(year,month,day,YEAR_OFFSET=2016)
{
	new result;
	for(new i=YEAR_OFFSET; i<year; i++)
		result += IsLeapYear(i) ? 366 : 365;
	for(new i=1; i<month; i++)
		result += GetDaysOfMonth(year,i);
	result += day;
	return result;
}
//-----/ GetDaysOfMonth /-------------------------------------------------------
stock GetDaysOfMonth(year,month)
{
	new days[] = {31,28,31,30,31,30,31,31,30,31,30,31};
	if(month == 2 && IsLeapYear(year))
		return days[1] + 1;
	return days[month-1];
}
//-----/ IsLeapYear /-----------------------------------------------------------
stock IsLeapYear(year)
{
	if(year % 4 == 0 && year % 100 != 0 || year % 400 == 0)
		return 1;
	return 0;
}
//-----/ IsTodayBetweenPeriods /------------------------------------------------
stock IsTodayBetweenPeriods(start_y,start_m,start_d, end_y,end_m,end_d)
{
	new today_y,today_m,today_d, a,b,c;
	getdate(today_y,today_m,today_d);
	a = ConvertDateToDays(start_y,start_m,start_d);
	b = ConvertDateToDays(end_y,end_m,end_d);
	c = ConvertDateToDays(today_y,today_m,today_d);
	if(c >= a && c <= b)
		return 1;
	return 0;
}





//==========/ INI Functions /===================================================
stock INI_GetKeyAndValue(const string[],key[],value[])
{
	new
		bool:keyvalue,
		idx = -1,len_k,len_v
	;
	while(idx < 192)
	{
		idx++;
		if(string[idx] == '\r' || string[idx] == '\n' || string[idx] == '\0')
			break;
		if(string[idx] == '=')
		{
			if(keyvalue)
				return 0;
			keyvalue = true;
			continue;
		}
		if(keyvalue)
			value[len_v++] = string[idx];
		else
			key[len_k++] = string[idx];
	}
	if(len_k == 0 || len_v == 0)
		return 0;
	key[len_k] = '\0';
	value[len_v] = '\0';
	return 1;
}





//==========/ Chatting Functions /==============================================
//-----/ ClearChatting /--------------------------------------------------------
stock ClearChatting(playerid)
{
	for(new i; i<20; i++)
		SendClientMessage(playerid,-1," ");
}
//-----/ ClearChattingToAll /---------------------------------------------------
stock ClearChattingToAll()
{
	for(new i; i<20; i++)
		SendClientMessageToAll(-1," ");
}
//-----/ ClearDialog/-----------------------------------------------------------
stock ClearDialog(playerid)
	ShowPlayerDialog(playerid,-1,DIALOG_STYLE_MSGBOX,"c","c","c","");
//-----/ ClearDialogToAll/------------------------------------------------------
stock ClearDialogToAll()
	for(new i,t=GetMaxPlayers(); i<t; i++)
		ShowPlayerDialog(i,-1,DIALOG_STYLE_MSGBOX,"c","c","c","");
//-----/ SendClientMessageToPoint /---------------------------------------------
stock SendClientMessageToPoint(color,text[],Float:x,Float:y,Float:z,Float:range)
{
	for(new i,t=GetMaxPlayers(); i<t; i++)
		if(IsPlayerInRangeOfPoint(i,range,x,y,z))
			SendClientMessage(i,color,text);
	return 1;
}
//-----/ SendClientMessageToNearPlayer /----------------------------------------
stock SendClientMessageToNearPlayer(playerid,const message[],Float:distance,color1,color2,color3,color4,color5,bool:except_playerself=false)
{
	new
		Float:between_dist,
		pint = GetPlayerInterior(playerid),
		pvw = GetPlayerVirtualWorld(playerid)
	;
	for(new i=0,t=GetMaxPlayers(); i<t; i++)
		if(GetPlayerInterior(i) == pint && GetPlayerVirtualWorld(i) == pvw)
		{
			if(except_playerself && playerid == i)
				continue;
			between_dist = GetDistanceBetweenPlayers(playerid,i);
			if(between_dist <= floatdiv(distance,16))
				SendClientMessage(i,color1,message);
			else if(between_dist <= floatdiv(distance,8))
				SendClientMessage(i,color2,message);
			else if(between_dist <= floatdiv(distance,4))
				SendClientMessage(i,color3,message);
			else if(between_dist <= floatdiv(distance,2))
				SendClientMessage(i,color4,message);
			else if(between_dist <= floatdiv(distance,1))
				SendClientMessage(i,color5,message);
		}
	return 1;
}





//==========/ Vehicle Functions /===============================================
//-----/ GetVehicleComponentInfo /----------------------------------------------
stock GetVehicleComponentInfo(componentid,name[],&categoryid)
{
	/*
	http://gta.wikia.com/wiki/TransFender
	http://gta.wikia.com/wiki/Wheel_Arch_Angels
	http://gta.wikia.com/wiki/Loco_Low_Co.
	*/
	enum eComponentInfo
	{
		ecID,
		ecName[40],
		ecCategoryID
	}
	new ComponentInfo[195][eComponentInfo] = {
		{500,"Paintjob 1",0},
		{501,"Paintjob 2",0},
		{502,"Paintjob 3",0},
		{1000,"Pro Spoiler",11},
		{1001,"Win Spoiler",11},
		{1002,"Drag Spoiler",11},
		{1003,"Alpha Spoiler",11},
		{1004,"Champ Scoop",1},
		{1005,"Fury Scoop",1},
		{1006,"Roof Scoop",10},
		{1007,"Right Side Skirts",12},
		{1008,"x5 Nitrous",16},
		{1009,"x2 Nitrous",16},
		{1010,"x10 Nitrous",16},
		{1011,"Race Scoop",1},
		{1012,"Worx Scoop",1},
		{1013,"Round Fog Lamp",4},
		{1014,"Champ Spoiler",11},
		{1015,"Race Spoiler",11},
		{1016,"Worx Spoiler",11},
		{1017,"Left Side Skirts",12},
		{1018,"Upswept Exhaust",3},
		{1019,"Twin Exhaust",3},
		{1020,"Large Exhaust",3},
		{1021,"Medium Exhaust",3},
		{1022,"Small Exhaust",3},
		{1023,"Fury Spoiler",11},
		{1024,"Square Fog Lamp",4},
		{1025,"Offroad",13},
		{1026,"Right Alien",12},
		{1027,"Left Alien",12},
		{1028,"Alien Exhaust",3},
		{1029,"X-Flow Exhaust",3},
		{1030,"Left X-Flow",12},
		{1031,"Right X-Flow",12},
		{1032,"Alien Roof Vent",10},
		{1033,"X-Flow Roof Vent",10},
		{1034,"Alien Exhaust",3},
		{1035,"X-Flow Roof Vent",10},
		{1036,"Right Alien",12},
		{1037,"X-Flow Exhaust",3},
		{1038,"Alien Roof Vent",10},
		{1039,"Left X-Flow",12},
		{1040,"Left Alien",12},
		{1041,"Right X-Flow",12},
		{1042,"Right Chrome Strips",12},
		{1043,"Slamin Exhaust",3},
		{1044,"Chromer Exhaust",3},
		{1045,"X-Flow Exhaust",3},
		{1046,"Alien Exhaust",3},
		{1047,"Right Alien",12},
		{1048,"Right X-Flow",12},
		{1049,"Alien Spoiler",11},
		{1050,"X-Flow Spoiler",11},
		{1051,"Left Alien",12},
		{1052,"Left X-Flow",12},
		{1053,"X-Flow Roof Vent",10},
		{1054,"Alien Roof Vent",10},
		{1055,"Alien Roof Vent",10},
		{1056,"Right Alien",12},
		{1057,"Right X-Flow",12},
		{1058,"Alien Spoiler",11},
		{1059,"X-Flow Exhaust",3},
		{1060,"X-Flow Spoiler",11},
		{1061,"X-Flow Roof Vent",10},
		{1062,"Left Alien",12},
		{1063,"Left X-Flow",12},
		{1064,"Alien Exhaust",3},
		{1065,"Alien Exhaust",3},
		{1066,"X-Flow Exhaust",3},
		{1067,"Alien Roof Vent",10},
		{1068,"X-Flow Roof Vent",10},
		{1069,"Right Alien",12},
		{1070,"Right X-Flow",12},
		{1071,"Left Alien",12},
		{1072,"Left X-Flow",12},
		{1073,"Shadow",13},
		{1074,"Mega",13},
		{1075,"Rimshine",13},
		{1076,"Wires",13},
		{1077,"Classic",13},
		{1078,"Twist",13},
		{1079,"Cutter",13},
		{1080,"Switch",13},
		{1081,"Grove",13},
		{1082,"Import",13},
		{1083,"Dollar",13},
		{1084,"Trance",13},
		{1085,"Atomic",13},
		{1086,"Bass Boost",14},
		{1087,"Hydraulics",15},
		{1088,"Alien Roof Vent",10},
		{1089,"X-Flow Exhaust",3},
		{1090,"Right Alien",12},
		{1091,"X-Flow Roof Vent",10},
		{1092,"Alien Exhaust",3},
		{1093,"Right X-Flow",12},
		{1094,"Left Alien",12},
		{1095,"Right X-Flow",12},
		{1096,"Ahab",13},
		{1097,"Virtual",13},
		{1098,"Access",13},
		{1099,"Left Chrome Strips",12},
		{1100,"Chrome Grill",7},
		{1101,"Left Chrome Flames",12},
		{1102,"Left Chrome Strips",12},
		{1103,"Covertible Roof",10},
		{1104,"Chromer Exhaust",3},
		{1105,"Slamin Exhaust",3},
		{1106,"Right Chrome Arches",12},
		{1107,"Left Chrome Strips",12},
		{1108,"Right Chrome Strips",12},
		{1109,"Chromer Bullbar",9},
		{1110,"Slamin Bullbar",9},
		{1113,"Chromer Exhaust",3},
		{1114,"Slamin Exhaust",3},
		{1115,"Chromer Bullbar",6},
		{1116,"Slamin Bullbar",6},
		{1117,"Chromer Front Bumper",5},
		{1118,"Right Chrome Trim",12},
		{1119,"Right Wheelcovers",12},
		{1120,"Left Chrome Trim",12},
		{1121,"Left Wheelcovers",12},
		{1122,"Right Chrome Flames",12},
		{1123,"Chrome Bars",7},
		{1124,"Left Chrome Arches",12},
		{1125,"Chrome Lights",7},
		{1126,"Chromer Exhaust",3},
		{1127,"Slamin Exhaust",3},
		{1128,"Vinyl Hardtop",10},
		{1129,"Chromer Exhaust",3},
		{1130,"Hardtop",10},
		{1131,"Softtop",10},
		{1132,"Slamin Exhaust",3},
		{1133,"Right Chrome Strips",12},
		{1134,"Right Chrome Strips",12},
		{1135,"Slamin Exhaust",3},
		{1136,"Chromer Exhaust",3},
		{1137,"Left Chrome Strips",12},
		{1138,"Alien Spoiler",11},
		{1139,"X-Flow Spoiler",11},
		{1140,"X-Flow Rear Bumper",8},
		{1141,"Alien Rear Bumper",8},
		{1142,"Left Oval Vents",2},
		{1143,"Right Oval Vents",2},
		{1144,"Left Square Vents",2},
		{1145,"Right Square Vents",2},
		{1146,"X-Flow Spoiler",11},
		{1147,"Alien Spoiler",11},
		{1148,"X-Flow Rear Bumper",8},
		{1149,"Alien Rear Bumper",8},
		{1150,"Alien Rear Bumper",8},
		{1151,"X-Flow Rear Bumper",8},
		{1152,"X-Flow Front Bumper",5},
		{1153,"Alien Front Bumper",5},
		{1154,"Alien Rear Bumper",8},
		{1155,"Alien Front Bumper",5},
		{1156,"X-Flow Rear Bumper",8},
		{1157,"X-Flow Front Bumper",5},
		{1158,"X-Flow Spoiler",11},
		{1159,"Alien Rear Bumper",8},
		{1160,"Alien Front Bumper",5},
		{1161,"X-Flow Rear Bumper",8},
		{1162,"Alien Spoiler",11},
		{1163,"X-Flow Spoiler",11},
		{1164,"Alien Spoiler",11},
		{1165,"X-Flow Front Bumper",5},
		{1166,"Alien Front Bumper",5},
		{1167,"X-Flow Rear Bumper",8},
		{1168,"Alien Rear Bumper",8},
		{1169,"Alien Front Bumper",5},
		{1170,"X-Flow Front Bumper",5},
		{1171,"Alien Front Bumper",5},
		{1172,"X-Flow Front Bumper",5},
		{1173,"X-Flow Front Bumper",5},
		{1174,"Chromer Front Bumper",5},
		{1175,"Slamin Front Bumper",5},
		{1176,"Chromer Rear Bumper",8},
		{1177,"Slamin Rear Bumper",8},
		{1178,"Slamin Rear Bumper",8},
		{1179,"Chromer Front Bumper",5},
		{1180,"Chromer Rear Bumper",8},
		{1181,"Slamin Front Bumper",5},
		{1182,"Chromer Front Bumper",5},
		{1183,"Slamin Rear Bumper",8},
		{1184,"Chromer Rear Bumper",8},
		{1185,"Slamin Front Bumper",5},
		{1186,"Slamin Rear Bumper",8},
		{1187,"Chromer Rear Bumper",8},
		{1188,"Slamin Front Bumper",5},
		{1189,"Chromer Front Bumper",5},
		{1190,"Slamin Front Bumper",5},
		{1191,"Chromer Front Bumper",5},
		{1192,"Chromer Rear Bumper",8},
		{1193,"Slamin Rear Bumper",8}
	};
	for(new i; i<192; i++)
	{
		if(ComponentInfo[i][ecID] == componentid)
		{
			strcpy(name,ComponentInfo[i][ecName]);
			categoryid = ComponentInfo[i][ecCategoryID];
			break;
		}
	}
}
//-----/ GetPairedComponentID /-------------------------------------------------
stock GetPairedComponentID(componentid)
{
	new PairedComponents[22][2] = {
		{1090,1094},
		{1069,1071},
		{1056,1062},
		{1047,1051},
		{1036,1040},
		{1026,1027},
		{1106,1124},
		{1101,1122},
		{1134,1137},
		{1107,1108},
		{1102,1133},
		{1042,1099},
		{1118,1120},
		{1142,1143},
		{1007,1017},
		{1144,1145},
		{1119,1121},
		{1070,1072},
		{1057,1063},
		{1048,1052},
		{1039,1041},
		{1030,1031}
	};
	for(new i; i<22; i++)
	{
		if(PairedComponents[i][0] == componentid)
			return PairedComponents[i][1];
		if(PairedComponents[i][1] == componentid)
			return PairedComponents[i][0];
	}
	return 0;
}
//-----/ GetComponentCategoryName /---------------------------------------------
stock GetComponentCategoryName(categoryid)
{
	new string[32];
	switch(categoryid)
	{
		case 0: strcpy(string,"Paint Jobs");
		case 1: strcpy(string,"Hood");
		case 2: strcpy(string,"Vents");
		case 3: strcpy(string,"Exhausts");
		case 4: strcpy(string,"Lights");
		case 5: strcpy(string,"Front Bumper");
		case 6: strcpy(string,"Front Bullbars");
		case 7: strcpy(string,"Misc");
		case 8: strcpy(string,"Rear Bumper");
		case 9: strcpy(string,"Rear Bullbars");
		case 10: strcpy(string,"Roof");
		case 11: strcpy(string,"Spoiler");
		case 12: strcpy(string,"Side Skirts");
		case 13: strcpy(string,"Wheels");
		case 14: strcpy(string,"Car Stereo");
		case 15: strcpy(string,"Hydraulics");
		case 16: strcpy(string,"Nitro");
	}
	return string;
}
//-----/ GetVehicleAvailableComponents /----------------------------------------
stock GetVehicleAvailableComponents(modelid,components[]) // components[43]
{
	new AvailableComponents[212][43] = { // idx: 0~211 (model: 400~611)
		{1020,1021,1019,1018,1013,1024,1082,1085,1096,1097,1098,1025,1074,1081,1078,1076,1079,1075,1080,1073,1077,1083,1084,1086,1087,1009,1008,1010},
		{1005,1004,1142,1143,1144,1145,1020,1019,1013,1006,1001,1003,1017,1007,1082,1085,1096,1097,1098,1025,1074,1081,1078,1076,1079,1075,1080,1073,1077,1083,1084,1086,1087,1009,1008,1010},
		{1082,1085,1096,1097,1098,1025,1074,1081,1078,1076,1079,1075,1080,1073,1077,1083,1084,1086,1087,1009,1008,1010},
		{1082,1085,1096,1097,1098,1025,1074,1081,1078,1076,1079,1075,1080,1073,1077,1083,1084,1086,1087,1009,1008,1010},
		{1020,1021,1019,1013,1002,1016,1000,1007,1017,1082,1085,1096,1097,1098,1025,1074,1081,1078,1076,1079,1075,1080,1073,1077,1083,1084,1086,1087,1009,1008,1010},
		{1020,1021,1019,1018,1001,1014,1023,1000,1082,1085,1096,1097,1098,1025,1074,1081,1078,1076,1079,1075,1080,1073,1077,1083,1084,1086,1087,1009,1008,1010},
		{1082,1085,1096,1097,1098,1025,1074,1081,1078,1076,1079,1075,1080,1073,1077,1083,1084,1086,1087,1009,1008,1010},
		{1082,1085,1096,1097,1098,1025,1074,1081,1078,1076,1079,1075,1080,1073,1077,1083,1084,1086,1087,1009,1008,1010},
		{1082,1085,1096,1097,1098,1025,1074,1081,1078,1076,1079,1075,1080,1073,1077,1083,1084,1086,1087,1009,1008,1010},
		{1082,1085,1096,1097,1098,1025,1074,1081,1078,1076,1079,1075,1080,1073,1077,1083,1084,1086,1087,1009,1008,1010},
		{1020,1021,1019,1013,1024,1001,1023,1003,1007,1017,1082,1085,1096,1097,1098,1025,1074,1081,1078,1076,1079,1075,1080,1073,1077,1083,1084,1086,1087,1009,1008,1010},
		{1082,1085,1096,1097,1098,1025,1074,1081,1078,1076,1079,1075,1080,1073,1077,1083,1084,1086,1087,1009,1008,1010},
		{1082,1085,1096,1097,1098,1025,1074,1081,1078,1076,1079,1075,1080,1073,1077,1083,1084,1086,1087,1009,1008,1010},
		{1082,1085,1096,1097,1098,1025,1074,1081,1078,1076,1079,1075,1080,1073,1077,1083,1084,1086,1087,1009,1008,1010},
		{1082,1085,1096,1097,1098,1025,1074,1081,1078,1076,1079,1075,1080,1073,1077,1083,1084,1086,1087,1009,1008,1010},
		{1019,1018,1001,1023,1003,1007,1017,1082,1085,1096,1097,1098,1025,1074,1081,1078,1076,1079,1075,1080,1073,1077,1083,1084,1086,1087,1009,1008,1010},
		{1082,1085,1096,1097,1098,1025,1074,1081,1078,1076,1079,1075,1080,1073,1077,1083,1084,1086,1087,1009,1008,1010},
		{1082,1085,1096,1097,1098,1025,1074,1081,1078,1076,1079,1075,1080,1073,1077,1083,1084,1086,1087,1009,1008,1010},
		{1020,1021,1006,1002,1016,1082,1085,1096,1097,1098,1025,1074,1081,1078,1076,1079,1075,1080,1073,1077,1083,1084,1086,1087,1009,1008,1010},
		{1082,1085,1096,1097,1098,1025,1074,1081,1078,1076,1079,1075,1080,1073,1077,1083,1084,1086,1087,1009,1008,1010},
		{1005,1004,1021,1019,1001,1003,1082,1085,1096,1097,1098,1025,1074,1081,1078,1076,1079,1075,1080,1073,1077,1083,1084,1086,1087,1009,1008,1010},
		{1020,1021,1019,1018,1014,1023,1016,1000,1082,1085,1096,1097,1098,1025,1074,1081,1078,1076,1079,1075,1080,1073,1077,1083,1084,1086,1087,1009,1008,1010},
		{1020,1021,1019,1013,1007,1017,1082,1085,1096,1097,1098,1025,1074,1081,1078,1076,1079,1075,1080,1073,1077,1083,1084,1086,1087,1009,1008,1010},
		{1082,1085,1096,1097,1098,1025,1074,1081,1078,1076,1079,1075,1080,1073,1077,1083,1084,1086,1087,1009,1008,1010},
		{1082,1085,1096,1097,1098,1025,1074,1081,1078,1076,1079,1075,1080,1073,1077,1083,1084,1086,1087,1009,1008,1010},
		{1082,1085,1096,1097,1098,1025,1074,1081,1078,1076,1079,1075,1080,1073,1077,1083,1084,1086,1087,1009,1008,1010},
		{1005,1004,1021,1019,1006,1001,1003,1082,1085,1096,1097,1098,1025,1074,1081,1078,1076,1079,1075,1080,1073,1077,1083,1084,1086,1087,1009,1008,1010},
		{1082,1085,1096,1097,1098,1025,1074,1081,1078,1076,1079,1075,1080,1073,1077,1083,1084,1086,1087,1009,1008,1010},
		{1082,1085,1096,1097,1098,1025,1074,1081,1078,1076,1079,1075,1080,1073,1077,1083,1084,1086,1087,1009,1008,1010},
		{1082,1085,1096,1097,1098,1025,1074,1081,1078,1076,1079,1075,1080,1073,1077,1083,1084,1086,1087,1009,1008,1010},
		{},
		{1082,1085,1096,1097,1098,1025,1074,1081,1078,1076,1079,1075,1080,1073,1077,1083,1084,1086,1087,1009,1008,1010},
		{1082,1085,1096,1097,1098,1025,1074,1081,1078,1076,1079,1075,1080,1073,1077,1083,1084,1086,1087,1009,1008,1010},
		{1082,1085,1096,1097,1098,1025,1074,1081,1078,1076,1079,1075,1080,1073,1077,1083,1084,1086,1087,1009,1008,1010},
		{1082,1085,1096,1097,1098,1025,1074,1081,1078,1076,1079,1075,1080,1073,1077,1083,1084,1086,1087,1009,1008,1010},
		{1082,1085,1096,1097,1098,1025,1074,1081,1078,1076,1079,1075,1080,1073,1077,1083,1084,1086,1087,1009,1008,1010},
		{1020,1021,1022,1019,1013,1006,1001,1003,1007,1017,1082,1085,1096,1097,1098,1025,1074,1081,1078,1076,1079,1075,1080,1073,1077,1083,1084,1086,1087,1009,1008,1010},
		{1082,1085,1096,1097,1098,1025,1074,1081,1078,1076,1079,1075,1080,1073,1077,1083,1084,1086,1087,1009,1008,1010},
		{1082,1085,1096,1097,1098,1025,1074,1081,1078,1076,1079,1075,1080,1073,1077,1083,1084,1086,1087,1009,1008,1010},
		{1142,1143,1144,1145,1013,1001,1023,1003,1007,1017,1082,1085,1096,1097,1098,1025,1074,1081,1078,1076,1079,1075,1080,1073,1077,1083,1084,1086,1087,1009,1008,1010},
		{1082,1085,1096,1097,1098,1025,1074,1081,1078,1076,1079,1075,1080,1073,1077,1083,1084,1086,1087,1009,1008,1010},
		{1082,1085,1096,1097,1098,1025,1074,1081,1078,1076,1079,1075,1080,1073,1077,1083,1084,1086,1087,1009,1008,1010},
		{1082,1085,1096,1097,1098,1025,1074,1081,1078,1076,1079,1075,1080,1073,1077,1083,1084,1086,1087,1009,1008,1010},
		{1082,1085,1096,1097,1098,1025,1074,1081,1078,1076,1079,1075,1080,1073,1077,1083,1084,1086,1087,1009,1008,1010},
		{1082,1085,1096,1097,1098,1025,1074,1081,1078,1076,1079,1075,1080,1073,1077,1083,1084,1086,1087,1009,1008,1010},
		{1082,1085,1096,1097,1098,1025,1074,1081,1078,1076,1079,1075,1080,1073,1077,1083,1084,1086,1087,1009,1008,1010},
		{},
		{1082,1085,1096,1097,1098,1025,1074,1081,1078,1076,1079,1075,1080,1073,1077,1083,1084,1086,1087,1009,1008,1010},
		{},
		{},
		{1082,1085,1096,1097,1098,1025,1074,1081,1078,1076,1079,1075,1080,1073,1077,1083,1084,1086,1087,1009,1008,1010},
		{1082,1085,1096,1097,1098,1025,1074,1081,1078,1076,1079,1075,1080,1073,1077,1083,1084,1086,1087,1009,1008,1010},
		{},
		{},
		{},
		{1082,1085,1096,1097,1098,1025,1074,1081,1078,1076,1079,1075,1080,1073,1077,1083,1084,1086,1087,1009,1008,1010},
		{1082,1085,1096,1097,1098,1025,1074,1081,1078,1076,1079,1075,1080,1073,1077,1083,1084,1086,1087,1009,1008,1010},
		{1082,1085,1096,1097,1098,1025,1074,1081,1078,1076,1079,1075,1080,1073,1077,1083,1084,1086,1087,1009,1008,1010},
		{1082,1085,1096,1097,1098,1025,1074,1081,1078,1076,1079,1075,1080,1073,1077,1083,1084,1086,1087,1009,1008,1010},
		{1082,1085,1096,1097,1098,1025,1074,1081,1078,1076,1079,1075,1080,1073,1077,1083,1084,1086,1087,1009,1008,1010},
		{1082,1085,1096,1097,1098,1025,1074,1081,1078,1076,1079,1075,1080,1073,1077,1083,1084,1086,1087,1009,1008,1010},
		{},
		{},
		{},
		{1082,1085,1096,1097,1098,1025,1074,1081,1078,1076,1079,1075,1080,1073,1077,1083,1084,1086,1087,1009,1008,1010},
		{1082,1085,1096,1097,1098,1025,1074,1081,1078,1076,1079,1075,1080,1073,1077,1083,1084,1086,1087,1009,1008,1010},
		{1082,1085,1096,1097,1098,1025,1074,1081,1078,1076,1079,1075,1080,1073,1077,1083,1084,1086,1087,1009,1008,1010},
		{1082,1085,1096,1097,1098,1025,1074,1081,1078,1076,1079,1075,1080,1073,1077,1083,1084,1086,1087,1009,1008,1010},
		{},
		{1082,1085,1096,1097,1098,1025,1074,1081,1078,1076,1079,1075,1080,1073,1077,1083,1084,1086,1087,1009,1008,1010},
		{1082,1085,1096,1097,1098,1025,1074,1081,1078,1076,1079,1075,1080,1073,1077,1083,1084,1086,1087,1009,1008,1010},
		{1082,1085,1096,1097,1098,1025,1074,1081,1078,1076,1079,1075,1080,1073,1077,1083,1084,1086,1087,1009,1008,1010},
		{},
		{},
		{1082,1085,1096,1097,1098,1025,1074,1081,1078,1076,1079,1075,1080,1073,1077,1083,1084,1086,1087,1009,1008,1010},
		{1082,1085,1096,1097,1098,1025,1074,1081,1078,1076,1079,1075,1080,1073,1077,1083,1084,1086,1087,1009,1008,1010},
		{1082,1085,1096,1097,1098,1025,1074,1081,1078,1076,1079,1075,1080,1073,1077,1083,1084,1086,1087,1009,1008,1010},
		{1020,1021,1019,1018,1006,1007,1017,1082,1085,1096,1097,1098,1025,1074,1081,1078,1076,1079,1075,1080,1073,1077,1083,1084,1086,1087,1009,1008,1010},
		{1005,1004,1012,1020,1021,1022,1013,1024,1082,1085,1096,1097,1098,1025,1074,1081,1078,1076,1079,1075,1080,1073,1077,1083,1084,1086,1087,1009,1008,1010},
		{1082,1085,1096,1097,1098,1025,1074,1081,1078,1076,1079,1075,1080,1073,1077,1083,1084,1086,1087,1009,1008,1010},
		{1082,1085,1096,1097,1098,1025,1074,1081,1078,1076,1079,1075,1080,1073,1077,1083,1084,1086,1087,1009,1008,1010},
		{},
		{1082,1085,1096,1097,1098,1025,1074,1081,1078,1076,1079,1075,1080,1073,1077,1083,1084,1086,1087,1009,1008,1010},
		{1082,1085,1096,1097,1098,1025,1074,1081,1078,1076,1079,1075,1080,1073,1077,1083,1084,1086,1087,1009,1008,1010},
		{},
		{1082,1085,1096,1097,1098,1025,1074,1081,1078,1076,1079,1075,1080,1073,1077,1083,1084,1086,1087,1009,1008,1010},
		{1082,1085,1096,1097,1098,1025,1074,1081,1078,1076,1079,1075,1080,1073,1077,1083,1084,1086,1087,1009,1008,1010},
		{1082,1085,1096,1097,1098,1025,1074,1081,1078,1076,1079,1075,1080,1073,1077,1083,1084,1086,1087,1009,1008,1010},
		{1082,1085,1096,1097,1098,1025,1074,1081,1078,1076,1079,1075,1080,1073,1077,1083,1084,1086,1087,1009,1008,1010},
		{1005,1004,1020,1019,1018,1013,1024,1006,1002,1016,1000,1082,1085,1096,1097,1098,1025,1074,1081,1078,1076,1079,1075,1080,1073,1077,1083,1084,1086,1087,1009,1008,1010},
		{1082,1085,1096,1097,1098,1025,1074,1081,1078,1076,1079,1075,1080,1073,1077,1083,1084,1086,1087,1009,1008,1010},
		{1142,1143,1144,1145,1020,1021,1019,1018,1014,1023,1003,1007,1017,1082,1085,1096,1097,1098,1025,1074,1081,1078,1076,1079,1075,1080,1073,1077,1083,1084,1086,1087,1009,1008,1010},
		{1005,1004,1006,1016,1000,1082,1085,1096,1097,1098,1025,1074,1081,1078,1076,1079,1075,1080,1073,1077,1083,1084,1086,1087,1009,1008,1010},
		{},
		{1082,1085,1096,1097,1098,1025,1074,1081,1078,1076,1079,1075,1080,1073,1077,1083,1084,1086,1087,1009,1008,1010},
		{1082,1085,1096,1097,1098,1025,1074,1081,1078,1076,1079,1075,1080,1073,1077,1083,1084,1086,1087,1009,1008,1010},
		{1011,1142,1143,1020,1019,1006,1001,1002,1023,1003,1007,1017,1082,1085,1096,1097,1098,1025,1074,1081,1078,1076,1079,1075,1080,1073,1077,1083,1084,1086,1087,1009,1008,1010},
		{1082,1085,1096,1097,1098,1025,1074,1081,1078,1076,1079,1075,1080,1073,1077,1083,1084,1086,1087,1009,1008,1010},
		{1082,1085,1096,1097,1098,1025,1074,1081,1078,1076,1079,1075,1080,1073,1077,1083,1084,1086,1087,1009,1008,1010},
		{1082,1085,1096,1097,1098,1025,1074,1081,1078,1076,1079,1075,1080,1073,1077,1083,1084,1086,1087,1009,1008,1010},
		{1020,1021,1019,1013,1024,1082,1085,1096,1097,1098,1025,1074,1081,1078,1076,1079,1075,1080,1073,1077,1083,1084,1086,1087,1009,1008,1010},
		{1082,1085,1096,1097,1098,1025,1074,1081,1078,1076,1079,1075,1080,1073,1077,1083,1084,1086,1087,1009,1008,1010},
		{1082,1085,1096,1097,1098,1025,1074,1081,1078,1076,1079,1075,1080,1073,1077,1083,1084,1086,1087,1009,1008,1010},
		{1082,1085,1096,1097,1098,1025,1074,1081,1078,1076,1079,1075,1080,1073,1077,1083,1084,1086,1087,1009,1008,1010},
		{1082,1085,1096,1097,1098,1025,1074,1081,1078,1076,1079,1075,1080,1073,1077,1083,1084,1086,1087,1009,1008,1010},
		{1082,1085,1096,1097,1098,1025,1074,1081,1078,1076,1079,1075,1080,1073,1077,1083,1084,1086,1087,1009,1008,1010},
		{1082,1085,1096,1097,1098,1025,1074,1081,1078,1076,1079,1075,1080,1073,1077,1083,1084,1086,1087,1009,1008,1010},
		{1082,1085,1096,1097,1098,1025,1074,1081,1078,1076,1079,1075,1080,1073,1077,1083,1084,1086,1087,1009,1008,1010},
		{1082,1085,1096,1097,1098,1025,1074,1081,1078,1076,1079,1075,1080,1073,1077,1083,1084,1086,1087,1009,1008,1010},
		{},
		{},
		{1082,1085,1096,1097,1098,1025,1074,1081,1078,1076,1079,1075,1080,1073,1077,1083,1084,1086,1087,1009,1008,1010},
		{1082,1085,1096,1097,1098,1025,1074,1081,1078,1076,1079,1075,1080,1073,1077,1083,1084,1086,1087,1009,1008,1010},
		{1082,1085,1096,1097,1098,1025,1074,1081,1078,1076,1079,1075,1080,1073,1077,1083,1084,1086,1087,1009,1008,1010},
		{1082,1085,1096,1097,1098,1025,1074,1081,1078,1076,1079,1075,1080,1073,1077,1083,1084,1086,1087,1009,1008,1010},
		{1082,1085,1096,1097,1098,1025,1074,1081,1078,1076,1079,1075,1080,1073,1077,1083,1084,1086,1087,1009,1008,1010},
		{1004,1020,1021,1019,1018,1002,1016,1000,1015,1007,1017,1082,1085,1096,1097,1098,1025,1074,1081,1078,1076,1079,1075,1080,1073,1077,1083,1084,1086,1087,1009,1008,1010},
		{1142,1143,1144,1145,1020,1019,1018,1002,1023,1016,1003,1007,1017,1082,1085,1096,1097,1098,1025,1074,1081,1078,1076,1079,1075,1080,1073,1077,1083,1084,1086,1087,1009,1008,1010},
		{1005,1142,1143,1144,1145,1020,1018,1013,1006,1001,1023,1003,1007,1017,1082,1085,1096,1097,1098,1025,1074,1081,1078,1076,1079,1075,1080,1073,1077,1083,1084,1086,1087,1009,1008,1010},
		{1082,1085,1096,1097,1098,1025,1074,1081,1078,1076,1079,1075,1080,1073,1077,1083,1084,1086,1087,1009,1008,1010},
		{1082,1085,1096,1097,1098,1025,1074,1081,1078,1076,1079,1075,1080,1073,1077,1083,1084,1086,1087,1009,1008,1010},
		{},
		{},
		{},
		{1082,1085,1096,1097,1098,1025,1074,1081,1078,1076,1079,1075,1080,1073,1077,1083,1084,1086,1087,1009,1008,1010},
		{1082,1085,1096,1097,1098,1025,1074,1081,1078,1076,1079,1075,1080,1073,1077,1083,1084,1086,1087,1009,1008,1010},
		{1082,1085,1096,1097,1098,1025,1074,1081,1078,1076,1079,1075,1080,1073,1077,1083,1084,1086,1087,1009,1008,1010},
		{1020,1021,1018,1001,1014,1015,1007,1017,1082,1085,1096,1097,1098,1025,1074,1081,1078,1076,1079,1075,1080,1073,1077,1083,1084,1086,1087,1009,1008,1010},
		{1082,1085,1096,1097,1098,1025,1074,1081,1078,1076,1079,1075,1080,1073,1077,1083,1084,1086,1087,1009,1008,1010},
		{1012,1011,1020,1019,1018,1006,1001,1023,1003,1007,1017,1082,1085,1096,1097,1098,1025,1074,1081,1078,1076,1079,1075,1080,1073,1077,1083,1084,1086,1087,1009,1008,1010},
		{1082,1085,1096,1097,1098,1025,1074,1081,1078,1076,1079,1075,1080,1073,1077,1083,1084,1086,1087,1009,1008,1010},
		{1082,1085,1096,1097,1098,1025,1074,1081,1078,1076,1079,1075,1080,1073,1077,1083,1084,1086,1087,1009,1008,1010},
		{1082,1085,1096,1097,1098,1025,1074,1081,1078,1076,1079,1075,1080,1073,1077,1083,1084,1086,1087,1009,1008,1010},
		{1082,1085,1096,1097,1098,1025,1074,1081,1078,1076,1079,1075,1080,1073,1077,1083,1084,1086,1087,1009,1008,1010},
		{1126,1127,1179,1185,1100,1123,1125,1180,1178,1101,1122,1106,1124,1082,1085,1096,1097,1098,1025,1074,1081,1078,1076,1079,1075,1080,1073,1077,1083,1084,1086,1087,1009,1008,1010},
		{1113,1114,1117,1115,1116,1109,1110,1118,1120,1121,1119,1082,1085,1096,1097,1098,1025,1074,1081,1078,1076,1079,1075,1080,1073,1077,1083,1084,1086,1087,1009,1008,1010},
		{1104,1105,1182,1181,1184,1183,1128,1103,1107,1108,1082,1085,1096,1097,1098,1025,1074,1081,1078,1076,1079,1075,1080,1073,1077,1083,1084,1086,1087,1009,1008,1010},
		{},
		{},
		{1082,1085,1096,1097,1098,1025,1074,1081,1078,1076,1079,1075,1080,1073,1077,1083,1084,1086,1087,1009,1008,1010},
		{1004,1142,1143,1144,1145,1020,1019,1018,1024,1006,1001,1023,1007,1017,1082,1085,1096,1097,1098,1025,1074,1081,1078,1076,1079,1075,1080,1073,1077,1083,1084,1086,1087,1009,1008,1010},
		{1082,1085,1096,1097,1098,1025,1074,1081,1078,1076,1079,1075,1080,1073,1077,1083,1084,1086,1087,1009,1008,1010},
		{1144,1145,1020,1021,1019,1018,1014,1015,1082,1085,1096,1097,1098,1025,1074,1081,1078,1076,1079,1075,1080,1073,1077,1083,1084,1086,1087,1009,1008,1010},
		{1082,1085,1096,1097,1098,1025,1074,1081,1078,1076,1079,1075,1080,1073,1077,1083,1084,1086,1087,1009,1008,1010},
		{1082,1085,1096,1097,1098,1025,1074,1081,1078,1076,1079,1075,1080,1073,1077,1083,1084,1086,1087,1009,1008,1010},
		{1082,1085,1096,1097,1098,1025,1074,1081,1078,1076,1079,1075,1080,1073,1077,1083,1084,1086,1087,1009,1008,1010},
		{1004,1142,1143,1144,1145,1019,1018,1024,1006,1001,1002,1023,1007,1017,1082,1085,1096,1097,1098,1025,1074,1081,1078,1076,1079,1075,1080,1073,1077,1083,1084,1086,1087,1009,1008,1010},
		{1142,1143,1020,1021,1019,1018,1016,1003,1000,1082,1085,1096,1097,1098,1025,1074,1081,1078,1076,1079,1075,1080,1073,1077,1083,1084,1086,1087,1009,1008,1010},
		{1082,1085,1096,1097,1098,1025,1074,1081,1078,1076,1079,1075,1080,1073,1077,1083,1084,1086,1087,1009,1008,1010},
		{1012,1011,1142,1143,1144,1145,1020,1019,1018,1001,1023,1003,1007,1017,1082,1085,1096,1097,1098,1025,1074,1081,1078,1076,1079,1075,1080,1073,1077,1083,1084,1086,1087,1009,1008,1010},
		{1005,1004,1142,1143,1144,1145,1020,1019,1018,1006,1001,1023,1003,1082,1085,1096,1097,1098,1025,1074,1081,1078,1076,1079,1075,1080,1073,1077,1083,1084,1086,1087,1009,1008,1010},
		{1005,1020,1021,1019,1018,1006,1002,1023,1016,1003,1082,1085,1096,1097,1098,1025,1074,1081,1078,1076,1079,1075,1080,1073,1077,1083,1084,1086,1087,1009,1008,1010},
		{1082,1085,1096,1097,1098,1025,1074,1081,1078,1076,1079,1075,1080,1073,1077,1083,1084,1086,1009,1008,1010}, // Utility(552): 1087(Hydraulics) 제거됨
		{1082,1085,1096,1097,1098,1025,1074,1081,1078,1076,1079,1075,1080,1073,1077,1083,1084,1086,1087,1009,1008,1010},
		{1082,1085,1096,1097,1098,1025,1074,1081,1078,1076,1079,1075,1080,1073,1077,1083,1084,1086,1087,1009,1008,1010},
		{1082,1085,1096,1097,1098,1025,1074,1081,1078,1076,1079,1075,1080,1073,1077,1083,1084,1086,1087,1009,1008,1010},
		{1082,1085,1096,1097,1098,1025,1074,1081,1078,1076,1079,1075,1080,1073,1077,1083,1084,1086,1087,1009,1008,1010},
		{1082,1085,1096,1097,1098,1025,1074,1081,1078,1076,1079,1075,1080,1073,1077,1083,1084,1086,1087,1009,1008,1010},
		{1092,1089,1166,1165,1168,1167,1088,1091,1164,1163,1090,1094,1093,1095,1082,1085,1096,1097,1098,1025,1074,1081,1078,1076,1079,1075,1080,1073,1077,1083,1084,1086,1087,1009,1008,1010},
		{1065,1066,1160,1173,1159,1161,1067,1068,1162,1158,1071,1069,1072,1070,1082,1085,1096,1097,1098,1025,1074,1081,1078,1076,1079,1075,1080,1073,1077,1083,1084,1086,1087,1009,1008,1010},
		{1028,1029,1169,1170,1141,1140,1032,1033,1138,1139,1026,1027,1030,1031,1082,1085,1096,1097,1098,1025,1074,1081,1078,1076,1079,1075,1080,1073,1077,1083,1084,1086,1087,1009,1008,1010},
		{1064,1059,1155,1157,1154,1156,1055,1061,1058,1060,1062,1026,1027,1056,1057,1063,1030,1031,1082,1085,1096,1097,1098,1025,1074,1081,1078,1076,1079,1075,1080,1073,1077,1083,1084,1086,1087,1009,1008,1010},
		{1034,1037,1171,1172,1149,1148,1038,1035,1147,1146,1040,1036,1041,1039,1082,1085,1096,1097,1098,1025,1074,1081,1078,1076,1079,1075,1080,1073,1077,1083,1084,1086,1087,1009,1008,1010},
		{1082,1085,1096,1097,1098,1025,1074,1081,1078,1076,1079,1075,1080,1073,1077,1083,1084,1086,1087,1009,1008,1010},
		{1082,1085,1096,1097,1098,1025,1074,1081,1078,1076,1079,1075,1080,1073,1077,1083,1084,1086,1087,1009,1008,1010},
		{1046,1045,1153,1152,1150,1151,1054,1053,1049,1050,1051,1047,1052,1048,1082,1085,1096,1097,1098,1025,1074,1081,1078,1076,1079,1075,1080,1073,1077,1083,1084,1086,1087,1009,1008,1010},
		{1082,1085,1096,1097,1098,1025,1074,1081,1078,1076,1079,1075,1080,1073,1077,1083,1084,1086,1087,1009,1008,1010},
		{1129,1132,1189,1188,1187,1186,1130,1131,1102,1133,1082,1085,1096,1097,1098,1025,1074,1081,1078,1076,1079,1075,1080,1073,1077,1083,1084,1086,1087,1009,1008,1010},
		{1082,1085,1096,1097,1098,1025,1074,1081,1078,1076,1079,1075,1080,1073,1077,1083,1084,1086,1087,1009,1008,1010},
		{},
		{},
		{1082,1085,1096,1097,1098,1025,1074,1081,1078,1076,1079,1075,1080,1073,1077,1083,1084,1086,1087,1009,1008,1010},
		{1082,1085,1096,1097,1098,1025,1074,1081,1078,1076,1079,1075,1080,1073,1077,1083,1084,1086,1087,1009,1008,1010},
		{1082,1085,1096,1097,1098,1025,1074,1081,1078,1076,1079,1075,1080,1073,1077,1083,1084,1086,1087,1009,1008,1010},
		{1082,1085,1096,1097,1098,1025,1074,1081,1078,1076,1079,1075,1080,1073,1077,1083,1084,1086,1087,1009,1008,1010},
		{1044,1043,1174,1175,1176,1177,1099,1042,1082,1085,1096,1097,1098,1025,1074,1081,1078,1076,1079,1075,1080,1073,1077,1083,1084,1086,1087,1009,1008,1010},
		{1136,1135,1191,1190,1192,1193,1134,1137,1082,1085,1096,1097,1098,1025,1074,1081,1078,1076,1079,1075,1080,1073,1077,1083,1084,1086,1087,1009,1008,1010},
		{1082,1085,1096,1097,1098,1025,1074,1081,1078,1076,1079,1075,1080,1073,1077,1083,1084,1086,1087,1009,1008,1010},
		{1082,1085,1096,1097,1098,1025,1074,1081,1078,1076,1079,1075,1080,1073,1077,1083,1084,1086,1087,1009,1008,1010},
		{1082,1085,1096,1097,1098,1025,1074,1081,1078,1076,1079,1075,1080,1073,1077,1083,1084,1086,1087,1009,1008,1010},
		{1020,1018,1006,1001,1023,1007,1017,1082,1085,1096,1097,1098,1025,1074,1081,1078,1076,1079,1075,1080,1073,1077,1083,1084,1086,1087,1009,1008,1010},
		{},
		{1082,1085,1096,1097,1098,1025,1074,1081,1078,1076,1079,1075,1080,1073,1077,1083,1084,1086,1087,1009,1008,1010},
		{1082,1085,1096,1097,1098,1025,1074,1081,1078,1076,1079,1075,1080,1073,1077,1083,1084,1086,1087,1009,1008,1010},
		{1082,1085,1096,1097,1098,1025,1074,1081,1078,1076,1079,1075,1080,1073,1077,1083,1084,1086,1087,1009,1008,1010},
		{1142,1143,1144,1020,1021,1022,1019,1018,1013,1024,1006,1014,1002,1023,1016,1003,1000,1015,1017,1007,1082,1085,1096,1097,1098,1025,1074,1081,1078,1076,1079,1075,1080,1073,1077,1083,1084,1086,1087,1009,1008,1010},
		{},
		{1082,1085,1096,1097,1098,1025,1074,1081,1078,1076,1079,1075,1080,1073,1077,1083,1084,1086,1087,1009,1008,1010},
		{1082,1085,1096,1097,1098,1025,1074,1081,1078,1076,1079,1075,1080,1073,1077,1083,1084,1086,1087,1009,1008,1010},
		{1005,1004,1144,1145,1020,1018,1013,1024,1006,1016,1000,1017,1007,1082,1085,1096,1097,1098,1025,1074,1081,1078,1076,1079,1075,1080,1073,1077,1083,1084,1086,1087,1009,1008,1010},
		{},
		{1082,1085,1096,1097,1098,1025,1074,1081,1078,1076,1079,1075,1080,1073,1077,1083,1084,1086,1087,1009,1008,1010},
		{1082,1085,1096,1097,1098,1025,1074,1081,1078,1076,1079,1075,1080,1073,1077,1083,1084,1086,1087,1009,1008,1010},
		{1082,1085,1096,1097,1098,1025,1074,1081,1078,1076,1079,1075,1080,1073,1077,1083,1084,1086,1087,1009,1008,1010},
		{1082,1085,1096,1097,1098,1025,1074,1081,1078,1076,1079,1075,1080,1073,1077,1083,1084,1086,1087,1009,1008,1010},
		{},
		{1082,1085,1096,1097,1098,1025,1074,1081,1078,1076,1079,1075,1080,1073,1077,1083,1084,1086,1087,1009,1008,1010},
		{1082,1085,1096,1097,1098,1025,1074,1081,1078,1076,1079,1075,1080,1073,1077,1083,1084,1086,1087,1009,1008,1010},
		{1082,1085,1096,1097,1098,1025,1074,1081,1078,1076,1079,1075,1080,1073,1077,1083,1084,1086,1087,1009,1008,1010},
		{1082,1085,1096,1097,1098,1025,1074,1081,1078,1076,1079,1075,1080,1073,1077,1083,1084,1086,1087,1009,1008,1010},
		{1005,1004,1020,1022,1018,1013,1006,1007,1017,1082,1085,1096,1097,1098,1025,1074,1081,1078,1076,1079,1075,1080,1073,1077,1083,1084,1086,1087,1009,1008,1010},
		{1082,1085,1096,1097,1098,1025,1074,1081,1078,1076,1079,1075,1080,1073,1077,1083,1084,1086,1087,1009,1008,1010},
		{1082,1085,1096,1097,1098,1025,1074,1081,1078,1076,1079,1075,1080,1073,1077,1083,1084,1086,1087,1009,1008,1010},
		{1142,1143,1144,1145,1020,1019,1018,1024,1006,1001,1023,1007,1017,1082,1085,1096,1097,1098,1025,1074,1081,1078,1076,1079,1075,1080,1073,1077,1083,1084,1086,1087,1009,1008,1010},
		{1082,1085,1096,1097,1098,1025,1074,1081,1078,1076,1079,1075,1080,1073,1077,1083,1084,1086,1087,1009,1008,1010},
		{1082,1085,1096,1097,1098,1025,1074,1081,1078,1076,1079,1075,1080,1073,1077,1083,1084,1086,1087,1009,1008,1010},
		{1082,1085,1096,1097,1098,1025,1074,1081,1078,1076,1079,1075,1080,1073,1077,1083,1084,1086,1087,1009,1008,1010},
		{1082,1085,1096,1097,1098,1025,1074,1081,1078,1076,1079,1075,1080,1073,1077,1083,1084,1086,1087,1009,1008,1010},
		{1082,1085,1096,1097,1098,1025,1074,1081,1078,1076,1079,1075,1080,1073,1077,1083,1084,1086,1087,1009,1008,1010},
		{1082,1085,1096,1097,1098,1025,1074,1081,1078,1076,1079,1075,1080,1073,1077,1083,1084,1086,1087,1009,1008,1010},
		{1082,1085,1096,1097,1098,1025,1074,1081,1078,1076,1079,1075,1080,1073,1077,1083,1084,1086,1087,1009,1008,1010},
		{1082,1085,1096,1097,1098,1025,1074,1081,1078,1076,1079,1075,1080,1073,1077,1083,1084,1086,1087,1009,1008,1010}
	};
	if(modelid >= 400 && modelid <= 611)
	{
		new idx = modelid-400;
		for(new i; i<43; i++)
			components[i] = AvailableComponents[idx][i];
	}
}
//-----/ GetVehicleComponentsPerCategory /--------------------------------------
stock GetVehicleComponentsPerCategory(modelid,categories[]) // categories[17]
{
	new
		components[43],
		name[40],categoryid
	;
	GetVehicleAvailableComponents(modelid,components);
	for(new i; i<43; i++)
	{
		if(components[i] == 0)
			break;
		GetVehicleComponentInfo(components[i],name,categoryid);
		categories[categoryid]++;
	}
}





//==========/ Explosion Function /==============================================
//-----/ CreateExplosionCircle/-------------------------------------------------
forward CreateExplosionCircle(Float:x,Float:y,Float:z,points,Float:radius);
public CreateExplosionCircle(Float:x,Float:y,Float:z,points,Float:radius)
{
	new
		Float:diff = floatdiv(360,points),
		Float:pos[3]
	;
	for(new i; i<points; i++)
	{
		pos[0] = x;
		pos[1] = y;
		pos[2] = z;
		GetXYInFrontOfPoint(pos[0],pos[1],floatmul(diff,i),radius);
		CreateExplosion(pos[0],pos[1],pos[2], 7, 0.0);
	}
}
//-----/ CreateExplosionEx/-----------------------------------------------------
forward CreateExplosionEx(Float:x,Float:y,Float:z,Float:angle,Float:dist);
public CreateExplosionEx(Float:x,Float:y,Float:z,Float:angle,Float:dist)
{
	new Float:pos[3];
	pos[0] = x;
	pos[1] = y;
	pos[2] = z;
	GetXYInFrontOfPoint(pos[0],pos[1],angle,dist);
	CreateExplosion(pos[0],pos[1],pos[2], 7, 0.0);
}





//==========/ Hashing Function /================================================
//-----/ hash_adler32/----------------------------------------------------------
stock hash_adler32(const string[])
{
	new a=1,b;
	for(new i; string[i]!=EOS; i++)
	{
		a = (a + string[i]) % 65521;
		b = (a + b) % 65521;
	}
	return (b << 16) | a;
}





//==========/ File Functions /==================================================
//-----/ utf8_fwrite /----------------------------------------------------------
stock utf8_fwrite(File:handle,const string[])
	for(new i=0; i<strlen(string); i++)
		fputchar(handle,string[i],false);




//==========/ Player Variable Functions /=======================================
//-----/ GetPVarStringA /-------------------------------------------------------
stock GetPVarStringA(playerid,varname[])
{
	new string[512];
	GetPVarString(playerid,varname,string,sizeof(string));
	return string;
}
//-----/ SetPVarInt_ /----------------------------------------------------------
stock SetPVarInt_(playerid,varname[],int_value,array=0)
{
	new varname_[64];
	format(varname_,sizeof(varname_),"%s_%d",varname,array);
	SetPVarInt(playerid,varname_,int_value);
	return int_value;
}
//-----/ SetPVarFloat_ /--------------------------------------------------------
stock Float:SetPVarFloat_(playerid,varname[],Float:float_value,array=0)
{
	new varname_[64];
	format(varname_,sizeof(varname_),"%s_%d",varname,array);
	SetPVarFloat(playerid,varname_,float_value);
	return float_value;
}
//-----/ SetPVarString_ /-------------------------------------------------------
stock SetPVarString_(playerid,varname[],string_value[],array=0)
{
	new varname_[64];
	format(varname_,sizeof(varname_),"%s_%d",varname,array);
	SetPVarString(playerid,varname_,string_value);
	return string_value;
}
//-----/ GetPVarInt_ /----------------------------------------------------------
stock GetPVarInt_(playerid,varname[],array=0)
{
	new varname_[64];
	format(varname_,sizeof(varname_),"%s_%d",varname,array);
	return GetPVarInt(playerid,varname_);
}
//-----/ GetPVarFloat_ /--------------------------------------------------------
stock Float:GetPVarFloat_(playerid,varname[],array=0)
{
	new varname_[64];
	format(varname_,sizeof(varname_),"%s_%d",varname,array);
	return GetPVarFloat(playerid,varname_);
}
//-----/ GetPVarString_ /-------------------------------------------------------
stock GetPVarString_(playerid,varname[],array=0)
{
	new
		varname_[64],
		string[512]
	;
	format(varname_,sizeof(varname_),"%s_%d",varname,array);
	GetPVarString(playerid,varname_,string,sizeof(string));
	return string;
}





//==========/ Global Variable Functions /=======================================
#define MAX_GVARS			200
#define GVAR_TYPE_INTEGER	0
#define GVAR_TYPE_FLOAT		1
#define GVAR_TYPE_STRING	2
#define MAX_GVAR_INTEGER	50
#define MAX_GVAR_FLOAT		50
#define MAX_GVAR_STRING		50
new
	GVar_Name[MAX_GVARS][32],
	GVar_Idx,
	GVar_Type[MAX_GVARS],
	GVar_Pointer[MAX_GVARS],
	//-----
	GVar_Value_Integer[MAX_GVAR_INTEGER],
	GVar_Value_Integer_Idx,
	Float:GVar_Value_Float[MAX_GVAR_FLOAT],
	GVar_Value_Float_Idx,
	GVar_Value_String[MAX_GVAR_STRING][128],
	GVar_Value_String_Idx
;
//-----/ SetGVarInt /-----------------------------------------------------------
stock SetGVarInt(varname[],value)
{
	for(new i; i<MAX_GVARS; i++)
		if(GVar_Name[i][0] != EOS && !strcmp(varname,GVar_Name[i],true))
		{
			//case1: overwrite
			if(GVar_Type[i] != GVAR_TYPE_INTEGER)
				return printf("[gvar] Setting variable is blocked as different type. (%s)",varname);
			GVar_Value_Integer[GVar_Pointer[i]] = value;
			return 1;
		}
	//case2: add variable
	if(GVar_Idx == MAX_GVARS)
		return printf("[gvar] Max variables reached.");
	if(GVar_Value_Integer_Idx == MAX_GVAR_INTEGER)
		return printf("[gvar] Max integer variables reached.");
	strcpy(GVar_Name[GVar_Idx],varname);
	GVar_Type[GVar_Idx] = GVAR_TYPE_INTEGER;
	GVar_Pointer[GVar_Idx] = GVar_Value_Integer_Idx;
	GVar_Value_Integer[GVar_Value_Integer_Idx] = value;
	GVar_Value_Integer_Idx++;
	GVar_Idx++;
	return 1;
}
//-----/ SetGVarFloat /---------------------------------------------------------
stock SetGVarFloat(varname[],Float:value)
{
	for(new i; i<MAX_GVARS; i++)
		if(GVar_Name[i][0] != EOS && !strcmp(varname,GVar_Name[i],true))
		{
			//case1: overwrite
			if(GVar_Type[i] != GVAR_TYPE_FLOAT)
				return printf("[gvar] Setting variable is blocked as different type. (%s)",varname);
			GVar_Value_Float[GVar_Pointer[i]] = value;
			return 1;
		}
	//case2: add variable
	if(GVar_Idx == MAX_GVARS)
		return printf("[gvar] Max variables reached.");
	if(GVar_Value_Float_Idx == MAX_GVAR_FLOAT)
		return printf("[gvar] Max float variables reached.");
	strcpy(GVar_Name[GVar_Idx],varname);
	GVar_Type[GVar_Idx] = GVAR_TYPE_FLOAT;
	GVar_Pointer[GVar_Idx] = GVar_Value_Float_Idx;
	GVar_Value_Float[GVar_Value_Float_Idx] = value;
	GVar_Value_Float_Idx++;
	GVar_Idx++;
	return 1;
}
//-----/ SetGVarString /--------------------------------------------------------
stock SetGVarString(varname[],value[])
{
	for(new i; i<MAX_GVARS; i++)
		if(GVar_Name[i][0] != EOS && !strcmp(varname,GVar_Name[i],true))
		{
			//case1: overwrite
			if(GVar_Type[i] != GVAR_TYPE_STRING)
				return printf("[gvar] Setting variable is blocked as different type. (%s)",varname);
			strcpy(GVar_Value_String[GVar_Pointer[i]],value);
			return 1;
		}
	//case2: add variable
	if(GVar_Idx == MAX_GVARS)
		return printf("[gvar] Max variables reached.");
	if(GVar_Value_Integer_Idx == MAX_GVAR_STRING)
		return printf("[gvar] Max integer variables reached.");
	strcpy(GVar_Name[GVar_Idx],varname);
	GVar_Type[GVar_Idx] = GVAR_TYPE_STRING;
	GVar_Pointer[GVar_Idx] = GVar_Value_String_Idx;
	strcpy(GVar_Value_String[GVar_Value_String_Idx],value);
	GVar_Value_String_Idx++;
	GVar_Idx++;
	return 1;
}
//-----/ GetGVarInt /-----------------------------------------------------------
stock GetGVarInt(varname[])
{
	for(new i; i<MAX_GVARS; i++)
		if(GVar_Name[i][0] != EOS && !strcmp(varname,GVar_Name[i],true))
		{
			if(GVar_Type[i] != GVAR_TYPE_INTEGER)
			{
				printf("[gvar] Getting variable is blocked as different type. (%s)",varname);
				return 0;
			}
			return GVar_Value_Integer[GVar_Pointer[i]];
		}
	//printf("[gvar] Getting variable is blocked as unknown variable. (%s)",varname);
	return 0;
}
//-----/ GetGVarFloat /---------------------------------------------------------
stock Float:GetGVarFloat(varname[])
{
	for(new i; i<MAX_GVARS; i++)
		if(GVar_Name[i][0] != EOS && !strcmp(varname,GVar_Name[i],true))
		{
			if(GVar_Type[i] != GVAR_TYPE_FLOAT)
			{
				printf("[gvar] Getting variable is blocked as different type. (%s)",varname);
				return 0.0;
			}
			return GVar_Value_Float[GVar_Pointer[i]];
		}
	//printf("[gvar] Getting variable is blocked as unknown variable. (%s)",varname);
	return 0.0;
}
//-----/ GetGVarString /--------------------------------------------------------
stock GetGVarString(varname[])
{
	new string[128];
	for(new i; i<MAX_GVARS; i++)
		if(GVar_Name[i][0] != EOS && !strcmp(varname,GVar_Name[i],true))
		{
			if(GVar_Type[i] != GVAR_TYPE_STRING)
			{
				printf("[gvar] Getting variable is blocked as different type. (%s)",varname);
				return string;
			}
			strcpy(string,GVar_Value_String[GVar_Pointer[i]]);
			return string;
		}
	//printf("[gvar] Getting variable is blocked as unknown variable. (%s)",varname);
	return string;
}
//-----/ GetSVarStringA /-------------------------------------------------------
stock GetSVarStringA(varname[])
{
	new string[128];
	GetSVarString(varname,string,sizeof(string));
	return string;
}





//==========/ Bitmap Function /=================================================
//-----/ BitmapAdd /------------------------------------------------------------
stock BitmapAdd(&bitmap,pos)
{
	bitmap = bitmap | (1 << pos);
}
//-----/ BitmapSub /------------------------------------------------------------
stock BitmapSub(&bitmap,pos)
{
	bitmap = bitmap & ~(1 << pos);
}
//-----/ BitmapCheck /----------------------------------------------------------
stock BitmapCheck(bitmap,pos)
{
	return !(!(bitmap & (1 << pos)));
}
//-----/ BitmapPrint /----------------------------------------------------------
stock BitmapPrint(bitmap)
{
	new string[33];
	for(new i; i<32; i++)
	{
		if(bitmap & 1)
			string[i] = '1';
		else
			string[i] = '0';
		if(!(bitmap >>= 1))
		{
			printf("%s(2)",strreverse(string));
			break;
		}
	}
}
//-----/ ParseBitmapString /----------------------------------------------------
stock ParseBitmapString(input[])
{
	new output,exp = 1;
	for(new i=strlen(input)-1; i>=0; i--)
	{
		if(input[i] == ' ')
			continue;
		if(input[i] != '0' && input[i] != '1')
			return 0;
		output += (input[i]-'0') * exp;
		exp *= 2;
	}
	return output;
}
//-----/ GetBitmapString/-------------------------------------------------------
stock GetBitmapString(bitmap,bool:split=false)
{
	new string[41],idx,temp;

	// bit parsing
	while(bitmap)
	{
		if(split && idx % 5 == 4)
			string[idx++] = ' ';
		string[idx++] = bitmap&0x1 ? '1' : '0';
		bitmap >>= 1;
	}
	string[idx] = '\0';

	// invert string
	for(new i,t=strlen(string); i<t/2; i++)
	{
		temp = string[t-i-1];
		string[t-i-1] = string[i];
		string[i] = temp;
	}

	return string;
}





//==========/ Anti DeAMX Function /=============================================
//-----/ AntiDeAMX /------------------------------------------------------------
stock AntiDeAMX()
{
	new a[][] =	{"w","Acu"};
	#pragma unused a
}