/*======================================================================================================*
* This Weapon-Drop Include is made by Jeffry!                                                      		*
*                                                                                                       *
*                                                                                                       *
* Made in April 2011. Updated in June 2013                                                             	*
*                                                                                                       *
* Your Rights:                                                                                          *
*                                                                                                       *
* -You are allowed to modify this Include, aslong as you DO NOT remove credits or re-upload it.			*
*                                                                                                       *
* -You are NOT allowed to re-upload this Filterscript.                                                  *
* -You are NOT allowed to claim this as your own.                                                       *
* -You are NOT allowed to remove any credits.                                                           *
*                                                                                                       *
* Thank you.                                                                                            *
* Have fun. I would be happy if you give me /credits.  :D                                               *
* 			                                                                                            *
*=======================================================================================================*/
#include <a_samp>
//===============================================================================================================================================
//-------------------------Definitions that you may change---------------------------------------------------------------------------------------
//-----------------------------------------------------------------------------------------------------------------------------------------------
#define WEAPON_RESPAWN_TIME 30          	  // After this time the pickups get destroyed if not picked up.
#define MONEY_BAG_MONEY		 0         	 	 // -1 = Money bag ON with all player-money   0 = Money bag OFF   1+ = Money bag ON with given amount
#define MONEY_BAG_MODE       0              // 1 = Money comes from the killed player     0 = Money comes from the server
new ForbiddenWeapons[]= { 35, 36, 38, 44, 45 };    // Here you add the weapon IDs that you do not want to be created.
//-----------------------------------------------------------------------------------------------------------------------------------------------
//-------------------------End of the Definitions------------------------------------------------------------------------------------------------
//===============================================================================================================================================

//=============The Variables====================================================
new WeaponDrop[MAX_PLAYERS][15];
new WeaponData[MAX_PLAYERS][15][3];
new WeaponTimer[MAX_PLAYERS];
new BagMoney = MONEY_BAG_MONEY;
new BagMode = MONEY_BAG_MODE;

//=============The Functions====================================================
stock OnWeaponDropInit()
{
	for(new i=0; i<MAX_PLAYERS; i++)
	{
		for(new a=0; a<14; a++)
		{
		    WeaponDrop[i][a] = -1;
		    WeaponData[i][a][0] = -1;
		    WeaponData[i][a][1] = -1;
		    WeaponData[i][a][2] = -1;
		}
		WeaponTimer[i] = -1;
	}
	return 1;
}

stock OnWeaponDrop(playerid)
{
	RemovePickups(playerid);
	new Float:x, Float:y, Float:z, dropped;
	GetPlayerPos(playerid,x,y,z);
	new world = GetPlayerVirtualWorld(playerid);
	for(new i=0; i<13; i++)
	{
	    new weapon, ammo;
	    GetPlayerWeaponData(playerid, i, weapon, ammo);
	    if((ammo > 0 || weapon == 1) && weapon != 0)
	    {
			new model = GetModel(weapon);
			if(model != -1)
			{
	        	WeaponData[playerid][i][0] = weapon;
	        	WeaponData[playerid][i][1] = ammo;
	        	WeaponData[playerid][i][2] = world;
	        	dropped++;
			}
	    }
	}
	if(BagMoney != 0)
	{
	    if(BagMoney == -1 && GetPlayerMoney(playerid) > 0)
		{
			WeaponData[playerid][13][0] = GetPlayerMoney(playerid);
			if(BagMode) GivePlayerMoney(playerid, -WeaponData[playerid][13][0]);
			WeaponDrop[playerid][13] = CreatePickup(1550, 1, x, y, z);
			if(dropped <= 0) dropped=1;
		}
		if(BagMoney > 0)
		{
			WeaponData[playerid][13][0] = BagMoney;
			if(BagMode) GivePlayerMoney(playerid, -WeaponData[playerid][13][0]);
			WeaponDrop[playerid][13] = CreatePickup(1550, 1, x, y, z);
			if(dropped <= 0) dropped=1;
		}
	}
	if(dropped > 0)
	{
	    new radius;
	    if(dropped < 3) radius = 1;
		if(dropped < 6) radius = 1;             /*If you want another radius, change it here.*/
		if(dropped < 9) radius = 2;
		if(dropped > 8) radius = 3;
		new Float:degree, Float:tmp;
		degree = 360.0 / (float(dropped));
		tmp = degree;
		if(WeaponTimer[playerid] != -1) KillTimer(WeaponTimer[playerid]);
		WeaponTimer[playerid] = SetTimerEx("RemovePickups", WEAPON_RESPAWN_TIME*1000, 0, "d", playerid);
	    for(new i=0; i<13; i++)
		{
		    if((WeaponData[playerid][i][1] > 0 || WeaponData[playerid][i][0] == 1) && WeaponData[playerid][i][0] > 0)
		    {
				new model = GetModel(WeaponData[playerid][i][0]);
				if(model != -1)
				{
				    WeaponDrop[playerid][i] = CreatePickup(model, 1, x+(floatsin(degree, degrees)*radius), y+(floatcos(degree, degrees)*radius), z, world);
					degree = degree + tmp;
				}
		    }
		}
	}
	WeaponDrop[playerid][14] = CreatePickup(1240, 1, x, y, z, world);
	return 1;
}

stock OnWeaponDropCommand(playerid, cmdtext[])
{
    if(!strcmp(cmdtext, "/dropweapon", true, 11))
	{
		if((strlen(cmdtext[11]) && cmdtext[11] == ' ') || !strlen(cmdtext[11]))
		{
		    if(strlen(cmdtext[11]) && cmdtext[11] == ' ' && !strlen(cmdtext[12])) return SendClientMessage(playerid,0xFF0000FF,"Usage: /dropweapon [ammo]");
			new Float:x, Float:y, Float:z;
			GetPlayerPos(playerid,x,y,z);
			if(x > 4095.0 || x < -4095.0 || y > 4095.0 || y < -4095.0 || z > 4095.0 || z < -4095.0) return SendClientMessage(playerid,0xFF0000FF,"ERROR: You can not drop any weapons here, because pickups do not show here anymore (SA-MP issue).");
		    new world = GetPlayerVirtualWorld(playerid);
		    new weapon, ammo, dropped, i = GetWeaponSlot(GetPlayerWeapon(playerid));
		    GetPlayerWeaponData(playerid, i, weapon, ammo);
		    if(weapon == 0) return SendClientMessage(playerid,0xFF0000FF,"ERROR: You are not holding any weapon.");
		    new dammo;
		    if(strval(cmdtext[11]) == 0) dammo = 0;
			else dammo = strval(cmdtext[12]);
		    if(strlen(cmdtext[12])) if(dammo < 1) return SendClientMessage(playerid,0xFF0000FF,"ERROR: Invalid ammo.");
		    if(dammo > ammo) return SendClientMessage(playerid,0xFF0000FF,"ERROR: You don't have that much ammo.");
		    if(dammo == 0) dammo = ammo;
		   	if((ammo > 0 || weapon == 1) && weapon != 0)
		    {
				new model = GetModel(weapon);
				if(model != -1)
				{
		        	WeaponData[playerid][i][0] = weapon;
		        	WeaponData[playerid][i][1] = dammo;
		        	WeaponData[playerid][i][2] = world;
		        	dropped++;
				}
			}
			if(dropped > 0)
			{
			    if(WeaponDrop[playerid][i] != -1)
			    {
			        DestroyPickup(WeaponDrop[playerid][i]);
			        WeaponDrop[playerid][i] = -1;
			    }
				if(WeaponTimer[playerid] != -1) KillTimer(WeaponTimer[playerid]);
				WeaponTimer[playerid] = SetTimerEx("RemovePickups", WEAPON_RESPAWN_TIME*1000, 0, "d", playerid);
			    if((WeaponData[playerid][i][1] > 0 || WeaponData[playerid][i][0] == 1) && WeaponData[playerid][i][0] > 0)
			    {
					new model = GetModel(WeaponData[playerid][i][0]);
					if(model != -1)
					{
					    new Float:a;
						GetPlayerFacingAngle(playerid, a);
					    WeaponDrop[playerid][i] = CreatePickup(model, 1, x+(floatsin(-a, degrees)*2), y+(floatcos(-a, degrees)*2), z, world);
					}
			    }
			}
			else return SendClientMessage(playerid,0xFF00FFFF,"ERROR: You can not drop this weapon.");
			new u_savedweapon[13], u_savedammo[13];
			for(new a=0; a<13; a++) GetPlayerWeaponData(playerid, a, u_savedweapon[a], u_savedammo[a]);
			u_savedammo[i] -= dammo;
			ResetPlayerWeapons(playerid);
			new string[128];
			format(string, 128, "[Weapon] You have successfully dropped your %s with %d bullet(s).", GetJ_WeaponName(weapon), dammo);
			SendClientMessage(playerid, 0x00FF00FF, string);
			for(new a=0; a<13; a++) if(u_savedammo[a]!=0) GivePlayerWeapon(playerid, u_savedweapon[a], u_savedammo[a]);
			if(dammo == ammo) SetPlayerArmedWeapon(playerid,0);
			else SetPlayerArmedWeapon(playerid,weapon);
			return 1;
		}
	}
	return 0;
}

stock OnWeaponDropExit()
{
	for(new i=0; i<MAX_PLAYERS; i++)
	{
		RemovePickups(i);
		WeaponTimer[i] = -1;
	}
	return 1;
}

stock GetModel(weaponid)
{
	for(new i=0; i<sizeof(ForbiddenWeapons); i++)
	{
		if(weaponid == ForbiddenWeapons[i])
		{
			return -1;
		}
	}
	switch(weaponid)
	{
	    case 1: return 331;
	    case 2: return 333;
	    case 3: return 334;
	    case 4: return 335;
	    case 5: return 336;
	    case 6: return 337;
	    case 7: return 338;
	    case 8: return 339;
	    case 9: return 341;
	    case 10: return 321;
	    case 11: return 322;
	    case 12: return 323;
	    case 13: return 324;
	    case 14: return 325;
	    case 15: return 326;
	    case 16: return 342;
	    case 17: return 343;
	    case 18: return 344;
	    case 22: return 346;
	    case 23: return 347;
	    case 24: return 348;
	    case 25: return 349;
	    case 26: return 350;
	    case 27: return 351;
	    case 28: return 352;
	    case 29: return 353;
	    case 30: return 355;
	    case 31: return 356;
	    case 32: return 372;
	    case 33: return 357;
	    case 34: return 358;
	    case 35: return 359;
	    case 36: return 360;
	    case 37: return 361;
	    case 38: return 362;
	    case 39: return 363;
	    case 40: return 364;
	    case 41: return 365;
	    case 42: return 366;
	    case 43: return 367;
	    case 44: return 368;
	    case 45: return 369;
	    case 46: return 371;
		default: return -1;
	}
	return -1;
}

forward RemovePickups(playerid);
public RemovePickups(playerid)
{
	if(WeaponTimer[playerid] != -1) KillTimer(WeaponTimer[playerid]);
	WeaponTimer[playerid] = -1;
	for(new a=0; a<15; a++)
	{
	    if(WeaponDrop[playerid][a] != -1)
	    {
	        DestroyPickup(WeaponDrop[playerid][a]);
	        WeaponDrop[playerid][a] = -1;
	 		WeaponData[playerid][a][0] = -1;
	    	WeaponData[playerid][a][1] = -1;
	    	WeaponData[playerid][a][2] = -1;
	    }
	}
	return 1;
}

stock GetWeaponSlot(weaponid)
{
	switch(weaponid)
	{
		case 0,1: return 0;
		case 2..9: return 1;
		case 22..24: return 2;
		case 25..27: return 3;
		case 28,29,32: return 4;
		case 30,31: return 5;
		case 33,34: return 6;
		case 35..38: return 7;
		case 16..18,39: return 8;
		case 41..43: return 9;
		case 10..15: return 10;
		case 44..46: return 11;
		case 40: return 12;
		default: return -1;
	}
	return -1;
}

stock GetJ_WeaponName(id)
{
    new wName[32];
    wName="INVALID_WEAPON";
	switch(id)
	{
		case 0: wName="Fist";
		case 1: wName="Brass Knuckles";
	    case 2: wName="Golf Club";
	    case 3: wName="Night Stick";
	    case 4: wName="Knife";
	    case 5: wName="Baseball Bat";
	    case 6: wName="Shovel";
	    case 7: wName="Pool Cue";
	    case 8: wName="Katana";
	    case 9: wName="Chainsaw";
	    case 10: wName="Purple Dildo";
	    case 11: wName="Small White Vibrator";
	    case 12: wName="Large White Vibrator";
	    case 13: wName="Silver Vibrator";
	    case 14: wName="Flowers";
	    case 15: wName="Cane";
		case 16: wName="Grenade";
	    case 17: wName="Tear Gas";
		case 18: wName="Molotov Cocktail";
	 	case 22: wName="9mm";
	    case 23: wName="Silenced 9mm";
	    case 24: wName="Desert Eagle";
	    case 25: wName="Shotgun";
	    case 26: wName="Sawnoff Shotgun";
	    case 27: wName="Combat Shotgun";
	    case 28: wName="Micro SMG";
	    case 29: wName="MP5";
	    case 30: wName="AK 47";
	    case 31: wName="M4";
	    case 32: wName="Tec 9";
	    case 33: wName="Country Rifle";
	    case 34: wName="Sniper Rifle";
	    case 35: wName="Rocket Launcher";
	    case 36: wName="HS Rocket Launcher";
	    case 37: wName="Flamethrower";
	    case 38: wName="Minigun";
	    case 39: wName="Satchel Charge";
	    case 40: wName="Detonator";
	    case 41: wName="Spraycan";
	    case 42: wName="Fire Extinguiser";
	    case 43: wName="Camera";
	    case 44: wName="Night Vision Goggles";
	    case 45: wName="Thermal Goggles";
	    case 46: wName="Parachute";
	}
	return wName;
}
