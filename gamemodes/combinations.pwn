/*

	M""""""'YMM                      dPdP
	M  mmmm. `M                      8888           |--------------------------------------------------------|
	M  MMMMM  M.d8888b..d8888b..d888b8888dP    dP   | <>?#$#!$%! RaekwonDaChef !%$!# 3v0x $#?<>              |
	M  MMMMM  M88ooood888'  `8888'  `888888    88   |  <>?#$#!$%! Devastator !%$!#$#?<>                      |
	M  MMMM' .M88.  ...88.  .8888.  .888888.  .88   | [[[$!##!$]]] Since 2007 /{}\  R.I.P. [KR] [[[$!##!$]]] |
	M       .MM`88888P'`88888P8`88888P8dP`8888P88   |--------------------------------------------------------|
	MMMMMMMMMMM                               .88
	                                      d8888P
	MM'""""'YMM                  dP      oo                  dP  oo
	M' .mmm. `M                  88                          88                              PRO�
	M  MMMMMooM.d8888b.88d8b.d8b.88d888b.dP88d888b..d8888b.d8888PdP.d8888b.88d888b..d8888b.
	M  MMMMMMMM88'  `8888'`88'`8888'  `888888'  `8888'  `88  88  8888'  `8888'  `88Y8ooooo.
	M. `MMM' .M88.  .8888  88  8888.  .888888    8888.  .88  88  8888.  .8888    88      88
	MM.     .dM`88888P'dP  dP  dP88Y8888'dPdP    dP`88888P8  dP  dP`88888P'dP    dP`88888P'
	MMMMMMMMMMM                                GRAND THEFT AUTO: SAN ANDREAS (SA-MP GAMEMODE)

	---------------------------------------------------------------------------------------------
	---------------------------------------------------------------------------------------------

	Deadly Combinations (D.C.)
	Copyright (C) 2008 - 2011 D.C. Development Team, Contributors
	League Style Professional A/D + TDM

	SA-MP Forums: http://forum.sa-mp.com/showthread.php?t=89748

	Authors:		Raekwon <xfire: fsf3v0x>
					Devastator

	Developers:		Whitetiger <xfire: whitetigerswt>
					plaYmaker <xfire: playmakerz7>

	Credits: DracoBlue, mabako, Boylett, G-sTyLeZzZ, ILuSioN, Sneaky, Seif_ & Y_Less.

    Thanks to...
    
	Pablo                  Al_Pacino                 Rafs
	MaTrIx4057             Trip                      Raider
	[KR] Killadel Rydaz    [PTM] Portuguese Mafia    [U] United Army
	[ABK] Anybody Killaz   [___]
	
	for suggestions, bug reports & testing.
	
	Other credits documented within source code.

    SA-MP is Copyright (C) 2011 SA-MP Team
    http://www.sa-mp.com/

	---------------------------------------------------------------------------------------------
	---------------------------------------------------------------------------------------------

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>.

*/

#file "combinations.pwn" // ���̴� �� ����, ���ݵ�����
#define VER_MAJOR           8
#define VER_MINOR           4
#define VER_REVISION        1
//#define BETA                0
#define SPECIAL_HOSTNAME	"������[KOR] SA:MP WAR ~ A/D ~ with VP"

/*

	######################
	##      To-Do       ##
	######################

	    *FEATURES
			- Save clans and countries on ini data system, and add it to /stats (Utilize those stats more basically)
			- Add matches to /delete - might need to assign an ID for each match to identify it?
			- "automode" so it just keeps playing bases
		 	- /vote clearscores - clears servers scores and should require atleast 50% of player votes
			- Config cmds: "cbug" | "votetype", so u can force ppl to vote for random round -1
		 	- Make more config dialogs like /config audio, so there is less clutter with too many config commands
		 	- Make netstats parser to better utilize the data
		 	- Commands: /int - http://files.sa-mp.com/interiors.txt
		 	- choose previous weapons option from gunmenu
			- find some use for the textures added in RC5-3
				* there's a heart texture, put next to round health?
			- make it easy for ppl to report bugs, HTTP() in combination with a /report cmd?

		*BUGS
			- None

		*SUGGESTIONS
	        - None

		*NOTES
			- None
			
	---------------------------------------------------------------------------------------------
	---------------------------------------------------------------------------------------------

	######################
	##    ChangeLog     ##
	######################


		*8.4.1
		    - Fixed end round textdraws wrong color
		    - Fixed base textdraws showing wrong total count of players
		    - Fixed checkpoint siren sound playing for a split second at the begining of every round
		    - Fixed Weapon limit issues with autoreadd
		    - Fixed SetPlayerTeam issues with /sync
		    - Hid some textdraws when a base/tdm is loading
		    
		*8.4.0
		    - Release
		    
	    *8.3.7 BETA 3
	        - Refs now get auto killed as soon as they damage a player playing in round
	        
	    *8.3.7 BETA 2
	        - Added damage to end round textdraws instead of kills
	        - Fixed refs getting gun menu

	    *8.3.7 BETA 1
	        - Added siren sound to capturing the checkpoint.
			- Added end round sounds.
			- Added Player[playerid][IsAudioStreaming] so we can tell who has an audio stream playing - note: this won't always be accurate cause we can't tell when audio streams stop on there own.
			    ^ as a result: SOUND_GOTKILLED will now play correctly with the new onplayerdeath, SpawnPlayer changes.
			- should've fixed SetPlayerTeam bugs (feedback required)
			- Fixed OnPlayerDeath halting

	    *8.3.7
	        - Added /config joypad, removed DISABLE_JOYPAD define
	        - End round textdraws will show disconnected player's kills and set them back if the player reconnects.
	        - Made /car not spawn vehicle directly 5.0 units infront of you so you won't spawn cars in walls.
	        - Possible fix for /spec halting on some servers, HideAllSpecTD no longer does player loop, and is renamed HideSpecTD
			- Updated the Geo IP
			- Added RemoveBuildingForPlayer on gas tanks and exploding barrels
	        - Added /rcon tracking with OnRconLoginAttempt
	        - Made it so /config deadtag can be turned off
	        - Made it so when you die you will instantly respawn instead of a wavey camera
	        - Made the serer not shut down if audio.ini was detected, but instead create audio.ini and set default settings.
	        - Fixed GM destrying vehicles of other FS's or addons.
	        - Fixed round textdraws showing the wrong number of total players if players had been /added
	        - Possible fix for /spec again
	        
	    *8.3.6
	        - Implemented DIALOG_STYLE_PASSWORD for password dialogs (and still DIALOG_STYLE_INPUT for 0.3c)
	        - Made the 0.3d or 0.3c sa-mp version compile automatic (checks if 0.3d functions are defined, if they are it uses 0.3d, else 0.3c)
		    - Removed /d occuring when round was paused.
		    - Disallowed the gamemode to compile if MAX_PLAYERS is over 100
		    - Fixed SetPlayerSkin crashes on spawn
		    - Fixed players with 0 kills and 0 deaths showing in the final results
		    - Fixed BeyondDiscon inaccurate deaths
	        
	    *8.3.5
	        - Rewrote FixGaps() in MySQL, removed hundreds of useless sql queries
	        - Added *ping* sound when you shoot someone
	        - Made it so no ID given in /netstats shows the server's net stats
	        - Made Top shooter work in 0.3c (untested)
	        - Fixed /bases in mysql
	        - Fixed a bug with /bases and /tdms where hidden tetdraws wouldn't show after the base/arena textdraws disappeared
	        
	    *8.3.4
	        - Integrated 0.3d callback OnPlayerTakeDamage, round results and top shooter now utilizes damage data (0.3d)
	        - Added define "SAMP_VERSION" - you can now choose to compile the gamemode for use with 0.3c and 0.3d
	        - Renamed "dc_players_wepstats" sql table to "dc_players_wepstats"
	        - Renamed "dc_weapons_classes" sql table to "dc_weapon_classes"
	        - Cosmetic update to gamemode initation messages (server log/console)
	        - Major SQL optimization with loading stuff, large reduction in sql queries
	        - Removed GAMEMODE_TYPE and all gta-u code, as it has been depracated for more than a year
	        - Fixed bug where refs would get HP and weapons reset when not spawned in a round
	        - Finished audio panel which means toggling helicopter sound also works now
	        - Integrated WhiteTigers sqlite geoip, it is built in
	        - The old GeoIP which used GeoIP Plugin by totto has been removed
	        - Disabled IsInvalidSkin() function, not needed since 0.3d
	
	    *8.3.3
	        - Added weapons above the player name after picking from the menu.
	        - Added auto-add after a duel for players that where in duels when the base started.
	        - Added /vote -1, random round voting.
	        - Added /config maxplimit
	        - Removed all vending machines from the server.
	        - Fixed a bug where the radar would show if you typed /intro.
	        - Fixed /goto putting you in an invalid seat id and sometimes causing player crashes
	        - Fixed /rem minusing the weapon limit by 2, instead of 1
	        
	    *8.3.2
	        - Added /restoreall, /d, /netstats, and /swap as an alternative for /invert
	        - Added /config audio - A configuration panel for game audio on the server. (0.3d)
	        - Made round pausing put you into /d automaticly
	        - Made it so you can hear car custom radio if surfing on it. (0.3d)
	        - Added public PlayAudioStreamForPlayerEx(playerid, stream[])... so you can play audio streams on timer
	        - Added place your bets sound to /vote. (0.3d)
	        - Added new game sounds. (0.3d)
	        - Added new custom vehicle radio stream feature. (0.3d)
	        - Improved scoreboard textdraw
	        - Improved diag labels
	        - Improved 3D text above Checkpoint
	        - Fixed a server crash related to menus
	        - Fixed /sethealth and /setarmour no params using id 0 and then setting 0 health by default.
	        - Fixed client crashing related to weapon menu's (for SOME unknown reason, frozen while picking weapons = bad)

	    *8.3.1
	        - Added /startbase int (random interior base) and /startbase ext (random exterior base), and /startbase -1 for a random of both types.
	        - Added 3 second timer to round unpause
	        - Added /config autopause [on/off] - autopause the round when players time out
	        - Added /config spec [on/off] - enable/disable spec
	        - Added /config cplayout [on/off] - if enabled, the CP will count down by the same number of players in the CP, as apose to 1 per second no matter how many people are in the cp if this is disabled.
	        - Added 2 minute warning, and 30 second warning messages to players taking to long in bases.
	        - Added /setscore [teamid] [score]
	        - Added /setarmour [id] [armour]
	        - Added /sethealth [id] [health]
	        - Made /givemenu and /giveveh send a message to the whole server
	        - Made it so defenders can't drive vehicles.
	        - Made /teams output a more organized message back
	        - Made the scores automaticly reset if no one is in the server for 10+ minutes.
	        - Made the round clock change colors depending on the time on it.
	        - Made WEB_URL an optional define.
	        - Made /startbase not start any recently played bases (e.g, i do /startbase -1 it picks baseid 30, baseid 30 won't start (from random) for at least 10 more bases).
	        - Fixed an exploit that let you spectate the CP while being a sub for the attacking team
	        - Fixed scroll spec not working sometimes.
	        - Fixed player's appearing to run in place when they where frozen
	        - Fixed getting "Enemy Disconnected" duel message when you wern't in a duel, but in a round
	        - Fixed tempdamage textdraw only showing for players in the round
	        - Fixed being able to pass the weapon limit if very specific actions were done
	        - Removed some unneeded debug messages.

	---------------------------------------------------------------------------------------------
	---------------------------------------------------------------------------------------------

*/

#include <a_samp>               // SA-MP icludes

#define DEBUG                   0	//	DEBUG mode - this if statement checks, etc - ONLY USE FOR TESTING ONLY!!! 1 on - 0 off

#define WEB_URL                 "cafe415.daum.net/_c21_/bbs_list?grpid=30lB&mgrpid=&fldid=Aozm" // Web site url of the clan/group/organiztion running the server

#define CLAN_NAME               "Korean War" // Full name of the clan/group/organization running the server

#define IRC                     2   //  Defines wether or not some of the gm strings will be echoed using a IRC fs / plugin.
#define DATA_SYSTEM             1 	//	1 for INI - 2 for MySQL

#if !defined OnPlayerTakeDamage
	// 0.3d function isn't added, we must be on 0.3c.
	#define SAMP_VERSION            1   //	1 for 0.3c - 2 for 0.3d
#else
	// if OnPlayerClickMap is defined, we're on 0.3d
	#define SAMP_VERSION            2   //	1 for 0.3c - 2 for 0.3d
#endif

#define LOG_SYSTEM              1   //	0 for disabled - 1 for enabled

/*
	Deadly Combinations Audio Configuration
*/

#if SAMP_VERSION == 2
	#define SOUND_VEHICLERADIO	    "http://yp.shoutcast.com/sbin/tunein-station.pls?id=1283516" 	// Radio stream to play in car radios
	#define SOUND_FIRSTBLOOD        "http://www.pamp3.site40.net/quake/firstblood.mp3"				// Sound: "First Blood!" - Played when a player gets first kill in a round
	#define SOUND_GOTKILL           "http://www.pamp3.site40.net/zombie/killed.mp3"					// Sound: Played for a player when they get a kill
	#define SOUND_GOTKILLED			"http://tinyurl.com/3o4nsct"									// Sound: Played for a player when they die
	#define SOUND_DUEL				"http://tinyurl.com/65qxgv7"									// Sound: Played during duels
	#define SOUND_PAUSED            "http://tinyurl.com/3wzqy3s"                                    // Sound: Played when the round is paused.
	#define SOUND_ROUNDSTARTING		"http://www.pamp3.site40.net/zombie/prepare.mp3"				// Sound: Played for all players when a round is being started
	#define SOUND_ROUNDSTARTED      "http://www.pamp3.site40.net/zombie/play.wav"					// Sound: Played for all players when a round is started
	#define SOUND_KILLSPREE			"http://www.pamp3.site40.net/quake/killingspree.mp3"			// Sound: Played for all players when someone is on a kill streak
	#define SOUND_FINALRESULTS      "http://tinyurl.com/6h87do4"                                    // Sound: Played when the final results are active and the difference in rounds won is greater than 5.
	#define SOUND_FINALRESULTS2     "http://raekwon.org/sa-mp/music/halen2.mp3"              	 	// Sound: Played when the final results are active and the difference in rounds won is less than 5
	#define SOUND_FINALRESULTS3     "http://raekwon.org/sa-mp/music/vangelis.mp3"             		// Sound: Played when the final results are active and the difference in rounds won is greater than 9
	#define SOUND_INTRO             "http://tinyurl.com/3vjhavx"                                    // Sound: Played during intro.
	#define SOUND_CLASSSELECT       "http://raekwon.org/sa-mp/music/route24.mp3"              		// Sound: Played during class selection.

	new nextStreamURL[256];
#endif

/*
45400 good beep
40600 - green hum
SOUND_CROWD_AWWS2 36201
SOUND_CROWD_CHEERS_BIG 36205
*/

/*   Team Colors   */
// AWAY
#define AWAY_COLOR              0x84000000      // Away Team Color (Main)
#define AWAY_INACTIVE_COLOR     0xFFA6A600      // Away Team Color (Inactive)
// HOME
#define HOME_COLOR              0x9a3bfd00      // Home Team Color (Main)
#define HOME_INACTIVE_COLOR     0xb876fb00      // Home Team Color (Inactive)
// REF
#define COLOR_REF				0xFFFF00AA      // Referee Team Color
/* ------------- */


/* NOTE: This is not needed as this gamemode is public. */
/*
	If you use this, you HAVE to add:
	bind 127.0.0.1
	to your server.cfg (Replace 127.0.0.1 with protected ip!)
*/
#define PROTECTED				0				// Protection system (gm will only run under the protected ip & port) | 0 for disabled - 1 for enabled
#define PROTECTED_IP1 			"127.0.0.1"     // Protected Server IP 1
#define PROTECTED_IP2 			"192.168.1.100" // Protected Server IP 2
#define PROTECTED_PORT          7777            // Protected Server Port

//------------------------------------------------------//
//******************** MySQL Config ********************//
//------------------------------------------------------//
// Note: This info is only needed if DATA_SYSTEM is set to 2

#define MYSQL_SERVER            "127.0.0.1"			// Server IP of the MySQL database server
#define MYSQL_USER              "root"      		// Username
#define MYSQL_PASS              ""    	 			// Password
#define MYSQL_DB  	            "combinations"		// Database Name

//------------------------------------------------------//
//********************** Includes **********************//
//------------------------------------------------------//

/* Redefine max players and vehicles as the limits do not need to be high on this type of gamemode */
#undef MAX_PLAYERS
#undef MAX_VEHICLES
#define MAX_PLAYERS     100
#define MAX_VEHICLES    100

// Max amount of rounds for matches
#define MAX_ROUND_LIMIT 25

#include <Dini>             // DracoBlue's INI include
#include <dutils>           // DracoBlue's Utilities
#include <zcmd>           	// zcmd command processor by ZeeX

// If you are using MySQL data system...
#if DATA_SYSTEM == 2
	#include <a_mysql>			// MySQL plugin (G-sTyLeZzZ) include
#endif

//-----------------------------------------------------------//
//********************** Configuration **********************//
//-----------------------------------------------------------//

// SMALL_GM_NAME used for "Mode" info in sa-mp browser
#define SMALL_GM_NAME           "TangE A/D"

/*
	Includes and settings files for INI data system
	SQL Mode only requires MatchFile
*/

#define ServerDataFile          "combinations/config/serverdata.ini"        // Server data file
#define ConfigFile				"combinations/config/main_config.ini"       // Main configuration file
#define Weapon_Config			"combinations/config/weapon_config.ini"     // Weapon data (Gun Menu)
#define WeaponLimits_Config		"combinations/config/weapon_limits.ini"     // Weapon limit data
#define WeaponSkill_Config		"combinations/config/weapon_skill.ini"      // Weapon skill data
#define MatchFile               "combinations/matches/matches.txt"          // Stored match results
#define AudioFile               "combinations/config/audio.ini"             // Audio configuration file

//#define BlockFile             "combinations/players/xx.ini"

#define UAV_VIEW_DISTANCE       150     // This is the maximum distance where players will see the UAV marker when player shoot
#define MAX_BASES				300		// This can be set set at any number, used internally
#define MAX_ARENAS				200		// This can be set set at any number, used internally
#define SAVE_SLOTS              10      // Used internally, maximum number of saved timeouts variables
#define VEH_SPAWN_DISTANCE      150     // Maximum distance that attackers can be from spawn to spawn vehicles

// Initiation messages for console...
main()
{
  	print(" ");
  	printf("  *** Deadly Combinations v%d.%d.%d Initiated!", VER_MAJOR, VER_MINOR, VER_REVISION);
  	print("  *** Created by: Raekwon & Devastator (R.I.P. [KR])");
  	print("      |- Development Team: Raekwon, Devastator, WhiteTiger, playMaker");
	print("\n  ----------------------------------------------------\n");
}

//-----------------------------------------------------//
//********************** Defines **********************//
//-----------------------------------------------------//

//DracoBlue's Command Processor
//#define dcmd(%1,%2,%3) if ((strcmp((%3)[1], #%1, true, (%2)) == 0) && ((((%3)[(%2) + 1] == 0) && (CMD:%1(playerid, "")))||(((%3)[(%2) + 1] == 32) && (CMD:%1(playerid, (%3)[(%2) + 2]))))) return 1

#define COLOR_NOTSPAWNED 	0xFF00FF96 	// Color of players when they are not spawned.. (Grey)

#define COLOR_BLUE			0x2020FFFF  // Blue
#define COLOR_GREEN			0x00E100FF  // Green
#define COLOR_GREY			0xAFAFAFAA  // Grey
#define COLOR_YELLOW		0xFFFF00AA  // Yellow
#define COLOR_WHITE			0xFFFFFFAA  // White
#define COLOR_ORANGE		0xFF8000FF  // Orange
#define COLOR_DARKGREY		0x4E4F5296  // Dark Grey
#define COLOR_RED			0xDC143CFF  // Red
#define COLOR_DARKRED       0x590000FF  // Dark Red
#define COLOR_CYAN			0x00FFFFAA  // Cyan
#define COLOR_PINK			0xFF00FF96  // Pink
#define COLOR_LIGHTPURPLE	0x8000FF56  // Light Purple
#define COLOR_BLACK			0x000000FF  // Black
#define COLOR_MARINE 		0x00BB99FF  // Marine
#define COLOR_GREYBLUE      0x8080FF96  // Grey Blue
#define COLOR_LIGHTBLUE     0x33CCFFAA  // Light Blue
#define COLOR_BUILDMODE     0x00CECEFF	// Bases/tdms buildmode messages colors.

#define TD_BACKGROUND       0xA042FF44  // Color used like round hud and top shooter background color
#define TD_CLASSHUD        	0xFFA85144  // Color used for class hud background color

#define COLOR_DMS1			0x00BB99FF  // Deathmatch messages color 1
#define COLOR_DMS2			0xFF00FF96  // Deathmatch messages color 2
#define COLOR_DM_ZONE      	0xFFFFFF66  // gang zone color for DMs
#define COLOR_DM_PLAYER     0xFFFFFFFF  // Player color for players in deathmatches (/dm)

//#define TD_CLASSHUD        	0x0000C144  // Color used for class hud background color

/******************************************/
/* Team IDs: Each team has an assigned ID */
/******************************************/
#define T_NON		-1
#define T_HOME		0
#define T_SUBHOME	1
#define T_AWAY		2
#define T_SUBAWAY	3
#define T_REF		4

/**************************************/
/* Misc.. Ingnore These, Internal Use */
/**************************************/
#define SPECTATE_TYPE_NONE		0
#define SPECTATE_TYPE_PLAYER	1
#define SPECTATE_TYPE_VEHICLE	2

#define MAX_TEAMS 				4

#define MIN_SKIN_ID				0
#define MAX_SKIN_ID				299

#define LOBBY_SPAWN             0
#define DEATH_SPOT				1

// Virtual worlds
#define ROUND_VW   				0   // Rounds virtual world
#define DEATH_VW             	1   // Death virtual world
#define LOBBY_VW				2   // Lobby virtual world
#define FINAL_RESULTS_VW		3   // Final results virtual world
#define CSEL_VW					4   // Class selection virtual world

#define BASE                    1
#define TDM                     2

#define STEALTH                 1
#define WAR_ZONE                2
#define RUMBLE	                2

#define WEAPONSYSTEM_MENU       1
#define WEAPONSYSTEM_RANDOM     2
#define WEAPONSYSTEM_FULL      	3
#define WEAPONSYSTEM_WW   		4
#define WEAPONSYSTEM_RW			5

/****************************************/
/* Player Status, Each status has an ID */
/****************************************/
#define STATUS_PLAYING	1
#define STATUS_SUB		2
#define STATUS_DEAD		3
#define STATUS_AFK		4
/****************************************/

#define KEY_AIM	128

// Disables or enables the IsValidNick checks
#define RESTRICT_NICK 1

//Rotation Degree - The greater the faster the rotation
//Rotating Camera, round starting...
#define ROTATE_DEGREES 0.2

// Player States for OnPlayerPause and Unpause
#define STATE_PAUSED        0
#define STATE_UNPAUSED      1
#define STATE_CONNECT		2

// The amount of weapons the gamemode stores info/stats for
#define MAX_COUNT_WEAPONS 14

// Keeps track of how a round has ended or won
#define ELIMINATION 1
#define CHECKPOINT 2
#define TIME_LIMIT 3

#define HUD_TRACK       1 // track player (hud - ingame)
#define HUD_AUTO       	2 // automatically track closest team player (hud - ingame)

#if defined DIALOG_STYLE_PASSWORD
	#define DIALOG_STYLE_DC DIALOG_STYLE_PASSWORD
#else
	#define DIALOG_STYLE_DC DIALOG_STYLE_INPUT
#endif

/****************************************/
/*   Weapon Dropping system Defines     */
/****************************************/
#define MAX_DROP_AMOUNT				-1	// special drop-limits like 500 ammo are possible; -1 = all ammo is dropped
#define MAX_DROP_LIFETIME			30	// after 15 seconds the pickup gets destroyed. Note: old pickups will be destroyed anyway.

#define WEAPON_SLOTS				13  // amount of weapon slots
#define INVALID_PICKUP				-1  // invalid pickup id
#define MAX_PICKUPS2				90  // max amount of weapons that can be dropped at any time
#define PICKUP_TYPE                 23  // The pickup type for weapon drops

//----------------------------------------------------------------//
//********************** TextDraw Variables **********************//
//----------------------------------------------------------------//

new Text:fr_sidebox1;                   // Round Info Side Box on final results
new Text:fr_sidebox2;                   // Round Info Side Box on final results
new Text:fr_sidebox3;                   // Round Info Side Box on final results
new Text:fr_sidebox4;                   // Round Info Side Box on final results
new Text:fr_sidebox5;                   // Round Info Side Box on final results
new Text:fr_sidebox6;                   // Round Info Side Box on final results
new Text:fr_sidebox7;                   // Round Info Side Box on final results
new Text:fr_sidebox8;                   // Round Info Side Box on final results
new Text:fr_sidebox9;                   // Round Info Side Box on final results
new Text:MapNameTD;						// map name.. base/tdm #, under money
new Text:health_plus;               	// health +
new Text:Link2;     					// textdraw in top right corner displaying gm name/clan tag
new Text:gamemsg_voting;				// Voting
new Text:gamemsg_whowon;				// Who Won Round
new Text:gamemsg_lobby;					// Lobby Message. Bases/TDM Count
new Text:TimerClock;        			// Clock during rounds
new Text:gamemsg_baseupdatehome;		// GameplayInfo, Score Bottom
new Text:gamemsg_baseupdateaway;		// Gameplay Info, Score Bottom
new Text:text_rules;					// On Connect Rules
new Text:text_redflash;					// CP countdown/Red Flash
new Text:gamemsg_cp;            		// checkpoint infiltration
new Text:WideScreenUp;  				// Class Selectiom Cinematic Black Bar
new Text:WideScreenDown;				// Class Selectiom Cinematic Black Bar
new Text:ClassTeams_Auto;				// Team name - class selection
new Text:ClassTeams_Home;				// Team name - class selection
new Text:ClassTeams_Away;				// Team name - class selection
new Text:ClassTeams_Subhome;			// Team name - class selection
new Text:ClassTeams_Subaway;			// Team name - class selection
new Text:ClassTeams_Ref;				// Team name - class selection
new Text:classhud1;                 	// Class HUD - Top bar
new Text:classhud2;                 	// Class HUD - Central
new Text:classhud3;                 	// Class HUD - Bottom bar
new Text:classhud_home;             	// Class HUD - Home Info
new Text:classhud_away;             	// Class HUD - Away Info
new Text:home_tdamage;					// Team Damage - Home
new Text:away_tdamage;					// Team Damage - Away
new Text:text_gtau;                 	// "GTA-United" small label above the radar
new Text:DamageTexts[MAX_PLAYERS];  	// Hits & Damage textdraw
new Text:skip_intro;                	// Skip Intro: /intro (Intro Cinematics)
new Text:specingYou[MAX_PLAYERS];   	// Who is spectating you td
new Text:lobbybg1;                  	// No longer used
new Text:text_firstblood;           	// First Blood td 1
new Text:text_firstblood2;          	// First Blood td 2
new Text:text_deathmsg;             	// Message shown on players screen when they die
new Text:text_hint[50];            		// Hints
new Text:text_fadeblack[MAX_PLAYERS];	// Fading black screen for Intro
new Text:intro_gmname[MAX_PLAYERS];     // Intro: GM Name
new Text:BasesTextdraws[MAX_BASES];		// /bases command textdraw
new Text:BasesTextDrawsTop;				// Title of /bases command
new Text:ArenasTextdraws[MAX_ARENAS];	// /tdms command textdraw
new Text:ArenasTextDrawsTop	;			// Title of /tdms command
new Text:CoverScreen;              		// Cover whole screen with black
new Text:flashy_site;					// Flashy site link (No longer used)
new Text:flashy_site2;                  // Flashy site link 2 (No longer used)
new Text:autowep;                       // Auto-Weapons: Big yellow box
new Text:autowep2;                      // Auto-Weapons: Top black box
new Text:autowep3;                      // Auto-Weapons: Bottom black box
new Text:autowep4;                      // Auto-Weapons: "Auto Weapons" title
new Text:autowep5;                      // Auto-Weapons: Weapons list
new Text:specfps[MAX_PLAYERS];          // Spec FPS
new Text:specweps1;                     // Spec Weapons: Big yellow box
new Text:specweps2;                     // Spec Weapons: Top black box
new Text:specweps4;                     // Spec Weapons: "Auto Weapons" title
new Text:specweps5[MAX_PLAYERS];        // Spec Weapons: Weapons list
new Text:hud1;                          // Round Hud: Top black bar
new Text:hud2;                          // Round Hud: Bottom black bar
new Text:hud3;                          // Round Hud: Purple background
new Text:hud4;                          // Round Hud: Title
new Text:homehud;                       // Round Hud: Home team info
new Text:awayhud;                       // Round Hud: Away team info
new Text:veh1;                          // Vehicle Hud: Top black bar
new Text:veh2;                          // Vehicle Hud: Bottom black bar
new Text:veh3;                          // Vehicle Hud: Content
new Text:veh4[MAX_VEHICLES];            // Vehicle Hud: Vehicle name
new Text:veh5;                          // Vehicle Hud: Health black bar bg
new Text:veh6[MAX_VEHICLES];            // Vehicle Hud: Health red bar
new Text:veh7[MAX_VEHICLES];            // Vehicle Hud: Info
new Text:HUDTop;                        // Player Hud: Top black bar
new Text:HUDBottom;                     // Player Hud: Bottom black bar
new Text:HUDBox;                        // Player Hud: Background box
new Text:HUDPlayerName[MAX_PLAYERS];    // Player Hud: Player name
new Text:HUDWeapons[MAX_PLAYERS];       // Player Hud: Player weapons
new Text:HUDHealth[MAX_PLAYERS];        // Player Hud: Player health
new Text:HUDArmour[MAX_PLAYERS];        // Player Hud: Player armour
new Text:HUDDistance[MAX_PLAYERS];      // Player Hud: Player distance
new Text:fps_text[MAX_PLAYERS];         // Shows player ping and tickrate
new Text:ts_lefttopbar;                 // Round Over: Left side black background box
new Text:ts_awaybg;                     // Round Over: Away team background box
new Text:ts_homebg;                     // Round Over: Home team background box
new Text:ts_homename;                   // Round Over: Home team name
new Text:ts_awayname;                   // Round Over: Away Team Name
new Text:ts_homescore;                  // Round Over: Home player list
new Text:ts_awayscore;                  // Round Over: Away player list
new Text:ts_righttopbar;                // Round Over: Right side black background box
new Text:ts_topbar;                     // Top Shooter: Top black bar
new Text:ts_bottombar;                  // Top Shooter: Bottom black bar
new Text:ts_centralbg;                  // Top Shooter: Main purple background
new Text:topshooter;                    // Top Shooter: Name of top shooter player
new Text:HomePlayersScore;              // Final Results: Home player list
new Text:AwayPlayersScores;             // Final Results: Away player list
new Text:AwayTotalScore;                // Final Results: Away team score
new Text:HomeTotalScore;                // Final Results: Home team score
new Text:AwayNameTD;                    // Final Results: Away team name
new Text:HomeNameTD;                    // Final Results: Home team name
new Text:AwayBackground;                // Final Results: Away player list background box
new Text:HomeBackground;				// Final Results: Home player list background box
new Text:TopOne;                        // Final Results: Top black box background behind team names
new Text:ScoreBox;                      // Final Results: Score Box
new Text:DownOne;                       // Final Results: Bottom black bar under team player lists
new Text:Results;                       // Final Results: "Final Results" title
new Text:ResultsHome;                   // Final Results: Home Result
new Text:ResultsAway;                   // Final Results: Away Result
new Text:ResultsScore;                  // Final Results: Scores
new Text:ScoreBoxStarsTop;              // Final Results: Score Box Stars Top
new Text:ScoreBoxStarsBottom;           // Final Results: Score Box Stars Bottom
new Text:CinematicUp;                   // Final Results: Widescreen top black bar
new Text:CinematicDown;                 // Final Results: Widescreen bottom black bar
new Text:GunList_1;                     // Gun list textdraw 1
new Text:GunList_2;                     // Gun list textdraw 2
new Text:GunList_3;                     // Gun list textdraw 3
new Text:GunList_4;                     // Gun list textdraw 4
new Text:GunList_5;						// Gun list textdraw 5
new Text:FPS[MAX_PLAYERS];              // Used to display FPS in Corner
//new Text:ScoreboardScore;              // Lobby Scoreboard: Scores
new Text:ScoreboardHome;                // Lobby Scoreboard: Home Team Name
new Text:ScoreboardAway;                // Lobby Scoreboard: Away Team Name

//----------------------------------------------------------------//
//************************ Menu Variables ************************//
//----------------------------------------------------------------//

new Menu:SetTheWorldTime;		// Set world time
new Menu:CreateBaseMenu;		// Base creation
new Menu:CreateTDMMenu;			// TDM creation
new Menu:vehiclemenu;			// Vehicle Menu: Main
new Menu:vehiclemenu_suv;		// Vehicle Menu: 4 Door SUVs
new Menu:vehiclemenu_car; 		// Vehicle Menu: 4 Door Cars
new Menu:vehiclemenu_air; 		// Vehicle Menu: Aircraft
new Menu:vehiclemenu_sports; 	// Vehicle Menu: Sports Cars
new Menu:vehiclemenu_low; 		// Vehicle Menu: Low Riders
new Menu:vehiclemenu_boats; 	// Vehicle Menu: Boats
new Menu:vehiclemenu_bikes; 	// Vehicle Menu: Bikes
new Menu:vehiclemenu_other; 	// Vehicle Menu: Other
new Menu:DuelSetupMenu;         // Duels Setup
new Menu:DMSetupMenu;           // DM Setup
new Menu:primarymenu;			// Gun Menu: Primary
new Menu:secondarymenu;			// Gun Menu: Secondary
new Menu:terciarymenu;          // Gun Menu: Terciary
new Menu:specialmenu;			// Gun Menu: Special
new Menu:switch_menu;			// Switch teams
new Menu:wepdone_menu;			// Gun Menu: Finished?
new Menu:fightmenu;             // Fighting style selection

//-------------------------------------------------------//
//********************** Variables **********************//
//-------------------------------------------------------//

#define GeoIP_MainFile      "dc_geoip/geoip.db"
#define GeoIP_CityFile      "dc_geoip/geoip_city.db"



new DB:geoip_db;
new DB:geoip_city;

enum geoip_info {
	ISP[70],
	City[70],
	Country[70],
};

new GeoIP[MAX_PLAYERS][geoip_info];

/*
	Player Info Array || Player[MAX_PLAYERS][p_info]
	- used to track a large amount of player information throught the gamemode
*/

enum p_info
{
	pTeam,								// team the player is on
	pColour,							// player color
	vHudID,								// vehicle hud id (textdraw)
	secondsPlayed,						// seconds played on the server
	State,								// current player state
	WepState,                           // Current player weapon state
	Status,								// keeps track if there a sub, playing, dead, afk, etc
	LastUpdate,							// last time OnPlayerUpdate was called for player
	LastSync,							// how many seconds sinc ethe last they synced
	RoundsPlayedEx,						// amount of rounds played
	Kills,								// kills total
	RoundKillsEx,						// kills in rounds
	RoundDeathsEx,						// deaths in rounds
	Deaths,								// deaths total
	TempKillSpree,						// temp kspree
	TempDeathSpree,						// temp dspreee
	KillSpree,							// current kill spree
	DeathSpree,							// current death spree
	CaptureTimes,						// amount of checkpoint captures
	OnlineTime,							// time played
	pWeaponsKills[MAX_COUNT_WEAPONS],	// amount of kills with each weapon
	pWeaponsDeaths[MAX_COUNT_WEAPONS],	// amount of deaths with each weapon
	RoundScore,							// there score in the current round
	SpawnType,							// death spot, regular or set
	pClass,								// keeps track of each players class, not just team actual class id
	PrimaryWep,							// id of primary weapon chosen for round
	PrimaryWepAmmo,						// ammo of primary weapon chosen for round
	SecondaryWep,						// id of secondary weapon chosen for round
	SecondaryWepAmmo,					// ammo of secondary weapon chosen for round
	TerciaryWep,                        // if of terciary weapon chosed for round
	TerciaryWepAmmo,                    // ammo of terciary weapon chosen for round
	SpecialWep,							// id of special weapon chosen for round
	SpecialWepAmmo,						// ammo of special weapon chosen for round
	pSkin,								// keeps track of the players current set skin
	pScore,								// keeps tracks of players score, since score is used for hp
	gSpectateID,						// id of the player they are spectating
	gSpectateType,						// the type of spectating... vehicle, player on foot, etc
	TempTime,							// stores "online time" for each player
	ViewTDMID,							// id of the tdm the player is viewing
	ViewBaseID, 						// id of the base the player is viewing
	pDuel,								// keeps track of the id of the duel a player is in, or if they are in fact in a duel, 0 means no
	pLevel,								// player admin level
	pCarColor1,							// player default car color 1
	pCarColor2,							// player default car color 2
	Text:SpecText,						// textdraw spec text
	NowTracking,						// keeps track of player id a player is tracking (hud)
	Float:pArmour,						// keeps track of player armour
	Float:pHealth,						// keeps track of player health
	//PlayerText3D:CPLabel,             // id of 3d text label for base cp
	NamePrefix,							// keeps track of current player name prefix
	VehicleID,							// id of the vehicle they are in
	pHits,								// Number of hits player got in a row
	DLlast,                             // Variable for tracking player fps
	FPS2,                               // Variable for tracking player fps
	LastDamage,							// last player damage amount
	DuelsWon,                           // amount of duels won
	DuelsLost,                          // amount of duels lost
	vWorld,                             // virtual world player is in
	Camera,                             // Keeps track of which csel location player will see
	IntroPos,                           // Keeps track of intro location for player
	Tickrate,                           // Players tickrate with the server
	introIndex,							// seconds into intro they are
	introOffset,						// for the rotating camera
	class_id,							// current class they are at in class selection
	introTimer,							// id of intro timer
	duelTimer,							// id of duel timer
	csel_timer,							// id of the timer used for csel camera
	InPickup,                           // if of pickup player has just picked up
	introStopFlashing,                  // stop flashing text in intro
	introStringIndex,                   // used for the dynamic strings in into cinematics
	TempIntroString[256],               // used to temporarily store the intro string as its being typed out on players screen
	pLanguage,                          // players language
	PossibleDamage,                     // Not currently implemented
	PossibleHits,                       // Not currently implemented
	DM,                                 // id of deathmatch player is in
	DMPlayTime,                         // time playing in dm
	DMKills,                            // deathmatch kills
	DMDeaths,                           // deathmatch deaths
	DMKillSpree,                        // deathmatch kill spree
	TempDMKills,                        // temp deathmatch kills
	TempDMDeaths,                       // temp deathmatch deaths
	Text3D:AFKLabel,                    // I am currently AFK. 3d text label
	Text3D:DmgLabel,                    // Damage 3d text label
	Float:LoadingScreenRotationAngle,   // rotation angle of loading round camera
	Float:Altitude,                     // altitude of loading round camera
	Float:AltitudeIndex,                // altitude index of loading round camera
	Float:CamRotationAngle,             // rotation angle of class selection camera
	Float:CamZPosition,                 // z position of class selection camera
	Float:RequestClassAngle,            // angle of class selection camera
	Float:LastPos[3],                   // constantly stores players last position for GetPlayerSpeed
	Float:bounds_xmax,                  // World Bounds: X Max
	Float:bounds_xmin,                  // World Bounds: X Min
	Float:bounds_ymax,                  // World Bounds: Y Max
	Float:bounds_ymin,                  // World Bounds: Y Min
	csel_object,                        // object for class selection
	SurfingVehicleID,                   // last known vehicle player was surfing
	Damage,                             // The total amount of damage the playerid has done in the current round
	IJustLost,                          // the amount of HP the player has lost from the last shot he took
	bool:pMoney,               		    // does the palyer have money enabled or not?
	bool:boundsSet,                     // world bounds set for player?
	bool:isRaging,                      // is the player raging? killed within the last 20 seconds
	bool:Suicided,                      // did they kill themself? /kill
	bool:CanSync,                       // can the player use sync command?
	bool:CanScrollSpec,                 // can the player scroll in spec?
	bool:FirstSpawn,                    // is the player spawning for the first time?
	bool:ChangedNick,                   // has the player changed their nickname?
	bool:ControlledCamera,              // is the player manually controlling rotate camera (base/tdm loading)
	bool:introFlashing,                 // used to track flashy text in intro
	bool:FirstIntroFlash,               // used to track first intro flash
	bool:EndedIntro,                    // has the player skipped the intro?
	bool:FirstTime,                     // is it the players first time entering class selection?
	bool:inIntro,						// are they in the intro?
	bool:inCmdIntro,					// did they view intro with cmd?
	bool:justConn,						// did they just connect?
	bool:justClass,						// did they just enter class selection?
	bool:RequestingClass,               // are they in class selection?
	bool:CamRotationDirection,          // rotation direction of csel camera
	bool:CamZPositionFall,              // z position fall for csel camera
	bool:GamemodeOwner,                 // not used for anything anymore
	bool:ChosenWeapons,                 // has the player finished choosing weapons from gun menu?
	bool:ChatAllowed,					// is player allowed to use open chat ?
	bool:SpecingBase,					// is player specing base ?
	bool:Lobbytextdraws,				// is lobby textdraw showed ?
	bool:Roundtextdraws,				// is round textdraw showed ?
	bool:Visible,						// is player visible in enemy's radar ?
	bool:PlayerHUDTextDrawCreated,		// is player hud td created ?
	bool:PlayerHUDTextDrawShown,		// is player hud td shown ?
	bool:CancelDuel,					// cancel duel for the player?
	bool:ViewBase,						// are they viewing a base?
	bool:ViewTDM,						// are theyv iewing a tdm?
	bool:InHappyEnding,					// are they in the final results screen?
	bool:IgnoreSpawnCallback,			// are they syncing?
	bool:vHud,							// are they being show a vehicle hud?
	bool:lock_pass,						// did they enter server pass?
	bool:registered,					// are they registered?
	bool:loggedin,						// are they logged in?
	bool:admin,							// are they regular admin?
	bool:superadmin,					// are they super admin?
	bool:AFK,							// are they afk? /afk
	bool:setToPlay,						// are they set to play? this is false when they are afk, in a duel, etc
	bool:pPlaying,						// are they playing in a round?
	bool:pVoted,						// have they voted?
	bool:Specing,						// are they spectating?
	bool:pSpawned,						// is the player spawned?
	bool:InDuelWhenRound,               // was the player in a duel when a round was started?
	bool:IsAudioStreaming               // Does the player have an audio stream recently running
}

new Player[MAX_PLAYERS][p_info];

/*
	Server Info Array || Server[s_info]
	- used to track information about server
*/

enum s_info
{
	HighestID,					// holds the highest player id connected
	Vehicles,					// keeps track of how many vehicles spawned
	Slots,						// keeps track of how many slots this samp server has
	MaxVehicles,				// keeps track of max vehicles
	ServerTicks,				// amount of seconds since server has started
	pConnected,					// amount of players connected to the server
	TotalConnections,			// total connections to server
	ServerDeaths,				// total player kills
	ServerKills,				// total player deaths
	ServerRoundKills,			// total player kills in rounds
	ServerRoundDeaths,			// total player deaths in rounds
	TotalCrashes,				// total player crashes/timeouts
	TotalRounds,				// total rounds played
	Init,						// stores the data/time the server was started
	HomeTeamSkin,				// holds the set team skin for home team
	AwayTeamSkin,				// holds the set team skin for away team
	RoundLimit,					// amount of rounds before final results shown
	LastGamemodePlayed, 		// the type of the last round played (base, tdm, etc)
	LastRoundPlayed,			// id of the file for the last round
	PartialRounds,				// rounds played
	TotalBases,					// total amount of bases
	TotalTDMs,					// total amount of TDMs
	DeadTag[10],				// tag player get when they die in a round
	MainTextdrawLayout,			// type of main gm textdraw
	LeaveVehicleMessage[24],    // Message you see on vehicle hud when vehicle is on fire (Default: GTFO)
	ValidDuels,                 // How many valid duels there is
	ValidDMs,                   // How many valid deathmatches there is
	IntroString[128],           // main intro string
	IntroSubString[128],        // intro sub sting
	FlashyTimer,                // Not used anymore
	FlashyLink,                 // Not used anymore
	FlashyMessage,              // Not used anymore
	FlashyFlashes,              // Not used anymore
	HighestBaseID,              // Highest base ID
	HighestTdmID,               // Highest tdm ID
	HighestDmID,          	    // Highest dm ID
	HighestTeleID,              // Highest tp ID
	HighestDuelID,              // Highest duel ID
	RecentB[MAX_ROUND_LIMIT],   // Recent bases played
	RecentT[MAX_ROUND_LIMIT],   // Recent TDM's played
	SQLQueriesExecuted,         // amount of mysql queries executed
	Text3D:lobby1_text3d,       // 3d text label for lobby 1
	Text3D:lobby2_text3d,       // 3d text label for lobby 2
	bool:EPRoundStarted,        // has an expansion pack round been started?
	bool:AutoSpec,				// Should players automattically spectate their teammates when they die in a round ?
	bool:NoChat,				// Is any use of chat allowed ?
	bool:NickChanging,			// is /nick command permited ?
	bool:LobbyVehicles,			// Are lobby vehicles allowed to be spawned ?
	bool:AutoReadd,				// should players be auto-readded to a round when they timeout ?
	bool:GlobalChatEnabled,		// is Gobal chat permited ?
	bool:AllowDuels,			// Are duels allowed ?
	bool:explosives,			// explosives enabled ?
	bool:PauseMessages,			// Show pause messages during rounds ?
	bool:AllowVehicleMod,		// Allow players to add nitro / hydraulics to their cars?
	bool:AutoHUD,				// Automatically activates HUD when player connect ?
	bool:HUD,					// HUD system enabled ?
	bool:WeaponDrop,			// weapon drop enabled ?
	bool:TimerMode,				// is timer mode enabled?
	bool:TkMode,				// is tk protection enabled?
	bool:SaveResults,			// should the gamemode be saving round results?
	bool:EnableSkinChanging[6],	// can players use /skin?
	bool:serverLock,			// is the server locked?
	bool:UAVEnabled,			// is uav radar enabled?
	bool:CantSpawnVehicle,		// can vehicles be spawned?
	bool:DisplayHintMessages,	// are hint messages displayed?
}

new Server[s_info];

/*
	BeyondDiscon System
	- Keeps track of players scores after they disconnect to be used in Final Results
*/

enum bd_info
{
	pName[30],						// Player Name
	pTeam,                          // Player Team
	pKills,							// Player Kills
	pDeaths,						// Player Deaths
	pRoundKills,					// Player Round Kills
	pRoundDeaths,					// Player Round Deaths
	pCurrDmg,                       // Player's damage in the current round
}

new BeyondDiscon[MAX_PLAYERS][bd_info];

/*
	Death List Info
	- used to track whats on the death list for clearing/saving
*/

enum dl_info
{
	killer,							// the killer
	whodead,						// who is dead
	deadreason						// death reason
}

new DeathList[6][dl_info];

/*
	ConfigAudio[]
	- Stores configuration information for audio
	    See: audio.ini
*/
#if SAMP_VERSION == 2
	enum ConfigAudioInfo
	{
		bool:sndVoiceMsgs,
		bool:sndChoppers,
		bool:sndVehicleRadio,
		bool:sndFirstBlood,
		bool:sndGotKill,
		bool:sndGotKilled,
		bool:sndRoundStarting,
		bool:sndRoundStarted,
		bool:sndDuel,
		bool:sndKillSpree,
		bool:sndPaused,
		bool:sndFinalResults,
		bool:sndIntro,
		bool:sndClassSelect,
	}

	new ConfigAudio[ConfigAudioInfo];
#endif

/*
	Config[]
	- Stores configuration information from the external ini configuration
	    See: main_config.ini
*/

enum ConfigInfo
{
	round_time,			// Time limit for rounds, in minutes
	cp_time,			// Time to capture checkpoint (bases)
	cp_size,			// Size of cp
	stop_counting,		// Round about to start coutndown
	LobbyInterior,		// Interior of the lobby
	LobbyWeapons,		// Disable or enable lobby weapons
	LobbyTD,			// Disable or enable lobby textdraws
	UseIntro,			// Disable or enable intro
	NameTagDistance,	// distance (feet) players can see nametags
	Speedmeter,			// Disable or enable vehicles' speedmeter on vehicle hud
	textdraws,			// Total amount of textdraws used
	autobalance,        // auto team balance
	RefMode,            // ref mode, spectate or spawned
	autoinvert,         // auto invert teams
	laser,         		// Weapon lasers
	//forcereg,         	// Required registration
	classic_chat,       // classic chat, ! for teamchat instead of teamchat default
	antisktime,         // time players will have god mod after they spawn
	tdmpoints,          // amount of points players have to reach in tdm rumble
	//-------------------------------------------------------------
	// These are the actual skins for each time, set in main_config
	skin_auto,
	skin_home,
	skin_subhome,
	skin_away,
	skin_subaway,
	skin_ref,
	//-------------------------------------------------------------
	weaponsystem,		// Gun Menu / Random / Full Set
	plimit,             // minimum players needed to start a round
	maxplimit,          // maximum players needed to start a round
	globalhealth,		// default health each player get in lobby
	globalarmour,		// default armour each player get in lobby
	roundhealth,		// health each player get in rounds
	roundarmour,		// armour each player get in rounds
	thetime,			// Time in server
	weather,			// Weather in server
	RotateCameraEx,		// Rotate camer in round about to start sky view?
	autologin,			// Auto login by IP
	skincmd,			// Enable or disable skin command
	diag,               // Player diagnostics
	regmode,            // Registration mode: Disabled, Normal, Forced
	sync,               // Sync on or off
	blip,               // /blip on or off
	c_dm,               // /config dm [on/off]
	autopause,          // autopause when a player times out on/off
	spec,               // spec on or off
	forcetime,          // The time that is forced ignoring time set in bases
	cplayout,           // If set to 0 it will count down the cp by 1 no matter how many players are in it, if set to 1 it will count down based on how many players are in the cp.
	bool:joypad,        // Joypad kick.
	DeathMsg[20]		// Message shown on players screen when they die
}

new Config[ConfigInfo];

/*
	Vehicle Info Array || VehicleInfo[MAX_VEHICLES][v_info]
	- used to track information about spawned vehicles
*/

enum v_info
{
	vModel,             // vehicle model
	vID,				// vehicle id
	vWorld,				// virtual world the vehicle is in
	pDriver,			// player id of the driver, -1 is default (none)
	pPass1,				// player id of passenger 1, -1 is default (none)
	pPass2,				// player id of passenger 2, -1 is default (none)
	pPass3,				// player id of passenger 3, -1 is default (none)
	Text3D:NameLabel,   // 3d text label with vehicle name
	EmptyCount,         // amount of seconds the vehicle has been unoccupied
	bool:wasEntered,	// was the vehicle enetered?
	bool:round,			// was it spawned in round?
	bool:hasSpawned		// has it spawned?
}

new VehicleInfo[MAX_VEHICLES][v_info];

/*
	HintMessages[#][string max size]
	- Shown to players each time they spawn as a reminder how to use the gamemode
	- Add more or edit as you need. Remember to increase the first array dimension.
*/
new HintMessages[13][128] = { // Shown to players each time they spawn in lobby
{"~b~Hint: ~w~To spawn a vehicle, use /car"},
{"~b~Hint: ~w~Type /duel to see the available duels."},
{"~b~Hint: ~w~You can use /gunmenu to re-select weapons while in the round."},
{"~b~Hint: ~w~Use /getgun to obtain a weapon while on Lobby"},
{"~b~Hint: ~w~You can register your nickname and save your~n~stats by using /register."},
{"~b~Hint: ~w~Type /serverinfo to see general Server Statistics."},
{"~b~Hint: ~w~Type /teleport to see the list of available teleports."},
{"~b~Hint: ~w~You can use /search to search for a specific base or tdm."},
{"~b~Hint: ~w~Use /hud to configure your HUD system."},
{"~b~Hint: ~w~Type /info to see server configuration and stats."},
{"~b~Hint: ~w~Use /bases or /tdms to see the complete list of all available bases/tdms."},
{"~b~Hint: ~w~Type /view to spectate a base or tdm."},
{"~b~Hint: ~w~While a round is being loaded, control the camera~n~using SPRINT, JUMP, CROUCH and ENTER."}
};

/*
	Weekday names and month names
		Used in log system.
*/
new WeekdayName[7][16] = {
	"Sunday",
	"Monday",
	"Tuesday",
	"Wednesday",
	"Thursday",
	"Friday",
	"Saturday"
};

new MonthName[12][16] = {
	"January",
	"February",
	"March",
	"April",
	"May",
	"June",
	"July",
	"August",
	"September",
	"October",
	"November",
	"December"
};

/*
	Weapons Info Array || WeaponsKills[MAX_COUNT_WEAPONS]
	- used to track amount of kills with each weapon on the server
*/

enum WeInfo
{
	WID,
	strKills[32],
	strDeaths[32]
};

new weaponsInfo[MAX_COUNT_WEAPONS][WeInfo] = {
{4, "knifekills", "knifedeaths"},// knife
{16, "grenadekills", "grenadedeaths"}, // grenade/explosion
{22, "coltkills", "coltdeaths"}, // colt 45 (pistols)
{23, "scoltkills", "scoltdeaths"}, // silenced pistol
{24, "desertkills", "desertdeaths"}, // desert eagle
{25, "shotgunkills", "shotgundeaths"}, // regular shotgun
{26, "sawnoffkills", "sawnoffdeaths"}, // sawnoffs
{27, "cshotgunkills", "cshotgundeaths"}, //combat shotgun
{28, "uzikills", "uzideaths"}, // uzi (mac 10)
{29, "mp5kills", "mp5deaths"}, // mp5
{30, "ak47kills", "ak47deaths"}, // ak47
{31, "m4kills", "m4deaths"}, // m4
{32, "tec9kills", "tec9deaths"}, // tec9
{34, "sniperkills", "sniperdeaths"} //shiper rifle
};

new WeaponsKills[MAX_COUNT_WEAPONS];

/*
	Weapons for /getgun
	- /getgun command [lobby]
*/

// The actual weapon id's
#define MAX_GETGUN_WEAPONS 30
new Weapon_idx;
new AvailableWeaponsIDs[MAX_GETGUN_WEAPONS];
// Ammo!
new AvailableWeaponsAmmo[MAX_GETGUN_WEAPONS];
// Name !
new AvailableWeapons[MAX_GETGUN_WEAPONS][24];

#define MAX_WEAPONS 47

/*
	Weapon Info (Gun Menu)
	- the weapons and ammo in the gun menu, dynamic, can be changed
*/

enum wmenu_data
{
	Option[MAX_WEAPONS],    // what weapons players has
	wAmmo[MAX_WEAPONS],     // weapon menu
	PrimaryMenuIDs[12],     // ID of weapons in primary menu
	SecondaryMenuIDs[12],   // ID of weapons in secondary menu
	TerciaryMenuIDs[12],    // ID of weapons in terciary menu
	SpecialMenuIDs[12],     // ID of weapons in special menu
	PrimaryCount,           // amount of guns in primary menu
	SecondaryCount,         // amount of guns in secondary menu
	TerciaryCount,          // amount of guns in terciary menu
	SpecialCount            // amount of guns in special menu
}

new WeaponsMenus[wmenu_data];

/*
	Player Match Info Array || PlayerMatchInfo[MAX_PLAYERS][variables]
	- used to track information about players who have played in a match
*/

enum Variables
{
	TotalKills,				// total kills player has
	TotalDeaths,			// total deaths player has
	RoundKills,				// kills achieved in round
	RoundDeaths,			// deaths in rounds
	bool:Died,				// did they die?
	bool:StartedPlaying,	// did they start playing?
	bool:PlayingMatch,		// are they playing match?
	bool:DidPlayMatch		// did they play match?
};

new PlayerMatchInfo[MAX_PLAYERS][Variables];

/*
	Match Info Array || MatchInfo[m_info]
	- used to track information about matches, team round statistics
*/

enum m_info
{
	AwayRoundsWon,	// total rounds away has won
	HomeRoundsWon,	// total rounds home has won
	TotalScoreHome,	// total score of home team
	TotalScoreAway,	// total score of away team
	away_list,      // amount of players on away player list
	home_list,      // amount of players on home player list
	results_ticks,  // final results timer
	RoundsPlayed 	// total rounds played
};

new MatchInfo[m_info];

/*
	Match Rounds Info Array || MatchInfo[m_info]
	- used to track information about rounds in matches
*/

enum mr_info
{
	roundtype,			// type 1 or 2 (base or tdm)
	roundid,			// id of base or tdm
	hpleft,         	// winning team: hp left
	roundkills,         // winning team: kills
	rounddeaths,        // winning team: deaths
	whowon,				// id of team who won
	roundwintype,       // win type of round
	roundtopshotta[30], // who was topshotta
	roundend[30],       // round end time
	roundstart[30]     	// round start time
};

new MatchRoundInfo[MAX_ROUND_LIMIT][mr_info];

/*
	Team Info Array || TeamInfo[MAX_TEAMS][TeamVariables]
	- used to track information about teams
*/

enum TeamVariables
{
	TotalKills,				// total kills team has
	TotalDeaths,			// total deaths team has
	RoundKills,				// kills in rounds
	RoundDeaths,			// deaths in rounds
	RoundHealth,			// current round health
	TempDamage,				// temp amount of damage team has taken
	bool:Won,				// did they win?
	bool:CapturedCP,		// did they capture cp?
	bool:TimeLimitedReached // time limit reached win?
}

new TeamInfo[MAX_TEAMS][TeamVariables];

/*
	Round Info Array || Round[r_info]
	- used to track information about rounds
*/

enum r_info
{
	Current,									   	   // the id of the current round, -1 is none
	ModeMin,									   	   // round timer: minutes
	ModeSec,									   	   // round timer: seconds
	started_home,								   	   // amount of defenders who were playing at start of round
	started_away,								   	   // amount of attackers who were playing at start of round
	home_list,              					       // amount of players on home team list for round over td
	away_list,               					       // amount of players on away team list for round over td
	StopCounting,								       // round about to start timer (seconds)
	Gamemode,									       // Base = 1; TDM = 2;
	Gameplay,									       // 1= Stealth and Survive, 2= War zone
	WinnerTeam,									       // Team that won
	WinType,									       // type of round win, how they won
	WorldTime,									       // world time for the round
	Interior,									       // interior the round is in
	VotingTime,									       // seconds it takes for voting
	RoundStartTimeInt,							   	   // integer form of round start time
	HPLeft,										   	   // stores the hp left of winning team
	TDMGangZone,								   	   // used to indentify the gang zone in tdms
	Attackers,										   // used to track which team is attacking
	EplapsedTime,								   	   // current time elapsed since round started
	atotal,											   // total "away" team members playing in round
	dtotal,											   // total "home" team members playing in round
	TeamDmgTimerAway,								   // ID of team damage timer - Away
	TeamDmgTimerHome,								   // ID of team damage timer - Home
	TimeInCP,										   // cp time, this keeps track of seconds until captured
	Paused,				        					   // is the round paused? 0 = no, 1 = yes, 2 = autopaused.
	Text3D:CPLabel,             					   // 3d text label -> "Capture the checkpoint"
	bool:FirstBlood,            					   // has first blood been drawn in the round?
	bool:AdminEnded,								   // was the round ended by admin?
	bool:DefTimeLost,								   // did the round end by time limit?
	bool:PlayerOnCP,								   // is an attacker in the cp?
	bool:CapturedCheckpoint,						   // did the round end by capture cp?
	bool:LoadScreen,								   // is the sky view of base/tdm being shown to players?
	bool:AdminCanEnd,								   // can the admin /end the round?
	bool:Voting,							           // is voting currently taking place?
}

new Round[r_info];

new VehicleMenuID[9][20];       	// Stores ID of vehicles in the menu
new bool:VehicleForAdmins[9][20];   // Stores info on which vehicles are for admins only
new Air_idx, SUV_idx, Car_idx, Boat_idx, Sports_idx, Low_idx, Others_idx, Bikes_idx;

static armedbody_pTick[MAX_PLAYERS]; // Used for weapons on body system
#pragma unused armedbody_pTick

new Text3D:PingLabels[MAX_PLAYERS]; // Diagnostics label

/*
	FinalResults[]
	- Keep track of variables used in Final Results slide show.
*/

enum fr_info
{
	bool:MovingCamera,
	Index1,
	Float:Index2
}

new FinalResults[fr_info];

/*
	Bases variables
	- used to track all base info
*/

enum base_vars
{
	Float:BaseCheckpoint[3],
	Float:DefSpawn[3],
	Float:AttSpawn[3],
	Interior,
	About[256],
	WorldTime,
	TimesPlayed,
	AttWins,
	DefWins,
	CreationDate[24],
	Creator[24]
}

new BaseVariables[MAX_BASES][base_vars];

/*
	Arenas variables
	- used to track all TDMs info
*/

enum arena_vars
{
	Float:ArenaCheckpoint[3],
	Float:DefSpawn[3],
	Float:AttSpawn[3],
	Interior,
	About[256],
	WorldTime,
	Float:Min_X,
	Float:Max_X,
	Float:Min_y,
	Float:Max_Y
}

new ArenaVariables[MAX_ARENAS][arena_vars];

/*
	Saved Variables Array || SaveVariables[SAVE_SLOTS][save_vars];
	- used to store player vars when they are timed out in a round
*/

enum save_vars
{
	pName[24],          		// player name
	Float:pHealth,      		// player health
	Float:pArmour,      		// player armour
	pWeapons[13],       		// player weapons
	pAmmo[13],          		// player ammo
	pTeam,              		// player team
	pInterior,          		// player interior
	pVWorld,            		// player virtual world
	SvTotalKills,       		// total kills
	SvTotalDeaths,      		// total deaths
	SvScore,            		// player score
	pSkin,              		// player skin
	pClass,             		// player class
	bool:RoundLoad,             // was the round loading?
	/*MatchKills,         		// Match Kills
	MatchDeaths,        		// Match Deaths
	MatchRoundKills,    		// Match Round Kills
	MatchRoundDeaths,   		// Match Round Deaths*/
	Float:pCoords[4]    		// player position coords
}

new SaveVariables[SAVE_SLOTS][save_vars];

/*
	Weapon Limit Data || WeaponLimit[50][wlimit_info];
	- used to store weapon limit info for each weapon
*/

enum wlimit_info
{
	limit,
	home_used,
	away_used
}

new WeaponLimit[50][wlimit_info];   // stores weapon limit info for each weapon
new WeaponSkill[MAX_WEAPONS];       // stores weapon skill info for each weapon

/*
	Other Player Variables
	-------------------------------------------------------
*/

enum VariablesHUD
{
	bool:Activated,     // is player hud activated?
	Type,               // type of hud
	TrackingID          // player id to be tracked

}

new PlayerHUD[MAX_PLAYERS][VariablesHUD];   // players player hud variables
new PlayerGuns[MAX_PLAYERS][13];			// keeps track of their lobby guns
new PlayerAmmos[MAX_PLAYERS][13];			// keeps track of their lobby guns' ammo
new Float:Spawn[MAX_PLAYERS][4];			// keeps track of their spawn for lobby
new PlayerSavedNames[MAX_PLAYERS][24];		// keeps track of their actual player name without DEAD_ AFK_, etc
new PlayerRootNames[MAX_PLAYERS][24];		// the name each player first connected with

/*
	Other Vehicle Variables
	-------------------------------------------------------
*/

new AttackerVehicle[MAX_PLAYERS][v_info]; // its like VehicleInfo, except more specific to attackers spawning vehicles within rounds

/*
	Other Round Variables
	-------------------------------------------------------
*/

new KillerInfo[MAX_PLAYERS][256]; // saves data of a kill/killer in a round like weapon, distance, and hp left

/* Location/Coords Data - CP, Attack Spawn, Defend Spawn, etc */
new Float:Checkpoint[3];
new Float:AwaySpawn[3];
new Float:HomeSpawn[3];
new Float:MinX,Float:MinY,Float:MaxX,Float:MaxY;
new	Float:Lobby[3];		// stores coords of lobby
new bool:TeamLocked[6]; // is team locked ?
/* ---------------------------------------------------------- */

new RoundStartTime[256];	// time the round started in string format
new RoundStartTime2[256];	// time the round started in string format
new RoundEndTime[256];		// time the round ended in string format
new RoundEndTime2[256];		// time the round ended in string format

/*
	Misc Strings, used to save text strings for the gamemode
*/

new Rules[6][1024];				// GM rules - can be changed with /config rules
new FullSet[7];					// Full set weapons tracking
new ClanTag[16];				// stores the clan_tag from main_config
new ServerPass[24];				// stores the server password, used for /lock
new HomeName[256];				// stores the set name of the home team
new AwayName[256];				// stores the set name of the away team
new RefName[256];				// stores the set name of the ref team
new HomeStatus[24] = "Defend";	// status of the home team, att or def
new AwayStatus[24] = "Attack";	// status of the away team, att or def
new StartedString[32];			// the date/time the server started in string format
new CreateFileString[256];		// stores file path to a created file like creating bases/tdms

// Lists of players for final results
new homestr[256], homestr2[256], homestr3[256], homestr4[256], homestr5[256], homestr6[256], homestr7[256];
new awaystr[256], awaystr2[256], awaystr3[256], awaystr4[256], awaystr5[256], awaystr6[256], awaystr7[256];

new grey[256];  // list of home players (round over td's)
new red[256];	// list of away players (round over td's)

#if DATA_SYSTEM == 2
new WorkingOnFileID;
new WorkingOnFileType;
#endif

/*
	Array of vehicle names
	- Example: VehicleName[vehicleid-400]
*/

new VehicleName[][] = {
   "Landstalker","Bravura","Buffalo","Linerunner","Pereniel","Sentinel","Dumper","Firetruck","Trashmaster","Stretch","Manana","Infernus",
   "Voodoo","Pony","Mule","Cheetah","Ambulance","Leviathan","Moonbeam","Esperanto","Taxi","Washington","Bobcat","Mr Whoopee","BF Injection",
   "Hunter","Premier","Enforcer","Securicar","Banshee","Predator","Bus","Rhino","Barracks","Hotknife","Trailer","Previon","Coach","Cabbie",
   "Stallion","Rumpo","RC Bandit","Romero","Packer","Monster Truck","Admiral","Squalo","Seasparrow","Pizzaboy","Tram","Trailer","Turismo",
   "Speeder","Reefer","Tropic","Flatbed","Yankee","Caddy","Solair","Berkley's RC Van","Skimmer","PCJ-600","Faggio","Freeway","RC Baron",
   "RC Raider","Glendale","Oceanic","Sanchez","Sparrow","Patriot","Quad","Coastguard","Dinghy","Hermes","Sabre","Rustler","ZR-350","Walton",
   "Regina","Comet","BMX","Burrito","Camper","Marquis","Baggage","Dozer","Maverick","SA News","Rancher","FBI Rancher","Virgo","Greenwood","Jetmax",
   "Hotring","Sandking","Blista Compact","Police Mav.","Boxville","Benson","Mesa","RC Goblin","Hotring Racer","Hotring Racer","Bloodring Banger",
   "Rancher","Super GT","Elegant","Journey","Bike","Mountain Bike","Beagle","Cropdust","Stunt Plane","Tanker","RoadTrain","Nebula","Majestic",
   "Buccaneer","Shamal","Hydra","FCR-900","NRG-500","HPV1000","Cement Truck","Tow Truck","Fortune","Cadrona","FBI Truck","Willard","Forklift",
   "Tractor","Combine","Feltzer","Remington","Slamvan","Blade","Freight","Streak","Vortex","Vincent","Bullet","Clover","Sadler","Firetruck",
   "Hustler","Intruder","Primo","Cargobob","Tampa","Sunrise","Merit","Utility","Nevada","Yosemite","Windsor","Monster Truck","Monster Truck",
   "Uranus","Jester","Sultan","Stratum","Elegy","Raindance","RC Tiger","Flash","Tahoma","Savanna","Bandito","Freight","Trailer","Kart","Mower",
   "Duneride","Sweeper","Broadway","Tornado","AT-400","DFT-30","Huntley","Stafford","BF-400","Newsvan","Tug","Trailer","Emperor","Wayfarer",
   "Euros","Hotdog","Club","Trailer","Trailer","Andromada","Dodo","RC Cam","Launch","Police Car (LSPD)","Police Car (SFPD)","Police Car (LVPD)",
   "Police Ranger","Picador","S.W.A.T. Van","Alpha","Phoenix","Glendale","Sadler","Luggage Trailer","Luggage Trailer","Stair Trailer","Boxville",
   "Farm Plow","Utility Trailer"
};

// Weapon Names (Shortened)

new wNamesShortened[][32] = {
	{"Unarmed (Fist)"}, // 0
	{"Brass Knuckles"}, // 1
	{"Golf Club"}, // 2
	{"Night Stick"}, // 3
	{"Knife"}, // 4
	{"Baseball Bat"}, // 5
	{"Shovel"}, // 6
	{"Pool Cue"}, // 7
	{"Katana"}, // 8
	{"Chainsaw"}, // 9
	{"Purple Dildo"}, // 10
	{"Big White Vibrator"}, // 11
	{"Medium White Vibrator"}, // 12
	{"Small White Vibrator"}, // 13
	{"Flowers"}, // 14
	{"Cane"}, // 15
	{"Grenade"}, // 16
	{"Teargas"}, // 17
	{"Molotov"}, // 18
	{" "}, // 19
	{" "}, // 20
	{" "}, // 21
	{"Colt 45"}, // 22
	{"Silenced"}, // 23
	{"Deagle"}, // 24
	{"Shotgun"}, // 25
	{"Sawnoff"}, // 26
	{"Combat"}, // 27
	{"Uzi"}, // 28
	{"MP5"}, // 29
	{"AK47"}, // 30
	{"M4"}, // 31
	{"Tec9"}, // 32
	{"Rifle"}, // 33
	{"Sniper"}, // 34
	{"RPG"}, // 35
	{"HS RPG"}, // 36
	{"Flame"}, // 37
	{"Minigun"}, // 38
	{"Satchel Charge"}, // 39
	{"Detonator"}, // 40
	{"Spray Can"}, // 41
	{"Fire Ext."}, // 42
	{"Camera"}, // 43
	{"NVG"}, // 44
	{"IVG"}, // 45
	{"Para."}, // 46
	{"Fake Pistol"} // 47
};

// Weapon Names (Normal)

new wNames[][32] = {
	{"N/A"}, // 0
	{"Brass Knuckles"}, // 1
	{"Golf Club"}, // 2
	{"Night Stick"}, // 3
	{"Knife"}, // 4
	{"Baseball Bat"}, // 5
	{"Shovel"}, // 6
	{"Pool Cue"}, // 7
	{"Katana"}, // 8
	{"Chainsaw"}, // 9
	{"Purple Dildo"}, // 10
	{"Big White Vibrator"}, // 11
	{"Medium White Vibrator"}, // 12
	{"Small White Vibrator"}, // 13
	{"Flowers"}, // 14
	{"Cane"}, // 15
	{"Grenade"}, // 16
	{"Teargas"}, // 17
	{"Molotov"}, // 18
	{" "}, // 19
	{" "}, // 20
	{" "}, // 21
	{"Colt 45"}, // 22
	{"Silenced 9mm"}, // 23
	{"Desert Eagle"}, // 24
	{"Pump Shotgun"}, // 25
	{"Sawnoff Shotgun"}, // 26
	{"Combat Shotgun"}, // 27
	{"Uzi"}, // 28
	{"MP5"}, // 29
	{"AK47"}, // 30
	{"M4"}, // 31
	{"Tec9"}, // 32
	{"Country Rifle"}, // 33
	{"Sniper Rifle"}, // 34
	{"RPG"}, // 35
	{"HS RPG"}, // 36
	{"Flamethrower"}, // 37
	{"Minigun"}, // 38
	{"Satchel Charge"}, // 39
	{"Detonator"}, // 40
	{"Spray Can"}, // 41
	{"Fire Extinguisher"}, // 42
	{"Camera"}, // 43
	{"Nightvision Goggles"}, // 44
	{"Infrared Goggles"}, // 45
	{"Parachute"}, // 46
	{"Fake Pistol"} // 47
};

// Weapon Names (Initials)

new wNamesInitials[][32] = {
	{"Unarmed (Fist)"}, // 0
	{"Brass Knuckles"}, // 1
	{"Golf Club"}, // 2
	{"Night Stick"}, // 3
	{"K."}, // 4
	{"Baseball Bat"}, // 5
	{"Shovel"}, // 6
	{"Pool Cue"}, // 7
	{"Katana"}, // 8
	{"Chainsaw"}, // 9
	{"Purple Dildo"}, // 10
	{"Big White Vibrator"}, // 11
	{"Medium White Vibrator"}, // 12
	{"Small White Vibrator"}, // 13
	{"Flowers"}, // 14
	{"Cane"}, // 15
	{"G."}, // 16
	{"Teargas"}, // 17
	{"Molotov"}, // 18
	{" "}, // 19
	{" "}, // 20
	{" "}, // 21
	{"Colt"}, // 22
	{"S9"}, // 23
	{"DE"}, // 24
	{"Pump"}, // 25
	{"Sawn"}, // 26
	{"CS"}, // 27
	{"Uzi"}, // 28
	{"MP5"}, // 29
	{"AK"}, // 30
	{"M4"}, // 31
	{"Tec9"}, // 32
	{"CR"}, // 33
	{"SR"}, // 34
	{"RPG"}, // 35
	{"HS RPG"}, // 36
	{"Flamethrower"}, // 37
	{"Minigun"}, // 38
	{"Satchel Charge"}, // 39
	{"Detonator"}, // 40
	{"Spray Can"}, // 41
	{"Fire Extinguisher"}, // 42
	{"Camera"}, // 43
	{"NVG"}, // 44
	{"IVG"}, // 45
	{"P."}, // 46
	{"Fake Pistol"} // 47
};

/*
	Misc/Other Variables used throught the gamemode...
*/

/* Request Class Array */
// {camera posx, y, z, cameralookat pos x, y, z}
new Float:IntroPositions[4][6] = {
	{1867.0000, -1761.0000, 72.0000, 1500.0000, -1250.0000, 65.0000},		// Los Santos
	{-2233.0591, 997.9387, 140.0078, 2176.6233, 78.4012, 100.0078},			// San Fierro
	{1940.0631, 1629.4506, 150.2578, 2117.1104, 1683.2452, 13.0060},		// Las Venturas
	{1483.5476, -1218.5514, 73.7567, 1405.6055, -790.4913, 84.8043}			// Vinewood Sign
};

/* Intro Locations */
// {player posx, y, z, facing angle, camera pos x, y, z, interior}
new Float:CamPositions[6][8] = {
	{220.5151, 1822.9080, 7.5400, 270.3133, 226.688491, 1822.708251, 7.414062, 0.0 },	// Area 51 radar bg
	{487.5913,-3.0521,1002.3828,179.8082, 487.4378,-4.0787,1000.6719, 17.0 },			// Dancing club
	{1221.4973,-6.3550,1001.3281,88.1925,1216.2343,-6.3932,1001.6281,2.0},				// ILL Repude, hearts in the background
	{2324.4299,-1140.8053,1050.4922,179.3733,2324.4299,-1145.7411,1050.7101,12.0},		// CJ behind table, stairs in backgrund
	{292.2432, -81.5983, 1002.5341, 90.0, 289.2432, -79.5983, 1002.5341, 4.0},			// gun shop
	{380.880096,-2020.602294,10.250000,90.0, 387.880096,-2020.602294,11.250000, 0.0}	// Santa maria pier
};

new ValidCselWeapons[8][1] = {
	6,	// shovel
	25,	// shotgun
	27,	// combat shotgun
	30,	// ak-47
	31,	// m4
	35,	// rocket launcher
	34,	// sniper rifle
	36  // hs rocket launcher
};

/* Duel Variables */
#define MAX_DUELS	20

new InDuel[MAX_DUELS];
new Counting[MAX_DUELS];

//Duel Coords {player 1 x, player 1 y, player 1 z, player 1 angle, player 2 x, player 2 y, player 2 z, player 2 angle},
new Float:DuelCoords[MAX_DUELS][9];

new DuelSetupID;
new DuelWeapons[MAX_DUELS][5];
new DuelName[MAX_DUELS][256];
new bool:DuelWorking[MAX_DUELS] = false;

/* Note: You can increase the MAX_DUELS define and have as many duels as you want. */
/* -------------- */

/* DMs Variables */
#define MAX_DMS	20

//Duel Coords {player 1 x, player 1 y, player 1 z, player 1 angle, player 2 x, player 2 y, player 2 z, player 2 angle},
new Float:DMCoords[MAX_DMS][9];

new DMZones[MAX_DMS];
new Text:DMScores[MAX_DMS];
new DMSetupID;
new DMWeapons[MAX_DMS][5];
new DMName[MAX_DMS][256];
new bool:DMWorking[MAX_DMS] = false;

/* Note: You can increase the MAX_DMS define and have as many DMs as you want. */
/* -------------- */

/* Teleport Variables */
#define MAX_TELEPORT_AREAS  30
new Float:TeleportAreas[MAX_TELEPORT_AREAS][4];
new TeleportNames[MAX_TELEPORT_AREAS][256];
/* Note: You can increase the MAX_TELEPORT_AREAS define and have as many teleports as you want. */
/* -------------- */

new Votes[MAX_BASES] = 0;	// stores the vote count for each base OR tdm
new BaseTimer;				// used to identify the baseupdate timer for bases
new TDMTimer;				// used to identify the tdmupdate timer for tdms
new MarkerTimer;			// used to identify markerstealth timer for rounds
new NametagTimer;			// used to identify nametagstealth timer for rounds
new HUDUpdateTimer;			// used to identify the hud update timer for rounds

new RandWheels[17][1] = {1025,1073,1074,1075,1076,1077,1078,1079,1080,1081,1082,1083,1084,1085,1096,1097,1098};  // ids of random wheels for vehicles

/* Weapon droping system variables \ by mabako with minor edits */
enum pickup
{
	creation_time,
	weapon,
	ammo,
	Float:Pos_x,
	Float:Pos_y,
	Float:Pos_z,
	timer
}
new Pickups[MAX_PICKUPS2][pickup];

// Set any of those to -1 to disable dropping of that weapon
new weapons[] =
{
	-1,		// no fists
	331,	// - Brass Knuckles
	333,	// Golf Club
	334,	// Night Stick
	335,	// Knife
	336,	// baseball bat
	337,	// shovel
	338,	// pool cue
	339,	// katama
	341,	// chainsaw
	321,	// regular dildo
	322,	// white dildo
	323,	// Medium, white vibrator
	324,	// smaill, silver vibrator
	325,	// flowers
	326,	// cane
	342,	// grendade
	343,	// tear gas
	344,	// molotov
	-1,		// RPG rocket - we can't pick up those, do we oO
	-1,		// Heat-Seeking Rocket
	-1,		// Hydra rocket
	346,	// colt 45
	347,	// colt 45 + silencer
	348,	// deagle
	349,	// shotgun
	350,	// sawn-off
	351,	// spaz
	352,	// micro-uzi
	353,	// mp5
	355,	// ak47
	356,	// m4
	372,	// tec9
	357,	// country rifle
	358,	// sniper rifle
	-1,		// rocket launcher
	-1,		// heat-seeking rocket launcher
	361,	// flamethrower
	-1,		// minigun
	363,	// sachtel charges
	-1,		// detonator
	365,	// spray can
	366,	// fire extinguisher
	367,	// camera
	-1,		// night-vision goggles
	-1,		// heat-vision goggles
	371		// parachute
};

#define MAX_SPAWNABLE_VEHICLES  100
enum spawnable_veh
{
	VehName[24],
	VehID,
	bool:A_Only
}
new SpawnableVehicles[MAX_SPAWNABLE_VEHICLES][spawnable_veh];
new S_Index;

// used for hits & damage system

new dmg_update_timer[MAX_PLAYERS];

enum dmg_enum
{
	xplayer = 0,
	damage
}

new DamageData[50][dmg_enum];

stock strtok(const string[], &index,seperator=' ')
{
	new length = strlen(string);
	new offset = index;
	new result[MAX_STRING];
	while ((index < length) && (string[index] != seperator) && ((index - offset) < (sizeof(result) - 1)))
	{
		result[index - offset] = string[index];
		index++;
	}

	result[index - offset] = EOS;
	if ((index < length) && (string[index] == seperator))
	{
		index++;
	}
	return result;
}

//------------------------------------------------------//
//********************** Commands **********************//
//------------------------------------------------------//

/*
	Make Admin Command
	Usage: /makeadmin <playerid> <admin level>
	Description: Can be used by rcon admins to make ppl administrator.
	Access: RCon, Root Admin
*/

CMD:makeadmin(playerid, params[])
{
	new tmp[256], tmp2[256], idx;
	tmp = strtok(params, idx);      // get player id parameter
	new id;
	tmp2 = strtok(params, idx);     // get admin level parameter
	new status = strval(tmp2);		// admin level to be set

	if(!IsNumeric(tmp))
		id = ReturnPlayerID(tmp);
	else
		id = strval(tmp);

	if(!IsPlayerRootAdmin(playerid)) SendClientMessageEx(playerid, COLOR_RED, "{FF0000}� Error: {FFFFFF}You need to be root admin to do that!"); // no access
	else if(isnull(tmp) || !IsNumeric(tmp2) || isnull(tmp2) || strval(tmp2) > 2 || strval(tmp2) < 0)
	{   // did not use command properly
		SendClientMessageEx(playerid, COLOR_GREY, "Usage: {FFFFFF}/makeadmin [player id/name] [admin level]");
		SendClientMessageEx(playerid, COLOR_GREEN, "Help - Levels: 0: Regular Player | 1: Administrator | 2: Root Admin");
	}
	else if(!IsPlayerConnected(id))
		return SendClientMessageEx(playerid, COLOR_RED, "{FF0000}� Error: {FFFFFF}Player not found."); // player doesnt exist
	else if(!Player[id][loggedin])
		return SendClientMessageEx(playerid, COLOR_RED, "{FF0000}� Error: {FFFFFF}Player not logged in."); // player not logged in
	else
	{
		new pfile[200];
		format(pfile, sizeof(pfile), "combinations/players/%s.ini", nick_encode(PlayerName(id))); // path to target players save file
		new pstatus[200];
	    switch(status)
	    {
	        case 0: // Regular Player (Demotion)
	        {
	            format(pstatus, sizeof(pstatus), "** Admin %s has changed your account level to 0 (Regular Player)", PlayerName(playerid),GetPlayerLevelName(id));
	        	SendClientMessageEx(id, COLOR_GREEN, pstatus);
				#if DATA_SYSTEM == 1
	            	dini_IntSet(pfile, "AdminLevel", 0);
	            #elseif DATA_SYSTEM == 2
                	UpdateSqlUserDataInt(id, "AdminLevel", 0);
                #endif
  	            Player[id][pLevel] = 0;
	            format(pstatus, sizeof(pstatus),"** Changed %s account level to 0 (%s)", PlayerName(id), GetPlayerLevelName(id));
	     	   	SendClientMessageEx(playerid, COLOR_GREEN, pstatus);
			}
			case 1: // Regular admin
			{
				#if DATA_SYSTEM == 1
	            	dini_IntSet(pfile, "AdminLevel", 1);
	            #elseif DATA_SYSTEM == 2
                	UpdateSqlUserDataInt(id, "AdminLevel", 1);
                #endif
	            Player[id][pLevel] = 1;
	            format(pstatus, sizeof(pstatus), "** Admin %s has changed your account level to 1 (%s)", PlayerName(playerid), GetPlayerLevelName(id));
	        	SendClientMessageEx(id, COLOR_GREEN, pstatus);
	            format(pstatus, sizeof(pstatus),"** Changed %s account level to 1 (%s)", PlayerName(id), GetPlayerLevelName(id));
	     	   	SendClientMessageEx(playerid, COLOR_GREEN, pstatus);
	     		CallRemoteFunction("DC_MakeAdmin", "i", id);
			}
			case 2: // Root Admin
			{
				#if DATA_SYSTEM == 1
	            	dini_IntSet(pfile, "AdminLevel", 2);
	            #elseif DATA_SYSTEM == 2
                	UpdateSqlUserDataInt(id, "AdminLevel", 2);
                #endif
    	        Player[id][pLevel] = 2;
	            format(pstatus, sizeof(pstatus),"** Admin %s has changed your account level to 2 (%s)", PlayerName(playerid), GetPlayerLevelName(id));
	        	SendClientMessageEx(id, COLOR_GREEN, pstatus);
	            format(pstatus, sizeof(pstatus),"** Changed %s account level to 2 (%s)", PlayerName(id), GetPlayerLevelName(id));
	     	   	SendClientMessageEx(playerid, COLOR_GREEN, pstatus);
	     		CallRemoteFunction("DC_MakeAdmin", "i", id);
			}
		}

	}
	return 1;
}

/*
	Team Skin Command
	Usage: /teamskin [team id] <skin id>
	Description: Can be used by all admins to set a team skin on a team. Team skin means all team members get set skin.
	Access: Administrator
*/

CMD:teamskin(playerid, params[])
{

	new tmp[256], idx;
	new command_id;
	tmp = strtok(params, idx);
	new string[256];

	if(!IsPlayerAdmin3(playerid)) SendClientMessageEx(playerid, COLOR_RED, "{FF0000}� Error: {FFFFFF}You need to be admin to do that!"); // no access

	else if(isnull(tmp)|| !IsNumeric(tmp) || strval(tmp) > 2 || strval(tmp) < 1) // did not provide required parameters
 	{
    	SendClientMessageEx(playerid,COLOR_GREY,"Usage: {FFFFFF}/teamskin [team id] [skin id]");
	 	SendClientMessageEx(playerid,COLOR_GREEN,"Help: Home = 1 | Away = 2");
		return 1;
	}
	else
	{
		command_id = strval(tmp); // this is the team id
		tmp = strtok(params, idx);

		if(command_id == 1)
		{
		    new skin = strval(tmp);
			if(IsInvalidSkin(skin) || idx < MIN_SKIN_ID || idx > MAX_SKIN_ID)
			{
	    		SendClientMessageEx(playerid, COLOR_RED, "{FF0000}� Error: {FFFFFF}Invalid Skin!");
			}
			else
			{
				Server[EnableSkinChanging][T_HOME] = false;  // dsiable skin changing
				Server[HomeTeamSkin] =skin;
				format(string,256,"** %s changed the team skin for %s to ID %d!",PlayerName(playerid),HomeName,skin);
				for(new x; x <= Server[HighestID]; x++)
				{
				    if(Player[x][pTeam] == T_HOME) {
						SetPlayerSkin(x, skin);
					}
				}
				SendClientMessageToAllEx(COLOR_YELLOW,string);
			}
		}
		else if(command_id == 2)
		{
		    new skin = strval(tmp);
			if(IsInvalidSkin(skin) || idx < MIN_SKIN_ID || idx > MAX_SKIN_ID)
			{
	    		SendClientMessageEx(playerid, COLOR_RED, "{FF0000}� Error: {FFFFFF}Invalid Skin!");
			}
			else
			{
			  	Server[EnableSkinChanging][T_AWAY] = false;
				Server[AwayTeamSkin] =skin;
				format(string,256,"** %s changed the team skin for %s to ID %d!",PlayerName(playerid),AwayName,skin);
				for(new x; x <= Server[HighestID]; x++)
				{
				    if(Player[x][pTeam] == T_AWAY) {
						SetPlayerSkin(x, skin);
					}
				}
				SendClientMessageToAllEx(COLOR_YELLOW,string);
			}
		}
	}
	return 1;
}


/*
	Team lock Command
	Usage: /teamlock [team id] [0-1] 0:unlocked | 1:locked
	Access: Administrators
*/

CMD:teamlock(playerid, params[])
{
	new tmp[256], tmp2[256], idx;
	tmp = strtok(params, idx);
	tmp2 = strtok(params, idx);
	new string[256];
	if(!IsPlayerAdmin3(playerid)) SendClientMessageEx(playerid, COLOR_RED, "{FF0000}� Error: {FFFFFF}You need to be admin to do that!"); // no access
	else if(isnull(tmp)|| !IsNumeric(tmp) || !IsNumeric(tmp2) || isnull(tmp2) || strval(tmp) > 5 || strval(tmp) < 0 || strval(tmp2) > 1 || strval(tmp2) < 0) // did not provide required parameters
 	{
    	SendClientMessageEx(playerid,COLOR_GREY,"Usage: {FFFFFF}/teamlock [team id] [0-1] | 0:Unlocked  1:Locked");
	 	SendClientMessageEx(playerid,COLOR_GREEN,"Help: Home = 0 | Sub Home: 1 | Away = 2 | Sub Away: 3 | Referee: 4 | Auto-Assign: 5");
		return 1;
	}
	else
	{

		if(strval(tmp2) == 1)
		{
			if(TeamLocked[strval(tmp)] == false)
			{
				TeamLocked[strval(tmp)] = true;
				format(string,256,"** %s has locked the team %s", PlayerName(playerid), GetTeamName(strval(tmp)));
				SendClientMessageToAllEx(COLOR_YELLOW, string);
			}
			else
			{
			    SendClientMessageEx(playerid,COLOR_RED, "{FF0000}� Error: {FFFFFF}The selected team is already locked");
			}
		}
		else
		{
			if(TeamLocked[strval(tmp)] == true)
			{
				TeamLocked[strval(tmp)] = false;
				format(string,256,"** %s has unlocked the team %s", PlayerName(playerid), GetTeamName(strval(tmp)));
				SendClientMessageToAllEx(COLOR_YELLOW, string);
			}
			else
			{
			    SendClientMessageEx(playerid,COLOR_RED, "{FF0000}� Error: {FFFFFF}The selected team is already unlocked");
			}
		}
		return 1;
	}
	return 1;
}

/*
	End Command
	Usage: /end: Abruptly ends a round.
	Access: Administrators
*/

CMD:end(playerid, params[])
{
	if(!IsPlayerAdmin3(playerid)) SendClientMessageEx(playerid, COLOR_RED, "{FF0000}� Error: {FFFFFF}You need to be admin to do that!");
 	else {
	    if((Round[AdminCanEnd]) && (Round[Current] != -1)) {
			Round[AdminEnded] = true;
	 		new string[256];
	   		format(string,256,"** %s has ended the round abruptly.",PlayerName(playerid));
			SendClientMessageToAllEx(COLOR_YELLOW,string);

			#if IRC == 1
	   		format(string,256,"2*** 8%s has ended the round abruptly!",PlayerName(playerid));
			CallRemoteFunction("DC_IRCForceSay", "s", string);
			#endif
   			EndRound();
		} else {
			SendClientMessageEx(playerid, COLOR_RED, "{FF0000}� Error: {FFFFFF}Could not end round!");
		}
	}
	return 1;
	#pragma unused params
}

/*
	Invert Command
	Usage: /invert | /swap
	Description: Switches the role of the teams (Attack or Defend)
	Access: Administrators
*/

CMD:invert(playerid, params[])
{
	if(!IsPlayerAdmin3(playerid)) return SendClientMessageEx(playerid, COLOR_RED, "{FF0000}� Error: {FFFFFF}You need to be admin to do that!");
 	else
	{
		new string[128];
		if(Round[Attackers] == T_AWAY)
		{
			format(string,128,"** %s inverted the Teams - %s Defend | %s Attack", PlayerName(playerid),AwayName,HomeName);
			Round[Attackers] = T_HOME;
			SendClientMessageToAllEx(COLOR_ORANGE, string);
			HomeStatus = "Attack";
			AwayStatus = "Defend";
			return 1;
		}
		else
		{
			format(string,128,"** %s inverted the Teams - %s Attack | %s Defend", PlayerName(playerid),AwayName,HomeName);
			Round[Attackers] = T_AWAY;
			SendClientMessageToAllEx(COLOR_ORANGE, string);
	 		AwayStatus = "Attack";
			HomeStatus = "Defend";
			return 1;
		}
		#pragma unused params
	}
}

CMD:swap(playerid, params[]) return cmd_invert(playerid, params);

/*
	Reset Guns Command
	Usage: /resetguns
	Description: Takes away all players weapons.
	Access: Administrators
*/

CMD:resetguns(playerid, params[])
{

	if(!IsPlayerAdmin3(playerid)) SendClientMessageEx(playerid, COLOR_RED, "{FF0000}� Error: {FFFFFF}You need to be admin to do that!");
	else
	{
	    new string[256];
	  	for(new i = 0; i <= Server[HighestID]; i++)
   		{
			ResetPlayerWeapons(i);
		}
	   	format(string,256,"** %s has reset everyones weapons!",PlayerName(playerid));
		SendClientMessageToAllEx(COLOR_ORANGE,string);

		#if IRC == 1
	   	format(string,256,"2*** 8%s has reset everyones weapons.",PlayerName(playerid));
		CallRemoteFunction("DC_IRCForceSay", "s", string);
		#endif
	}
	return 1;
	#pragma unused params
}

CMD:sound(playerid, params[])
{
	new tmp[256], idx, string[256];
	tmp = strtok(params, idx);
	new id = strval(tmp);

	if(isnull(tmp))
	{
		SendClientMessageEx(playerid, COLOR_GREY, "Usage: {FFFFFF}/sound [sound id]");
	}
	else if(!IsNumeric(params))
	{
	    SendClientMessageEx(playerid, COLOR_GREY, "Usage: {FFFFFF}/sound [sound id]");
	}
	else
	{
		PlayerPlaySound(playerid, id, 0, 0, 0);
   		format(string,256,"Played Sound ID: %d", id);
		SendClientMessageEx(playerid,COLOR_WHITE,string);
	}
	return 1;
}

/*
	Force Sync Command
	Usage: /forcesync <playerid>
	Description: Forcefully syncs another player.
	Access: Administrators
*/

CMD:forcesync(playerid, params[])
{
	new tmp[256], idx, string[256];
	tmp = strtok(params, idx);
	new id = strval(tmp);

	if(!IsPlayerAdmin3(playerid)) SendClientMessageEx(playerid, COLOR_RED, "{FF0000}� Error: {FFFFFF}You need to be admin to do that!");
	else if(isnull(tmp))
	{
		SendClientMessageEx(playerid, COLOR_GREY, "Usage: {FFFFFF}/forcesync [player id/name]");
	}
	else
	{
		if(!IsNumeric(params))
			id = ReturnPlayerID(params);
		else
			id = strval(params);

		SyncPlayer(id);
   		format(string,256,"%s has forcefully synced you.",PlayerName(playerid));
		SendClientMessageEx(id,COLOR_ORANGE,string);
   		format(string,256,"Force synced %s.",PlayerName(id));
		SendClientMessageEx(playerid,COLOR_ORANGE,string);
	}
	return 1;
}

/*
	All Versus Command
	Usage: /allvs [tag]
	Description: Organizes teams as all versus the players with the clan tag set in main_config.ini
	Access: Administrators
*/

CMD:allvs(playerid, params[])
{
	new tmp[256], idx, string[256];
	tmp = strtok(params, idx);

	if(!IsPlayerAdmin3(playerid)) SendClientMessageEx(playerid, COLOR_RED, "{FF0000}� Error: {FFFFFF}You need to be admin to do that!");
	else if(Round[Current] != -1 || Server[EPRoundStarted] == true) SendClientMessageEx(playerid, COLOR_RED, "{FF0000}� Error: {FFFFFF}You cannot use this command while a round is being played.");
	else if(isnull(tmp) || strlen(tmp) < 2 || strlen(tmp) > 10) return SendClientMessageEx(playerid, COLOR_GREY, "Usage: {FFFFFF}/allvs [tag] | From 2 to 10 characters");
	else
	{
		for(new i=0; i <= Server[HighestID]+1; i++)
		{
			if(IsPlayerConnected(i))
			{
		        if(strfind(PlayerName(i),tmp,true) != -1)
				{
	                SetPlayerTeamEx(i, T_HOME);
 				}
 				else
 				{
 		           	SetPlayerTeamEx(i, T_AWAY);
 				}
			}
		}
 		format(string,128,"** %s changed teams to \"All vs %s\"", PlayerName(playerid), tmp);
		SendClientMessageToAllEx(COLOR_MARINE, string);
	}
	return 1;
}

/*
	Balance Teams Command
	Usage: /balance
	Description: Balances teams
	Access: Administrators
*/

CMD:balance(playerid, params[])
{

	if(!IsPlayerAdmin3(playerid)) SendClientMessageEx(playerid, COLOR_RED, "{FF0000}� Error: {FFFFFF}You need to be admin to do that!");
	else if(Round[Current] != -1 || Server[EPRoundStarted] == true) SendClientMessageEx(playerid, COLOR_RED, "{FF0000}� Error: {FFFFFF}You cannot use this command while a round is being played.");
	else
	{
	    new PlayersPlaying;
	    for(new i = 0; i <= Server[HighestID]; i ++)
	    {
			if(IsPlayerConnected(i) && Player[i][pSpawned] == true && Player[i][setToPlay] == true && (Player[i][pTeam] == T_AWAY || Player[i][pTeam] == T_HOME))
			    PlayersPlaying ++;
	    }

	    if(PlayersPlaying <= 1)
	        return SendClientMessageEx(playerid, COLOR_RED, "{FF0000}� Error: {FFFFFF}Failed to balance teams.");

	    new Divisor = floatround(PlayersPlaying / 2);
	    new Temp;
		new bool:HomeFull = false;

		for(new i = 0; i <= Server[HighestID]; i ++)
	    {
			if(IsPlayerConnected(i) && Player[i][pSpawned] == true && Player[i][setToPlay] == true && (Player[i][pTeam] == T_AWAY || Player[i][pTeam] == T_HOME))
			{
			    if(HomeFull == false)
			    {
			        SetPlayerTeamEx(i, T_HOME);
			        Temp ++;
			        if(Temp >= Divisor)
			        {
			            HomeFull = true;
			        }
			    }
			    else if(HomeFull == true)
			    {
					SetPlayerTeamEx(i, T_AWAY);
				}
			}
		}
		new string[128];
		format(string,128,"** %s has balanced the teams!", PlayerName(playerid));
		SendClientMessageToAllEx(COLOR_MARINE, string);
	}
	return 1;
	#pragma unused params
}

/*
	Shuffle Command
	Usage: /shuffle
	Description: Balances and shuffles the teams
	Access: Administrators
*/

CMD:shuffle(playerid, params[])
{
	if(!IsPlayerAdmin3(playerid)) SendClientMessageEx(playerid, COLOR_GREY, "{FF0000}� Error: {FFFFFF} You need to be admin to do that!");
	else if(Round[Current] != -1 || Server[EPRoundStarted] == true) SendClientMessageEx(playerid, COLOR_GREY, "{FF0000}� Error: {FFFFFF} You cannot use this command while a round is being played.");
	else
	{
	    new PlayersPlaying;
	    for(new i = 0; i <= Server[HighestID]; i ++)
	    {
			if(IsPlayerConnected(i) && Player[i][pSpawned] == true && Player[i][setToPlay] == true && (Player[i][pTeam] == T_AWAY || Player[i][pTeam] == T_HOME))
			    PlayersPlaying ++;
	    }

	    if(PlayersPlaying <= 1)
	        return SendClientMessageEx(playerid, COLOR_GREY, "{FF0000}� Error: {FFFFFF}Failed to shuffle teams.");

		new totalaway;
		new totalhome;
		for(new i = 0; i <= Server[HighestID]; i ++)
	    {
			if(IsPlayerConnected(i) && Player[i][pSpawned] == true && Player[i][setToPlay] == true && (Player[i][pTeam] == T_AWAY || Player[i][pTeam] == T_HOME))
			{
				new tid = random(2);
				if (tid == 0) {
				    SetPlayerTeamEx(i, T_HOME);
				    totalhome++;
				} else if (tid == 1) {
				    SetPlayerTeamEx(i, T_AWAY);
				    totalaway++;
				}
			}
		}

	    new Divisor = floatround((totalhome+totalaway) / 2);

		for(new i = 0; i <= Server[HighestID]; i ++)
	    {
			if(IsPlayerConnected(i) && Player[i][pSpawned] == true && Player[i][setToPlay] == true && (Player[i][pTeam] == T_AWAY || Player[i][pTeam] == T_HOME))
			{
			    new randomnum = random(2);
			    switch(randomnum) {
			    	case 0: {
			    		if(totalhome <= Divisor && totalhome < totalaway)
			    		{
			       	 		if(Player[i][pTeam] == T_AWAY) totalaway--;
			        		SetPlayerTeamEx(i, T_HOME);
			        		totalhome++;
			    		}
			    		else if(totalaway <= Divisor && totalaway <= totalhome)
			    		{
			        		if(Player[i][pTeam] == T_HOME) totalhome--;
							SetPlayerTeamEx(i, T_AWAY);
							totalaway++;
						}
						else
						{
						    #if DEBUG == 1
					    	SendClientMessageToAllEx(COLOR_YELLOW, "We got neither teams to assign for this player, here's some shit that came back:");
					   		new string[128];
					    	format(string, sizeof(string), "playerid: %d, Divisor: %d, totalhome: %d, totalaway: %d", playerid, Divisor, totalhome, totalaway);
					    	printf(string);
					    	#endif
						}
					}
					case 1: {
				    	if(totalaway <= Divisor && totalaway < totalhome)
			    		{
			        		if(Player[i][pTeam] == T_HOME) totalhome--;
							SetPlayerTeamEx(i, T_AWAY);
							totalaway++;
						}
				    	else if(totalhome <= Divisor && totalhome <= totalaway)
			    		{
			       	 		if(Player[i][pTeam] == T_AWAY) totalaway--;
			        		SetPlayerTeamEx(i, T_HOME);
			        		totalhome++;
			    		}
			    		else
						{
						    #if DEBUG == 1
					    	SendClientMessageToAllEx(COLOR_YELLOW, "We got neither teams to assign for this player, here's some shit that came back:");
					    	new string[128];
					    	format(string, sizeof(string), "playerid: %d, Divisor: %d, totalhome: %d, totalaway: %d", playerid, Divisor, totalhome, totalaway);
					    	SendClientMessageToAllEx(COLOR_YELLOW, string);
					    	#endif
						}
					}
				}
				if(totalhome == totalaway) break;
			}
		}
		new string[60];
		format(string, sizeof(string), "** %s has shuffled the teams!", PlayerName(playerid));
		SendClientMessageToAll(COLOR_MARINE, string);
	}
	return 1;
	#pragma unused params
}

/*
	Set Team Command
	Usage: /setteam <playerid> <teamid>
	Description: Change/Set a players team.
	Access: Administrators
*/

CMD:setteam(playerid, params[])
{
	new tmp[256], tmp2[256], idx, string[256];
	tmp = strtok(params, idx);
	new id;
	tmp2 = strtok(params, idx);
	new status = strval(tmp2);

	if(!IsPlayerAdmin3(playerid)) SendClientMessageEx(playerid, COLOR_RED, "{FF0000}� Error: {FFFFFF}You need to be admin to do that!");
	else if(isnull(tmp) || isnull(tmp2) || !IsNumeric(tmp2) || status < 0 || status > 5 || isnull(tmp2))
	{
		SendClientMessageEx(playerid, COLOR_GREY, "Usage: {FFFFFF}/setteam [id|name] [team id]");
 		SendClientMessageEx(playerid, COLOR_GREEN, "Help - Teams IDs: [0: Home] [1: Home Sub] [2: Away] [3: Away Sub] [4: Ref] [5: Auto-Assign]");
	}
	else
	{
		if(!IsNumeric(tmp))
			id = ReturnPlayerID(tmp);
		else
			id = strval(tmp);

		if(!IsPlayerConnected(id)) return SendClientMessageEx(playerid, COLOR_RED, "{FF0000}� Error: {FFFFFF}Player not found.");
		if(Player[id][pPlaying] == true) return SendClientMessageEx(playerid, COLOR_RED, "{FF0000}� Error: {FFFFFF}Player is in a round.");
	    switch(status)
	    {
	        case 0: //Home
	        {
 		    	if(Player[id][pTeam] != T_HOME) {
		            SetPlayerTeamEx(id, T_HOME);
     	    		format(string,256,"* %s changed %s team to %s",PlayerName(playerid), PlayerName(id), HomeName);
	 			    SendClientMessageToAllEx(COLOR_YELLOW,string);
				}
				if (Player[id][AFK] == false) TogglePlayerControllable(id, 1);
			}
			case 1: //Home Sub
			{
			    if(Player[id][pTeam] != T_SUBHOME) {
		            SetPlayerTeamEx(id, T_SUBHOME);
       	 		   	format(string,256,"* %s changed %s team to \"%s Sub\"",PlayerName(playerid), PlayerName(id),HomeName);
	    			SendClientMessageToAllEx(COLOR_YELLOW,string);
				}
				if (Player[id][AFK] == false) TogglePlayerControllable(id, 1);
			}
			case 2: //Away
			{
			    if(Player[id][pTeam] != T_AWAY) {
   		            SetPlayerTeamEx(id, T_AWAY);
     			    format(string,256,"* %s changed %s team to %s",PlayerName(playerid), PlayerName(id),AwayName);
	    			SendClientMessageToAllEx(COLOR_YELLOW,string);
				}
				if (Player[id][AFK] == false) TogglePlayerControllable(id, 1);
   			}
			case 3: //Away Sub
			{
			    if(Player[id][pTeam] != T_SUBAWAY) {
	            	SetPlayerTeamEx(id, T_SUBAWAY);
       			    format(string,256,"* %s changed %s team to \"%s Sub\"",PlayerName(playerid), PlayerName(id),AwayName);
	    			SendClientMessageToAllEx(COLOR_YELLOW,string);
				}
				if (Player[id][AFK] == false) TogglePlayerControllable(id, 1);
			}
			case 4: //Ref
			{
			    if(Player[id][pTeam] != T_REF) {
	            	SetPlayerTeamEx(id, T_REF);
     			    format(string,256,"* %s changed %s team to %s",PlayerName(playerid), PlayerName(id), RefName);
				    SendClientMessageToAllEx(COLOR_YELLOW,string);
				}
			}
			case 5: //Auto Assign
			{
	            SetPlayerTeamEx(id, GetTeamWithLessMembers());
				new omfg[256];
			  	if(Player[id][pTeam] == T_AWAY) omfg = AwayName;
				else if(Player[id][pTeam] == T_HOME) omfg = HomeName;
				format(string,256,"* %s changed %s team to %s (Auto-Assign)",PlayerName(playerid), PlayerName(id),omfg);
				SendClientMessageToAllEx(COLOR_PINK,string);
			}
		}
	}
	return 1;
}

/*
	Set Score Command
	Usage: /setscore <teamid> <score>
	Description: Sets the team score of the specified team ID
	Access: Administrators
*/

CMD:setscore(playerid, params[]) {

    if(!IsPlayerAdmin3(playerid)) SendClientMessageEx(playerid, COLOR_RED, "{FF0000}� Error: {FFFFFF}You need to be admin to do that!");

	new teamid, score;

	if(sscanf(params, "dd", teamid, score))
	{
		SendClientMessageEx(playerid, COLOR_GREY, "Usage: {FFFFFF}/setscore [teamid] [score]");
 		SendClientMessageEx(playerid, COLOR_GREEN, "Help - Teams IDs: [0: Home] [1: Away]");
 		return 1;
	}

	if(teamid < 0 || teamid > 1)
	{
		SendClientMessageEx(playerid, COLOR_GREY, "Usage: {FFFFFF}/setscore [teamid] [score]");
 		SendClientMessageEx(playerid, COLOR_GREEN, "Help - Teams IDs: [0: Home] [1: Away]");
 		return 1;
	}

	if(score > Server[RoundLimit]) return SendClientMessageEx(playerid, COLOR_RED, "{FF0000}� Error: {FFFFFF}The score is above the max round limit.");

	if(teamid == 1) teamid = 2;

	switch(teamid) {
		case 0: MatchInfo[HomeRoundsWon] = score;
		case 2: MatchInfo[AwayRoundsWon] = score;
	}

	Server[PartialRounds] = MatchInfo[HomeRoundsWon] + MatchInfo[AwayRoundsWon];

	new string[128];
	format(string, sizeof(string), "** %s has set the score of the %s team to %d", PlayerName(playerid), GetTeamName(teamid), score);

	SendClientMessageToAll(COLOR_YELLOW, string);

	if(Server[PartialRounds] < Server[RoundLimit])
	{
		format(string, sizeof(string), "Rounds Played: %d/%d", Server[PartialRounds],Server[RoundLimit]);
		SendClientMessageToAllEx(COLOR_WHITE,string);
	}
	return 1;
}


/*
	Set Player Command
	Usage: /setplayer <playerid> <status>
	Description: Sets the status of a player (Playing, Sub, or AFK)
	Access: Administrators
*/

CMD:setplayer(playerid, params[])
{
	new tmp[256], tmp2[256], idx, string[256];
	tmp = strtok(params, idx);
	new id;
	tmp2 = strtok(params, idx);
	new status = strval(tmp2);

	if(!IsPlayerAdmin3(playerid)) SendClientMessageEx(playerid, COLOR_RED, "{FF0000}� Error: {FFFFFF}You need to be admin to do that!");
	else if(isnull(tmp) || !IsNumeric(tmp2) || status != 3 && status != 2 && status != 1)
	{
		SendClientMessageEx(playerid, COLOR_GREY, "Usage: {FFFFFF}/setplayer [player id/name] [status]");
 		SendClientMessageEx(playerid, COLOR_GREEN, "Help - Avaible status: [1: Playing] [2: Substitute] [3: AFK]");
	}
	else
	{
		if(!IsNumeric(tmp))
			id = ReturnPlayerID(tmp);
		else
			id = strval(tmp);

		if(!IsPlayerConnected(id)) return SendClientMessageEx(playerid, COLOR_RED, "{FF0000}� Error: {FFFFFF}Player not found.");

 		TogglePlayerControllable(id,1);
		if(status == 1)
		{
 			Player[id][AFK] = false;
			Player[id][setToPlay] = true;
 			Player[id][Status] = STATUS_PLAYING;
	   		format(string,256,"** %s has forced you to Playing Status.",PlayerName(playerid));
			SendClientMessageEx(id,COLOR_YELLOW,string);
	   		format(string,256,"** You forced %s to Playing Status .",PlayerName(id));
			SendClientMessageEx(playerid,COLOR_YELLOW,string);
		}
		if(status == 2)
		{
 			Player[id][AFK] = false;
 			Player[id][setToPlay] = false;
 			Player[id][Status] = STATUS_SUB;
	   		format(string,256,"** %s has forced you to Substitute Status.",PlayerName(playerid));
			SendClientMessageEx(id,COLOR_YELLOW,string);
	   		format(string,256,"** You forced %s to Substitute Status .",PlayerName(id));
			SendClientMessageEx(playerid,COLOR_YELLOW,string);
		}
 		if(status == 3)
		{
			Player[id][AFK] = true;
  			Player[id][setToPlay] = false;
			TogglePlayerControllable(id,0);
		    Player[id][Status] = STATUS_AFK;
	   		format(string,256,"** %s has forced you to AFK Status.",PlayerName(playerid));
			SendClientMessageEx(id,COLOR_YELLOW,string);
	   		format(string,256,"** You forced %s to AFK Status .",PlayerName(id));
			SendClientMessageEx(playerid,COLOR_YELLOW,string);
		}
	}
	return 1;
}

/*
	Give Weapons Menu Command
	Usage: /givemneu <playerid>
	Description: Forces a player into the gun menu.
	Access: Administrators
*/

CMD:givemenu(playerid, params[])
{

	new tmp[256], idx, string[256];
	tmp = strtok(params, idx);
	new id = strval(tmp);

	if(!IsPlayerAdmin3(playerid)) SendClientMessageEx(playerid, COLOR_RED, "{FF0000}� Error: {FFFFFF}You need to be admin to do that!");
	else if(Round[Current] == -1) SendClientMessageEx(playerid, COLOR_RED, "{FF0000}� Error: {FFFFFF}A round is not in progress!");
	else if(isnull(tmp))
	{
		SendClientMessageEx(playerid, COLOR_GREY, "Usage: {FFFFFF}/givemenu [player id/name]");
	}
	else
	{
		if(!IsNumeric(params))
			id = ReturnPlayerID(params);
		else
			id = strval(params);

        FixTeamWeapons(id);

		ResetPlayerWeapons(id);
	    Player[id][PrimaryWep] = 0;
		Player[id][PrimaryWepAmmo] = 0;
		Player[id][SecondaryWep] = 0;
		Player[id][SecondaryWepAmmo] = 0;
		Player[id][TerciaryWep] = 0;
		Player[id][TerciaryWepAmmo] = 0;
		Player[id][SpecialWep] = 0;
		Player[id][SpecialWepAmmo] = 0;

		for(new i = 0 ; i < MAX_WEAPONS; ++ i)
		{
		    if(WeaponsMenus[Option][i] == 5)
		    {
		        TimeTextForPlayer(id, autowep5, 6000);
		        TimeTextForPlayer(id, autowep,  6000);
		        TimeTextForPlayer(id, autowep2, 6000);
		        TimeTextForPlayer(id, autowep3, 6000);
				TimeTextForPlayer(id, autowep4, 6000);
		        break;
		    }
		}

		TogglePlayerControllable(id, 0);
		TryGunMenu(1, id);

		format(string, sizeof(string), "** %s has shown the weapon menu to %s!", PlayerName(playerid), PlayerName(id));
		SendClientMessageToAll(COLOR_YELLOW, string);
	}
	return 1;
}

/*
	Give Vehicle Menu Command
	Usage: /giveveh <playerid>
	Description: Forces a player into the vehicle menu.
	Access: Administrators
*/

CMD:giveveh(playerid, params[])
{

	new tmp[256], idx, string[256];
	tmp = strtok(params, idx);
	new id = strval(tmp);

	if(!IsPlayerAdmin3(playerid)) SendClientMessageEx(playerid, COLOR_RED, "{FF0000}� Error: {FFFFFF}You need to be admin to do that!");
	else if(isnull(tmp))
	{
		SendClientMessageEx(playerid, COLOR_GREY, "Usage: {FFFFFF}/giveveh [player id/name]");
	}
	else
	{
		if(!IsNumeric(params))
			id = ReturnPlayerID(params);
		else
			id = strval(params);

		TogglePlayerControllable(id, 0);
		ShowMenuForPlayer(vehiclemenu,id);
	   	format(string, sizeof(string), "%s has been forced into Vehicle Selection by %s", PlayerName(id), PlayerName(playerid));
		SendClientMessageToAll(COLOR_YELLOW, string);
	}
	return 1;
}

/*
	Remove Player Command
	Usage: /rem <playerid>
	Description: Removes a player from the current round.
	Access: Administrators
*/

CMD:rem(playerid, params[])
{

	new tmp[256], idx, string[256];
	tmp = strtok(params, idx);
	new id = strval(tmp);

	if(!IsPlayerAdmin3(playerid)) SendClientMessageEx(playerid, COLOR_RED, "{FF0000}� Error: {FFFFFF}You need to be admin to do that!");
	else if(Player[id][pPlaying] == false) SendClientMessageEx(playerid, COLOR_RED, "{FF0000}� Error: {FFFFFF}That player is not in the round!");
	else if(Round[Current] == -1) SendClientMessageEx(playerid, COLOR_RED, "{FF0000}� Error: {FFFFFF}A round is not in progress!");
	else if(isnull(tmp))
	{
		SendClientMessageEx(playerid, COLOR_GREY, "Usage: {FFFFFF}/rem [id|name]");
	}
	else
	{
		if(!IsNumeric(params))
			id = ReturnPlayerID(params);
		else
			id = strval(params);

		Player[id][pPlaying] = false;

		if(Round[Current] != -1 || Server[EPRoundStarted] == true)
		{
			if(Round[Gamemode] == TDM && (Round[Gameplay] == WAR_ZONE || Round[Gameplay] == RUMBLE) && Player[id][setToPlay] == true)
			{
		        Player[id][setToPlay] = false;
			}
		}
		
		if(Player[id][pTeam] == T_AWAY) Round[started_away]--;
		if(Player[id][pTeam] == T_HOME) Round[started_home]--;
		
		FixTeamWeapons(id);

		SpawnPlayerEx(id);
	   	format(string,256,"** %s has removed %s from the round.",PlayerName(playerid),PlayerName(id));
		SendClientMessageToAllEx(COLOR_YELLOW,string);

		#if IRC == 1
	   	format(string,256,"2*** 8%s has removed %s from the round.",PlayerName(playerid), PlayerName(id));
		CallRemoteFunction("DC_IRCForceSay", "s", string);
		#endif
	}
	return 1;
}

/*
	Add Command
	Usage: /add <playerid>
	Description: Used to add a player into the current round.
	Access: Administrators
*/

CMD:add(playerid, params[])
{
	new tmp[256], idx;
	tmp = strtok(params, idx);
	new id = strval(tmp);
	if(!IsNumeric(params))
		id = ReturnPlayerID(params);
	else
		id = strval(params);

	new string[128];
	if(!IsPlayerAdmin3(playerid)) SendClientMessageEx(playerid, COLOR_RED, "{FF0000}� Error: {FFFFFF}You need to be admin to do that!");
	else if(Player[id][pPlaying]) SendClientMessageEx(playerid, COLOR_RED, "{FF0000}� Error: {FFFFFF}That player is already in the round!");
	else if(!IsPlayerConnected(id)) SendClientMessageEx(playerid, COLOR_RED, "{FF0000}� Error: {FFFFFF}Player not found.");
	else if(Round[Current] == -1) SendClientMessageEx(playerid, COLOR_RED, "{FF0000}� Error: {FFFFFF}A round is not in progress!");
	else if(isnull(tmp))
	{
		SendClientMessageEx(playerid, COLOR_GREY, "Usage: {FFFFFF}/add [name|id]");
	}
	else
	{
		if(IsPlayerInAnyVehicle(id))
			RemovePlayerFromVehicle(id);
		if(Player[id][pDuel] > 0) {
			InDuel[Player[id][pDuel]] = 0;
			Player[id][pDuel] = 0;
		}

		AddPlayerToRound(id);
	   	format(string,256,"** %s has brought %s to the round.",PlayerName(playerid),PlayerName(id));
		SendClientMessageToAllEx(COLOR_YELLOW,string);

		#if IRC == 1
	   	format(string,256,"2*** 8%s has brought %s to the round.",PlayerName(playerid), PlayerName(id));
		CallRemoteFunction("DC_IRCForceSay", "s", string);
		#endif
	}
	return 1;
}

/*
	Vehicle Clear Command
	Usage: /vclear
	Description: Clears all vehicles in the server.
	Access: Administrators
*/

CMD:vclear(playerid, params[])
{
	if(!IsPlayerAdmin3(playerid)) SendClientMessageEx(playerid, COLOR_RED, "{FF0000}� Error: {FFFFFF}You need to be admin to do that!");
	else if(Round[Current] != -1 || Server[EPRoundStarted] == true) SendClientMessageEx(playerid, COLOR_RED, "{FF0000}� Error: {FFFFFF}You cannot use this command while a round is being played.");
	else
	{
		ClearVehicles();
		new string[256];
	   	format(string,256,"** %s has cleared all vehicles!",PlayerName(playerid));
		SendClientMessageToAllEx(COLOR_YELLOW,string);

		#if IRC == 1
	   	format(string,256,"2*** 7%s has cleared all vehicles!",PlayerName(playerid));
		CallRemoteFunction("DC_IRCForceSay", "s", string);
		#endif
	}
	return 1;
	#pragma unused params
}

/*
	Set Weather Command
	Usage: /setweather <weatherID>
	Description: Used to change the weather.
	Access: Administrators
*/

CMD:setweather(playerid, params[])
{
	new idx;
	new tmp[256];
	tmp = strtok(params, idx);
	new time = strval(tmp);
	if(!IsPlayerAdmin3(playerid))
		return SendClientMessageEx(playerid, COLOR_RED, "{FF0000}� Error: {FFFFFF}You need to be admin to do that!");
	else if( time < 0 || isnull(tmp))
		return SendClientMessageEx(playerid, COLOR_GREY, "Usage: {FFFFFF}/setweather [id]");
	else
	{

		SetWeather(time);
 		Config[weather] = time;

		new string[256];
	   	format(string,256,"** %s has changed the weather to %d.",PlayerName(playerid),time);
 		SendClientMessageToAllEx(COLOR_YELLOW,string);
  	    #if IRC == 1
   		format(string,256,"2*** 8%s has changed the weather to %d.",PlayerName(playerid),time);
		CallRemoteFunction("DC_IRCForceSay", "s", string);
		#endif
	}

	return 1;
}

/*
	Set Time Command
	Usage: /settime <0-23>
	Description: Used to change the time.
	Access: Administrators
*/

CMD:settime(playerid, params[])
{
	new idx;
	new tmp[256];
	tmp = strtok(params, idx);
	new string[256];
	new time = strval(tmp);

	if(!IsPlayerAdmin3(playerid))
		return SendClientMessageEx(playerid, COLOR_RED, "{FF0000}� Error: {FFFFFF}You need to be admin to do that!");
	else if( time < 0 || time > 23 || isnull(tmp))
		return SendClientMessageEx(playerid, COLOR_GREY, "Usage: {FFFFFF}/settime [0-23]");
	else
	{
	   	format(string,256,"** %s has changed the time to %d.",PlayerName(playerid),time);
	    SendClientMessageToAllEx(COLOR_YELLOW,string);
		SetWorldTime(time);
		Config[thetime] = time;

		#if IRC == 1
	  	format(string,256,"2*** 8%s has changed the time to %d.",PlayerName(playerid),time);
	    CallRemoteFunction("DC_IRCForceSay", "s", string);
	    #endif
	}

	return 1;
}

/*
	Reset Base Info Command
	Usage: /resetbaseinfo [id/all]
	Description: Resets base info (times played, att wins, etc);
	Access: Administrators
*/

CMD:resetbaseinfo(playerid, params[])
{
	if(!IsPlayerAdmin3(playerid))
		return SendClientMessageEx(playerid, COLOR_RED, "{FF0000}� Error: {FFFFFF}You need to be admin to do that!");
	else if(strval(params) < 0 || strval(params) > MAX_BASES || isnull(params))
		return SendClientMessageEx(playerid, COLOR_GREY, "Usage: {FFFFFF}/resetbaseinfo [baseid/all]");


	new string[128];
	if(strcmp(params, "all", true)==0)
	{
        for(new i = 0; i < MAX_BASES; i ++)
        {
 			BaseVariables[i][TimesPlayed] = BaseVariables[i][AttWins] = BaseVariables[i][DefWins] = 0;

			#if DATA_SYSTEM == 1
				new fbase[256];
				fbase = Basefile(i);
				dini_IntSet(fbase,"played",BaseVariables[i][TimesPlayed]);
				dini_IntSet(fbase,"attwins",BaseVariables[i][AttWins]);
				dini_IntSet(fbase,"defwins",BaseVariables[i][DefWins]);
			#elseif DATA_SYSTEM == 2
				UpdateSqlBaseInt(i, "played", BaseVariables[i][TimesPlayed]);
				UpdateSqlBaseInt(i, "attwins", BaseVariables[i][AttWins]);
				UpdateSqlBaseInt(i, "defwins", BaseVariables[i][AttWins]);
			#endif


        }
		format(string,128,"** %s has reseted all bases info.", PlayerName(playerid));
		SendClientMessageToAllEx(COLOR_YELLOW, string);
		#if IRC == 1
	  	format(string,256,"2*** 8%s has reseted all bases info.", PlayerName(playerid));
	    CallRemoteFunction("DC_IRCForceSay", "s", string);
	    #endif
	}
	else
	{
	    new baseid = strval(params);
		BaseVariables[baseid][TimesPlayed] = BaseVariables[baseid][AttWins] = BaseVariables[baseid][DefWins] = 0;

		#if DATA_SYSTEM == 1
			new fbase[256];
			fbase = Basefile(baseid);
			dini_IntSet(fbase,"played",BaseVariables[baseid][TimesPlayed]);
			dini_IntSet(fbase,"attwins",BaseVariables[baseid][AttWins]);
			dini_IntSet(fbase,"defwins",BaseVariables[baseid][DefWins]);
		#elseif DATA_SYSTEM == 2
			UpdateSqlBaseInt(baseid, "played", BaseVariables[baseid][TimesPlayed]);
			UpdateSqlBaseInt(baseid, "attwins", BaseVariables[baseid][AttWins]);
			UpdateSqlBaseInt(baseid, "defwins", BaseVariables[baseid][AttWins]);
		#endif

		format(string,128,"** %s has reseted base %d info.", PlayerName(playerid), baseid);
		SendClientMessageToAllEx(COLOR_YELLOW, string);
		#if IRC == 1
		  	format(string,256,"2*** 8%s %s has reseted base %d info.", PlayerName(playerid), baseid);
		    CallRemoteFunction("DC_IRCForceSay", "s", string);
	    #endif
	}
	return 1;
}

/*
	Reset Serverinfo Command
	Usage: /resetserverinfo
	Description: Resets all server info (kills, deaths, etc);
	Access: Administrators
*/

CMD:resetserverinfo(playerid, params[])
{
		new idx;
		new tmp[256];
		tmp = strtok(params, idx);

		new time = strval(tmp);
		if(!IsPlayerAdmin3(playerid))
			return SendClientMessageEx(playerid, COLOR_RED, "{FF0000}� Error: {FFFFFF}You need to be admin to do that!");

		new time_msg[256];
	   	format(time_msg,256,"** %s has reseted all server info.",PlayerName(playerid),time);
		SendClientMessageToAllEx(COLOR_YELLOW,time_msg);

		Server[TotalRounds] = 0;
		Server[ServerDeaths] = 0;
		Server[ServerKills] = 0;
		Server[TotalConnections] = 0;
		Server[TotalCrashes] = 0;
		Server[ServerRoundDeaths] = 0;
		Server[ServerRoundKills] = 0;

		for(new i = 0; i < MAX_COUNT_WEAPONS; i++)
		{
			WeaponsKills[i] = 0;
		}

		new hour,minute,second,year,month,day;
		gettime(hour, minute, second);
		getdate(year, month, day);

		new string[256];
		format(string,256,"%d/%d/%d | %d:%02d:%02d",day,month,year,hour,minute,second);

		#if DATA_SYSTEM == 1
			dini_Set(ServerDataFile,"Last_Updated",string);
			dini_IntSet(ServerDataFile,"TotalRounds",Server[TotalRounds]);
			dini_IntSet(ServerDataFile,"ServerDeaths",Server[ServerDeaths]);
			dini_IntSet(ServerDataFile,"ServerKills",Server[ServerKills]);
			dini_IntSet(ServerDataFile,"TotalConnections",Server[TotalConnections]);
			dini_IntSet(ServerDataFile,"TotalCrashes",Server[TotalCrashes]);
			dini_IntSet(ServerDataFile,"ServerRoundDeaths",Server[ServerRoundDeaths]);
			dini_IntSet(ServerDataFile,"ServerRoundKills",Server[ServerRoundKills]);
		#elseif DATA_SYSTEM == 2
			UpdateSqlServerDataStr("Last_Updated", string);
			UpdateSqlServerDataInt("TotalRounds", Server[TotalRounds]);
			UpdateSqlServerDataInt("ServerDeaths", Server[ServerDeaths]);
			UpdateSqlServerDataInt("ServerKills", Server[ServerKills]);
			UpdateSqlServerDataInt("TotalConnections", Server[TotalConnections]);
			UpdateSqlServerDataInt("TotalCrashes", Server[TotalCrashes]);
			UpdateSqlServerDataInt("ServerRoundDeaths", Server[ServerRoundDeaths]);
			UpdateSqlServerDataInt("ServerRoundKills", Server[ServerRoundKills]);
		#endif

		for(new i = 0; i < MAX_COUNT_WEAPONS; i++)
		{
			#if DATA_SYSTEM == 1
				dini_IntSet(ServerDataFile,weaponsInfo[i][strKills], WeaponsKills[i]);
			#elseif DATA_SYSTEM == 2
				UpdateSqlWepKillDataInt(weaponsInfo[i][strKills], WeaponsKills[i]);
			#endif
		}

		Server[Init] = GetDateAndTime();

		format(StartedString,256,"%d/%d/%d - %d:%02d:%02d",month,day,year,hour,minute,second);

		return 1;
		#pragma unused params
}

/*
	Reset All Command
	Usage: /resetall
	Description: Resets all round info.
	Access: Administrators
*/

CMD:resetall(playerid, params[])
{
		new idx;
		new tmp[256];
		tmp = strtok(params, idx);

		new time = strval(tmp);
		if(!IsPlayerAdmin3(playerid))
			return SendClientMessageEx(playerid, COLOR_RED, "{FF0000}� Error: {FFFFFF}You need to be admin to do that!");

		new time_msg[256];
	   	format(time_msg,256,"** %s has reset the round counting.",PlayerName(playerid),time);
		SendClientMessageToAllEx(COLOR_YELLOW,time_msg);
	    Server[LastGamemodePlayed] = 0;
	    Server[LastRoundPlayed] = 0;
    	Server[PartialRounds] = 0;
    	ClearMatchRoundInfo();
		return 1;
		#pragma unused params
}

/*
	Reset Scores Command
	Usage: /resetscores
	Description: Used to reset all player + team scores.
	Access: Administrators
*/

CMD:resetscores(playerid, params[])
{
		new idx;
		new tmp[256];
		tmp = strtok(params, idx);

		new time = strval(tmp);
		if(!IsPlayerAdmin3(playerid))
			return SendClientMessageEx(playerid, COLOR_RED, "{FF0000}� Error: {FFFFFF}You need to be admin to do that!");

		new time_msg[256];
	   	format(time_msg,256,"** %s has reset all Teams / Players scores.",PlayerName(playerid),time);
		SendClientMessageToAllEx(COLOR_YELLOW,time_msg);

    	ResetScores();

		return 1;
		#pragma unused params
}

/*
	Stop Vote Command
	Usage: /stopvote
	Description: Used to rstop a vote.
	Access: Administrators
*/

CMD:stopvote(playerid, params[])
{

    if(!IsPlayerAdmin3(playerid))
		return SendClientMessageEx(playerid, COLOR_RED, "{FF0000}� Error: {FFFFFF}You need to be admin to do that!");
	else if(Round[Voting] == false)
		return SendClientMessageEx(playerid, COLOR_RED, "{FF0000}� Error: {FFFFFF}There arent any votes in progress!");
	else
	{
	    new string[256];
		Round[Voting] = false;
		format(string,256,"** %s cancelled the Round Voting.", PlayerName(playerid));
		SendClientMessageToAllEx(COLOR_YELLOW,string);
	}
	return 1;
	#pragma unused params
}

/*
	Start Base Command
	Usage: /startbase <baseid>
	Description: Forcefully starts a round (base)
	Access: Administrators
*/

CMD:startbase(playerid, params[])
{
	new string[256];
    if(!IsPlayerAdmin3(playerid))
		return SendClientMessageEx(playerid, COLOR_RED, "{FF0000}� Error: {FFFFFF}You need to be admin to do that!");
	else if(Round[Current] != -1|| Server[EPRoundStarted] == true)
		return SendClientMessageEx(playerid, COLOR_RED, "{FF0000}� Error: {FFFFFF}You cannot use this command while a round is being played.");
	else if(isnull(params))
		return SendClientMessageEx(playerid, COLOR_GREY, "Usage: {FFFFFF}/startbase [baseid] | -1 for Random");
    else
	{
	    new idx;
		new tmp[256];
		tmp = strtok(params, idx);

		new baseid;
		if(!strcmp(tmp, "int", true)) {
		    baseid = DetermineRandomBase(1);
		    if(baseid == -1) {
				SendClientMessageEx(playerid, -1, "{FF0000}� Error: {FFFFFF}A interior base that has not been played recently, could not be found, we're going to start a recently played Interior.");
				baseid = DetermineRandomBase(1, 1);
			}

		}
		else if(!strcmp(tmp, "ext", true)) {
		    baseid = DetermineRandomBase(2);
		    if(baseid == -1) {
				SendClientMessageEx(playerid, -1, "{FF0000}� Error: {FFFFFF}A Exterior base that has not been played recently, could not be found, we're going to start a recently played Exterior.");
				baseid = DetermineRandomBase(2, 1);
			}
  		}
  		else baseid = strval(tmp);

		//printf("PAST TEST! %d, %s, %d, interior: %d", baseid, tmp, strval(tmp), BaseVariables[baseid][Interior]);

     	if(baseid > Server[TotalBases] || baseid < -1 || baseid == 0)
 			return SendClientMessageEx(playerid, COLOR_RED, "{FF0000}� Error: {FFFFFF}That base doesnt exist!");
		else
		{

  			for(new i = 0; i <= Server[HighestID]; i++)
   			{
				if(Player[i][Specing] == true)
				{
				    StopSpectate(i);
				}
			}


			if(baseid == -1)
			{
				baseid = DetermineRandomBase();
				if(baseid == 0) {
				    baseid = 1;
				}
				format(string,256,"Random Base Info | Starter: %s | Base ID: %d - %s", PlayerName(playerid),baseid, BaseVariables[baseid][About]);
				SendClientMessageToAllEx(COLOR_YELLOW, string);
			}
			else
			{
				format(string,256,"Loading Base ID: %d - %s |  Starter: %s", baseid, BaseVariables[baseid][About], PlayerName(playerid));
				SendClientMessageToAllEx(COLOR_YELLOW, string);

			}


			Round[Voting] = false;
		    KillTimer(BaseTimer);
			StartBase(baseid);

			#if LOG_SYSTEM == 1
			format(string,256,"%s started base ID %d (%s)", PlayerName(playerid), baseid, BaseVariables[baseid][About]);
			WriteLog("rounds", string);
			#endif
		}
	}
	return 1;
}

/*
	Start TDM Command
	Usage: /starttdm <tdmid>
	Description: Forcefully starts a round (tdm)
	Access: Administrators
*/

CMD:starttdm(playerid, params[])
{
	new string[256];
	if(!IsPlayerAdmin3(playerid)) SendClientMessageEx(playerid, COLOR_RED, "{FF0000}� Error: {FFFFFF}You need to be admin to do that!");
	else if(Round[Current] != -1 || Server[EPRoundStarted] == true) SendClientMessageEx(playerid, COLOR_RED, "{FF0000}� Error: {FFFFFF}Another Round is already in progress!");
	else if(isnull(params)) SendClientMessageEx(playerid, COLOR_GREY, "Usage: {FFFFFF}/starttdm [id]");
    else {
        new idx;
		new tmp[256];
		tmp = strtok(params, idx);

		new tdm_id;
		if(!strcmp(tmp, "int", true)) {
		    tdm_id = DetermineRandomTDM(1);
		    if(tdm_id == -1) {
				SendClientMessageEx(playerid, -1, "{FF0000}� Error: {FFFFFF}A Interior base that has not been played recently, could not be found, we're going to start a recently played Interior.");
				tdm_id = DetermineRandomTDM(1, 1);
			}
		}
		else if(!strcmp(tmp, "ext", true)) {
		    tdm_id = DetermineRandomTDM(2);
		    if(tdm_id == -1) {
				SendClientMessageEx(playerid, -1, "{FF0000}� Error: {FFFFFF}A Exterior base that has not been played recently, could not be found, we're going to start a recently played Exterior.");
				tdm_id = DetermineRandomTDM(2, 1);
			}
  		}
  		else tdm_id = strval(tmp);

     	if(tdm_id > Server[TotalTDMs] || tdm_id < -1 || tdm_id == 0) SendClientMessageEx(playerid, COLOR_RED, "{FF0000}� Error: {FFFFFF}That TDM doesnt exist!");
		else {
  			for(new i = 0; i <= Server[HighestID]; i++)
  			{
				if(Player[i][Specing] == true)
				{
				    StopSpectate(i);
				}
			}
  			if(tdm_id == -1)
			{
				tdm_id = DetermineRandomTDM();

				format(string,256,"Random TDM Info | Starter: %s | TDM ID: %d - %s", PlayerName(playerid),tdm_id, ArenaVariables[tdm_id][About]);
				SendClientMessageToAllEx(COLOR_YELLOW, string);
			}
			else
			{
				format(string,256,"Loading TDM ID: %d - %s | Starter: %s", tdm_id, ArenaVariables[tdm_id][About], PlayerName(playerid));
				SendClientMessageToAllEx(COLOR_YELLOW, string);
			}
		    Round[Voting] = false;
		    KillTimer(TDMTimer);
			StartTDM(tdm_id);

			#if LOG_SYSTEM == 1
			format(string,256,"%s started TDM ID %d (%s)", PlayerName(playerid), tdm_id, ArenaVariables[tdm_id][About]);
			WriteLog("rounds", string);
			#endif
		}
	}
    return 1;
}

/*
	Lock Command
	Usage: /lock <password>
	Description: Locks the server with a password.
	Access: Administrators
*/

CMD:lock(playerid,params[])
{
	if(!IsPlayerAdmin3(playerid)) return SendClientMessageEx(playerid, COLOR_RED, "{FF0000}� Error: {FFFFFF}You must be admin to do that!");
	else if(isnull(params))  return SendClientMessageEx(playerid, COLOR_GREY, "Usage: {FFFFFF}/lock [pass]");
	else
	{
		new string[256];
		format(string, 256,"** %s has locked the server!",PlayerName(playerid));
		Server[serverLock] = true;
		format(ServerPass, sizeof(ServerPass), "%s", params);
		SendClientMessageToAllEx(COLOR_YELLOW,string);

		for(new i = 0; i <= Server[HighestID]; i ++)
		    Player[i][lock_pass] = true;

	}
	return 1;
}

/*
	Unlock Command
	Usage: /unlock
	Description: Unlocks the server.
	Access: Administrators
*/

CMD:unlock(playerid,params[])
{
	if(IsPlayerAdmin3(playerid))
	{
     	if(Server[serverLock] ==false) return SendClientMessageEx(playerid, COLOR_RED, "{FF0000}� Error: {FFFFFF}Server is not locked");
		new string[256];
		format(string, 256,"** %s has unlocked the server.",PlayerName(playerid));
		Server[serverLock] = false;
		SendClientMessageToAllEx(COLOR_YELLOW,string);
		for (new i = 0; i <= Server[HighestID]; i ++) {
		    Player[i][lock_pass] = true;
		}
	} else {
	    SendClientMessageEx(playerid, COLOR_RED, "{FF0000}� Error: {FFFFFF}You must be admin to do that!");
	}
	return 1;
	#pragma unused params
}

/*
	Config Command
	Usage: /config <subcommand>
	Description: Used to change various server settings. Most important commands, all variables set on the /config command will be permanently saved.
	Access: Administrators
*/

CMD:config(playerid, params[])
{

	new tmp[256], idx;
	new command_id;
	tmp = strtok(params, idx);
	new string[256];

	if(!IsPlayerAdmin3(playerid)) SendClientMessageEx(playerid, COLOR_RED, "{FF0000}� Error: {FFFFFF}You need to be admin to do that!");
	else if(isnull(params))
	{
	    if (IsPlayerRootAdmin(playerid)) {
	    	Errormsg1:
	 		SendClientMessageEx(playerid, COLOR_GREY, "Usage: {FFFFFF}/config [subcommand]");
	 		SendClientMessageEx(playerid, COLOR_GREEN, "Avaible Subcommands: reload, lobby, cptime, cpsize, roundtime, stopcounting, lobbyweapons, nametag, explosives, skin");
 			SendClientMessageEx(playerid, COLOR_GREEN, "roundhealth, roundarmour, globalarmour, globalhealth, dynamiccamera, teamskin, teamname, uav, tk, roundtimer, plimit, maxplimit");
	 		SendClientMessageEx(playerid, COLOR_GREEN, "votetime, worldtime, weather, hintmessages, autohud, hud, vehiclemods, weapondrop, pausemessages, vehiclemsg, deathmsg");
 			SendClientMessageEx(playerid, COLOR_GREEN, "saveresults, roundlimit, cplayout, deadtag, vehiclemsg, gameplay, weaponsystem, duels, nick, lobbyvehicles, autoreadd, wlimit");
 			SendClientMessageEx(playerid, COLOR_GREEN, "autospec, textdrawlayout, introstring, introsubstring, intro, weapons, ammo, rule, fullset, speedmeter, wskill, audio, joypad");
 			SendClientMessageEx(playerid, COLOR_GREEN, "autologin, clantag, autobalance, refmode, autopause, spec, autoinvert, diag, classicchat, antisktime, tdmpoints, regmode, sync, blip, dm");
 		} else {
 			Errormsg2:
	 		SendClientMessageEx(playerid, COLOR_GREY, "Usage: {FFFFFF}/config [subcommand]");
 			SendClientMessageEx(playerid, COLOR_GREEN, "Avaible Subcommands: reload, cptime, cpsize, roundtime, stopcounting, uav, tk, roundtimer, autohud, hud, joypad");
			SendClientMessageEx(playerid, COLOR_GREEN, "vehiclemods, weapondrop, pausemessages, votetime, gameplay, weaponsystem, autoreadd, wlimit, plimit, maxplimit, audio");
			SendClientMessageEx(playerid, COLOR_GREEN, "autobalance, refmode, autopause, spec, autoinvert, diag, classicchat, antisktime, tdmpoints, regmode, sync, blip, dm");
		}
		return 1;
	}
	else
	{
		if(strcmp(tmp, "reload", true)==0)
		    command_id = 1;
		else if(strcmp(tmp, "lobby", true)==0)
		    command_id = 2;
		else if(strcmp(tmp, "cptime", true)==0)
		    command_id = 3;
  		else if(strcmp(tmp, "roundtime", true)==0)
		    command_id = 4;
    	else if(strcmp(tmp, "stopcounting", true)==0)
		    command_id = 5;
    	else if(strcmp(tmp, "lobbyweapons", true)==0)
		    command_id = 6;
    	else if(strcmp(tmp, "nametag", true)==0)
		    command_id = 7;
    	else if(strcmp(tmp, "roundhealth", true)==0)
		    command_id = 8;
    	else if(strcmp(tmp, "roundarmour", true)==0)
		    command_id = 9;
      	else if(strcmp(tmp, "dynamiccamera", true)==0)
		    command_id = 10;
       	else if(strcmp(tmp, "teamskin", true)==0)
		    command_id = 11;
       	else if(strcmp(tmp, "teamcolor", true)==0)
		    command_id = 12;
      	else if(strcmp(tmp, "teamname", true)==0)
		    command_id = 13;
      	else if(strcmp(tmp, "uav", true)==0)
		    command_id = 14;
      	else if(strcmp(tmp, "tk", true)==0)
		    command_id = 15;
       	else if(strcmp(tmp, "explosives", true)==0)
		    command_id = 16;
      	else if(strcmp(tmp, "roundtimer", true)==0)
		    command_id = 17;
       	else if(strcmp(tmp, "votetime", true)==0)
		    command_id = 18;
       	else if(strcmp(tmp, "worldtime", true)==0)
		    command_id = 19;
        else if(strcmp(tmp, "weather", true)==0)
		    command_id = 20;
        else if(strcmp(tmp, "hintmessages", true)==0)
		    command_id = 21;
        else if(strcmp(tmp, "autohud", true)==0)
		    command_id = 22;
        else if(strcmp(tmp, "globalarmour", true)==0)
		    command_id = 23;
        else if(strcmp(tmp, "globalhealth", true)==0)
		    command_id = 24;
        else if(strcmp(tmp, "vehiclemods", true)==0)
		    command_id = 25;
        else if(strcmp(tmp, "weapondrop", true)==0)
		    command_id = 26;
        else if(strcmp(tmp, "pausemessages", true)==0)
		    command_id = 27;
        else if(strcmp(tmp, "textdrawlayout", true)==0)
		    command_id = 28;
        else if(strcmp(tmp, "saveresults", true)==0)
		    command_id = 29;
        else if(strcmp(tmp, "roundlimit", true)==0)
		    command_id = 30;
        else if(strcmp(tmp, "deadtag", true)==0)
		    command_id = 31;
        else if(strcmp(tmp, "gameplay", true)==0)
		    command_id = 32;
        else if(strcmp(tmp, "weaponsystem", true)==0)
		    command_id = 33;
      	else if(strcmp(tmp, "duels", true)==0)
		    command_id = 34;
      	else if(strcmp(tmp, "lobbyvehicles", true)==0)
		    command_id = 35;
      	else if(strcmp(tmp, "nick", true)==0)
		    command_id = 36;
      	else if(strcmp(tmp, "autoreadd", true)==0)
		    command_id = 37;
      	else if(strcmp(tmp, "autospec", true)==0)
		    command_id = 38;
  		else if(strcmp(tmp, "cpsize", true)==0)
		    command_id = 39;
      	else if(strcmp(tmp, "hud", true)==0)
		    command_id = 40;
      	else if(strcmp(tmp, "vehiclemsg", true)==0)
		    command_id = 41;
        else if(strcmp(tmp, "introstring", true)==0)
		    command_id = 42;
    	else if(strcmp(tmp, "introsubstring", true)==0)
		    command_id = 43;
	   	else if(strcmp(tmp, "lobbytd", true)==0)
		    command_id = 44;
	   	else if(strcmp(tmp, "intro", true)==0)
		    command_id = 45;
	   	else if(strcmp(tmp, "weapons", true)==0)
		    command_id = 46;
	   	else if(strcmp(tmp, "ammo", true)==0)
		    command_id = 47;
     	else if(strcmp(tmp, "rule", true)==0)
		    command_id = 48;
      	else if(strcmp(tmp, "fullset", true)==0)
		    command_id = 49;
       	else if(strcmp(tmp, "speedmeter", true)==0)
		    command_id = 50;
      	else if(strcmp(tmp, "deathmsg", true)==0)
		    command_id = 51;
      	else if(strcmp(tmp, "wlimit", true)==0)
		    command_id = 52;
      	else if(strcmp(tmp, "wskill", true)==0)
		    command_id = 53;
      	else if(strcmp(tmp, "autologin", true)==0)
		    command_id = 54;
      	else if(strcmp(tmp, "skin", true)==0)
		    command_id = 55;
      	else if(strcmp(tmp, "plimit", true)==0)
		    command_id = 56;
      	else if(strcmp(tmp, "clantag", true)==0)
		    command_id = 57;
      	else if(strcmp(tmp, "autobalance", true)==0)
		    command_id = 58;
      	else if(strcmp(tmp, "refmode", true)==0)
		    command_id = 59;
      	else if(strcmp(tmp, "autoinvert", true)==0)
		    command_id = 60;
      	else if(strcmp(tmp, "diag", true)==0)
		    command_id = 61;
      	else if(strcmp(tmp, "classicchat", true)==0)
		    command_id = 62;
      	else if(strcmp(tmp, "antisktime", true)==0)
		    command_id = 63;
      	else if(strcmp(tmp, "tdmpoints", true)==0)
		    command_id = 64;
      	else if(strcmp(tmp, "sync", true)==0)
		    command_id = 65;
      	else if(strcmp(tmp, "regmode", true)==0)
		    command_id = 66;
      	else if(strcmp(tmp, "blip", true)==0)
		    command_id = 67;
		else if(strcmp(tmp, "forcetime", true)==0)
		    command_id = 68;
		else if(strcmp(tmp, "dm", true)==0)
		    command_id = 69;
  		else if(strcmp(tmp, "autopause", true) == 0)
  		    command_id = 70;
		else if(strcmp(tmp, "spec", true) == 0)
		    command_id = 71;
		else if(strcmp(tmp, "cplayout", true) == 0)
		    command_id = 72;
		else if(strcmp(tmp, "audio", true) == 0)
		    command_id = 73;
		else if(strcmp(tmp, "maxplimit", true) == 0)
		    command_id = 74;
		else if(strcmp(tmp, "joypad", true) == 0)
		    command_id = 75;
		else
		{
		 	SendClientMessageEx(playerid, COLOR_DARKRED, "Error: Invalid subcommand.");
      		if (IsPlayerRootAdmin(playerid)) {
		 		goto Errormsg1;
	 		} else {
	 			goto Errormsg2;
	 		}
		}

		tmp = strtok(params, idx);

		#if LOG_SYSTEM == 1
		format(string,256,"%s - /config %s.", PlayerName(playerid), params);
        WriteLog("config_commands", string);
        #endif

		if(command_id == 1)
		{
			LoadConfig();
			printf("Config reloaded by Player %s",PlayerName(playerid));
	 		GameTextForAll("~r~main Config ~y~reloaded",2000,1);
	 	}
		else if(command_id == 2)
		{
		    if (!IsPlayerRootAdmin(playerid)) return SendClientMessageEx(playerid, COLOR_RED, "Error: Access Denied.");
			new Float:PlayerPos[3];
			GetPlayerPos(playerid,PlayerPos[0],PlayerPos[1],PlayerPos[2]);
			format(string,256, "%f,%f,%f",PlayerPos[0],PlayerPos[1],PlayerPos[2]);
			Lobby[0] = PlayerPos[0];
			Lobby[1] = PlayerPos[1];
			Lobby[2] = PlayerPos[2];
			Config[LobbyInterior] =	GetPlayerInterior(playerid);

			#if DATA_SYSTEM == 1
				dini_Set(ConfigFile,"lobby_coords",string);
				dini_IntSet(ConfigFile,"lobby_int",GetPlayerInterior(playerid));
			#elseif DATA_SYSTEM == 2
				UpdateSqlConfigStr("lobby_coords", string);
				UpdateSqlConfigInt("lobby_int", GetPlayerInterior(playerid));
			#endif

			//Delete3DTextLabel(Server[lobby1_text3d]);
			Delete3DTextLabel(Server[lobby2_text3d]);
			//Server[lobby1_text3d] = Create3DTextLabel("Welcome to Deadly Combinations...", COLOR_WHITE, Lobby[0], Lobby[1], Lobby[2]+0.4, 30, LOBBY_VW);
			new lobby2_text[256];
			format(lobby2_text, 256 , "TangE A/D�� ���� ���� ȯ���մϴ�\n{FFFFFF}�κ�\nA/D �� ������ġ\nBases: %d - TDMs: %d\n{BABABA}/help /commands /info /rules /credits\n{00FF00}��� ���: D.C A/D              ������:TangE", Server[TotalBases], Server[TotalTDMs]);
			Server[lobby2_text3d] = Create3DTextLabel(lobby2_text, COLOR_GREYBLUE, Lobby[0], Lobby[1], Lobby[2]+0.2, 150, LOBBY_VW);
			format(string,256,"Main Spawn Coords Saved ~> %s (Interior %d)",string,GetPlayerInterior(playerid));
			SendClientMessageEx(playerid,COLOR_YELLOW,string);
		}
		else if(command_id == 3)
		{
		    if(isnull(tmp) || !IsNumeric(tmp) || strval(tmp) < 1)
		        return SendClientMessageEx(playerid, COLOR_RED, "{FF0000}� Error: {FFFFFF}/config cptime [time]");

		    new time = strval(tmp);

			#if DATA_SYSTEM == 1
				dini_IntSet(ConfigFile,"cp_time",time);
			#elseif DATA_SYSTEM == 2
				UpdateSqlConfigInt("cp_time", time);
			#endif

		    Config[cp_time] = time;
			format(string,256,"** %s changed checkpoint capture time to %d seconds!",PlayerName(playerid),time);
			SendClientMessageToAllEx(COLOR_YELLOW,string);
		}
		else if(command_id == 39)
		{
		    if(isnull(tmp) || !IsNumeric(tmp) || strval(tmp) < 0 || strval(tmp) > 20)
		        return SendClientMessageEx(playerid, COLOR_RED, "{FF0000}� Error: {FFFFFF}/config cpsize [size]");

		    new size = strval(tmp);

			#if DATA_SYSTEM == 1
				dini_IntSet(ConfigFile,"cp_size",size);
			#elseif DATA_SYSTEM == 2
				UpdateSqlConfigInt("cp_size",size);
			#endif

		    Config[cp_size] = size;
			format(string,256,"** %s changed Checkpoint size to %d!",PlayerName(playerid),size);
			SendClientMessageToAllEx(COLOR_YELLOW,string);
		}
		else if(command_id == 4)
		{
			if(isnull(tmp) || !IsNumeric(tmp) || strval(tmp) < 1)
		        return SendClientMessageEx(playerid, COLOR_RED, "{FF0000}� Error: {FFFFFF}/config roundtime [time]");

		    new time = strval(tmp);

			#if DATA_SYSTEM == 1
				dini_IntSet(ConfigFile,"round_time",time);
			#elseif DATA_SYSTEM == 2
				UpdateSqlConfigInt("round_time",time);
			#endif

		    Config[round_time] = time;
			format(string,256,"** %s changed round duration to %d minutes!",PlayerName(playerid),time);
			SendClientMessageToAllEx(COLOR_YELLOW,string);
		}
		else if(command_id == 5)
		{
		    if(isnull(tmp) || !IsNumeric(tmp) || strval(tmp) < 1)
		        return SendClientMessageEx(playerid, COLOR_RED, "{FF0000}� Error: {FFFFFF}/config stopcounting [time]");

		    new time = strval(tmp);

			#if DATA_SYSTEM == 1
				dini_IntSet(ConfigFile,"stop_counting",time);
			#elseif DATA_SYSTEM == 2
				UpdateSqlConfigInt("stop_counting",time);
			#endif

		    Config[stop_counting] = time;
			format(string,256,"** %s changed starting countdown to %d seconds!",PlayerName(playerid),time);
			SendClientMessageToAllEx(COLOR_YELLOW,string);
		}
		else if(command_id == 7)
		{
		    if (!IsPlayerRootAdmin(playerid)) return SendClientMessageEx(playerid, COLOR_RED, "Error: Access Denied.");
			if(isnull(tmp) || !IsNumeric(tmp) || strval(tmp) < 1)
		        return SendClientMessageEx(playerid, COLOR_RED, "{FF0000}� Error: {FFFFFF}/config nametag [distance]");

		    new dist = strval(tmp);

		    #if DATA_SYSTEM == 1
				dini_IntSet(ConfigFile,"nametag_distance",dist);
			#elseif DATA_SYSTEM == 2
				UpdateSqlConfigInt("nametag_distance",dist);
			#endif

		    Config[NameTagDistance] = dist;
			format(string,256,"** %s changed Name Tag Distance to %d!",PlayerName(playerid),dist);
			SendClientMessageToAllEx(COLOR_YELLOW,string);
		}
		else if(command_id == 6)
		{
		    if (!IsPlayerRootAdmin(playerid)) return SendClientMessageEx(playerid, COLOR_RED, "Error: Access Denied.");
			if(isnull(tmp))
		        return SendClientMessageEx(playerid, COLOR_RED, "{FF0000}� Error: {FFFFFF}/config lobbyweapons [on/off]");

		    new use = strval(tmp);

			if(strcmp(tmp, "on", true)==0)
			    use = 1;
			else if(strcmp(tmp, "off", true)==0)
			    use = 0;
			else
				return SendClientMessageEx(playerid, COLOR_GREY, "Usage: {FFFFFF}/config [lobbyweapons] [on/off]");
   		    Config[LobbyWeapons] =use;

		    #if DATA_SYSTEM == 1
				dini_IntSet(ConfigFile,"lobby_weapons",use);
			#elseif DATA_SYSTEM == 2
				UpdateSqlConfigInt("lobby_weapons",use);
			#endif

		    if(use==0) {
				format(string,256,"** %s has disabled lobby weapons!",PlayerName(playerid));
				for(new i = 0; i <= Server[HighestID]; i++)
   				{
   			    	if (Player[i][pPlaying] == false && Player[playerid][pDuel] < 1 && Player[playerid][DM] < 1) {
						ResetPlayerWeapons(i);
					}
				}
			} else {
				format(string,256,"** %s has enabled lobby weapons!",PlayerName(playerid));
				for(new i = 0; i <= Server[HighestID]; i++)
   				{
   			    	if (Player[i][pPlaying] == false) {
						for(new slots = 0; slots < 13; slots++)
						{
							if(PlayerGuns[i][slots] > 0)
							{
								GivePlayerWeaponEx(i, PlayerGuns[i][slots], PlayerAmmos[i][slots]);
							}
						}
					}
				}
			}
			SendClientMessageToAllEx(COLOR_YELLOW,string);
		}
		else if(command_id == 8)
		{
		    new health = strval(tmp);

  			if(health < 1) return SendClientMessageEx(playerid, COLOR_RED, "{FF0000}� Error: {FFFFFF}Invalid Health");

		    #if DATA_SYSTEM == 1
				dini_IntSet(ConfigFile,"roundhealth",health);
			#elseif DATA_SYSTEM == 2
				UpdateSqlConfigInt("roundhealth",health);
			#endif

		    Config[roundhealth] =health;
			format(string,256,"** %s changed round health to %d!",PlayerName(playerid),health);
			SendClientMessageToAllEx(COLOR_YELLOW,string);
		}
		else if(command_id == 9)
		{
		    new armor = strval(tmp);
		    #if DATA_SYSTEM == 1
				dini_IntSet(ConfigFile,"roundarmour",armor);
			#elseif DATA_SYSTEM == 2
				UpdateSqlConfigInt("roundarmour",armor);
			#endif

		    Config[roundarmour] =armor;
			format(string,256,"** %s changed round armour to %d!",PlayerName(playerid),armor);
			SendClientMessageToAllEx(COLOR_YELLOW,string);
		}
		else if(command_id == 24)
		{
		    new health = strval(tmp);
			if(health < 1) return SendClientMessageEx(playerid, COLOR_RED, "{FF0000}� Error: {FFFFFF}Invalid Health");

		    #if DATA_SYSTEM == 1
				dini_IntSet(ConfigFile,"globalhealth",health);
			#elseif DATA_SYSTEM == 2
				UpdateSqlConfigInt("globalhealth",health);
			#endif

		    Config[globalhealth] =health;
			format(string,256,"** %s changed global health to %d!",PlayerName(playerid),health);
			SendClientMessageToAllEx(COLOR_YELLOW,string);
		}
		else if(command_id == 23)
		{
		    new armor = strval(tmp);
		    #if DATA_SYSTEM == 1
				dini_IntSet(ConfigFile,"globalarmour",armor);
			#elseif DATA_SYSTEM == 2
				UpdateSqlConfigInt("globalarmour",armor);
			#endif
		    Config[globalarmour] =armor;
			format(string,256,"** %s changed global armour to %d!",PlayerName(playerid),armor);
			SendClientMessageToAllEx(COLOR_YELLOW,string);
		}
		else if(command_id == 10)
		{
		    if (!IsPlayerRootAdmin(playerid)) return SendClientMessageEx(playerid, COLOR_RED, "Error: Access Denied.");
			if(isnull(tmp))
		        return SendClientMessageEx(playerid, COLOR_RED, "{FF0000}� Error: {FFFFFF}/config rotatecamera [on/off]");

		    new use = strval(tmp);
  			if(strcmp(tmp, "on", true)==0)
			    use = 1;
			else if(strcmp(tmp, "off", true)==0)
			    use = 0;
			else
				return SendClientMessageEx(playerid, COLOR_GREY, "Usage: {FFFFFF}/config dynamiccamera [on/off]");

		    if(use==0) {
				format(string,256,"** %s has disabled Dynamic Camera system!",PlayerName(playerid));
			} else {
				format(string,256,"** %s has enabled Dynamic Camera system!",PlayerName(playerid));
			}

		    #if DATA_SYSTEM == 1
				dini_IntSet(ConfigFile,"rotatecamera",use);
			#elseif DATA_SYSTEM == 2
				UpdateSqlConfigInt("rotatecamera",use);
			#endif

		    Config[RotateCameraEx] = use;

			SendClientMessageToAllEx(COLOR_YELLOW,string);
		}
		else if(command_id == 11) //Team skin I know we already have /teamskin but don't remove this or i'll rape your pets
		{
		    if (!IsPlayerRootAdmin(playerid)) return SendClientMessageEx(playerid, COLOR_RED, "Error: Access Denied.");
		    if (Round[Current] != -1) {
			 	SendClientMessageEx(playerid,COLOR_GREY,"Error: Wait untill the current round is over to use this command.");
				return 1;
		    }

		    new tmp2[256]; tmp2 = strtok(params, idx);
		    new skin = strval(tmp2);
		    if(isnull(tmp)|| isnull(tmp2)|| !IsNumeric(tmp) || strval(tmp) > 5 || strval(tmp) < 0 || IsInvalidSkin(skin) || skin < MIN_SKIN_ID || skin > MAX_SKIN_ID)
		    {
	    		SendClientMessageEx(playerid,COLOR_GREY,"Usage: {FFFFFF}/config teamskin [team id] [skin id]");
			 	SendClientMessageEx(playerid,COLOR_GREEN,"Help: Home = 0 | Sub Home: 1 | Away = 2 | Sub Away: 3 | Referee: 4 | Auto-Assign: 5");
				return 1;
			}
			if(strval(tmp) == 0)
			{
		    	#if DATA_SYSTEM == 1
					dini_IntSet(ConfigFile,"skin_home",skin);
				#elseif DATA_SYSTEM == 2
					UpdateSqlConfigInt("skin_home",skin);
				#endif

				format(string, 256,"** %s changed %s default skin to id %d.",PlayerName(playerid), HomeName, skin);
				Config[skin_home] = skin;
	 			for(new i = 0; i <= Server[HighestID]; i ++)
				{
				    if (Player[i][pTeam] == T_HOME) {
						SetPlayerSkin(i, skin);
					}
				}
			}
  			if(strval(tmp) == 1)
			{
			   	#if DATA_SYSTEM == 1
					dini_IntSet(ConfigFile,"skin_subhome",skin);
				#elseif DATA_SYSTEM == 2
					UpdateSqlConfigInt("skin_subhome",skin);
				#endif
				format(string, 256,"** %s changed %s Sub default skin to id %d.",PlayerName(playerid), HomeName, skin);
				for(new i = 0; i <= Server[HighestID]; i ++)
				{
				    if (Player[i][pTeam] == T_SUBHOME) {
						SetPlayerSkin(i, skin);
					}
				}
				Config[skin_subhome] = skin;
			}
			else if(strval(tmp) == 2)
			{
		    	#if DATA_SYSTEM == 1
					dini_IntSet(ConfigFile,"skin_away",skin);
				#elseif DATA_SYSTEM == 2
					UpdateSqlConfigInt("skin_away",skin);
				#endif
				format(string, 256,"** %s changed %s default skin to id %d.",PlayerName(playerid), AwayName, skin);
	 			for(new i = 0; i <= Server[HighestID]; i ++)
				{
				    if (Player[i][pTeam] == T_AWAY) {
						SetPlayerSkin(i, skin);
					}
				}
				Config[skin_away] = skin;
			}
  			else if(strval(tmp) == 3)
			{
			  	#if DATA_SYSTEM == 1
					dini_IntSet(ConfigFile,"skin_subaway",skin);
				#elseif DATA_SYSTEM == 2
					UpdateSqlConfigInt("skin_subaway",skin);
				#endif
				format(string, 256,"** %s changed %s Sub default skin to id %d.",PlayerName(playerid), AwayName, skin);
	 			for(new i = 0; i <= Server[HighestID]; i ++)
				{
				    if (Player[i][pTeam] == T_SUBAWAY) {
						SetPlayerSkin(i, skin);
					}
				}
				Config[skin_subaway] = skin;
			}
  			else if(strval(tmp) == 4)
			{
			  	#if DATA_SYSTEM == 1
					dini_IntSet(ConfigFile,"skin_ref",skin);
				#elseif DATA_SYSTEM == 2
					UpdateSqlConfigInt("skin_ref",skin);
				#endif
				format(string, 256,"** %s changed %s default skin to id %d.",PlayerName(playerid), RefName, skin);
	 			for(new i = 0; i <= Server[HighestID]; i ++)
				{
				    if (Player[i][pTeam] == T_REF) {
						SetPlayerSkin(i, skin);
					}
				}
				Config[skin_ref] = skin;
			}
  			else if(strval(tmp) == 5)
			{
			  	#if DATA_SYSTEM == 1
					dini_IntSet(ConfigFile,"skin_auto",skin);
				#elseif DATA_SYSTEM == 2
					UpdateSqlConfigInt("skin_auto",skin);
				#endif
				format(string, 256,"** %s changed Auto-Assign default skin to id %d.",PlayerName(playerid), skin);
				Config[skin_auto] = skin;
			}
			return SendClientMessageToAllEx(COLOR_YELLOW,string);
		}
		else if(command_id == 13) //Team name
		{
		    if (!IsPlayerRootAdmin(playerid)) return SendClientMessageEx(playerid, COLOR_RED, "Error: Access Denied.");
		    new tmp2[256]; tmp2 = strtok(params, idx);
			if(isnull(tmp)|| isnull(tmp2)|| !IsNumeric(tmp) || strval(tmp) > 3 || strval(tmp) < 1)
		    {
	    		SendClientMessageEx(playerid,COLOR_GREY,"Usage: {FFFFFF}/config teamname [team id] [name]");
			 	SendClientMessageEx(playerid,COLOR_GREEN,"Help: Home = 1 | Away = 2 | Ref = 3");
				return 1;
			}
			if(strval(tmp) == 1)
			{
				format(string, 256,"** %s changed %s team name to %s.",PlayerName(playerid), HomeName, params[11]);
			    format(HomeName,sizeof(HomeName),"%s",params[11]);
				#if DATA_SYSTEM == 1
					dini_Set(ConfigFile,"homename",params[11]);
				#elseif DATA_SYSTEM == 2
					UpdateSqlConfigStr("homename",params[11]);
				#endif
			}
			else if(strval(tmp) == 2)
			{
				format(string, 256,"** %s changed %s team name to %s.",PlayerName(playerid), AwayName,  params[11]);
				format(AwayName,sizeof(AwayName),"%s", params[11]);
				#if DATA_SYSTEM == 1
					dini_Set(ConfigFile,"awayname",params[11]);
				#elseif DATA_SYSTEM == 2
					UpdateSqlConfigStr("awayname",params[11]);
				#endif
			}
			else if(strval(tmp) == 3)
			{
				format(string, 256,"** %s changed %s team name to %s.",PlayerName(playerid), RefName,  params[11]);
				format(RefName,sizeof(RefName),"%s", params[11]);
				#if DATA_SYSTEM == 1
					dini_Set(ConfigFile,"refname",params[11]);
				#elseif DATA_SYSTEM == 2
					UpdateSqlConfigStr("refname",params[11]);
				#endif
			}
			return SendClientMessageToAllEx(COLOR_YELLOW,string);
		}
		else if(command_id == 14)
		{
			new tempvar = strval(tmp);

			if(strcmp(tmp, "on", true)==0)
			    tempvar = 1;
			else if(strcmp(tmp, "off", true)==0)
			    tempvar = 0;
			else
				return SendClientMessageEx(playerid, COLOR_GREY, "Usage: {FFFFFF}/config uav [on/off]");


			if(Round[Current] != -1|| Server[EPRoundStarted] == true) SendClientMessageEx(playerid, COLOR_RED, "{FF0000}� Error: {FFFFFF}Round is in progress!");
			else if( tempvar < 0 || tempvar > 1 || isnull(tmp))
			{
				SendClientMessageEx(playerid, COLOR_GREY, "Usage: {FFFFFF}/config uav [on/off]|");
			}
			else
			{
			    if(tempvar == 0)
				{
					format(string,256,"** %s has turned off UAV radar!",PlayerName(playerid));
					SendClientMessageToAllEx(COLOR_YELLOW,string);

					#if IRC == 1
					format(string,256,"2*** 7%s has turned off UAV radar!",PlayerName(playerid));
					CallRemoteFunction("DC_IRCForceSay", "s", string);
					#endif

					Server[UAVEnabled] = false;
					#if DATA_SYSTEM == 1
						dini_IntSet(ConfigFile,"uavradar",0);
					#elseif DATA_SYSTEM == 2
						UpdateSqlConfigInt("uavradar",0);
					#endif
		        }
				else if(tempvar == 1)
				{
		   			format(string,256,"** %s has turned on UAV radar!",PlayerName(playerid));
					SendClientMessageToAllEx(COLOR_YELLOW,string);

					#if IRC == 1
					format(string,256,"2*** 7%s has turned on UAV radar!",PlayerName(playerid));
					CallRemoteFunction("DC_IRCForceSay", "s", string);
					#endif

					Server[UAVEnabled] = true;
					#if DATA_SYSTEM == 1
						dini_IntSet(ConfigFile,"uavradar",1);
					#elseif DATA_SYSTEM == 2
						UpdateSqlConfigInt("uavradar",1);
					#endif
				}
			}
		}
		else if(command_id == 15)
		{
			new tempvar = strval(tmp);

			if(strcmp(tmp, "on", true)==0)
			    tempvar = 1;
			else if(strcmp(tmp, "off", true)==0)
			    tempvar = 0;
			else
				return SendClientMessageEx(playerid, COLOR_GREY, "Usage: {FFFFFF}/config tk [on/off]");


			if(Round[Current] != -1 || Server[EPRoundStarted] == true) SendClientMessageEx(playerid, COLOR_RED, "{FF0000}� Error: {FFFFFF}Round is in progress!");
			else if( tempvar < 0 || tempvar > 1 || isnull(tmp))
			{
				SendClientMessageEx(playerid, COLOR_GREY, "Usage: {FFFFFF}/config tk [on/off]");
			}
			else
			{
			    if(tempvar == 0)
				{
			    	format(string,256,"** %s has turned off tk protection!",PlayerName(playerid));
					SendClientMessageToAllEx(COLOR_YELLOW,string);

					#if IRC == 1
					format(string,256,"2*** 7%s has turned off tk protection!",PlayerName(playerid));
					CallRemoteFunction("DC_IRCForceSay", "s", string);
					#endif

					Server[TkMode] = false;

					#if DATA_SYSTEM == 1
						dini_IntSet(ConfigFile,"tk",0);
					#elseif DATA_SYSTEM == 2
						UpdateSqlConfigInt("tk",0);
					#endif
		        }
				else if(tempvar == 1)
			 	{
		        	format(string,256,"** %s has turned on tk protection!",PlayerName(playerid));
					SendClientMessageToAllEx(COLOR_YELLOW,string);

					#if IRC == 1
					format(string,256,"2*** 7%s has turned on tk protection!",PlayerName(playerid));
					CallRemoteFunction("DC_IRCForceSay", "s", string);
					#endif

					Server[TkMode] = true;

					#if DATA_SYSTEM == 1
						dini_IntSet(ConfigFile,"tk",1);
					#elseif DATA_SYSTEM == 2
						UpdateSqlConfigInt("tk",1);
					#endif
				}
			}
		}
		else if(command_id == 16)
		{
		    if (!IsPlayerRootAdmin(playerid)) return SendClientMessageEx(playerid, COLOR_RED, "Error: Access Denied.");
			new tempvar = strval(tmp);

			if(strcmp(tmp, "on", true)==0)
			    tempvar = 1;
			else if(strcmp(tmp, "off", true)==0)
			    tempvar = 0;
			else
				return SendClientMessageEx(playerid, COLOR_GREY, "Usage: {FFFFFF}/config explosives [on/off]");

			if(Round[Current] != -1|| Server[EPRoundStarted] == true)
				return SendClientMessageEx(playerid, COLOR_RED, "{FF0000}� Error: {FFFFFF}Round is in progress!");
			else if( tempvar < 0 || tempvar > 1 || isnull(tmp))
				return SendClientMessageEx(playerid, COLOR_GREY, "Usage: {FFFFFF}/config explosives [on/off]");
			else
			{
			    if(tempvar == 0)
				{
					format(string,256,"** %s has turned off explosives!",PlayerName(playerid));
					SendClientMessageToAllEx(COLOR_YELLOW,string);

					#if IRC == 1
					format(string,256,"2*** 7%s has turned off explosives!",PlayerName(playerid));
					CallRemoteFunction("DC_IRCForceSay", "s", string);
					#endif

					WeaponsMenus[Option][35] = 0;
					WeaponsMenus[Option][16] = 0;
					WeaponsMenus[wAmmo][35] = 0;
					WeaponsMenus[wAmmo][16] = 0;
					Server[explosives] = false;
					#if DATA_SYSTEM == 1
						dini_IntSet(ConfigFile,"explosives",0);
					#elseif DATA_SYSTEM == 2
						UpdateSqlConfigInt("explosives",0);
					#endif
					UpdateTextDraws();
		        }
				else if(tempvar == 1)
				{
					format(string,256,"** %s has turned on explosives!",PlayerName(playerid));
					SendClientMessageToAllEx(COLOR_YELLOW,string);

					#if IRC == 1
					format(string,256,"2*** 7%s has turned on explosives!",PlayerName(playerid));
					CallRemoteFunction("DC_IRCForceSay", "s", string);
					#endif

					WeaponsMenus[Option][35] = 4;
					WeaponsMenus[Option][16] = 4;
					WeaponsMenus[wAmmo][35] = 1;
					WeaponsMenus[wAmmo][16] = 2;
   					Server[explosives] = true;
					#if DATA_SYSTEM == 1
						dini_IntSet(ConfigFile,"explosives",1);
					#elseif DATA_SYSTEM == 2
						UpdateSqlConfigInt("explosives",1);
					#endif
					UpdateTextDraws();
				}
			}
		}
		else if(command_id == 17)
		{
			new tempvar = strval(tmp);
			if(strcmp(tmp, "on", true)==0)
			    tempvar = 1;
			else if(strcmp(tmp, "off", true)==0)
			    tempvar = 0;
			else
				return SendClientMessageEx(playerid, COLOR_GREY, "Usage: {FFFFFF}/config roundtimer [on/off]");

			if(Round[Current] != -1 || Server[EPRoundStarted] == true) SendClientMessageEx(playerid, COLOR_RED, "{FF0000}� Error: {FFFFFF}Round is in progress!");
			else if( tempvar < 0 || tempvar > 1 || isnull(tmp))
			{
				SendClientMessageEx(playerid, COLOR_GREY, "Usage: {FFFFFF}/config roundtimer [on/off]");
			}
			else
			{
			    if(tempvar == 0)
				{
					format(string,256,"** %s has turned off the round timer!",PlayerName(playerid));
					SendClientMessageToAllEx(COLOR_YELLOW,string);

					#if IRC == 1
					format(string,256,"2*** 7%s has turned off the round timer!",PlayerName(playerid));
					CallRemoteFunction("DC_IRCForceSay", "s", string);
					#endif

					#if DATA_SYSTEM == 1
						dini_IntSet(ConfigFile,"timer",0);
					#elseif DATA_SYSTEM == 2
						UpdateSqlConfigInt("timer",0);
					#endif
					Server[TimerMode] = false;
		        }
				else if(tempvar == 1)
				{
					format(string,256,"** %s has turned on the round timer!",PlayerName(playerid));
					SendClientMessageToAllEx(COLOR_YELLOW,string);

					#if IRC == 1
					format(string,256,"2*** 7%s has turned on the round timer!",PlayerName(playerid));
					CallRemoteFunction("DC_IRCForceSay", "s", string);
					#endif

					Server[TimerMode] = true;

					#if DATA_SYSTEM == 1
						dini_IntSet(ConfigFile,"timer",1);
					#elseif DATA_SYSTEM == 2
						UpdateSqlConfigInt("timer",1);
					#endif

				}
			}
		}
		else if(command_id == 18) //Voting time
		{
		    if(isnull(tmp) || !IsNumeric(tmp) || strval(tmp) < 1)
		        return SendClientMessageEx(playerid, COLOR_RED, "{FF0000}� Error: {FFFFFF}/config votetime [time]");

		    new time = strval(tmp);
  		    Round[VotingTime] = time;
			#if DATA_SYSTEM == 1
				dini_IntSet(ConfigFile,"votetime",time);
			#elseif DATA_SYSTEM == 2
				UpdateSqlConfigInt("votetime",time);
			#endif

			format(string,256,"** %s changed Voting time to %d seconds!",PlayerName(playerid),time);
			SendClientMessageToAllEx(COLOR_YELLOW,string);
		}
		else if(command_id == 19) //Time
		{
		    if(isnull(tmp) || !IsNumeric(tmp) || strval(tmp) < 0 || strval(tmp) > 23)
		        return SendClientMessageEx(playerid, COLOR_RED, "{FF0000}� Error: {FFFFFF}/config worldtime [time]");

		    new time = strval(tmp);
			#if DATA_SYSTEM == 1
				dini_IntSet(ConfigFile,"time",time);
			#elseif DATA_SYSTEM == 2
				UpdateSqlConfigInt("time",time);
			#endif
			format(string,256,"** %s changed default world time to %d.",PlayerName(playerid),time);
			SendClientMessageToAllEx(COLOR_YELLOW,string);
			SetWorldTime(time);
			#if IRC == 1
			format(string,256,"2*** 7%s changed default world time to %d.",PlayerName(playerid), time);
			CallRemoteFunction("DC_IRCForceSay", "s", string);
			#endif
		}
		else if(command_id == 20) //Weather
		{
		    if (!IsPlayerRootAdmin(playerid)) return SendClientMessageEx(playerid, COLOR_RED, "Error: Access Denied.");
		    if(isnull(tmp) || !IsNumeric(tmp) || strval(tmp) < 0 || strval(tmp) > 45)
		        return SendClientMessageEx(playerid, COLOR_RED, "{FF0000}� Error: {FFFFFF}/config weather <weather>");

		    new time = strval(tmp);
			#if DATA_SYSTEM == 1
				dini_IntSet(ConfigFile,"weather",time);
			#elseif DATA_SYSTEM == 2
				UpdateSqlConfigInt("weather",time);
			#endif
			format(string,256,"** %s changed default weather to %d.",PlayerName(playerid),time);
			SetWeather(time);
			SendClientMessageToAllEx(COLOR_YELLOW,string);
			#if IRC == 1
			format(string,256,"2*** 7%s changed default weather to %d.",PlayerName(playerid), time);
			CallRemoteFunction("DC_IRCForceSay", "s", string);
			#endif
		}
		else if(command_id == 21)
		{
		    if (!IsPlayerRootAdmin(playerid)) return SendClientMessageEx(playerid, COLOR_RED, "Error: Access Denied.");
			new tempvar = strval(tmp);

			if(strcmp(tmp, "on", true)==0)
			    tempvar = 1;
			else if(strcmp(tmp, "off", true)==0)
			    tempvar = 0;
			else
				return SendClientMessageEx(playerid, COLOR_GREY, "Usage: {FFFFFF}/config hintmessages [on/off]");


			if( tempvar < 0 || tempvar > 1 || isnull(tmp))
			{
				SendClientMessageEx(playerid, COLOR_GREY, "Usage: {FFFFFF}/config hintmessages [on/off]");
			}
			else
			{
			    if(tempvar == 1)
				{
					format(string,256,"** %s has enabled hint messages.",PlayerName(playerid));
					SendClientMessageToAllEx(COLOR_YELLOW,string);

					#if IRC == 1
					format(string,256,"2*** 7%s has enabled hint messages.",PlayerName(playerid));
					CallRemoteFunction("DC_IRCForceSay", "s", string);
					#endif

					Server[DisplayHintMessages] = true;

					#if DATA_SYSTEM == 1
						dini_IntSet(ConfigFile,"hintmessages",1);
					#elseif DATA_SYSTEM == 2
						UpdateSqlConfigInt("hintmessages",1);
					#endif
		        }
				else if(tempvar == 0)
				{
					format(string,256,"** %s has disabled hint messages.",PlayerName(playerid));
					SendClientMessageToAllEx(COLOR_YELLOW,string);

					#if IRC == 1
					format(string,256,"2*** 7%s has disabled hint messages.",PlayerName(playerid));
					CallRemoteFunction("DC_IRCForceSay", "s", string);
					#endif

					Server[DisplayHintMessages] = false;

					#if DATA_SYSTEM == 1
						dini_IntSet(ConfigFile,"hintmessages",0);
					#elseif DATA_SYSTEM == 2
						UpdateSqlConfigInt("hintmessages",0);
					#endif
				}
			}
		}
		else if(command_id == 22)
		{
			new tempvar = strval(tmp);

			if(strcmp(tmp, "on", true)==0)
			    tempvar = 1;
			else if(strcmp(tmp, "off", true)==0)
			    tempvar = 0;
			else
				return SendClientMessageEx(playerid, COLOR_GREY, "Usage: {FFFFFF}/config autohud [on/off]");


			if( tempvar < 0 || tempvar > 1 || isnull(tmp))
			{
				SendClientMessageEx(playerid, COLOR_GREY, "Usage: {FFFFFF}/config autohud [on/off]");
			}
			else
			{
			    if(tempvar == 1)
				{
					format(string,256,"** %s has enabled automatic HUD system.",PlayerName(playerid));
					SendClientMessageToAllEx(COLOR_YELLOW,string);
					#if IRC == 1
					format(string,256,"2*** 7%s has enabled automatic HUD system.",PlayerName(playerid));
					CallRemoteFunction("DC_IRCForceSay", "s", string);
					#endif

					Server[AutoHUD] = true;

					#if DATA_SYSTEM == 1
						dini_IntSet(ConfigFile,"autohud",1);
					#elseif DATA_SYSTEM == 2
						UpdateSqlConfigInt("autohud",1);
					#endif
		        }
				else if(tempvar == 0)
				{
					format(string,256,"** %s has disabled automatic HUD system.",PlayerName(playerid));
					SendClientMessageToAllEx(COLOR_YELLOW,string);

					#if IRC == 1
					format(string,256,"2*** 7%s has disabled automatic HUD system.",PlayerName(playerid));
					CallRemoteFunction("DC_IRCForceSay", "s", string);
					#endif

					Server[AutoHUD] = false;

					#if DATA_SYSTEM == 1
						dini_IntSet(ConfigFile,"autohud",0);
					#elseif DATA_SYSTEM == 2
						UpdateSqlConfigInt("autohud",0);
					#endif
				}
			}
		}
		else if(command_id == 40)
		{
			new tempvar;

			if(strcmp(tmp, "on", true)==0)
			    tempvar = 1;
			else if(strcmp(tmp, "off", true)==0)
			    tempvar = 0;
			else
				return SendClientMessageEx(playerid, COLOR_GREY, "Usage: {FFFFFF}/config hud [on/off]");


			if( tempvar < 0 || tempvar > 1 || isnull(tmp))
			{
				SendClientMessageEx(playerid, COLOR_GREY, "Usage: {FFFFFF}/config hud [on/off]");
			}
			else
			{
			    if(tempvar == 1)
				{
					format(string,256,"** %s has enabled HUD system.",PlayerName(playerid));
					SendClientMessageToAllEx(COLOR_YELLOW,string);
					#if IRC == 1
					format(string,256,"2*** 7%s has enabled HUD system.",PlayerName(playerid));
					CallRemoteFunction("DC_IRCForceSay", "s", string);
					#endif

					Server[HUD] = true;

					#if DATA_SYSTEM == 1
						dini_IntSet(ConfigFile,"hud",1);
					#elseif DATA_SYSTEM == 2
						UpdateSqlConfigInt("hud",1);
					#endif

		        }
				else if(tempvar == 0)
				{
					format(string,256,"** %s has disabled HUD system.",PlayerName(playerid));
					SendClientMessageToAllEx(COLOR_YELLOW,string);
					#if IRC == 1
					format(string,256,"2*** 7%s has disabled HUD system.",PlayerName(playerid));
					CallRemoteFunction("DC_IRCForceSay", "s", string);
					#endif

					Server[HUD] = false;

					#if DATA_SYSTEM == 1
						dini_IntSet(ConfigFile,"hud",0);
					#elseif DATA_SYSTEM == 2
						UpdateSqlConfigInt("hud",0);
					#endif
				}
			}
		}
		else if(command_id == 25)
		{
			new tempvar;
			if(strcmp(tmp, "on", true)==0)
			    tempvar = 1;
			else if(strcmp(tmp, "off", true)==0)
			    tempvar = 0;
			else
				return SendClientMessageEx(playerid, COLOR_GREY, "Usage: {FFFFFF}/config vehiclemods [on/off]");


			if( tempvar < 0 || tempvar > 1 || isnull(tmp))
			{
				SendClientMessageEx(playerid, COLOR_GREY, "Usage: {FFFFFF}/config vehiclemods [on/off]");
			}
			else
			{
			    if(tempvar == 1)
				{
					format(string,256,"** %s has enabled vehicle modding.",PlayerName(playerid));
					SendClientMessageToAllEx(COLOR_YELLOW,string);
					#if IRC == 1
					format(string,256,"2*** 7%s has enabled vehicle modding.",PlayerName(playerid));
					CallRemoteFunction("DC_IRCForceSay", "s", string);
					#endif

					Server[AllowVehicleMod] = true;

					#if DATA_SYSTEM == 1
						dini_IntSet(ConfigFile,"vehiclemod",1);
					#elseif DATA_SYSTEM == 2
						UpdateSqlConfigInt("vehiclemod",1);
					#endif
		        }
				else if(tempvar == 0)
				{
					format(string,256,"** %s has disabled vehicle modding.",PlayerName(playerid));
					SendClientMessageToAllEx(COLOR_YELLOW,string);
					#if IRC == 1
					format(string,256,"2*** 7%s has disabled vehicle modding.",PlayerName(playerid));
					CallRemoteFunction("DC_IRCForceSay", "s", string);
					#endif

					Server[AllowVehicleMod] = false;

					#if DATA_SYSTEM == 1
						dini_IntSet(ConfigFile,"vehiclemod",0);
					#elseif DATA_SYSTEM == 2
						UpdateSqlConfigInt("vehiclemod",0);
					#endif
				}
			}
		}
		else if(command_id == 26)
		{
			new tempvar;
			if(strcmp(tmp, "on", true)==0)
			    tempvar = 1;
			else if(strcmp(tmp, "off", true)==0)
			    tempvar = 0;
			else
				return SendClientMessageEx(playerid, COLOR_GREY, "Usage: {FFFFFF}/config weapondrop [on/off]");


			if( tempvar < 0 || tempvar > 1 || isnull(tmp))
			{
				SendClientMessageEx(playerid, COLOR_GREY, "Usage: {FFFFFF}/config weapondrop [on/off]");
			}
			else
			{
			    if(tempvar == 1)
				{
					format(string,256,"** %s has enabled weapon dropping.",PlayerName(playerid));
					SendClientMessageToAllEx(COLOR_YELLOW,string);
					#if IRC == 1
					format(string,256,"2*** 7%s has enabled weapon dropping.",PlayerName(playerid));
					CallRemoteFunction("DC_IRCForceSay", "s", string);
					#endif

                    Server[WeaponDrop] = true;

					#if DATA_SYSTEM == 1
						dini_IntSet(ConfigFile,"weapondrop",1);
					#elseif DATA_SYSTEM == 2
						UpdateSqlConfigInt("weapondrop",1);
					#endif
		        }
				else if(tempvar == 0)
				{
					format(string,256,"** %s has disabled weapon dropping.",PlayerName(playerid));
					SendClientMessageToAllEx(COLOR_YELLOW,string);
					#if IRC == 1
					format(string,256,"2*** 7%s has disabled weapon dropping.",PlayerName(playerid));
					CallRemoteFunction("DC_IRCForceSay", "s", string);
					#endif

					Server[WeaponDrop] = false;

					#if DATA_SYSTEM == 1
						dini_IntSet(ConfigFile,"weapondrop",0);
					#elseif DATA_SYSTEM == 2
						UpdateSqlConfigInt("weapondrop",0);
					#endif
				}
			}
		}
		else if(command_id == 27)
		{
			new tempvar;
			if(strcmp(tmp, "on", true)==0)
			    tempvar = 1;
			else if(strcmp(tmp, "off", true)==0)
			    tempvar = 0;
			else
				return SendClientMessageEx(playerid, COLOR_GREY, "Usage: {FFFFFF}/config pausemessages [on/off]");


			if(tempvar == 1)
		   	{
				format(string,256,"** %s has enabled pause messages.",PlayerName(playerid));
				SendClientMessageToAllEx(COLOR_YELLOW,string);
				#if IRC == 1
				format(string,256,"2*** 7%s has enabled pause messages.",PlayerName(playerid));
				CallRemoteFunction("DC_IRCForceSay", "s", string);
				#endif

				Server[PauseMessages] = true;

				#if DATA_SYSTEM == 1
					dini_IntSet(ConfigFile,"pausemessages",1);
				#elseif DATA_SYSTEM == 2
					UpdateSqlConfigInt("pausemessages",1);
				#endif
		   	}
		   	else if(tempvar == 0)
		   	{
				format(string,256,"** %s has disabled pause messages.",PlayerName(playerid));
				SendClientMessageToAllEx(COLOR_YELLOW,string);
				#if IRC == 1
				format(string,256,"2*** 7%s has disabled pause messages.",PlayerName(playerid));
				CallRemoteFunction("DC_IRCForceSay", "s", string);
				#endif

				Server[PauseMessages] = false;

				#if DATA_SYSTEM == 1
					dini_IntSet(ConfigFile,"pausemessages",0);
				#elseif DATA_SYSTEM == 2
					UpdateSqlConfigInt("pausemessages",0);
				#endif
			}
		}
		else if(command_id == 28) //textdraw layout
		{
		    if (!IsPlayerRootAdmin(playerid)) return SendClientMessageEx(playerid, COLOR_RED, "Error: Access Denied.");
		    if(isnull(tmp) || !IsNumeric(tmp) || strval(tmp) < 1 || strval(tmp) > 2)
		        return SendClientMessageEx(playerid, COLOR_RED, "{FF0000}� Error: {FFFFFF}/config textdrawlayout [1-2] | 1: Bottom  2: HUD");

		    new time = strval(tmp);
			#if DATA_SYSTEM == 1
				dini_IntSet(ConfigFile,"textdrawlayout",time);
			#elseif DATA_SYSTEM == 2
				UpdateSqlConfigInt("textdrawlayout",time);
			#endif

		    new td_layout[24];
		    if(time == 1)
				td_layout = "Bottom";
			else
			    td_layout = "HUD";

			format(string,256,"** %s changed default textdraw layout to %s",PlayerName(playerid),td_layout);
			SendClientMessageToAllEx(COLOR_YELLOW,string);
			SendClientMessageEx(playerid, COLOR_WHITE,"** Please restart the gamemode for changes to take effect");
		}
		else if(command_id == 29)
		{
		    if (!IsPlayerRootAdmin(playerid)) return SendClientMessageEx(playerid, COLOR_RED, "Error: Access Denied.");
			if(isnull(tmp))
				return SendClientMessageEx(playerid, COLOR_GREY, "Usage: {FFFFFF}/config saveresults [on/off]");

			new tempvar;
			if(strcmp(tmp, "on", true)==0)
			    tempvar = 1;
			else if(strcmp(tmp, "off", true)==0)
			    tempvar = 0;
			else
				return SendClientMessageEx(playerid, COLOR_GREY, "Usage: {FFFFFF}/config saveresults [on/off]");

			if(tempvar == 1)
		   	{
				format(string,256,"** %s has enabled saving results system.",PlayerName(playerid));
				SendClientMessageToAllEx(COLOR_YELLOW,string);
				#if IRC == 1
				format(string,256,"2*** 7%s has enabled saving results system.",PlayerName(playerid));
				CallRemoteFunction("DC_IRCForceSay", "s", string);
				#endif

				Server[SaveResults] = true;

				#if DATA_SYSTEM == 1
					dini_IntSet(ConfigFile,"saveresults",1);
				#elseif DATA_SYSTEM == 2
					UpdateSqlConfigInt("saveresults",1);
				#endif
		   	}
		   	else if(tempvar == 0)
		   	{
				format(string,256,"** %s has disabled saving results system.",PlayerName(playerid));
				SendClientMessageToAllEx(COLOR_YELLOW,string);
				#if IRC == 1
				format(string,256,"2*** 7%s has disabled saving results system.",PlayerName(playerid));
				CallRemoteFunction("DC_IRCForceSay", "s", string);
				#endif

				Server[SaveResults] = false;

				#if DATA_SYSTEM == 1
					dini_IntSet(ConfigFile,"saveresults",0);
				#elseif DATA_SYSTEM == 2
					UpdateSqlConfigInt("saveresults",0);
				#endif
			}
		}
		else if(command_id == 30)
		{
		    if (!IsPlayerRootAdmin(playerid)) return SendClientMessageEx(playerid, COLOR_RED, "Error: Access Denied.");
		    new tempvar = strval(tmp);
		    new usagemsg[200];
		    format(usagemsg, 200, "Usage: {FFFFFF}/config roundlimit [1-%d]", MAX_ROUND_LIMIT);

			if(tempvar < 0 || tempvar > MAX_ROUND_LIMIT || isnull(tmp))
				return SendClientMessageEx(playerid, COLOR_GREY, usagemsg);

			new msg[256];
		   	format(msg,256,"** %s has changed the round limit to %d.",PlayerName(playerid),tempvar);
			SendClientMessageToAllEx(COLOR_YELLOW,msg);
			Server[RoundLimit] = tempvar;
			#if DATA_SYSTEM == 1
				dini_IntSet(ConfigFile,"roundlimit",tempvar);
			#elseif DATA_SYSTEM == 2
				UpdateSqlConfigInt("roundlimit",tempvar);
			#endif
		}
		else if(command_id == 31)
		{
		    if (!IsPlayerRootAdmin(playerid)) return SendClientMessageEx(playerid, COLOR_RED, "Error: Access Denied.");
			if(isnull(tmp) || strlen(tmp) > 8 || strlen(tmp) < 2)
				return SendClientMessageEx(playerid, COLOR_GREY, "Usage: {FFFFFF}/config deadtag [tag|off] || From 1 to 8 characters");
			else if(!IsValidNick(tmp))
				return SendClientMessageEx(playerid, COLOR_RED, "{FF0000}� Error: {FFFFFF}Invalid character(s)");
            new msg[256];
            
			if(!strcmp(tmp, "off", true)) {
  				format(msg, sizeof(msg), "** %s has turned off the dead tag", PlayerName(playerid));
  				SendClientMessageToAllEx(COLOR_YELLOW,msg);
  			} else {
		   		format(msg,256,"** %s has changed the dead tag to %s",PlayerName(playerid),tmp);
				SendClientMessageToAllEx(COLOR_YELLOW,msg);
				
			}
			format(Server[DeadTag],24,tmp);
			#if DATA_SYSTEM == 1
				dini_Set(ConfigFile,"deadtag",tmp);
			#elseif DATA_SYSTEM == 2
				UpdateSqlConfigStr("deadtag",tmp);
			#endif
		}
		else if(command_id == 41)
		{
		    if (!IsPlayerRootAdmin(playerid)) return SendClientMessageEx(playerid, COLOR_RED, "Error: Access Denied.");
			if(isnull(tmp) || strlen(tmp) > 8)
				return SendClientMessageEx(playerid, COLOR_GREY, "Usage: {FFFFFF}/config vehiclemsg [msg] || Up to 8 characters");
			else if(!IsValidNick(tmp))
				return SendClientMessageEx(playerid, COLOR_RED, "{FF0000}� Error: {FFFFFF}Invalid character(s)");

			new msg[256];
		   	format(msg,256,"** %s has changed the vehicle leave message to %s",PlayerName(playerid), tmp);
			SendClientMessageToAllEx(COLOR_YELLOW,msg);
			format(Server[LeaveVehicleMessage],24,tmp);
			#if DATA_SYSTEM == 1
				dini_Set(ConfigFile,"vehiclemsg",tmp);
			#elseif DATA_SYSTEM == 2
				UpdateSqlConfigStr("vehiclemsg",tmp);
			#endif
		}
		else if(command_id == 32)
		{
			if(isnull(tmp) || strval(tmp) < 1 || strval(tmp) > 3)
				return SendClientMessageEx(playerid, COLOR_GREY, "Usage: {FFFFFF}/config gameplay [1-3] | 1: Stealh and Survive | 2: War Zone | 3: Rumble");

			new tempvar = strval(tmp);

			if(tempvar == 1)
		   	{
				format(string,256,"** %s has changed TDM gameplay to Stealth and Survive.",PlayerName(playerid));
				SendClientMessageToAllEx(COLOR_YELLOW,string);
				#if IRC == 1
				format(string,256,"2*** 7%s has changed TDM gameplay to \"Stealth and Survive\".",PlayerName(playerid));
				CallRemoteFunction("DC_IRCForceSay", "s", string);
				#endif

				Round[Gameplay] = STEALTH;

				#if DATA_SYSTEM == 1
					dini_IntSet(ConfigFile,"gameplay",1);
				#elseif DATA_SYSTEM == 2
					UpdateSqlConfigInt("gameplay",1);
				#endif
		   	}
		   	else if(tempvar == 2)
		   	{
				format(string,256,"** %s has changed TDM gameplay to War Zone.",PlayerName(playerid));
				SendClientMessageToAllEx(COLOR_YELLOW,string);
				#if IRC == 1
				format(string,256,"2*** 7%s has changed TDM gameplay to \"War Zone\".",PlayerName(playerid));
				CallRemoteFunction("DC_IRCForceSay", "s", string);
				#endif

				Round[Gameplay] = WAR_ZONE;

				#if DATA_SYSTEM == 1
					dini_IntSet(ConfigFile,"gameplay",2);
				#elseif DATA_SYSTEM == 2
					UpdateSqlConfigInt("gameplay",2);
				#endif
			}
		   	else if(tempvar == 3)
		   	{
				format(string,256,"** %s has changed TDM gameplay to Rumble.",PlayerName(playerid));
				SendClientMessageToAllEx(COLOR_YELLOW,string);
				#if IRC == 1
				format(string,256,"2*** 7%s has changed TDM gameplay to \"Rumble\".",PlayerName(playerid));
				CallRemoteFunction("DC_IRCForceSay", "s", string);
				#endif

				Round[Gameplay] = RUMBLE;

				#if DATA_SYSTEM == 1
					dini_IntSet(ConfigFile,"gameplay",3);
				#elseif DATA_SYSTEM == 2
					UpdateSqlConfigInt("gameplay",3);
				#endif
			}
		}
		else if(command_id == 33)
		{
			if(isnull(tmp) || strval(tmp) < 1 || strval(tmp) > 5)
			{
				SendClientMessageEx(playerid, COLOR_GREY, "Usage: {FFFFFF}/config weaponsystem [1-5]");
   				SendClientMessageEx(playerid, COLOR_GREEN, "Help -  1: Choose yourself (Menu) | 2: Randomly picked | 3: Full Set | 4: Walking Weapons | 5: Running Weapons");
				return 1;
			}

			new tempvar = strval(tmp);
			if(tempvar == 1)
		   	{
				format(string,256,"** %s has changed weapon system to Choose yourself.",PlayerName(playerid));
				SendClientMessageToAllEx(COLOR_YELLOW,string);
				#if IRC == 1
				format(string,256,"2*** 7%s has changed weapon system to \"Choose yourself\".",PlayerName(playerid));
				CallRemoteFunction("DC_IRCForceSay", "s", string);
				#endif

				Config[weaponsystem] = WEAPONSYSTEM_MENU;

				#if DATA_SYSTEM == 1
					dini_IntSet(ConfigFile,"weaponsystem",1);
				#elseif DATA_SYSTEM == 2
					UpdateSqlConfigInt("weaponsystem",1);
				#endif
		   	}
		   	else if(tempvar == 2)
		   	{
				format(string,256,"** %s has changed weapon system to Randomly picked.",PlayerName(playerid));
				SendClientMessageToAllEx(COLOR_YELLOW,string);
				#if IRC == 1
				format(string,256,"2*** 7%s has changed weapon system to \"Randomly picked\".",PlayerName(playerid));
				CallRemoteFunction("DC_IRCForceSay", "s", string);
				#endif

				Config[weaponsystem] = WEAPONSYSTEM_RANDOM;

				#if DATA_SYSTEM == 1
					dini_IntSet(ConfigFile,"weaponsystem",2);
				#elseif DATA_SYSTEM == 2
					UpdateSqlConfigInt("weaponsystem",2);
				#endif
			}
			else if(tempvar == 3)
			{
				format(string,256,"** %s has changed weapon system to Full Set.",PlayerName(playerid));
				SendClientMessageToAllEx(COLOR_YELLOW,string);
				#if IRC == 1
				format(string,256,"2*** 7%s has changed weapon system to \"Full Set\".",PlayerName(playerid));
				CallRemoteFunction("DC_IRCForceSay", "s", string);
				#endif

				Config[weaponsystem] = WEAPONSYSTEM_FULL;

				#if DATA_SYSTEM == 1
					dini_IntSet(ConfigFile,"weaponsystem",3);
				#elseif DATA_SYSTEM == 2
					UpdateSqlConfigInt("weaponsystem",3);
				#endif
			}
			else if(tempvar == 4)
			{
				format(string,256,"** %s has changed weapon system to Walking Weapons.",PlayerName(playerid));
				SendClientMessageToAllEx(COLOR_YELLOW,string);
				#if IRC == 1
				format(string,256,"2*** 7%s has changed weapon system to \"Walking Weapons\".",PlayerName(playerid));
				CallRemoteFunction("DC_IRCForceSay", "s", string);
				#endif

				Config[weaponsystem] = WEAPONSYSTEM_WW;

				#if DATA_SYSTEM == 1
					dini_IntSet(ConfigFile,"weaponsystem",4);
				#elseif DATA_SYSTEM == 2
					UpdateSqlConfigInt("weaponsystem",4);
				#endif
			}
			else if(tempvar == 5)
			{
				format(string,256,"** %s has changed weapon system to Running Weapons.",PlayerName(playerid));
				SendClientMessageToAllEx(COLOR_YELLOW,string);
				#if IRC == 1
				format(string,256,"2*** 7%s has changed weapon system to \"Running Weapons\".",PlayerName(playerid));
				CallRemoteFunction("DC_IRCForceSay", "s", string);
				#endif

				Config[weaponsystem] = WEAPONSYSTEM_RW;

				#if DATA_SYSTEM == 1
					dini_IntSet(ConfigFile,"weaponsystem",5);
				#elseif DATA_SYSTEM == 2
					UpdateSqlConfigInt("weaponsystem",5);
				#endif
			}
		}
		else if(command_id == 34)
		{
			if(isnull(tmp))
		        return SendClientMessageEx(playerid, COLOR_RED, "{FF0000}� Error: {FFFFFF}/config duels [on/off]");

		    new use = strval(tmp);

			if(strcmp(tmp, "on", true)==0)
			    use = 1;
			else if(strcmp(tmp, "off", true)==0)
			    use = 0;
			else
				return SendClientMessageEx(playerid, COLOR_GREY, "Usage: {FFFFFF}/config duels [on/off]");

			if(use==1) {
			    Server[AllowDuels] = true;
			   	format(string,256,"** %s has enabled duels", PlayerName(playerid));
			   	SendClientMessageToAllEx(COLOR_YELLOW,string);
			   	#if IRC == 1
				format(string,256,"2*** 7%s has enabled duels.", PlayerName(playerid));
				CallRemoteFunction("DC_IRCForceSay", "s", string);
				#endif
			}
			else
			{
			    Server[AllowDuels] = false;
			    format(string,256,"** %s has disabled duels",PlayerName(playerid));
			    SendClientMessageToAllEx(COLOR_YELLOW,string);
			    #if IRC == 1
				format(string,256,"2*** 7%s has disabled duels.", PlayerName(playerid));
				CallRemoteFunction("DC_IRCForceSay", "s", string);
				#endif
			}

			#if DATA_SYSTEM == 1
				dini_IntSet(ConfigFile,"duels",use);
			#elseif DATA_SYSTEM == 2
				UpdateSqlConfigInt("duels",use);
			#endif
		}
		else if(command_id == 35)
		{
		    if (!IsPlayerRootAdmin(playerid)) return SendClientMessageEx(playerid, COLOR_RED, "Error: Access Denied.");
			if(isnull(tmp))
		        return SendClientMessageEx(playerid, COLOR_RED, "{FF0000}� Error: {FFFFFF}/config lobbyvehicles [on/off]");

		    new use = strval(tmp);

			if(strcmp(tmp, "on", true)==0)
			    use = 1;
			else if(strcmp(tmp, "off", true)==0)
			    use = 0;
			else
				return SendClientMessageEx(playerid, COLOR_GREY, "Usage: {FFFFFF}/config lobbyvehicles [on/off]");

			if(use==1)
			{
			    Server[LobbyVehicles] = true;
			    format(string,256,"** %s has enabled Lobby vehicle spawning.",PlayerName(playerid));
			    SendClientMessageToAllEx(COLOR_YELLOW,string);
			    #if IRC == 1
				format(string,256,"2*** 7%s has enabled Lobby vehicle spawning.",PlayerName(playerid));
				CallRemoteFunction("DC_IRCForceSay", "s", string);
				#endif
			}
			else
			{
			    Server[LobbyVehicles] = false;
			    format(string,256,"** %s has disabled Lobby vehicle spawning.",PlayerName(playerid));
			    SendClientMessageToAllEx(COLOR_YELLOW,string);
			    #if IRC == 1
				format(string,256,"2*** 7%s has disabled Lobby vehicles spawning.",PlayerName(playerid));
				CallRemoteFunction("DC_IRCForceSay", "s", string);
				#endif
			}

			#if DATA_SYSTEM == 1
				dini_IntSet(ConfigFile,"lobbyvehicles",use);
			#elseif DATA_SYSTEM == 2
				UpdateSqlConfigInt("lobbyvehicles",use);
			#endif
		}
		else if(command_id == 36)
		{
		    if (!IsPlayerRootAdmin(playerid)) return SendClientMessageEx(playerid, COLOR_RED, "Error: Access Denied.");
			if(isnull(tmp))
		        return SendClientMessageEx(playerid, COLOR_RED, "{FF0000}� Error: {FFFFFF}/config nick [on/off]");

		    new use = strval(tmp);

			if(strcmp(tmp, "on", true)==0)
			    use = 1;
			else if(strcmp(tmp, "off", true)==0)
			    use = 0;
			else
				return SendClientMessageEx(playerid, COLOR_GREY, "Usage: {FFFFFF}/config nick [on/off]");

			if(use==1)
			{
			    Server[NickChanging] = true;
			    format(string,256,"** %s has enabled nick changing.",PlayerName(playerid));
			    SendClientMessageToAllEx(COLOR_YELLOW,string);
			    #if IRC == 1
				format(string,256,"2*** 7%s has enabled nick changing.",PlayerName(playerid));
				CallRemoteFunction("DC_IRCForceSay", "s", string);
				#endif
			}
			else
			{
			    Server[NickChanging] = false;
			    format(string,256,"** %s has disabled has disabled nick changing.",PlayerName(playerid));
			    SendClientMessageToAllEx(COLOR_YELLOW,string);
			    #if IRC == 1
				format(string,256,"2*** 7%s has disabled nick changing.",PlayerName(playerid));
				CallRemoteFunction("DC_IRCForceSay", "s", string);
				#endif
			}

			#if DATA_SYSTEM == 1
				dini_IntSet(ConfigFile,"nick",use);
			#elseif DATA_SYSTEM == 2
				UpdateSqlConfigInt("nick",use);
			#endif
		}
		else if(command_id == 37)
		{
			if(isnull(tmp))
		        return SendClientMessageEx(playerid, COLOR_RED, "{FF0000}� Error: {FFFFFF}/config autoreadd [on/off]");

		    new use;
			if(strcmp(tmp, "on", true)==0)
			    use = 1;
			else if(strcmp(tmp, "off", true)==0)
			    use = 0;
			else
				return SendClientMessageEx(playerid, COLOR_GREY, "Usage: {FFFFFF}/config autoreadd [on/off]");

			if(use==1)
			{
			    Server[AutoReadd] = true;
			    format(string,256,"** %s has enabled Auto-Readd system.",PlayerName(playerid));
			    SendClientMessageToAllEx(COLOR_YELLOW,string);
			    #if IRC == 1
				format(string,256,"2*** 7%s has enabled Auto-Readd system.",PlayerName(playerid));
				CallRemoteFunction("DC_IRCForceSay", "s", string);
				#endif
			}
			else
			{
			    Server[AutoReadd] = false;
			    format(string,256,"** %s has disabled Auto-Readd system.",PlayerName(playerid));
			    SendClientMessageToAllEx(COLOR_YELLOW,string);
			    #if IRC == 1
				format(string,256,"2*** 7%s has disabled Auto-Readd system.",PlayerName(playerid));
				CallRemoteFunction("DC_IRCForceSay", "s", string);
				#endif
			}

			#if DATA_SYSTEM == 1
				dini_IntSet(ConfigFile,"autoreadd",use);
			#elseif DATA_SYSTEM == 2
				UpdateSqlConfigInt("autoreadd",use);
			#endif
		}
		else if(command_id == 38)
		{
		    if (!IsPlayerRootAdmin(playerid)) return SendClientMessageEx(playerid, COLOR_RED, "Error: Access Denied.");
			if(isnull(tmp))
		        return SendClientMessageEx(playerid, COLOR_RED, "{FF0000}� Error: {FFFFFF}/config autospec [on/off]");

		    new use;
			if(strcmp(tmp, "on", true)==0)
			    use = 1;
			else if(strcmp(tmp, "off", true)==0)
			    use = 0;
			else
				return SendClientMessageEx(playerid, COLOR_GREY, "Usage: {FFFFFF}/config autospec [on/off]");

			if(use==1)
			{
				Server[AutoSpec] = true;
				format(string,256,"** %s has enabled auto-spectate system.",PlayerName(playerid));
				SendClientMessageToAllEx(COLOR_YELLOW,string);
			    #if IRC == 1
				format(string,256,"2*** 7%s has disabled auto-spectate system.",PlayerName(playerid));
				CallRemoteFunction("DC_IRCForceSay", "s", string);
				#endif
			}
			else
			{
			    Server[AutoSpec] = false;
				format(string,256,"** %s has disabled auto-spectate system.",PlayerName(playerid));
				SendClientMessageToAllEx(COLOR_YELLOW,string);
				#if IRC == 1
				format(string,256,"2*** 7%s has disabled auto-spectate system.",PlayerName(playerid));
				CallRemoteFunction("DC_IRCForceSay", "s", string);
				#endif
			}
			#if DATA_SYSTEM == 1
				dini_IntSet(ConfigFile,"autospec",use);
			#elseif DATA_SYSTEM == 2
				UpdateSqlConfigInt("autospec",use);
			#endif

		}
		else if(command_id == 42)
		{
		    if (!IsPlayerRootAdmin(playerid)) return SendClientMessageEx(playerid, COLOR_RED, "Error: Access Denied.");
			if(isnull(tmp))
		        return SendClientMessageEx(playerid, COLOR_RED, "{FF0000}� Error: {FFFFFF}/config introstring [string]");

			format(Server[IntroString],256,"%s",params[strlen("introstring")+1]);

    		format(string,256,"** %s has changed intro string to %s.",PlayerName(playerid), Server[IntroString]);
			SendClientMessageToAllEx(COLOR_YELLOW,string);

            #if IRC == 1
			format(string,256,"2*** 7%s has changed intro string to %s.",PlayerName(playerid), Server[IntroString]);
			CallRemoteFunction("DC_IRCForceSay", "s", string);
			#endif

			#if DATA_SYSTEM == 1
				dini_Set(ConfigFile,"intro_string", Server[IntroString]);
			#elseif DATA_SYSTEM == 2
				UpdateSqlConfigStr("intro_string",Server[IntroString]);
			#endif
		}
		else if(command_id == 43)
		{
		    if (!IsPlayerRootAdmin(playerid)) return SendClientMessageEx(playerid, COLOR_RED, "Error: Access Denied.");
			if(isnull(tmp))
		        return SendClientMessageEx(playerid, COLOR_RED, "{FF0000}� Error: {FFFFFF}/config introsubstring [string]");

			format(Server[IntroSubString],256,"%s",params[strlen("introsubstring")+1]);

    		format(string,256,"** %s has changed intro substring to %s.",PlayerName(playerid), Server[IntroSubString]);
			SendClientMessageToAllEx(COLOR_YELLOW,string);

			#if IRC == 1
			format(string,256,"2*** 7%s has changed intro string to %s.", PlayerName(playerid), Server[IntroSubString]);
			CallRemoteFunction("DC_IRCForceSay", "s", string);
			#endif

			#if DATA_SYSTEM == 1
				dini_Set(ConfigFile,"intro_substring", Server[IntroSubString]);
			#elseif DATA_SYSTEM == 2
				UpdateSqlConfigStr("intro_substring",Server[IntroSubString]);
			#endif
		}
		else if(command_id == 45)
		{
		    if (!IsPlayerRootAdmin(playerid)) return SendClientMessageEx(playerid, COLOR_RED, "Error: Access Denied.");
			if(isnull(tmp))
		        return SendClientMessageEx(playerid, COLOR_RED, "{FF0000}� Error: {FFFFFF}/config intro [on/off]");

		    new use = strval(tmp);

			if(strcmp(tmp, "on", true)==0)
			    use = 1;
			else if(strcmp(tmp, "off", true)==0)
			    use = 0;
			else
				return SendClientMessageEx(playerid, COLOR_GREY, "Usage: {FFFFFF}/config intro [on/off]");

	   	    Config[UseIntro] =use;

		    if(use==0)
			{
				format(string,256,"** %s has disabled intro cinematics.",PlayerName(playerid));
				SendClientMessageToAllEx(COLOR_YELLOW,string);
				#if IRC == 1
				format(string,256,"2*** 7%s has disabled intro cinematics.",PlayerName(playerid));
				CallRemoteFunction("DC_IRCForceSay", "s", string);
				#endif
			}
			else
			{
				format(string,256,"** %s has enabled intro cinematics.",PlayerName(playerid));
				SendClientMessageToAllEx(COLOR_YELLOW,string);
				#if IRC == 1
				format(string,256,"2*** 7%s has enabled intro cinematics.",PlayerName(playerid));
				CallRemoteFunction("DC_IRCForceSay", "s", string);
				#endif
			}

		    #if DATA_SYSTEM == 1
				dini_IntSet(ConfigFile,"use_intro",use);
			#elseif DATA_SYSTEM == 2
				UpdateSqlConfigInt("use_intro",use);
			#endif
		}
		else if(command_id == 46)
		{
		    if (!IsPlayerRootAdmin(playerid)) return SendClientMessageEx(playerid, COLOR_RED, "Error: Access Denied.");
			new tmp2[256];
			tmp2 = strtok(params,idx);
			if(isnull(tmp) || isnull(tmp2) || strval(tmp2) < 0 || strval(tmp2) > 5)
			{
				SendClientMessageEx(playerid, COLOR_GREY, "Usage: {FFFFFF}/config weapons [weapon id/name] [option]");
		 		SendClientMessageEx(playerid,COLOR_GREEN,"Options: | 0: Not Used | 1: Primary Menu | 2: Secondary Menu | 3: Terciary Menu | 4: Special Menu | 5: Given Auto");
				return 1;
			}

			new id;
			if(!IsNumeric(tmp))
				id = ReturnWeaponID(tmp);
			else
				id = strval(tmp);

			if(!IsValidWeaponID(id))
					return SendClientMessageEx(playerid,COLOR_GREY,"Error: You have selected an invalid weapon ID.");

			new wname[24];
			GetWeaponName(id,wname,24);
			if(id == 18) wname = "Molotov"; else if(id == 44) wname = "Nightvision G."; else if(id == 45) wname = "Infrared Vision";

			if(WeaponsMenus[Option][id] == strval(tmp2))
				return SendClientMessageEx(playerid,COLOR_GREY,"Error: That weapon is already set to that option.");
			else
			{
			    WeaponsMenus[Option][id] = strval(tmp2);
			    new info[24];
				switch(strval(tmp2))
				{
				    case 0: info = "Not used";
					case 1: info = "Primary Menu";
					case 2: info = "Secondary Menu";
					case 3: info = "Terciary Menu";
					case 4: info = "Special Menu";
		  			case 5: info = "Given Auto";
				}
				format(string,128,"** %s has set weapon %s (id %d) set to %s.", PlayerName(playerid), wname, id, info);
				SendClientMessageToAllEx(COLOR_YELLOW, string);
				#if IRC == 1
				format(string,256,"2*** 7%s has set weapon %s (id %d) set to %s",PlayerName(playerid), wname, id, info);
				CallRemoteFunction("DC_IRCForceSay", "s", string);
				#endif

				#if DATA_SYSTEM == 1
		    	dini_IntSet(Weapon_Config,wnames_encode(wname),strval(tmp2));
				#elseif DATA_SYSTEM == 2
				UpdateSqlWepOption(id, strval(tmp2));
				#endif

				UpdateTextDraws();
			}
		}
		else if(command_id == 47)
		{
		    if (!IsPlayerRootAdmin(playerid)) return SendClientMessageEx(playerid, COLOR_RED, "Error: Access Denied.");
			new  tmp2[256];
			tmp2 = strtok(params,idx);
			if(isnull(tmp) || isnull(tmp2) || strval(tmp2) < 0)
			{
				SendClientMessageEx(playerid, COLOR_GREY, "Usage: {FFFFFF}/config ammo [weapon id/name] [ammo]");
				return 1;
			}
			new id;
			if(!IsNumeric(tmp))
				id = ReturnWeaponID(tmp);
			else
				id = strval(tmp);

			if(!IsValidWeaponID(id))
					return SendClientMessageEx(playerid,COLOR_GREY,"Error: You have selected an invalid weapon ID.");

			new wname[24];
			GetWeaponName(id,wname,24);
			if(id == 18) wname = "Molotov"; else if(id == 44) wname = "Nightvision G."; else if(id == 45) wname = "Infrared Vision";

			if(WeaponsMenus[wAmmo][id] == strval(tmp2))
				return SendClientMessageEx(playerid,COLOR_GREY,"Error: That weapon is already set to that ammo.");
			else
			{
			    WeaponsMenus[wAmmo][id] = strval(tmp2);
				format(string,128,"** %s has set weapon %s (id %d) ammo set to %d.", PlayerName(playerid), wname, id, strval(tmp2));
				SendClientMessageToAllEx(COLOR_YELLOW, string);

				#if IRC == 1
				format(string,256,"2*** 7%s has set weapon %s (id %d) ammo set to %d.", PlayerName(playerid), wname, id, strval(tmp2));
				CallRemoteFunction("DC_IRCForceSay", "s", string);
				#endif

				#if DATA_SYSTEM == 1
		    	dini_IntSet(Weapon_Config,wnames_ammo_encode(wname),strval(tmp2));
				#elseif DATA_SYSTEM == 2
				UpdateSqlWepAmmo(id, strval(tmp2));
				#endif

			}
		}
		else if(command_id == 48)
		{
		    if (!IsPlayerRootAdmin(playerid)) return SendClientMessageEx(playerid, COLOR_RED, "Error: Access Denied.");
		    new tmp2[256]; tmp2 = strtok(params, idx);
			if(isnull(tmp)|| isnull(tmp2)|| !IsNumeric(tmp) || strval(tmp) > 5 || strval(tmp) < 1 || strlen(params[8]) >= 60)
		    {
	    		SendClientMessageEx(playerid,COLOR_GREY,"Usage: {FFFFFF}/config rules [rule id] [rule]");
			 	SendClientMessageEx(playerid,COLOR_GREEN,"Help: Rules IDs go from 1 to 5 | Maximum string size is 60 characters.");
				return 1;
			}

			new ruleid = strval(tmp);
			format(Rules[ruleid],128,"%s", params[7]);

			format(string,128,"** %s has set rule %d to %s.", PlayerName(playerid), ruleid, Rules[ruleid]);
			SendClientMessageToAllEx(COLOR_YELLOW,string);

		  	new therules[1024];

			#if DATA_SYSTEM == 1
			format(therules,1024,"%s|%s|%s|%s|%s", Rules[1],Rules[2],Rules[3],Rules[4], Rules[5]);
			dini_Set(ConfigFile,"rules",therules);
			#elseif DATA_SYSTEM == 2
			new rule[24];
			format(rule,24,"rule_%d",ruleid);
			UpdateSqlConfigStr(rule,params[7]);
			#endif

			#if defined WEB_URL
			format(therules,1024,"~r~Please follow these rules...~n~~n~~w~\
			- %s~n~\
			- %s~n~\
			- %s~n~\
			- %s~n~\
			- %s~n~~n~~y~\
			Visit %s",Rules[1],Rules[2],Rules[3],Rules[4], Rules[5], WEB_URL);
			#else
			format(therules,1024,"~r~Please follow these rules...~n~~n~~w~\
			- %s~n~\
			- %s~n~\
			- %s~n~\
			- %s~n~\
			- %s",Rules[1],Rules[2],Rules[3],Rules[4], Rules[5]);
			#endif
			TextDrawSetString(text_rules, therules);
			return 1;
		}
		else if(command_id == 49)
		{
		    if (!IsPlayerRootAdmin(playerid)) return SendClientMessageEx(playerid, COLOR_RED, "Error: Access Denied.");
		    new tmp2[256]; tmp2 = strtok(params, idx);
			if(isnull(tmp)|| isnull(tmp2)|| !IsNumeric(tmp) || strval(tmp) > 6 || strval(tmp) < 1 || strlen(params[8]) >= 60)
		    {
	    		SendClientMessageEx(playerid,COLOR_GREY,"Usage: {FFFFFF}/config fullset [slot id] [weap id]");
			 	SendClientMessageEx(playerid,COLOR_GREEN,"Help: Slot IDs go from 1 to 6 | Set weap id to 0 to deactivate the slot.");
				return 1;
			}

			new slot = strval(tmp);
			new weap_id = strval(tmp2);

			if(!IsNumeric(tmp))
				weap_id = ReturnWeaponID(tmp2);
			else
				weap_id = strval(tmp2);

			if(weap_id != 0 && !IsValidWeaponID(weap_id))
					return SendClientMessageEx(playerid,COLOR_GREY,"Error: You have selected an invalid weapon ID.");

			if(weap_id == 0)
				format(string,128,"** %s has set disabled Full Set slot %d.", PlayerName(playerid), slot);
			else
				format(string,128,"** %s has set Full Set slot %d weapon to %s.", PlayerName(playerid), slot, GetWepName(weap_id));

			SendClientMessageToAllEx(COLOR_YELLOW,string);

			FullSet[slot] = weap_id;

		  	new query[256];
			format(query,256,"%d,%d,%d,%d,%d,%d",FullSet[1],FullSet[2],FullSet[3],FullSet[4], FullSet[5], FullSet[6]);
			#if DATA_SYSTEM == 1
			dini_Set(ConfigFile,"fullset",query);
			#elseif DATA_SYSTEM == 2
			UpdateSqlConfigStr("fullset", query);
			#endif

			return 1;
		}
		else if(command_id == 50)
		{
		    if (!IsPlayerRootAdmin(playerid)) return SendClientMessageEx(playerid, COLOR_RED, "Error: Access Denied.");
			if(isnull(tmp))
		        return SendClientMessageEx(playerid, COLOR_RED, "{FF0000}� Error: {FFFFFF}/config speedmeter [on/off]");

		    new use = strval(tmp);

			if(strcmp(tmp, "on", true)==0)
			    use = 1;
			else if(strcmp(tmp, "off", true)==0)
			    use = 0;
			else
				return SendClientMessageEx(playerid, COLOR_GREY, "Usage: {FFFFFF}/config speedmeter [on/off]");

	   	    Config[Speedmeter] = use;

		    if(use==0)
			{
				format(string,256,"** %s has disabled Vehicle HUD speedmeter.",PlayerName(playerid));
				SendClientMessageToAllEx(COLOR_YELLOW,string);
				#if IRC == 1
				format(string,256,"2*** 7%s has disabled Vehicle HUD speedmeter.",PlayerName(playerid));
				CallRemoteFunction("DC_IRCForceSay", "s", string);
				#endif
			}
			else
			{
				format(string,256,"** %s has enabled Vehicle HUD speedmeter.",PlayerName(playerid));
				SendClientMessageToAllEx(COLOR_YELLOW,string);
				#if IRC == 1
				format(string,256,"2*** 7%s has enabled Vehicle HUD speedmeter.",PlayerName(playerid));
				CallRemoteFunction("DC_IRCForceSay", "s", string);
				#endif
			}

		    #if DATA_SYSTEM == 1
				dini_IntSet(ConfigFile,"speedmeter",use);
			#elseif DATA_SYSTEM == 2
				UpdateSqlConfigInt("speedmeter",use);
			#endif
		}
		else if(command_id == 51)
		{
		    if (!IsPlayerRootAdmin(playerid)) return SendClientMessageEx(playerid, COLOR_RED, "Error: Access Denied.");
			if(isnull(tmp) || strlen(tmp) > 19 || strlen(tmp) < 2)
				return SendClientMessageEx(playerid, COLOR_GREY, "Usage: {FFFFFF}/config deathmsg [message] || Less than 20 characters!");
			else if(!IsValidNick(tmp))
				return SendClientMessageEx(playerid, COLOR_RED, "{FF0000}� Error: {FFFFFF}Invalid character(s)!");

			new msg[256];
		   	format(msg,256,"** %s has changed the death message to %s",PlayerName(playerid),params[strlen("deathmsg")+1]);
			SendClientMessageToAllEx(COLOR_YELLOW,msg);
			format(Config[DeathMsg],24,params[strlen("deathmsg")+1]);
			#if DATA_SYSTEM == 1
				dini_Set(ConfigFile,"death_msg",params[strlen("deathmsg")+1]);
			#elseif DATA_SYSTEM == 2
				UpdateSqlConfigStr("death_msg",params[strlen("deathmsg")+1]);
			#endif
		}
		else if(command_id == 52)
		{
			new  tmp2[256];
			tmp2 = strtok(params,idx);
			if(isnull(tmp) || isnull(tmp2) || strval(tmp2) < 0)
			{
				SendClientMessageEx(playerid, COLOR_GREY, "Usage: {FFFFFF}/config wlimit [weapon id/name] [limit]");
				return 1;
			}
			new id;
			if(!IsNumeric(tmp))
				id = ReturnWeaponID(tmp);
			else
				id = strval(tmp);

			if(!IsValidWeaponID(id))
					return SendClientMessageEx(playerid,COLOR_GREY,"Error: You have selected an invalid weapon ID.");

			new wname[24];
			GetWeaponName(id,wname,24);
			if(id == 18) wname = "Molotov"; else if(id == 44) wname = "Nightvision G."; else if(id == 45) wname = "Infrared Vision";

			WeaponLimit[id][limit] = strval(tmp2);

			UpdateTextDraws();

			#if DATA_SYSTEM == 1
				new wepid_str[40];
				format(wepid_str, 40, "%d", id);
				dini_IntSet(WeaponLimits_Config,wepid_str,strval(tmp2));
			#elseif DATA_SYSTEM == 2
				UpdateSqlWepLimitData(id, WeaponLimit[id][limit]);
	        #endif

			format(string,128,"** %s has set weapon limit on %s to %d.", PlayerName(playerid), wname, strval(tmp2));
			SendClientMessageToAllEx(COLOR_YELLOW, string);

			#if IRC == 1
			format(string,256,"2*** 7%s has set weapon limit on %s to %d.", PlayerName(playerid), wname, strval(tmp2));
			CallRemoteFunction("DC_IRCForceSay", "s", string);
			#endif
		}
		else if(command_id == 53)
		{
		    if (!IsPlayerRootAdmin(playerid)) return SendClientMessageEx(playerid, COLOR_RED, "Error: Access Denied.");
			new  tmp2[256];
			tmp2 = strtok(params,idx);
			if(isnull(tmp) || isnull(tmp2) || strval(tmp2) < 0)
			{
				SendClientMessageEx(playerid, COLOR_GREY, "Usage: {FFFFFF}/config wskill [weapon id/name] [skill]");
			 	SendClientMessageEx(playerid, COLOR_GREEN, "Help: Skill level from 1 - 999.");
				return 1;
			}
			new id;
			if(!IsNumeric(tmp))
				id = ReturnWeaponID(tmp);
			else
				id = strval(tmp);

			if(!IsValidWeaponID(id))
					return SendClientMessageEx(playerid,COLOR_GREY,"Error: You have selected an invalid weapon ID.");

			if(!IsValidWepSkillID(id))
					return SendClientMessageEx(playerid,COLOR_GREY,"Error: You cannot adjust skill level on this weapon.");

			new wname[24];
			GetWeaponName(id,wname,24);
			if(id == 18) wname = "Molotov"; else if(id == 44) wname = "Nightvision G."; else if(id == 45) wname = "Infrared Vision";

			WeaponSkill[id] = strval(tmp2);

			#if DATA_SYSTEM == 1
				new wepid_str[40];
				format(wepid_str, 40, "%d", id);
				dini_IntSet(WeaponSkill_Config,wepid_str,strval(tmp2));
			#elseif DATA_SYSTEM == 2
				UpdateSqlWepSkillData(id, WeaponSkill[id]);
	        #endif

			format(string,128,"** %s has set weapon skill on %s to %d.", PlayerName(playerid), wname, strval(tmp2));
			SendClientMessageToAllEx(COLOR_YELLOW, string);

	 		for(new i = 0; i <= Server[HighestID]; i ++)
			{
				SetPlayerSkillLevel(i, WEAPONSKILL_PISTOL, WeaponSkill[22]);
				SetPlayerSkillLevel(i, WEAPONSKILL_PISTOL_SILENCED, WeaponSkill[23]);
				SetPlayerSkillLevel(i, WEAPONSKILL_DESERT_EAGLE, WeaponSkill[24]);
				SetPlayerSkillLevel(i, WEAPONSKILL_SHOTGUN, WeaponSkill[25]);
				SetPlayerSkillLevel(i, WEAPONSKILL_SAWNOFF_SHOTGUN, WeaponSkill[26]);
				SetPlayerSkillLevel(i, WEAPONSKILL_SPAS12_SHOTGUN, WeaponSkill[27]);
				SetPlayerSkillLevel(i, WEAPONSKILL_MICRO_UZI, WeaponSkill[28]);
				SetPlayerSkillLevel(i, WEAPONSKILL_MP5, WeaponSkill[29]);
				SetPlayerSkillLevel(i, WEAPONSKILL_AK47, WeaponSkill[30]);
				SetPlayerSkillLevel(i, WEAPONSKILL_M4, WeaponSkill[31]);
				SetPlayerSkillLevel(i, WEAPONSKILL_SNIPERRIFLE, WeaponSkill[34]);
			}

			#if IRC == 1
			format(string,256,"2*** 7%s has set weapon skill on %s. (%d)", PlayerName(playerid), wname, strval(tmp2));
			CallRemoteFunction("DC_IRCForceSay", "s", string);
			#endif
		}
		else if(command_id == 54)
		{
		    if (!IsPlayerRootAdmin(playerid)) return SendClientMessageEx(playerid, COLOR_RED, "Error: Access Denied.");
			if(isnull(tmp))
		        return SendClientMessageEx(playerid, COLOR_RED, "{FF0000}� Error: {FFFFFF}/config autologin [on/off]");

		    new use = strval(tmp);

			if(strcmp(tmp, "on", true)==0)
			    use = 1;
			else if(strcmp(tmp, "off", true)==0)
			    use = 0;
			else
				return SendClientMessageEx(playerid, COLOR_GREY, "Usage: {FFFFFF}/config autologin [on/off]");

	   	    Config[autologin] = use;

		    if(use==0)
			{
				format(string,256,"** %s has disabled auto-login.",PlayerName(playerid));
				SendClientMessageToAllEx(COLOR_YELLOW,string);
				#if IRC == 1
				format(string,256,"2*** 7%s has disabled auto-login.",PlayerName(playerid));
				CallRemoteFunction("DC_IRCForceSay", "s", string);
				#endif
			}
			else
			{
				format(string,256,"** %s has enabled auto-login.",PlayerName(playerid));
				SendClientMessageToAllEx(COLOR_YELLOW,string);
				#if IRC == 1
				format(string,256,"2*** 7%s has enabled auto-login.",PlayerName(playerid));
				CallRemoteFunction("DC_IRCForceSay", "s", string);
				#endif
			}

		    #if DATA_SYSTEM == 1
				dini_IntSet(ConfigFile,"autologin",use);
			#elseif DATA_SYSTEM == 2
				UpdateSqlConfigInt("autologin",use);
			#endif
		}
		else if(command_id == 55)
		{
		    if (!IsPlayerRootAdmin(playerid)) return SendClientMessageEx(playerid, COLOR_RED, "Error: Access Denied.");
			if(isnull(tmp))
		        return SendClientMessageEx(playerid, COLOR_RED, "{FF0000}� Error: {FFFFFF}/config skin [on/off]");

		    new use = strval(tmp);

			if(strcmp(tmp, "on", true)==0)
			    use = 1;
			else if(strcmp(tmp, "off", true)==0)
			    use = 0;
			else
				return SendClientMessageEx(playerid, COLOR_GREY, "Usage: {FFFFFF}/config skin [on/off]");

	   	    Config[skincmd] = use;

		    if(use==0)
			{
				format(string,256,"** %s has disabled skin changing.",PlayerName(playerid));
				SendClientMessageToAllEx(COLOR_YELLOW,string);
				#if IRC == 1
				format(string,256,"2*** 7%s has disabled skin changing.",PlayerName(playerid));
				CallRemoteFunction("DC_IRCForceSay", "s", string);
				#endif
			}
			else
			{
				format(string,256,"** %s has enabled skin changing.",PlayerName(playerid));
				SendClientMessageToAllEx(COLOR_YELLOW,string);
				#if IRC == 1
				format(string,256,"2*** 7%s has enabled skin changing.",PlayerName(playerid));
				CallRemoteFunction("DC_IRCForceSay", "s", string);
				#endif
			}

		    #if DATA_SYSTEM == 1
				dini_IntSet(ConfigFile,"skin",use);
			#elseif DATA_SYSTEM == 2
				UpdateSqlConfigInt("skin",use);
			#endif
		}
		else if(command_id == 56)
		{
			if(isnull(tmp))
		        return SendClientMessageEx(playerid, COLOR_RED, "{FF0000}� Error: {FFFFFF}/config plimit [limit]");

		    new thelimit = strval(tmp);

			if(thelimit < 0 || thelimit > 200)
				return SendClientMessageEx(playerid, COLOR_GREY, "Usage: {FFFFFF}/config plimit [limit]");

			format(string,256,"** %s has set the minimum player limit to %d.",PlayerName(playerid),thelimit);
			SendClientMessageToAllEx(COLOR_YELLOW,string);
			#if IRC == 1
			format(string,256,"2*** 7%s has set the minimum player limit to %d.",PlayerName(playerid),thelimit);
			CallRemoteFunction("DC_IRCForceSay", "s", string);
			#endif

			Config[plimit] = thelimit;

		    #if DATA_SYSTEM == 1
				dini_IntSet(ConfigFile,"plimit",thelimit);
			#elseif DATA_SYSTEM == 2
				UpdateSqlConfigInt("plimit",thelimit);
			#endif
		}
		else if(command_id == 57)
		{
			if(isnull(tmp))
		        return SendClientMessageEx(playerid, COLOR_RED, "{FF0000}� Error: {FFFFFF}/config clantag [tag]");

			format(string,256,"** %s has set the server clan tag to %s.",PlayerName(playerid),tmp);
			SendClientMessageToAllEx(COLOR_YELLOW,string);
			#if IRC == 1
			format(string,256,"2*** 7%s has set the server clan tag to %s.",PlayerName(playerid),tmp);
			CallRemoteFunction("DC_IRCForceSay", "s", string);
			#endif

			format(ClanTag, sizeof(ClanTag), "%s", tmp);

			new hostname[200];
			#if defined SPECIAL_HOSTNAME
			format(hostname, 200, "hostname %s", SPECIAL_HOSTNAME);
			SendRconCommand(hostname);
			#else
			format(hostname, 200, "hostname    �  Deadly Combinations ~ [%s]  �", ClanTag);
			SendRconCommand(hostname);
			#endif
			
		    #if DATA_SYSTEM == 1
				dini_Set(ConfigFile,"clan_tag",tmp);
			#elseif DATA_SYSTEM == 2
				UpdateSqlConfigStr("clan_tag",tmp);
			#endif
		}
		else if(command_id == 58)
		{
			if(isnull(tmp))
		        return SendClientMessageEx(playerid, COLOR_RED, "{FF0000}� Error: {FFFFFF}/config autobalance [on/off]");

		    new use = strval(tmp);

			if(strcmp(tmp, "on", true)==0)
			    use = 1;
			else if(strcmp(tmp, "off", true)==0)
			    use = 0;
			else
				return SendClientMessageEx(playerid, COLOR_GREY, "Usage: {FFFFFF}/config autobalance [on/off]");

	   	    Config[autobalance] = use;

		    if(use==0)
			{
				format(string,256,"** %s has disabled auto-balance teams.",PlayerName(playerid));
				SendClientMessageToAllEx(COLOR_YELLOW,string);
				#if IRC == 1
				format(string,256,"2*** 7%s has disabled auto-balance teams.",PlayerName(playerid));
				CallRemoteFunction("DC_IRCForceSay", "s", string);
				#endif
			}
			else
			{
				format(string,256,"** %s has enabled auto-balance teams.",PlayerName(playerid));
				SendClientMessageToAllEx(COLOR_YELLOW,string);
				#if IRC == 1
				format(string,256,"2*** 7%s has enabled auto-balance teams.",PlayerName(playerid));
				CallRemoteFunction("DC_IRCForceSay", "s", string);
				#endif
			}

		    #if DATA_SYSTEM == 1
				dini_IntSet(ConfigFile,"autobalance",use);
			#elseif DATA_SYSTEM == 2
				UpdateSqlConfigInt("autobalance",use);
			#endif
		}
		else if(command_id == 59)
		{
			if(isnull(tmp) || strval(tmp) < 1 || strval(tmp) > 2)
				return SendClientMessageEx(playerid, COLOR_GREY, "Usage: {FFFFFF}/config refmode [1-2] | 1: Spawn - 2: Spec Only");

			new tempvar = strval(tmp);

			if(tempvar == 1)
		   	{
				format(string,256,"** %s has changed referee mode to Spawn.",PlayerName(playerid));
				SendClientMessageToAllEx(COLOR_YELLOW,string);
				#if IRC == 1
				format(string,256,"2*** 7%s has changed referee mode to \"Spawn\".",PlayerName(playerid));
				CallRemoteFunction("DC_IRCForceSay", "s", string);
				#endif

				Config[RefMode] = 1;

				#if DATA_SYSTEM == 1
					dini_IntSet(ConfigFile,"refmode",1);
				#elseif DATA_SYSTEM == 2
					UpdateSqlConfigInt("refmode",1);
				#endif
		   	}
		   	else if(tempvar == 2)
		   	{
				format(string,256,"** %s has changed referee mode to Spec Only.",PlayerName(playerid));
				SendClientMessageToAllEx(COLOR_YELLOW,string);
				#if IRC == 1
				format(string,256,"2*** 7%s has changed referee mode to \"Spec Only\".",PlayerName(playerid));
				CallRemoteFunction("DC_IRCForceSay", "s", string);
				#endif

				Config[RefMode] = 2;

				#if DATA_SYSTEM == 1
					dini_IntSet(ConfigFile,"refmode",2);
				#elseif DATA_SYSTEM == 2
					UpdateSqlConfigInt("refmode",2);
				#endif
			}
		}
		else if(command_id == 60)
		{
			if(isnull(tmp))
		        return SendClientMessageEx(playerid, COLOR_RED, "{FF0000}� Error: {FFFFFF}/config autoinvert [on/off]");

		    new use = strval(tmp);

			if(strcmp(tmp, "on", true)==0)
			    use = 1;
			else if(strcmp(tmp, "off", true)==0)
			    use = 0;
			else
				return SendClientMessageEx(playerid, COLOR_GREY, "Usage: {FFFFFF}/config autoinvert [on/off]");

	   	    Config[autoinvert] = use;

		    if(use==0)
			{
				format(string,256,"** %s has disabled auto-invert teams.",PlayerName(playerid));
				SendClientMessageToAllEx(COLOR_YELLOW,string);
				#if IRC == 1
				format(string,256,"2*** 7%s has disabled auto-invert teams.",PlayerName(playerid));
				CallRemoteFunction("DC_IRCForceSay", "s", string);
				#endif
			}
			else
			{
				format(string,256,"** %s has enabled auto-invert teams.",PlayerName(playerid));
				SendClientMessageToAllEx(COLOR_YELLOW,string);
				#if IRC == 1
				format(string,256,"2*** 7%s has enabled auto-invert teams.",PlayerName(playerid));
				CallRemoteFunction("DC_IRCForceSay", "s", string);
				#endif
			}

		    #if DATA_SYSTEM == 1
				dini_IntSet(ConfigFile,"autoinvert",use);
			#elseif DATA_SYSTEM == 2
				UpdateSqlConfigInt("autoinvert",use);
			#endif
		}
		else if(command_id == 61)
		{
			if(isnull(tmp))
		        return SendClientMessageEx(playerid, COLOR_RED, "{FF0000}� Error: {FFFFFF}/config diag [on/off]");

		    new use = strval(tmp);

			if(strcmp(tmp, "on", true)==0)
			    use = 1;
			else if(strcmp(tmp, "off", true)==0)
			    use = 0;
			else
				return SendClientMessageEx(playerid, COLOR_GREY, "Usage: {FFFFFF}/config diag [on/off]");

	   	    Config[diag] = use;

		    if(use==0)
			{
				format(string,256,"** %s has disabled player diagnostics.",PlayerName(playerid));
				SendClientMessageToAllEx(COLOR_YELLOW,string);
				#if IRC == 1
				format(string,256,"2*** 7%s has disabled player diagnostics.",PlayerName(playerid));
				CallRemoteFunction("DC_IRCForceSay", "s", string);
				#endif
			}
			else
			{
				format(string,256,"** %s has enabled player diagnostics.",PlayerName(playerid));
				SendClientMessageToAllEx(COLOR_YELLOW,string);
				#if IRC == 1
				format(string,256,"2*** 7%s has enabled player diagnostics.",PlayerName(playerid));
				CallRemoteFunction("DC_IRCForceSay", "s", string);
				#endif
			}

		    #if DATA_SYSTEM == 1
				dini_IntSet(ConfigFile,"diag",use);
			#elseif DATA_SYSTEM == 2
				UpdateSqlConfigInt("diag",use);
			#endif
		}
		else if(command_id == 62)
		{
			if(isnull(tmp))
		        return SendClientMessageEx(playerid, COLOR_RED, "{FF0000}� Error: {FFFFFF}/config classicchat [on/off]");

		    new use = strval(tmp);

			if(strcmp(tmp, "on", true)==0)
			    use = 1;
			else if(strcmp(tmp, "off", true)==0)
			    use = 0;
			else
				return SendClientMessageEx(playerid, COLOR_GREY, "Usage: {FFFFFF}/config classicchat [on/off]");

	   	    Config[classic_chat] = use;

		    if(use==0)
			{
				format(string,256,"** %s has chaged chat system to default.",PlayerName(playerid));
				SendClientMessageToAllEx(COLOR_YELLOW,string);
				#if IRC == 1
				format(string,256,"2*** 7%s has chaged chat system to default.",PlayerName(playerid));
				CallRemoteFunction("DC_IRCForceSay", "s", string);
				#endif
			}
			else
			{
				format(string,256,"** %s has chaged chat system to classic.",PlayerName(playerid));
				SendClientMessageToAllEx(COLOR_YELLOW,string);
				#if IRC == 1
				format(string,256,"2*** 7%s has chaged chat system to classic..",PlayerName(playerid));
				CallRemoteFunction("DC_IRCForceSay", "s", string);
				#endif
			}

		    #if DATA_SYSTEM == 1
				dini_IntSet(ConfigFile,"classic_chat",use);
			#elseif DATA_SYSTEM == 2
				UpdateSqlConfigInt("classic_chat",use);
			#endif
		}
		else if(command_id == 63)
		{
			if(isnull(tmp))
		        return SendClientMessageEx(playerid, COLOR_GREY, "Usage: {FFFFFF}/config antisktime [time]");

		    new time = strval(tmp);

			if(time < 0 || time > 50000)
				return SendClientMessageEx(playerid, COLOR_GREY, "Usage: {FFFFFF}/config antisktime [time]");

			format(string,256,"** %s has set the anti spawnkill time to %d milliseconds.",PlayerName(playerid),time);
			SendClientMessageToAllEx(COLOR_YELLOW,string);
			#if IRC == 1
			format(string,256,"2*** 7%s has set the anti spawnkill time to %d milliseconds.",PlayerName(playerid),time);
			CallRemoteFunction("DC_IRCForceSay", "s", string);
			#endif

			Config[antisktime] = time;

		    #if DATA_SYSTEM == 1
				dini_IntSet(ConfigFile,"antisktime",time);
			#elseif DATA_SYSTEM == 2
				UpdateSqlConfigInt("antisktime",time);
			#endif
		}
		else if(command_id == 64)
		{
			if(isnull(tmp))
		        return SendClientMessageEx(playerid, COLOR_GREY, "Usage: {FFFFFF}/config tdmpoints [points]");

		    new points = strval(tmp);

			if(points < 1)
				return SendClientMessageEx(playerid, COLOR_GREY, "Usage: {FFFFFF}/config tdmpoints [points]");

			format(string,256,"** %s has set the TDM rumble max points at %d.",PlayerName(playerid),points);
			SendClientMessageToAllEx(COLOR_YELLOW,string);
			#if IRC == 1
			format(string,256,"2*** 7%s has set the TDM rumble max points at %d.",PlayerName(playerid),points);
			CallRemoteFunction("DC_IRCForceSay", "s", string);
			#endif

			Config[tdmpoints] = points;

		    #if DATA_SYSTEM == 1
				dini_IntSet(ConfigFile,"tdmpoints",points);
			#elseif DATA_SYSTEM == 2
				UpdateSqlConfigInt("tdmpoints",points);
			#endif
		}
		else if(command_id == 65)
		{
			if(isnull(tmp))
		        return SendClientMessageEx(playerid, COLOR_RED, "{FF0000}� Error: {FFFFFF}/config sync [on/off]");

		    new use = strval(tmp);

			if(strcmp(tmp, "on", true)==0)
			    use = 1;
			else if(strcmp(tmp, "off", true)==0)
			    use = 0;
			else
				return SendClientMessageEx(playerid, COLOR_GREY, "Usage: {FFFFFF}/config sync [on/off]");

	   	    Config[sync] = use;

		    if(use==0)
			{
				format(string,256,"** %s has disabled sync.",PlayerName(playerid));
				SendClientMessageToAllEx(COLOR_YELLOW,string);
				#if IRC == 1
				format(string,256,"2*** 7%s has disabled sync.",PlayerName(playerid));
				CallRemoteFunction("DC_IRCForceSay", "s", string);
				#endif
			}
			else
			{
				format(string,256,"** %s has enabled sync.",PlayerName(playerid));
				SendClientMessageToAllEx(COLOR_YELLOW,string);
				#if IRC == 1
				format(string,256,"2*** 7%s has enabled sync.",PlayerName(playerid));
				CallRemoteFunction("DC_IRCForceSay", "s", string);
				#endif
			}

		    #if DATA_SYSTEM == 1
				dini_IntSet(ConfigFile,"sync",use);
			#elseif DATA_SYSTEM == 2
				UpdateSqlConfigInt("sync",use);
			#endif
		}
		else if(command_id == 66)
		{

			if(isnull(tmp) || strval(tmp) < 0 || strval(tmp) > 2)
		        return SendClientMessageEx(playerid, COLOR_RED, "{FF0000}� Error: {FFFFFF}/config regmode [0-2]");

	   	    Config[regmode] = strval(tmp);

		    if (strval(tmp) == 0)
			{
				format(string,256,"** %s has set registration mode to disabled.",PlayerName(playerid));
				SendClientMessageToAllEx(COLOR_YELLOW,string);
				#if IRC == 1
				format(string,256,"2*** 7%s has set registration mode to disabled.",PlayerName(playerid));
				CallRemoteFunction("DC_IRCForceSay", "s", string);
				#endif
			}
			else if (strval(tmp) == 1)
			{
				format(string,256,"** %s has set registration mode to normal.",PlayerName(playerid));
				SendClientMessageToAllEx(COLOR_YELLOW,string);
				#if IRC == 1
				format(string,256,"2*** 7%s has set registration mode to normal.",PlayerName(playerid));
				CallRemoteFunction("DC_IRCForceSay", "s", string);
				#endif
			}
			else if (strval(tmp) == 2)
			{
				format(string,256,"** %s has set registration mode to forced.",PlayerName(playerid));
				SendClientMessageToAllEx(COLOR_YELLOW,string);
				#if IRC == 1
				format(string,256,"2*** 7%s has set registration mode to forced.",PlayerName(playerid));
				CallRemoteFunction("DC_IRCForceSay", "s", string);
				#endif
			}

		    #if DATA_SYSTEM == 1
				dini_IntSet(ConfigFile,"regmode",strval(tmp));
			#elseif DATA_SYSTEM == 2
				UpdateSqlConfigInt("regmode",strval(tmp));
			#endif
		}
		else if(command_id == 67)
		{
			if(isnull(tmp))
		        return SendClientMessageEx(playerid, COLOR_RED, "{FF0000}� Error: {FFFFFF}/config blip [on|off]");

		    new use = strval(tmp);

			if(strcmp(tmp, "on", true)==0)
			    use = 1;
			else if(strcmp(tmp, "off", true)==0)
			    use = 0;
			else
				return SendClientMessageEx(playerid, COLOR_GREY, "Usage: {FFFFFF}/config blip [on|off]");

	   	    Config[blip] = use;

		    if(use==0)
			{
				format(string,256,"** %s has disabled blip system.",PlayerName(playerid));
				SendClientMessageToAllEx(COLOR_YELLOW,string);
				#if IRC == 1
				format(string,256,"2*** 7%s has disabled blip system.",PlayerName(playerid));
				CallRemoteFunction("DC_IRCForceSay", "s", string);
				#endif
			}
			else
			{
				format(string,256,"** %s has enabled blip system.",PlayerName(playerid));
				SendClientMessageToAllEx(COLOR_YELLOW,string);
				#if IRC == 1
				format(string,256,"2*** 7%s has enabled blip system.",PlayerName(playerid));
				CallRemoteFunction("DC_IRCForceSay", "s", string);
				#endif
			}

		    #if DATA_SYSTEM == 1
				dini_IntSet(ConfigFile,"blip",use);
			#elseif DATA_SYSTEM == 2
				UpdateSqlConfigInt("blip",use);
			#endif
		}
		else if(command_id == 68)
		{
		    if(isnull(tmp))
		        return SendClientMessageEx(playerid, COLOR_RED, "{FF0000}� Error: {FFFFFF}/config forcetime [time|off]");

		    new time;
		    if(!IsNumeric(tmp) || strval(tmp) < 0 || strval(tmp) > 23) {
		        if(strcmp(tmp, "off", true) == 0) {
		            time = -1;
		        }
		        else return SendClientMessageEx(playerid, COLOR_RED, "{FF0000}� Error: {FFFFFF}/config forcetime [time|off]");
		    } else {
		    	time = strval(tmp);
		    }

		    #if DATA_SYSTEM == 1
				dini_IntSet(ConfigFile,"forcetime",time);
			#elseif DATA_SYSTEM == 2
				UpdateSqlConfigInt("forcetime",time);
			#endif

			if(time != -1) format(string,256,"** %s changed the forced time to %d.",PlayerName(playerid),time);
			else format(string,256,"** %s turned off Forced time.",PlayerName(playerid));
			SendClientMessageToAllEx(COLOR_YELLOW,string);
			if(time != -1) SetWorldTime(time);

			Config[forcetime] = time;

			#if IRC == 1
			if(time != -1) format(string,256,"2*** 7%s changed the forced time to %d",PlayerName(playerid), time);
			else format(string,256,"2*** 7%s turned off Forced time.",PlayerName(playerid));
			CallRemoteFunction("DC_IRCForceSay", "s", string);
			#endif
		}
		else if(command_id == 69)
		{
			if(isnull(tmp))
		        return SendClientMessageEx(playerid, COLOR_RED, "{FF0000}� Error: {FFFFFF}/config dm [on|off]");

		    new use = strval(tmp);

			if(strcmp(tmp, "on", true)==0)
			    use = 1;
			else if(strcmp(tmp, "off", true)==0)
			    use = 0;
			else
				return SendClientMessageEx(playerid, COLOR_GREY, "Usage: {FFFFFF}/config dm [on|off]");

	   	    Config[c_dm] = use;

		    if(use==0)
			{
				format(string,256,"** %s has disabled deathmatches.",PlayerName(playerid));
				SendClientMessageToAllEx(COLOR_YELLOW,string);
				#if IRC == 1
				format(string,256,"2*** 7%s has disabled deathmatches.",PlayerName(playerid));
				CallRemoteFunction("DC_IRCForceSay", "s", string);
				#endif
			}
			else
			{
				format(string,256,"** %s has enabled deathmatches.",PlayerName(playerid));
				SendClientMessageToAllEx(COLOR_YELLOW,string);
				#if IRC == 1
				format(string,256,"2*** 7%s has enabled deathmatches.",PlayerName(playerid));
				CallRemoteFunction("DC_IRCForceSay", "s", string);
				#endif
			}

		    #if DATA_SYSTEM == 1
				dini_IntSet(ConfigFile,"dm",use);
			#elseif DATA_SYSTEM == 2
				UpdateSqlConfigInt("dm",use);
			#endif
		}
		else if(command_id == 70) {
		    if(isnull(tmp))
		        return SendClientMessageEx(playerid, COLOR_RED, "{FF0000}� Error: {FFFFFF}/config autopause [on|off]");

		    new use = strval(tmp);

			if(strcmp(tmp, "on", true)==0)
			    use = 1;
			else if(strcmp(tmp, "off", true)==0)
			    use = 0;
			else
				return SendClientMessageEx(playerid, COLOR_GREY, "Usage: {FFFFFF}/config autopause [on|off]");

			Config[autopause] = use;

			if(use == 0)
			{
				format(string, sizeof(string),"** %s has disabled autopause when players leave the server.",PlayerName(playerid));
				SendClientMessageToAllEx(COLOR_YELLOW,string);
				#if IRC == 1
				format(string,sizeof(string),"2*** 7%s has disabled autopause when players leave the server.",PlayerName(playerid));
				CallRemoteFunction("DC_IRCForceSay", "s", string);
				#endif
			}
			else
			{
				format(string,sizeof(string),"** %s has enabled autopause when players leave the server.",PlayerName(playerid));
				SendClientMessageToAllEx(COLOR_YELLOW,string);
				#if IRC == 1
				format(string,sizeof(string),"2*** 7%s has enabled autopause when players leave the server.",PlayerName(playerid));
				CallRemoteFunction("DC_IRCForceSay", "s", string);
				#endif
			}

			#if DATA_SYSTEM == 1
				dini_IntSet(ConfigFile,"autopause",use);
			#elseif DATA_SYSTEM == 2
				UpdateSqlConfigInt("autopause",use);
			#endif
		}
		else if(command_id == 71) {
		    if(isnull(tmp))
		        return SendClientMessageEx(playerid, COLOR_RED, "{FF0000}� Error: {FFFFFF}/config spec [on|off]");

		    new use = strval(tmp);

			if(strcmp(tmp, "on", true)==0)
			    use = 1;
			else if(strcmp(tmp, "off", true)==0)
			    use = 0;
			else
				return SendClientMessageEx(playerid, COLOR_GREY, "Usage: {FFFFFF}/config spec [on|off]");

			Config[spec] = use;

			if(use == 0)
			{
				format(string, sizeof(string),"** %s has disabled spec.",PlayerName(playerid));
				SendClientMessageToAllEx(COLOR_YELLOW,string);
				#if IRC == 1
				format(string,sizeof(string),"2*** 7%s has disabled spec.",PlayerName(playerid));
				CallRemoteFunction("DC_IRCForceSay", "s", string);
				#endif
			}
			else
			{
				format(string,sizeof(string),"** %s has enabled spec.",PlayerName(playerid));
				SendClientMessageToAllEx(COLOR_YELLOW,string);
				#if IRC == 1
				format(string,sizeof(string),"2*** 7%s has enabled spec.",PlayerName(playerid));
				CallRemoteFunction("DC_IRCForceSay", "s", string);
				#endif
			}

			for(new i = 0; i <= Server[HighestID]; i++)
   			{
				if(Player[i][Specing] == true)
				{
				    StopSpectate(i);
				}
			}

			#if DATA_SYSTEM == 1
				dini_IntSet(ConfigFile,"spec",use);
			#elseif DATA_SYSTEM == 2
				UpdateSqlConfigInt("spec",use);
			#endif
		}
		else if(command_id == 72) {

		    if (!IsPlayerRootAdmin(playerid)) return SendClientMessageEx(playerid, COLOR_RED, "Error: Access Denied.");

		    if(isnull(tmp))
		        return SendClientMessageEx(playerid, COLOR_RED, "{FF0000}� Error: {FFFFFF}/config cplayout [on|off]");

		    new use = strval(tmp);

			if(strcmp(tmp, "on", true)==0)
			    use = 1;
			else if(strcmp(tmp, "off", true)==0)
			    use = 0;
			else
				return SendClientMessageEx(playerid, COLOR_GREY, "Usage: {FFFFFF}/config cplayout [on|off]");

			Config[cplayout] = use;

			if(use == 0)
			{
				format(string, sizeof(string),"** %s has disabled Classic Checkpoint layout.",PlayerName(playerid));
				SendClientMessageToAllEx(COLOR_YELLOW,string);
				#if IRC == 1
				format(string,sizeof(string),"2*** 7%s has disabled Classic Checkpoint layout.",PlayerName(playerid));
				CallRemoteFunction("DC_IRCForceSay", "s", string);
				#endif
			}
			else
			{
				format(string,sizeof(string),"** %s has enabled Classic Checkpoint layout.",PlayerName(playerid));
				SendClientMessageToAllEx(COLOR_YELLOW,string);
				#if IRC == 1
				format(string,sizeof(string),"2*** 7%s has enabled Classic Checkpoint layout.",PlayerName(playerid));
				CallRemoteFunction("DC_IRCForceSay", "s", string);
				#endif
			}

			#if DATA_SYSTEM == 1
				dini_IntSet(ConfigFile,"cplayout",use);
			#elseif DATA_SYSTEM == 2
				UpdateSqlConfigInt("cplayout",use);
			#endif
		}
		else if(command_id == 73) {
		    #if SAMP_VERSION == 2
            	ShowAudioConfig(playerid);
            #else
            	return SendClientMessageEx(playerid, COLOR_RED, "{FF0000}� Error: {FFFFFF}The gamemode needs to be set to SA-MP v0.3d to use this feature!");
  			#endif
		}
		else if(command_id == 74)
		{
			if(isnull(tmp))
		        return SendClientMessageEx(playerid, COLOR_RED, "{FF0000}� Error: {FFFFFF}/config plimit [limit]");

		    new thelimit = strval(tmp);

			if(thelimit < 0 || thelimit > 200)
				return SendClientMessageEx(playerid, COLOR_GREY, "Usage: {FFFFFF}/config plimit [limit]");

			format(string,256,"** %s has set the maximum player limit to %d.",PlayerName(playerid),thelimit);
			SendClientMessageToAllEx(COLOR_YELLOW,string);
			#if IRC == 1
			format(string,256,"2*** 7%s has set the maximum player limit to %d.",PlayerName(playerid),thelimit);
			CallRemoteFunction("DC_IRCForceSay", "s", string);
			#endif

			Config[maxplimit] = thelimit;

		    #if DATA_SYSTEM == 1
				dini_IntSet(ConfigFile,"maxplimit",thelimit);
			#elseif DATA_SYSTEM == 2
				UpdateSqlConfigInt("maxplimit",thelimit);
			#endif
		}
		else if(command_id == 75)
		{
			if(isnull(tmp))
		        return SendClientMessageEx(playerid, COLOR_RED, "{FF0000}� Error: {FFFFFF}/config joypad [on|off]");

			new bool:toggle;
			
			if(!strcmp(tmp, "on", true)) {
			    toggle = true;
			} else {
			    toggle = false;
			}
			    
			Config[joypad] = toggle;
			    
		    if(Config[joypad] == false) {
		    	format(string, sizeof(string), "** %s has disabled joypad auto kicking.", PlayerName(playerid));
		    	SendClientMessageToAll(COLOR_YELLOW, string);

		    	#if IRC == 1
				format(string, sizeof(string), "2*** 7%s has disabled joypad auto kicking.", PlayerName(playerid));
				CallRemoteFunction("DC_IRCForceSay", "s", string);
				#endif
		    }
		    else if(Config[joypad] == true) {
		    	format(string, sizeof(string), "** %s has enabled joypad auto kicking.", PlayerName(playerid));
		    	SendClientMessageToAll(COLOR_YELLOW, string);

		    	#if IRC == 1
				format(string, sizeof(string), "2*** 7%s has enabled joypad auto kicking.", PlayerName(playerid));
				CallRemoteFunction("DC_IRCForceSay", "s", string);
				#endif
		    }
		    #if DATA_SYSTEM == 3
		    	INI_WriteIntEx(ConfigFile, "joypad", Config[joypad]);
		    #elseif DATA_SYSTEM == 2
		    	UpdateSqlConfigInt("joypad", Config[joypad]);
		    #endif
		}
	}
	return 1;
}

/*
	Gethere Command
	Usage: /gethere [player id/name]
	Description: Teleport the selected player to you.
	Access: Administrators
*/

CMD:gethere(playerid,params[])
{
	new tmp[256], idx;
	tmp = strtok(params, idx);

	if(!IsPlayerAdmin3(playerid)) return SendClientMessageEx(playerid, COLOR_RED, "{FF0000}� Error: {FFFFFF}You need to be admin to do that!");
   	else if(isnull(params)) return SendClientMessageEx(playerid,COLOR_GREY,"Usage: {FFFFFF}/goto [player id/name]");

    new id;

	if(!IsNumeric(params))
		id = ReturnPlayerID(params);
	else
		id = strval(params);

	if(!IsPlayerConnected(id) || id == INVALID_PLAYER_ID || id == playerid)
		return SendClientMessageEx(playerid,COLOR_GREY,"Error: Player not found.");
	else if(Player[id][Specing] == true || Player[id][pSpawned] == false)
		return SendClientMessageEx(playerid,COLOR_GREY,"Error: You cannot teleport that player to you now.");

	new string[256],Float:X,Float:Y,Float:Z;

	new int = GetPlayerInterior(playerid);
	SetPlayerInterior(id,int);
	SetPlayerVirtualWorld2(id,GetPlayerVirtualWorld(playerid));
	GetPlayerPos(playerid,X,Y,Z);

	if(IsPlayerInAnyVehicle(id))
	{
		SetVehiclePos(GetPlayerVehicleID(id),X+1,Y,Z);
		LinkVehicleToInterior(GetPlayerVehicleID(id),int);
	}
	else
		SetPlayerPos(id,X+1,Y,Z+2);

	format(string,256,"** %s has brought you to his location.", PlayerName(playerid));
	SendClientMessageEx(id, COLOR_YELLOW,string);

	format(string,256,"** You brought %s to your location.",PlayerName(id));

	return SendClientMessageEx(playerid,COLOR_YELLOW,string);
}

/*
	Resume Command
	Usage: /resume || /unpause
	Description: Used to resume a paused round.
	Access: Administrators
*/

CMD:resume(playerid, params[])
{
	if(!IsPlayerAdmin3(playerid)) return SendClientMessageEx(playerid, COLOR_RED, "{FF0000}� Error: {FFFFFF}You need to be admin to do that!");
	else if(Round[Current] == -1) return SendClientMessageEx(playerid, COLOR_RED, "{FF0000}� Error: {FFFFFF}You can only use this command during a Round.");
	else if(Round[Paused] == 0) return SendClientMessageEx(playerid, COLOR_RED, "{FF0000}� Error: {FFFFFF}Round is not paused");
	else
	{
		new string[128];
		format(string,128,"** %s resumed the Round.", PlayerName(playerid));
		SendClientMessageToAllEx(COLOR_ORANGE, string);
		StartUnpause(3);
 		/*Round[Paused] = false;
	 	for(new i = 0; i <= Server[HighestID]; i ++)
		{
		    if(IsPlayerConnected(i) && Player[playerid][pPlaying] == true)
		    {
		        TogglePlayerControllable(i,true);
			}
		}*/
	}
	return 1;
	#pragma unused params
}

CMD:unpause(playerid, params[]) return cmd_resume(playerid, params);

/*
	Pause Command
	Usage: /pause
	Description: Used to pause a round.
	Access: Administrators
*/

CMD:pause(playerid, params[])
{
	if(!IsPlayerAdmin3(playerid)) return SendClientMessageEx(playerid, COLOR_RED, "{FF0000}� Error: {FFFFFF}You need to be admin to do that!");
	else if(Round[Current] == -1) return SendClientMessageEx(playerid, COLOR_RED, "{FF0000}� Error: {FFFFFF}You can only use this command during a Round.");
	else if(Round[Paused] >= 1) return SendClientMessageEx(playerid, COLOR_RED, "{FF0000}� Error: {FFFFFF}Round is already paused");
	else
	{
		new string[128];
		format(string,128,"** %s paused the Round.", PlayerName(playerid));
		SendClientMessageToAllEx(COLOR_ORANGE, string);
		PauseRound(1);
	}
	return 1;
	#pragma unused params
}

/*
	Global Chat On/Off Command
	Usage: /globalchat [on/off]
	Description: Used to Enable / Disable global chat
	Access: Administrators
*/

CMD:globalchat(playerid, params[])
{
	new tmp[256], idx;
	tmp = strtok(params, idx);
	new string[256];

	if(!IsPlayerAdmin3(playerid)) return SendClientMessageEx(playerid, COLOR_RED, "{FF0000}� Error: {FFFFFF}You need to be admin to do that!");
	else
	{
		if(isnull(tmp))
	        return SendClientMessageEx(playerid, COLOR_RED, "{FF0000}� Error: {FFFFFF}/globalchat [on/off]");

	    new use = strval(tmp);
		if(strcmp(tmp, "on", true)==0)
		    use = 1;
		else if(strcmp(tmp, "off", true)==0)
		    use = 0;
		else
			return SendClientMessageEx(playerid, COLOR_GREY, "Usage: {FFFFFF}/globalchat [on/off]");

	    if(use==0)
		{
			if(Server[GlobalChatEnabled] == false)
				return SendClientMessageEx(playerid, COLOR_RED, "{FF0000}� Error: {FFFFFF}Global Chat is already disabled");

			format(string,256,"** %s has disabled Global Chat.",PlayerName(playerid));
		    Server[GlobalChatEnabled] = false;

			for(new i = 0; i <= Server[HighestID]; i ++)
			{
			    if(IsPlayerConnected(i))
		    	 	Player[i][ChatAllowed] = false;
			}
		}
		else
		{
			if(Server[GlobalChatEnabled] == true)
				return SendClientMessageEx(playerid, COLOR_RED, "{FF0000}� Error: {FFFFFF}Global Chat is already enabled");

			format(string,256,"** %s has enabled Global Chat.",PlayerName(playerid));
  		    Server[GlobalChatEnabled] = true;

   			for(new i = 0; i <= Server[HighestID]; i ++)
			{
			    if(IsPlayerConnected(i))
		    	 	Player[i][ChatAllowed] = true;
			}
		}
		SendClientMessageToAllEx(COLOR_YELLOW,string);
	}
	return 1;
}

/*
	Chat Command
	Usage: /chat [player id/name]
	Description: Used to Enable / Disable global chat for a specific player
	Access: Administrators
*/

CMD:chat(playerid, params[])
{
	new tmp[256], idx;
	tmp = strtok(params, idx);
	new string[256];

	if(!IsPlayerAdmin3(playerid)) return SendClientMessageEx(playerid, COLOR_RED, "{FF0000}� Error: {FFFFFF}You need to be admin to do that!");
	else
	{
		if(isnull(tmp))
	        return SendClientMessageEx(playerid, COLOR_RED, "{FF0000}� Error: {FFFFFF}/chat [player id/name]");

		new id;
		if(!IsNumeric(tmp))
			id = ReturnPlayerID(tmp);
		else
			id = strval(tmp);

		if(!IsPlayerConnected(id)) return SendClientMessageEx(playerid, COLOR_RED, "{FF0000}� Error: {FFFFFF}Player not found.");

	    if(Player[id][ChatAllowed] == false)
		{
			Player[id][ChatAllowed] = true;
			format(string,256,"** %s has allowed %s to use Global Chat", PlayerName(playerid), PlayerName(id));
			SendClientMessageToAllEx(COLOR_YELLOW,string);
		}
		else if(Player[id][ChatAllowed] == true)
		{
			Player[id][ChatAllowed] = false;
			format(string,256,"** %s has disallowed %s to use Global Chat", PlayerName(playerid), PlayerName(id));
			SendClientMessageToAllEx(COLOR_YELLOW,string);
		}
	}
	return 1;
}

/*
	No Chat Command
	Usage: /nochat
	Description: Disables all chat during rounds.
	Access: Administrators
*/

CMD:nochat(playerid, params[])
{
	new string[256];
	if(!IsPlayerAdmin3(playerid)) return SendClientMessageEx(playerid, COLOR_RED, "{FF0000}� Error: {FFFFFF}You need to be admin to do that!");
	else if(Round[Current] == -1) return SendClientMessageEx(playerid, COLOR_RED, "{FF0000}� Error: {FFFFFF}You can only use this command during a Round.");
	else
	{
	    if(Server[NoChat] == false)
		{
			Server[NoChat] = true;
			format(string,256,"** %s has disabled any use of chat.", PlayerName(playerid));
			SendClientMessageToAllEx(COLOR_YELLOW,string);
		}
		else if(Server[NoChat] == true)
		{
			Server[NoChat] = false;
			format(string,256,"** %s has enabled chat.", PlayerName(playerid));
			SendClientMessageToAllEx(COLOR_YELLOW,string);
		}
	}
	return 1;
	#pragma unused params
}

/*
	Reset Account Command
	Usage: /resetaccount <nick>
	Description: Used to reset a player Account
	Access: Administrators
*/

CMD:resetacc(playerid, params[])
{
	new tmp[256], idx;
	tmp = strtok(params, idx);
	new string[256];

	if(!IsPlayerRootAdmin(playerid)) SendClientMessageEx(playerid, COLOR_RED, "{FF0000}� Error: {FFFFFF}You need to be admin to do that!");
	else
	{
   		if(isnull(params))
		   return SendClientMessageEx(playerid,COLOR_GREY,"Usage: {FFFFFF}/resetacc [account]");


		#if DATA_SYSTEM == 1
			new file[256];
			format(file,256,"combinations/players/%s.ini", nick_encode(params));

			if(dini_Exists(file))
			{
				format(string,256,"** Account %s reseted by %s", params, PlayerName(playerid),playerid);
				SendClientMessageToAllEx(COLOR_ORANGE,string);
				new savepw = dini_Int(file,"password");
				dini_Remove(file);
				dini_Create(file);
				dini_IntSet(file, "password", savepw);
			}
			else
				return SendClientMessageEx(playerid, COLOR_RED, "Error: The selected account is not valid.");
		#elseif DATA_SYSTEM == 2
			if(SqlUserExist(PlayerName(playerid)))
			{
				format(string,256,"** Account %s reseted by %s", params, PlayerName(playerid),playerid);
				SendClientMessageToAllEx(COLOR_ORANGE,string);

				UpdateSqlUserDataInt(playerid,"RoundsPlayedEx",0);
				UpdateSqlUserDataInt(playerid,"Kills",0);
				UpdateSqlUserDataInt(playerid,"Deaths",0);
				UpdateSqlUserDataInt(playerid,"KillSpree",0);
				UpdateSqlUserDataInt(playerid,"DeathSpree",0);
				UpdateSqlUserDataInt(playerid,"CaptureTimes",0);
				UpdateSqlUserDataInt(playerid,"OnlineTime",0);
				UpdateSqlUserDataInt(playerid,"RoundDeathsEx",0);
				UpdateSqlUserDataInt(playerid,"RoundKillsEx",0);
				UpdateSqlUserDataInt(playerid,"CarColor1",0);
				UpdateSqlUserDataInt(playerid,"CarColor2",0);

				format(string,256, "%f,%f,%f,%f\n",0.0, 0.0, 0.0);
				UpdateSqlUserDataStr(playerid,"spawn",string);
				UpdateSqlUserDataInt(playerid,"spawntype",LOBBY_SPAWN);

				for(new i = 0; i < MAX_COUNT_WEAPONS; i++)
				{
				    UpdateSqlUserWepStat(playerid, weaponsInfo[i][strKills], 0);
				}

				for(new slots = 0; slots < 13; slots++)
				{
				    new ffs[24];
				    format(ffs,24,"getgunweap_%d", slots);
					UpdateSqlPlayerGetGun(playerid, ffs, 0);

				    format(ffs,24,"getgunammo_%d", slots);
					UpdateSqlPlayerGetGun(playerid, ffs, 0);
				}

			}
			else
				return SendClientMessageEx(playerid, COLOR_RED, "Error: The selected account is not valid.");
		#endif
	}
	return 1;
}

/*
	Delete Account Command
	Usage: /deleteacc <nick>
	Description: Used to delete a player Account
	Access: Administrators
*/

CMD:deleteacc(playerid, params[])
{
	new tmp[256], idx;
	tmp = strtok(params, idx);
	new string[256];

	if(!IsPlayerRootAdmin(playerid)) SendClientMessageEx(playerid, COLOR_RED, "{FF0000}� Error: {FFFFFF}You need to be admin to do that!");
	else
	{
   		if(isnull(params))
		   return SendClientMessageEx(playerid,COLOR_GREY,"Usage: {FFFFFF}/deletacc [account]");

		#if DATA_SYSTEM == 1
		    new acc[256];
			format(acc,256,"combinations/players/%s.ini", nick_encode(params));

			if(dini_Exists(acc))
			{
				format(string,256,"** Account %s deleted by %s", params, PlayerName(playerid),playerid);
				SendClientMessageToAllEx(COLOR_ORANGE,string);
				dini_Remove(acc);
			}
			else
				return SendClientMessageEx(playerid, COLOR_RED, "Error: The selected account is not valid.");
		#elseif DATA_SYSTEM == 2
			if(SqlUserExist(params))
			{
				format(string,256,"** Account %s deleted by %s", params, PlayerName(playerid),playerid);
				SendClientMessageToAllEx(COLOR_ORANGE,string);
				DeleteSqlAccount(params);
			}
			else
				return SendClientMessageEx(playerid, COLOR_RED, "Error: The selected account is not valid.");
		#endif
	}
	return 1;
}

/*
	Delete Command
	Usage: /delete <base/tdm/duel/dm/tp> [id]
	Description: Used to delete a base or tdm.
	Access: Administrators
*/

CMD:delete(playerid, params[])
{
	new tmp[256], idx;
	new command_id;
	tmp = strtok(params, idx);
	new string[256];

	if(!IsPlayerRootAdmin(playerid)) SendClientMessageEx(playerid, COLOR_RED, "{FF0000}� Error: {FFFFFF}You need to be admin to do that!");
	else if(isnull(params)) SendClientMessageEx(playerid, COLOR_GREY, "Usage: {FFFFFF}/delete [base/tdm/duel/dm/tp] [id]");
	else
	{

		if(strcmp(tmp, "base", true)==0)
		    command_id = 1;
		else if(strcmp(tmp, "tdm", true)==0)
		    command_id = 2;
		else if(strcmp(tmp, "duel", true)==0)
		    command_id = 3;
		else if(strcmp(tmp, "dm", true)==0)
		    command_id = 4;
		else if(strcmp(tmp, "tp", true)==0)
		    command_id = 5;

		tmp = strtok(params, idx);

		if(command_id <= 2 && isnull(tmp)) {
		    if(command_id==1)
				SendClientMessageEx(playerid, COLOR_GREY, "Usage: {FFFFFF}/delete [base] [baseid]");
			else if(command_id==2)
				SendClientMessageEx(playerid, COLOR_GREY, "Usage: {FFFFFF}/delete [tdm] [tdm id]");
			return 1;
		}

		if(command_id==1)
		{
		   	#if DATA_SYSTEM == 1
				new fbase[256];
			   	new id = strval(tmp);
			    fbase = Basefile(id);
				if(!dini_Exists(fbase))
				{
						return SendClientMessageEx(playerid, COLOR_RED, "{FF0000}� Error: {FFFFFF}The selected base does not exist.");
				}
				else
				{
					dini_Remove(fbase);
					format(string,256,">> %s deleted Base id %d.",PlayerName(playerid), id);
					SendClientMessageToAllEx(COLOR_YELLOW, string);
					Server[TotalBases] = Server[TotalBases]-1;
					//printf(">> %s deleted Base id %d",PlayerName(playerid), id);
				}
			#elseif DATA_SYSTEM == 2
			   	new id = strval(tmp);
				if(!SqlBaseExist(id))
				{
						return SendClientMessageEx(playerid, COLOR_RED, "{FF0000}� Error: {FFFFFF}The selected base does not exist.");
				}
				else
				{
					DeleteSqlBase(id);
					format(string,256,">> %s deleted Base id %d.",PlayerName(playerid), id);
					SendClientMessageToAllEx(COLOR_YELLOW, string);
					Server[TotalBases] = Server[TotalBases]-1;
					//printf(">> %s deleted Base id %d",PlayerName(playerid), id);
				}
			#endif
		}
		else if(command_id==2)
		{
			#if DATA_SYSTEM == 1
				new fbase[256];
			    new id = strval(tmp);
			    fbase = TDMfile(id);
				if(!dini_Exists(fbase))
				{
						return SendClientMessageEx(playerid, COLOR_RED, "{FF0000}� Error: {FFFFFF}The selected TDM does not exist.");
				}
				else
				{
					dini_Remove(fbase);
					format(string,256,">> %s deleted TDM id %d",PlayerName(playerid), id);
					SendClientMessageToAllEx(COLOR_YELLOW, string);
					Server[TotalTDMs] = Server[TotalTDMs]-1;
					//printf(">> %s deleted TDM id %d",PlayerName(playerid), id);
				}
			#elseif DATA_SYSTEM == 2
			    new id = strval(tmp);
				if(!SqlTDMExist(id))
				{
						return SendClientMessageEx(playerid, COLOR_RED, "{FF0000}� Error: {FFFFFF}The selected TDM does not exist.");
				}
				else
				{
					DeleteSqlTDM(id);
					format(string,256,">> %s deleted TDM id %d",PlayerName(playerid), id);
					SendClientMessageToAllEx(COLOR_YELLOW, string);
					//printf(">> %s deleted TDM id %d",PlayerName(playerid), id);
				}
			#endif
		}
		else if(command_id==3)
		{
			#if DATA_SYSTEM == 1
			    new id = strval(tmp);
				if(!dini_Exists(Duelfile(id)))
				{
						return SendClientMessageEx(playerid, COLOR_RED, "{FF0000}� Error: {FFFFFF}The selected duel does not exist.");
				}
				else
				{
					dini_Remove(Duelfile(id));
					format(string,256,">> %s deleted duel id %d",PlayerName(playerid), id);
					SendClientMessageToAllEx(COLOR_YELLOW, string);
					//printf(">> %s deleted TDM id %d",PlayerName(playerid), id);
				}
			#elseif DATA_SYSTEM == 2
			    new id = strval(tmp);
				if(!SqlDuelExist(id))
				{
						return SendClientMessageEx(playerid, COLOR_RED, "{FF0000}� Error: {FFFFFF}The selected duel does not exist.");
				}
				else
				{
					DeleteSqlDuel(id);
					format(string,256,">> %s deleted duel id %d",PlayerName(playerid), id);
					SendClientMessageToAllEx(COLOR_YELLOW, string);
					//printf(">> %s deleted TDM id %d",PlayerName(playerid), id);
				}
			#endif
		}
		else if(command_id==4)
		{
			#if DATA_SYSTEM == 1
			    new id = strval(tmp);
				if(!dini_Exists(DMfile(id)))
				{
						return SendClientMessageEx(playerid, COLOR_RED, "{FF0000}� Error: {FFFFFF}The selected DM does not exist.");
				}
				else
				{
					dini_Remove(DMfile(id));
					format(string,256,">> %s deleted DM id %d",PlayerName(playerid), id);
					SendClientMessageToAllEx(COLOR_YELLOW, string);
					//printf(">> %s deleted TDM id %d",PlayerName(playerid), id);
				}
			#elseif DATA_SYSTEM == 2
			    new id = strval(tmp);
				if(!SqlDMExist(id))
				{
						return SendClientMessageEx(playerid, COLOR_RED, "{FF0000}� Error: {FFFFFF}The selected DM does not exist.");
				}
				else
				{
					DeleteSqlDM(id);
					format(string,256,">> %s deleted DM id %d",PlayerName(playerid), id);
					SendClientMessageToAllEx(COLOR_YELLOW, string);
					//printf(">> %s deleted TDM id %d",PlayerName(playerid), id);
				}
			#endif
		}
		else if(command_id==5)
		{
			#if DATA_SYSTEM == 1
			    new id = strval(tmp);
				if(!dini_Exists(Teleportfile(id)))
				{
						return SendClientMessageEx(playerid, COLOR_RED, "{FF0000}� Error: {FFFFFF}The selected TP does not exist.");
				}
				else
				{
					dini_Remove(Teleportfile(id));
					format(string,256,">> %s deleted TP id %d",PlayerName(playerid), id);
					SendClientMessageToAllEx(COLOR_YELLOW, string);
					//printf(">> %s deleted TDM id %d",PlayerName(playerid), id);
				}
			#elseif DATA_SYSTEM == 2
			    new id = strval(tmp);
				if(!SqlTeleExist(id))
				{
						return SendClientMessageEx(playerid, COLOR_RED, "{FF0000}� Error: {FFFFFF}The selected TP does not exist.");
				}
				else
				{
					DeleteSqlTele(id);
					format(string,256,">> %s deleted TP id %d",PlayerName(playerid), id);
					SendClientMessageToAllEx(COLOR_YELLOW, string);
					//printf(">> %s deleted TDM id %d",PlayerName(playerid), id);
				}
			#endif
		}
	}
	return 1;
}

/*
	Reload Command
	Usage: /reload[bases/tdms]
	Description: Used to reload bases/tdms. Used after creating a new base/tdm.
	Access: Administrators
*/

CMD:reload(playerid, params[])
{
	new tmp[256], idx;
	new command_id;
	tmp = strtok(params, idx);

	if(!IsPlayerAdmin3(playerid)) return SendClientMessageEx(playerid, COLOR_RED, "{FF0000}� Error: {FFFFFF}You need to be admin to do that!");
	if(isnull(tmp)) return SendClientMessageEx(playerid, COLOR_GREY, "Usage: {FFFFFF}/reload [bases/tdms/duels/teleports/dms]");
	else
	{
		if(strcmp(tmp, "bases", true)==0)
		    command_id = 1;
		else if(strcmp(tmp, "tdms", true)==0)
		    command_id = 2;
		else if(strcmp(tmp, "duels", true)==0)
		    command_id = 3;
		else if(strcmp(tmp, "teleports", true)==0)
		    command_id = 4;
		else if(strcmp(tmp, "dms", true)==0)
		    command_id = 5;
		else
		    return SendClientMessageEx(playerid, COLOR_GREY, "Usage: {FFFFFF}/reload [bases/tdms/duels/teleports/dms]");
		tmp = strtok(params, idx);

		if(command_id == 1)
		{
		    GameTextForAll("~r~Bases ~y~reloaded",2000,1);
		    LoadTotalBases();
		    FixGaps();
		}
		else if(command_id == 2)
		{
		    GameTextForAll("~r~TDMs ~y~reloaded",2000,1);
		    LoadTotalTDMs();
		    FixGaps();
		}
		else if(command_id == 3)
		{
		    GameTextForAll("~r~Duels ~y~reloaded",2000,1);
		    LoadDuelAreas();
		    FixGaps();
		}
		else if(command_id == 4)
		{
		    GameTextForAll("~r~Teleports ~y~reloaded",2000,1);
		    LoadTeleportAreas();
		    FixGaps();
		}
		else if(command_id == 5)
		{
		    GameTextForAll("~r~DMs ~y~reloaded",2000,1);
		    LoadDMAreas();
		    FixGaps();
		}
	}
	return 1;
}

/*
	Base Command
	Usage: /b [edit/view/create/gotocp/gotoatt/gotodef/desc]
	Description: Used to create, edit and view bases.
	Access: Administrators
*/

CMD:b(playerid, params[])
{
	new tmp[256], idx;
	new command_id;
	tmp = strtok(params, idx);
	new string[256];

	if(!IsPlayerRootAdmin(playerid)) SendClientMessageEx(playerid, COLOR_RED, "{FF0000}� Error: {FFFFFF}You need to be admin to do that!");
	else if(isnull(params)) SendClientMessageEx(playerid, COLOR_GREY, "Usage: {FFFFFF}/b [edit/view/create/gotocp/gotoatt/gotodef/desc]");
	else
	{
		if(strcmp(tmp, "edit", true)==0)
		    command_id = 2;
		else if(strcmp(tmp, "create", true)==0)
		    command_id = 3;
		else if(strcmp(tmp, "gotocp", true)==0)
		    command_id = 4;
  		else if(strcmp(tmp, "gotoatt", true)==0)
		    command_id = 5;
   		else if(strcmp(tmp, "gotodef", true)==0)
 			command_id = 6;
   		else if(strcmp(tmp, "desc", true)==0)
 			command_id = 7;
		else
		    return SendClientMessageEx(playerid, COLOR_GREY, "Usage: {FFFFFF}/b [edit/view/create/gotocp/gotoatt/gotodef/desc]");
		tmp = strtok(params, idx);

		if(command_id==7) {
			new baseid;
			new tmp2[256];
			tmp2 = strtok(params, idx);
			if(isnull(tmp) || isnull(tmp2))
			{
				SendClientMessageEx(playerid, COLOR_GREY, "Usage: {FFFFFF}/b desc [baseid] [description]");
				return 1;
			}

		    baseid = strval(tmp);

			#if DATA_SYSTEM == 1
			    new fbase[256];
				fbase = Basefile(baseid);
				if(!dini_Exists(fbase))
				{
				    return SendClientMessageEx(playerid, COLOR_RED, "{FF0000}� Error: {FFFFFF}The selected base does not exist.");
				}
				dini_Set(fbase,"about",params[6+strlen(tmp)]);
			#elseif DATA_SYSTEM == 2
				if(!SqlBaseExist(baseid))
				{
				    return SendClientMessageEx(playerid, COLOR_RED, "{FF0000}� Error: {FFFFFF}The selected base does not exist.");
				}
				UpdateSqlBaseStr(baseid, "name", params[6+strlen(tmp)]);
			#endif

			format(string,256,"** %s has set Base id %d description to %s ", PlayerName(playerid), baseid, params[6+strlen(tmp)]);
			SendClientMessageEx(playerid,COLOR_YELLOW,string);
		}
		else if(command_id==2) {
			new baseid;
		    if(Round[Current] == -1 && isnull(tmp))
		    {
				SendClientMessageEx(playerid, COLOR_GREY, "Usage: {FFFFFF}/b [edit] [baseid]");
				return 1;
		    }

		    baseid = strval(tmp);
		    if(Round[Current] != -1 && isnull(tmp))
		    {
		 	    baseid = Round[Current];
		    }

			EditBase(playerid,baseid);
		}
		else if(command_id==3) {
			CreateBase(playerid,Server[TotalBases]+1);
		}
		else if(command_id==4)
		{
			new baseid;
		    if(Round[Current] == -1 && isnull(tmp))
		    {
				SendClientMessageEx(playerid, COLOR_GREY, "Usage: {FFFFFF}/b [gotocp] [baseid]");
				return 1;
		    }
		    baseid = strval(tmp);

		    if(Round[Current] != -1 && isnull(tmp))
		    {
		 	    baseid = Round[Current];
		    }

			#if DATA_SYSTEM == 1
			    new fbase[256];
				fbase = Basefile(baseid);
				if(!dini_Exists(fbase))
				{
				    return SendClientMessageEx(playerid, COLOR_RED, "{FF0000}� Error: {FFFFFF}The selected base does not exist.");
				}
			#elseif DATA_SYSTEM == 2
				if(!SqlBaseExist(baseid))
				{
				    return SendClientMessageEx(playerid, COLOR_RED, "{FF0000}� Error: {FFFFFF}The selected base does not exist.");
				}
			#endif

  			SetPlayerInterior(playerid,BaseVariables[baseid][Interior]);
		 	SetPlayerPos(playerid, BaseVariables[baseid][BaseCheckpoint][0], BaseVariables[baseid][BaseCheckpoint][1],BaseVariables[baseid][BaseCheckpoint][2]+2);
		}
		else if(command_id==5)
		{
			new baseid;
		    if(Round[Current] == -1 && isnull(tmp))
		    {
				SendClientMessageEx(playerid, COLOR_GREY, "Usage: {FFFFFF}/b [gotoatt] [baseid]");
				return 1;
		    }
		    baseid = strval(tmp);

		    if(Round[Current] != -1 && isnull(tmp))
		    {
		 	    baseid = Round[Current];
		    }

			#if DATA_SYSTEM == 1
			    new fbase[256];
				fbase = Basefile(baseid);
				if(!dini_Exists(fbase))
				{
				    return SendClientMessageEx(playerid, COLOR_RED, "{FF0000}� Error: {FFFFFF}The selected base does not exist.");
				}
			#elseif DATA_SYSTEM == 2
				if(!SqlBaseExist(baseid))
				{
				    return SendClientMessageEx(playerid, COLOR_RED, "{FF0000}� Error: {FFFFFF}The selected base does not exist.");
				}
			#endif

  			SetPlayerInterior(playerid,BaseVariables[baseid][Interior]);
		 	SetPlayerPos(playerid, BaseVariables[baseid][AttSpawn][0], BaseVariables[baseid][AttSpawn][1],BaseVariables[baseid][AttSpawn][2]+2);
		 	SetCameraBehindPlayer(playerid);

		}
		else if(command_id==6) {
			new baseid;
		    if(Round[Current] == -1 && isnull(tmp))
		    {
				SendClientMessageEx(playerid, COLOR_GREY, "Usage: {FFFFFF}/b [gotodef] [baseid]");
				return 1;
		    }
    		baseid = strval(tmp);

		    if(Round[Current] != -1 && isnull(tmp))
		    {
		 	    baseid = Round[Current];
		    }

			#if DATA_SYSTEM == 1
			    new fbase[256];
				fbase = Basefile(baseid);
				if(!dini_Exists(fbase))
				{
				    return SendClientMessageEx(playerid, COLOR_RED, "{FF0000}� Error: {FFFFFF}The selected base does not exist.");
				}
			#elseif DATA_SYSTEM == 2
				if(!SqlBaseExist(baseid))
				{
				    return SendClientMessageEx(playerid, COLOR_RED, "{FF0000}� Error: {FFFFFF}The selected base does not exist.");
				}
			#endif

			SetPlayerInterior(playerid,BaseVariables[baseid][Interior]);
		 	SetPlayerPos(playerid, BaseVariables[baseid][DefSpawn][0], BaseVariables[baseid][DefSpawn][1],BaseVariables[baseid][DefSpawn][2]+2);
			SetCameraBehindPlayer(playerid);

		}
	}
	return 1;
}

/*
	TDM Command
	Usage: /a [edit/view/create/gotocp/gotoatt/gotodef]
	Description: Used for various tdm creating/editing/viewing purposes.
	Access: Administrators
*/

CMD:a(playerid, params[])
{
	new tmp[256], idx;
	new command_id;
	tmp = strtok(params, idx);
	new string[256];

	if(!IsPlayerRootAdmin(playerid)) SendClientMessageEx(playerid, COLOR_RED, "{FF0000}� Error: {FFFFFF}You need to be admin to do that!");
	else if(isnull(params)) SendClientMessageEx(playerid, COLOR_GREY, "Usage: {FFFFFF}/a [edit/view/create/gotocp/gotoatt/gotodef]");
	else
	{

		if(strcmp(tmp, "edit", true)==0)
		    command_id = 2;
		else if(strcmp(tmp, "create", true)==0)
		    command_id = 3;
		else if(strcmp(tmp, "gotocp", true)==0)
		    command_id = 4;
  		else if(strcmp(tmp, "gotoatt", true)==0)
		    command_id = 5;
   		else if(strcmp(tmp, "gotodef", true)==0)
 			command_id = 6;
   		else if(strcmp(tmp, "desc", true)==0)
 			command_id = 7;
		else
			return SendClientMessageEx(playerid, COLOR_GREY, "Usage: {FFFFFF}/a [edit/view/create/gotocp/gotoatt/gotodef]");
		tmp = strtok(params, idx);


		if(command_id==2 && isnull(tmp))
		{
			SendClientMessageEx(playerid, COLOR_GREY, "Usage: {FFFFFF}/a [edit] [tdm id]");
			return 1;
		}

		if(command_id==7) {
			new baseid;
			new tmp2[256];
			tmp2 = strtok(params, idx);
			if(isnull(tmp) || isnull(tmp2))
			{
				SendClientMessageEx(playerid, COLOR_GREY, "Usage: {FFFFFF}/a desc [tdm id] [description]");
				return 1;
			}

		    baseid = strval(tmp);

			#if DATA_SYSTEM == 1
			    new fbase[256];
				fbase = TDMfile(baseid);
				if(!dini_Exists(fbase))
				{
			  	  return SendClientMessageEx(playerid, COLOR_RED, "{FF0000}� Error: {FFFFFF}The selected TDM does not exist.");
				}
		   		dini_Set(fbase,"about",params[6+strlen(tmp)]);
			#elseif DATA_SYSTEM == 2
				if(!SqlTDMExist(baseid))
				{
			    	return SendClientMessageEx(playerid, COLOR_RED, "{FF0000}� Error: {FFFFFF}The selected TDM does not exist.");
				}
				UpdateSqlTDMStr(baseid, "name", params[6+strlen(tmp)]);
			#endif

			format(string,256,"** %s has set TDM id %d description to %s ", PlayerName(playerid), baseid, params[6+strlen(tmp)]);
			SendClientMessageEx(playerid,COLOR_YELLOW,string);
		}
		else if(command_id==2) {
			new baseid = strval(tmp);
			EditTDM(playerid,baseid);
		}
		else if(command_id==3) {
			CreateTDM(playerid,Server[TotalTDMs]+1);
		}
		else if(command_id==4)
		{
			new baseid;
		    if(Round[Current] == -1 && isnull(tmp))
		    {
				SendClientMessageEx(playerid, COLOR_GREY, "Usage: {FFFFFF}/a [gotocp] [tdm id]");
				return 1;
		    }
		    baseid = strval(tmp);

		    if(Round[Current] != -1 && isnull(tmp))
		    {
		 	    baseid = Round[Current];
		    }

			#if DATA_SYSTEM == 1
			    new fbase[256];
				fbase = TDMfile(baseid);
				if(!dini_Exists(fbase))
				{
			  	  return SendClientMessageEx(playerid, COLOR_RED, "{FF0000}� Error: {FFFFFF}The selected TDM does not exist.");
				}
			#elseif DATA_SYSTEM == 2
				if(!SqlTDMExist(baseid))
				{
			    	return SendClientMessageEx(playerid, COLOR_RED, "{FF0000}� Error: {FFFFFF}The selected TDM does not exist.");
				}
			#endif

			SetPlayerInterior(playerid,ArenaVariables[baseid][Interior]);
		 	SetPlayerPos(playerid, ArenaVariables[baseid][ArenaCheckpoint][0], ArenaVariables[baseid][ArenaCheckpoint][1],ArenaVariables[baseid][ArenaCheckpoint][2]+2);
		}
		else if(command_id==5)
		{
			new baseid;
		    if(Round[Current] == -1 && isnull(tmp))
		    {
				SendClientMessageEx(playerid, COLOR_GREY, "Usage: {FFFFFF}/a [gotoatt] [tdm id]");
				return 1;
		    }
		    baseid = strval(tmp);

		    if(Round[Current] != -1 && isnull(tmp))
		    {
		 	    baseid = Round[Current];
		    }

			#if DATA_SYSTEM == 1
			    new fbase[256];
				fbase = TDMfile(baseid);
				if(!dini_Exists(fbase))
				{
			  	  return SendClientMessageEx(playerid, COLOR_RED, "{FF0000}� Error: {FFFFFF}The selected TDM does not exist.");
				}
			#elseif DATA_SYSTEM == 2
				if(!SqlTDMExist(baseid))
				{
			    	return SendClientMessageEx(playerid, COLOR_RED, "{FF0000}� Error: {FFFFFF}The selected TDM does not exist.");
				}
			#endif

			SetPlayerInterior(playerid,ArenaVariables[baseid][Interior]);
		 	SetPlayerPos(playerid, ArenaVariables[baseid][AttSpawn][0], ArenaVariables[baseid][AttSpawn][1],ArenaVariables[baseid][AttSpawn][2]+2);

		 	SetCameraBehindPlayer(playerid);

		}
		else if(command_id==6) {
			new baseid;
		    if(Round[Current] == -1 && isnull(tmp))
		    {
				SendClientMessageEx(playerid, COLOR_GREY, "Usage: {FFFFFF}/a [gotodef] [tdm id]");
				return 1;
		    }
    		baseid = strval(tmp);

		    if(Round[Current] != -1 && isnull(tmp))
		    {
		 	    baseid = Round[Current];
		    }

			#if DATA_SYSTEM == 1
			    new fbase[256];
				fbase = TDMfile(baseid);
				if(!dini_Exists(fbase))
				{
			  	  return SendClientMessageEx(playerid, COLOR_RED, "{FF0000}� Error: {FFFFFF}The selected TDM does not exist.");
				}
			#elseif DATA_SYSTEM == 2
				if(!SqlTDMExist(baseid))
				{
			    	return SendClientMessageEx(playerid, COLOR_RED, "{FF0000}� Error: {FFFFFF}The selected TDM does not exist.");
				}
			#endif

			SetPlayerInterior(playerid,ArenaVariables[baseid][Interior]);
		 	SetPlayerPos(playerid, ArenaVariables[baseid][DefSpawn][0], ArenaVariables[baseid][DefSpawn][1],ArenaVariables[baseid][DefSpawn][2]+2);
			SetCameraBehindPlayer(playerid);

		}
	}
	return 1;
}

/*
	Register Command
	Usage: /register <password>
	Description: Allows players to register an account under thei nickname which saves their stats and allows them access to certain parts of the gamemode.
	Access: Regular User
*/

CMD:register(playerid, params[])
{
    if (Config[regmode] == 0) {
        SendClientMessageEx(playerid, COLOR_RED, "-NickServ- Registration/login system currently disabled!");
    	return 1;
    }

	#if DATA_SYSTEM == 1
		new pfile[200];
		format(pfile, sizeof(pfile), "combinations/players/%s.ini", nick_encode(PlayerName(playerid))); // path to players save file

		if (Player[playerid][loggedin]) {
			SendClientMessageEx(playerid, COLOR_RED, "-NickServ- You are already logged in!"); // already logged in, cant login again
		} else if (isnull(params) || strlen(params) < 4) {
			SendClientMessageEx(playerid, COLOR_RED, "-NickServ- Usage: /register password"); // did /register with no paramters
			SendClientMessageEx(playerid, COLOR_RED, "-NickServ- Password must be atleast 4 characters long!");
			ShowPlayerDialog(playerid, 4, DIALOG_STYLE_DC, "Account Login", "\nOops... It seems you forgot to enter a password!\nPasswords must be greater than 4 characters long.", "Enter", "Cancel");
		} else if (dini_Exists(pfile)) {
			SendClientMessageEx(playerid, COLOR_RED, "-NickServ- This name is already registered!"); // the name is already registered and cannot be registered again
		} else if (Player[playerid][ChangedNick] == true) {
			SendClientMessageEx(playerid, COLOR_RED, "-NickServ- You cant register any nicknames after using /nick"); // the name is already registered and cannot be registered again
			SendClientMessageEx(playerid, COLOR_RED, "-NickServ- Change your nickname back to the one you connected with to register!"); // the name is already registered and cannot be registered again
		}
		else
		{
			dini_Create(pfile);
			SendClientMessageEx(playerid, COLOR_GREEN, "-NickServ- You have successfully registered your nickname and logged in."); // registration successful and logged in!
			dini_IntSet(pfile, "password", pass_encode(params)); // set encoded pass
			dini_IntSet(pfile, "AdminLevel", 0); // not an admin

			new string[256];
			new year,month,day;
			getdate(year, month, day);
			format(string,256,"%d/%d/%d",month,day,year);
			dini_Set(pfile,"RegisterDate",string);

			new ip[24];
			GetPlayerIp(playerid, ip, 24);
			dini_Set(pfile,"lastloginip",ip);

			Player[playerid][loggedin] = true; // yes, logged in
		}
	#elseif DATA_SYSTEM == 2
		if(Player[playerid][loggedin])
			SendClientMessageEx(playerid, COLOR_RED, "-NickServ- You are already logged in!"); // already logged in, cant login again
		else if(isnull(params) || strlen(params) < 4)
			SendClientMessageEx(playerid, COLOR_RED, "-NickServ- Usage: /register password"); // did /register with no paramters
		else if(SqlUserExist(PlayerName(playerid)))
			SendClientMessageEx(playerid, COLOR_RED, "-NickServ- This name is already registered!"); // the name is already registered and cannot be registered again
		else
		{
			AddNewSqlUser(PlayerName(playerid), params);
	  		LoginGameSession(playerid);
			SendClientMessageEx(playerid, COLOR_GREEN, "-NickServ- You have successfully registered your nickname and logged in."); // registration successful and logged in!
			Player[playerid][loggedin] = true; // yes, logged in
			new ip[24];
			GetPlayerIp(playerid, ip, 24);
			UpdateSqlUserDataStr(playerid, "lastloginip", ip);
		}
	#endif
	return 1;
}

/*
	Login Command
	Usage: /login <password>
	Description: Allows player with an account to login and utilize that account.
	Access: Regular User
*/

CMD:login(playerid, params[])
{
    if (Config[regmode] == 0) {
        SendClientMessageEx(playerid, COLOR_RED, "-NickServ- Registration/login system currently disabled!");
    	return 1;
    }

	#if DATA_SYSTEM  == 1
		new pfile[200];
		format(pfile, sizeof(pfile), "combinations/players/%s.ini", nick_encode(PlayerName(playerid)));  // path to players save file

		if (Player[playerid][loggedin]) {
			SendClientMessageEx(playerid, COLOR_RED, "-NickServ- You are already logged in!"); // already logged in, cant login again
		} else if (strlen(params)==0) {
			ShowPlayerDialog(playerid, 3, DIALOG_STYLE_DC, "Account Login", "\nOops... It seems you forgot to enter a password!", "Enter", "Cancel");
			SendClientMessageEx(playerid, COLOR_GREY, "-NickServ- Usage: /login password"); // did /login and did not provide a password
		} else if (!dini_Exists(pfile)) {
			SendClientMessageEx(playerid, COLOR_RED, "-NickServ- This name is not registered!"); // name is not even registered ftw
		}
		else
		{
		    new thepass, apass;
		    thepass = dini_Int(pfile, "password"); // get pass from player file
		    apass = pass_encode(params); // encode provided password
			if(apass == thepass)
			{ // do the passwords match?
				new string[256];
	  			LoadAccount(playerid); // load account, sets their variables correctly and loads info
				format(string,256,"-NickServ- You have successfully logged into your account. [Status: %s | Kills: %d | Deaths: %d]", GetPlayerLevelName(playerid), Player[playerid][RoundKillsEx], Player[playerid][RoundDeathsEx]);
				SendClientMessageEx(playerid, COLOR_GREEN,  string); // successful login
				Player[playerid][loggedin] = true; // yes, logged in

			}
			else
			{
				SendClientMessageEx(playerid, COLOR_RED, "-NickServ- Wrong Password!"); // wrong password, login rejected
			}
		}
	#elseif DATA_SYSTEM == 2
		if(Player[playerid][loggedin])
			SendClientMessageEx(playerid, COLOR_RED, "-NickServ- You are already logged in!"); // already logged in, cant login again
		else if(strlen(params)==0)
			SendClientMessageEx(playerid, COLOR_GREY, "-NickServ- Usage: /login password"); // did /login and did not provide a password
		else if(!SqlUserExist(PlayerName(playerid)))
			SendClientMessageEx(playerid, COLOR_RED, "-NickServ- This name is not registered!"); // name is not even registered ftw
		else
		{
			if(SqlAuth(PlayerName(playerid), params))
			{
				new string[256];
	  			LoadAccount(playerid); // load account, sets their variables correctly and loads info
	  			LoginGameSession(playerid);
				format(string,256,"-NickServ- You have successfully logged into your account. [Account ID: %d | Status: %s | Kills: %d | Deaths: %d]", GetSqlUserID(PlayerName(playerid)), GetPlayerLevelName(playerid), Player[playerid][RoundKillsEx], Player[playerid][RoundDeathsEx]);
				SendClientMessageEx(playerid, COLOR_GREEN,  string); // successful login
				Player[playerid][loggedin] = true; // yes, logged in
			}
			else
			{
				SendClientMessageEx(playerid, COLOR_RED, "-NickServ- Wrong Password!"); // wrong password, login rejected
			}
		}
	#endif
	return 1;
}

/*
	Changepass Command
	Usage: /changepass <oldpassword> <newpassword]
	Description: Allows player to change their acc's pw.
	Access: Regular User
*/

CMD:changepass(playerid, params[])
{
	#if DATA_SYSTEM  == 1
		new pfile[200];
		format(pfile, sizeof(pfile), "combinations/players/%s.ini", nick_encode(PlayerName(playerid)));

		new tmp[256], tmp2[256], idx;
		tmp = strtok(params, idx);
		tmp2 = strtok(params, idx);

		if(!Player[playerid][loggedin])
			SendClientMessageEx(playerid, COLOR_RED, "-NickServ- Please log into your account first.");
		else if(isnull(tmp) || isnull(tmp2) || strlen(tmp2) < 4)
			SendClientMessageEx(playerid, COLOR_GREY, "-NickServ- Usage: /changepass [old password] [new password]");
		else
		{
		    new thepass, apass;
		    thepass = dini_Int(pfile, "password"); // get pass from player file
		    apass = pass_encode(tmp); // encode provided password
			if(apass == thepass)
			{ // do the passwords match?
				new string[256];
				format(string,256,"-NickServ- You have successfully changed your account password to %s. Remember it!", tmp2);
				SendClientMessageEx(playerid, COLOR_GREEN,  string);
				dini_IntSet(pfile, "password", pass_encode(tmp2)); // set encoded pass
			}
			else
			{
				SendClientMessageEx(playerid, COLOR_RED, "-NickServ- Wrong Password!"); // wrong password, login rejected
			}
		}
	#elseif DATA_SYSTEM == 2
		new tmp[256], tmp2[256], idx;
		tmp = strtok(params, idx); //oldpass
		tmp2 = strtok(params, idx); //newpass

		if(!Player[playerid][loggedin])
			SendClientMessageEx(playerid, COLOR_RED, "-NickServ- Please log into your account first.");
		else if(isnull(tmp) || isnull(tmp2) || strlen(tmp2) < 4)
			SendClientMessageEx(playerid, COLOR_GREY, "-NickServ- Usage: /changepass [old password] [new password]");
		else
		{
			if(SqlAuth(PlayerName(playerid), tmp))
			{ // do the passwords match?
				new string[256];
				format(string,256,"-NickServ- You have successfully changed your account password to %s. Remember it!", tmp2);
				SendClientMessageEx(playerid, COLOR_GREEN,  string);
				UpdateSqlUserPass(playerid, tmp2);
			}
			else
			{
				SendClientMessageEx(playerid, COLOR_RED, "-NickServ- Wrong Password!"); // wrong password, login rejected
			}
		}
	#endif
	return 1;
}

/*
	Group Command
	Usage: /group <oldnick> <oldpassword>
	Description: Allows player to group 2 accounts
	Access: Regular User
*/

CMD:group(playerid, params[])
{
	new tmp[256], tmp2[256], idx;
	tmp = strtok(params, idx); //oldnick
	tmp2 = strtok(params, idx); //oldpassword

	#if DATA_SYSTEM  == 1

		if(!Player[playerid][loggedin])
			SendClientMessageEx(playerid, COLOR_RED, "-NickServ- Please log into your account first.");
		else if(isnull(tmp) || isnull(tmp2))
			SendClientMessageEx(playerid, COLOR_GREY, "-NickServ- Usage: /group [old nick] [old password]");
		else
		{
			new file[200];
			format(file, sizeof(file), "combinations/players/%s.ini", nick_encode(tmp));  // path to players save file

			if(!dini_Exists(file))
				return SendClientMessageEx(playerid, COLOR_RED, "-NickServ- Error: That account doesn't exists");

			new thepass, apass;
		    thepass = dini_Int(file, "password"); // get pass from player file
		    apass = pass_encode(tmp2); // encode provided password
			if(apass == thepass)
			{
			 	Player[playerid][RoundsPlayedEx] += dini_Int(file,"RoundsPlayedEx");
			 	Player[playerid][Kills] += dini_Int(file,"Kills");
			  	Player[playerid][Deaths] += dini_Int(file,"Deaths");
			   	Player[playerid][KillSpree] += dini_Int(file,"KillSpree");
			    Player[playerid][DeathSpree] += dini_Int(file,"DeathSpree");
			    Player[playerid][CaptureTimes] += dini_Int(file,"CaptureTimes");
			    Player[playerid][OnlineTime] += dini_Int(file,"OnlineTime");
			 	Player[playerid][RoundsPlayedEx] += dini_Int(file,"RoundsPlayedEx");
			  	Player[playerid][RoundDeathsEx] += dini_Int(file,"RoundDeathsEx");
			   	Player[playerid][RoundKillsEx] += dini_Int(file,"RoundKillsEx");

			   	for(new i = 0; i < MAX_COUNT_WEAPONS; i++)
				{
					Player[playerid][pWeaponsKills][i] += dini_Int(file,weaponsInfo[i][strKills]);
					Player[playerid][pWeaponsDeaths][i] += dini_Int(file,weaponsInfo[i][strDeaths]);
				}

		  		Player[playerid][pLevel] = max(Player[playerid][pLevel], dini_Int(file,"AdminLevel"));

				new string[256];
				format(string,256,"-NickServ- You have successfully grouped your accounts!");
				SendClientMessageEx(playerid, COLOR_GREEN,  string); // successful login

				dini_Remove(file);
			}
			else
			{
				SendClientMessageEx(playerid, COLOR_RED, "-NickServ- Wrong Password!"); // wrong password, login rejected
			}
		}
	#elseif DATA_SYSTEM == 2
		if(!Player[playerid][loggedin])
			SendClientMessageEx(playerid, COLOR_RED, "-NickServ- Please log into your account first.");
		else if(isnull(tmp) || isnull(tmp2))
			SendClientMessageEx(playerid, COLOR_GREY, "-NickServ- Usage: /group [old nick] [old password]");
		else if(!SqlUserExist(PlayerName(playerid)))
			SendClientMessageEx(playerid, COLOR_RED, "-NickServ- Error: That account doesn't exists");
		else
		{
			if(SqlAuth(tmp, tmp2))
			{
			 	Player[playerid][RoundsPlayedEx] += GetSqlUserDataInt(tmp, "RoundsPlayedEx");
			 	Player[playerid][Kills] += GetSqlUserDataInt(tmp, "Kills");
			  	Player[playerid][Deaths] += GetSqlUserDataInt(tmp, "Deaths");
			  	SetKillsGameSession(playerid, Player[playerid][Kills]);
				SetDeathsGameSession(playerid, Player[playerid][Deaths]);
			   	Player[playerid][KillSpree] += GetSqlUserDataInt(tmp, "KillSpree");
			    Player[playerid][DeathSpree] += GetSqlUserDataInt(tmp, "DeathSpree");
			    Player[playerid][CaptureTimes] += GetSqlUserDataInt(tmp, "CaptureTimes");
			    Player[playerid][OnlineTime] += GetSqlUserDataInt(tmp, "OnlineTime");
			  	Player[playerid][RoundDeathsEx] += GetSqlUserDataInt(tmp, "RoundDeathsEx");
       			Player[playerid][RoundKillsEx] += GetSqlUserDataInt(tmp, "RoundKillsEx");

			   	for(new i = 0; i < MAX_COUNT_WEAPONS; i++)
				{
					Player[playerid][pWeaponsKills][i] += GetSqlUserWepStat(tmp, weaponsInfo[i][strKills]);
					Player[playerid][pWeaponsDeaths][i] += GetSqlUserWepStat(tmp, weaponsInfo[i][strKills]);
				}

			   	if(Player[playerid][pLevel] < GetSqlUserDataInt(tmp, "Adminlevel"))
			  		Player[playerid][pLevel] = GetSqlUserDataInt(tmp, "AdminLevel");

				new string[256];
				format(string,256,"-NickServ- You have successfully grouped your accounts!");
				SendClientMessageEx(playerid, COLOR_GREEN,  string); // successful login

				DeleteSqlAccount(tmp);
			}
			else
			{
				SendClientMessageEx(playerid, COLOR_RED, "-NickServ- Wrong Password!"); // wrong password, login rejected
			}
		}
	#endif
	return 1;
}

/*
	Playing Command
	Usage: /playing
	Description: Shows all players current playing status and some round statistics.
	Access: All Players
*/

CMD:playing(playerid, params[])
{
	//ClearDeathMessages();
	new playingList1[300], playingList2[300], playingList3[300];
	new playingList4[900];
	for (new i = 0; i <= Server[HighestID]; i++)
	{
		if(IsPlayerConnected(i) && Player[i][pPlaying])
		{
		    if (Player[i][pTeam] == T_HOME) {
		    	format(playingList1, 200, "%s %s (%s - Ping: %d - Tickrate: %d)\r\n", playingList1, PlayerName(i), HomeName, GetPlayerPing(i), Player[i][Tickrate]);
			} else if (Player[i][pTeam] == T_AWAY) {
		    	format(playingList2, 200, "%s %s (%s - Ping: %d - Tickrate: %d)\r\n", playingList2, PlayerName(i), AwayName, GetPlayerPing(i), Player[i][Tickrate]);
			} else if (Player[i][pTeam] == T_REF) {
		    	format(playingList3, 200, "%s %s (%s - Ping: %d - Tickrate: %d)\r\n", playingList3, PlayerName(i), RefName, GetPlayerPing(i), Player[i][Tickrate]);
			}
		}
	}
	format(playingList4, 900, "%s %s %s", playingList1, playingList2, playingList3);
	ShowPlayerDialog(playerid, 5, DIALOG_STYLE_LIST, "D.C. Playing Data", playingList4, "Ok", "X");
	#pragma unused params
	return true;
}
/*
	Money Command
	Usage: /money [on|off]
	Description: Allows the player to have actual money instead of using it for health..
	Access: All Players
*/

CMD:money(playerid, params[])
{
	if (isnull(params)) {
  		SendClientMessageEx(playerid, COLOR_GREY, "Usage: {FFFFFF}/money [on/off]");
		return true;
	} else if (Player[playerid][pPlaying] == true) {
  		SendClientMessageEx(playerid, COLOR_GREY, "youre playing in a round mother fucker");
		return true;
	}

	if (strcmp(params, "on", true)==0) {
		SendClientMessageEx(playerid, COLOR_WHITE, "* Enabled Money!");
		Player[playerid][pMoney] = true;
		GivePlayerMoney(playerid, 1537);
    	TextDrawHideForPlayer(playerid, health_plus);
    	EnableStuntBonusForPlayer(playerid, 1);
	} else if (strcmp(params, "off", true)==0) {
		SendClientMessageEx(playerid, COLOR_WHITE, "* Disabled Money!");
		Player[playerid][pMoney] = false;
    	TextDrawShowForPlayer(playerid, health_plus);
    	EnableStuntBonusForPlayer(playerid, 0);
	}

	return true;
}

/*
	Me Command
	Usage: /me <message>
	Description: Sends a personal message in purple to all players.
	Access: All Players
*/

CMD:me(playerid, params[])
{
	if (isnull(params)) {
		ShowPlayerDialog(playerid, 1, DIALOG_STYLE_INPUT, "Personal Message", "\nOops... It seems you forgot to enter a message!\n", "Ok", "Cancel");
		return true;
	}

	if(Server[NoChat] == true)
	    return 0;

    new string[600];
	format(string, 200, "* %s %s", PlayerName(playerid), params);
	SendClientMessageToAllEx(COLOR_LIGHTPURPLE, string);

	format(string, 200, "* says: %s", params);

	SetPlayerChatBubble(playerid, string, COLOR_LIGHTPURPLE, 100, 10000);

	#if IRC == 1
	format(string, 200, "2[%d] 13* %s %s", playerid, PlayerName(playerid), params);
	CallRemoteFunction("DC_IRCForceSay", "s", string);
	#endif
	return true;
}

/*
	Matches Command
	Usage: /matches
	Description: Used for viewing/managing server matches
	Access: All Players
*/

CMD:matches(playerid, params[])
{
	#pragma unused params

	new file[256], match_title[256];
	for(new i = 1; i < MAX_ROUND_LIMIT; i++)
	{
		format(file,256,"combinations/matches/%d.ini", i);
		if (dini_Exists(file)) {
		    if (i == 1) {
				format(match_title, 256, "[%d/%d/%d] %s vs %s (%d - %d)", dini_Int(file,"match_day"), dini_Int(file,"match_month"), dini_Int(file,"match_year"), dini_Get(file,"home_name"), dini_Get(file,"away_name"), dini_Int(file,"home_roundswon"), dini_Int(file,"away_roundswon"));
			} else {
				format(match_title, 256, "%s\r\n[%d/%d/%d] %s vs %s (%d - %d)", match_title, dini_Int(file,"match_day"), dini_Int(file,"match_month"), dini_Int(file,"match_year"), dini_Get(file,"home_name"), dini_Get(file,"away_name"), dini_Int(file,"home_roundswon"), dini_Int(file,"away_roundswon"));
			}
		} else {
		    i = 999999;
		}
	}

    ShowPlayerDialog(playerid, 6, DIALOG_STYLE_LIST, "D.C. Matches", match_title, "Select","Close");
	return true;
}

/*
	Nickname Command
	Usage: /nick [name]
	Description: Allows a player to change his/her name.
	Access: All Players
*/

CMD:nick(playerid, params[])
{
	new oldname[30];
	format(oldname, 30, "%s", PlayerName2(playerid));
	new tmp[256], tmp2[256], idx;
	tmp = strtok(params, idx);
	tmp2 = strtok(params, idx);
	new string[128];

	if(Server[NickChanging] == false) return SendClientMessageEx(playerid, COLOR_RED, "{FF0000}� Error: {FFFFFF}This command is disabled");
	if (isnull(tmp) || strlen(tmp) < 4 || strlen(tmp) > 20) {
		ShowPlayerDialog(playerid, 2, DIALOG_STYLE_INPUT, "Change Nickname", "\nOops... It seems you forgot to enter a nickname or there was a problem with the character length!\nNicknames must be between 4 and 20 characters long!", "Enter", "Cancel");
    	return 1;
	}

	#if RESTRICT_NICK == 1
 	else if(!IsValidNick(tmp)) return SendClientMessageEx(playerid, COLOR_RED, "{FF0000}� Error: {FFFFFF}Invalid Nickname");
 	#endif
 	else if(AnyoneWithThisNick(tmp)) return SendClientMessageEx(playerid, COLOR_RED, "{FF0000}� Error: {FFFFFF}This nick is already in use");

	#if DATA_SYSTEM == 1
		new pfile[200];
		format(pfile, sizeof(pfile), "combinations/players/%s.ini", nick_encode(tmp));

		if(dini_Exists(pfile))
		{
		    if(isnull(tmp2)) return SendClientMessageEx(playerid, COLOR_RED, "{FF0000}� Error: {FFFFFF}The nick you chose is registered. Please use /nick [nickname] [password]");
			else
			{
			    new thepass, apass;

			    thepass = dini_Int(pfile, "password");
			    apass = pass_encode(tmp2);
				if(apass == thepass)
				{
		    		format(string,128,"** %s has changed his nick to %s", oldname, tmp);
		    		Player[playerid][ChangedNick] = true;

		    		if (isStringSame(tmp, PlayerRootNames[playerid], 24)) {
		    		    Player[playerid][ChangedNick] = false;
					}

					ResetAccount(playerid);
					SetPlayerName(playerid,tmp);
		    		format(PlayerSavedNames[playerid],24,tmp);
					SendClientMessageToAllEx(COLOR_MARINE, string);
					Player[playerid][registered] = true;
	   				Player[playerid][loggedin] = true;

	  	  			LoadAccount(playerid);
	  	  			ResetPlayerWeapons(playerid);
					if(Config[LobbyWeapons] == 1 && Player[playerid][pSpawned])
					{
						// -- Players's /getgun weapons
						for(new slots = 0; slots < 13; slots++)
						{
							if(PlayerGuns[playerid][slots] > 0)
							{
								GivePlayerWeaponEx(playerid, PlayerGuns[playerid][slots], PlayerAmmos[playerid][slots]);
							}
						}
					}

					return 1;
				}
				else
				{
					return SendClientMessageEx(playerid, COLOR_RED, "-NickServ- Wrong Password!"); // wrong password, login rejected
				}
			}
		}
		else
		{
			format(string,128,"** %s has changed his nick to %s", PlayerName2(playerid), tmp);
			Player[playerid][registered] = false;
			Player[playerid][loggedin] = false;
            Player[playerid][ChangedNick] = true;
            if (isStringSame(tmp, PlayerRootNames[playerid], 24)) {
		        Player[playerid][ChangedNick] = false;
			}
			ResetAccount(playerid);

			SetPlayerName(playerid,tmp);
			format(PlayerSavedNames[playerid],256,tmp);
			SendClientMessageToAllEx(COLOR_MARINE, string);
			LoadAccount(playerid);
		}
	#elseif DATA_SYSTEM == 2
		if(SqlUserExist(tmp))
		{
		    if(isnull(tmp2)) return SendClientMessageEx(playerid, COLOR_RED, "{FF0000}� Error: {FFFFFF}The nick you chose is registered. Please use /nick [nickname] [password]");
			else
			{
				if(SqlAuth(tmp, tmp2))
				{
		    		format(string,256,"** %s has changed his nick to %s", PlayerName2(playerid), tmp);
		    		Player[playerid][ChangedNick] = true;
					ResetAccount(playerid);
					SetPlayerName(playerid,tmp);
					format(PlayerSavedNames[playerid],24,tmp);
					SendClientMessageToAllEx(COLOR_MARINE, string);
					Player[playerid][registered] = true;
	   				Player[playerid][loggedin] = true;

	  	  			LoadAccount(playerid);

					if(Config[LobbyWeapons] == 1 && Player[playerid][pSpawned])
					{
						// -- Players's /getgun weapons
						for(new slots = 0; slots < 13; slots++)
						{
							if(PlayerGuns[playerid][slots] > 0)
							{
								GivePlayerWeaponEx(playerid, PlayerGuns[playerid][slots], PlayerAmmos[playerid][slots]);
							}
						}
					}

					return 1;
				}
				else
				{
					return SendClientMessageEx(playerid, COLOR_RED, "-NickServ- Wrong Password!"); // wrong password, login rejected
				}
			}
		}
		else
		{
			format(string,128,"** %s has changed his nick to %s", PlayerName2(playerid), tmp);
			Player[playerid][registered] = false;
			Player[playerid][loggedin] = false;
            Player[playerid][ChangedNick] = true;
			ResetAccount(playerid);
			SetPlayerName(playerid,tmp);
			format(PlayerSavedNames[playerid],256,tmp);
			SendClientMessageToAllEx(COLOR_MARINE, string);
			LoadAccount(playerid);
		}
	#endif

	return true;
}

/*
	AFK Command
	Usage: /afk
	Description: Used for players to go afk, players cannot go afk while playin a round and this will make sure they dont get included in rounds.
	Access: All Players
*/

CMD:afk(playerid, params[])
{
	if(Player[playerid][pPlaying])
	{
		SendClientMessageEx(playerid, COLOR_RED, "Error: You cannot go AFK while in a round!");
	}
	else
	{
		if(Player[playerid][AFK] == false)
		{
		    new reason[128];
		    if(isnull(params))
		        reason = "I am currently AFK.";
			else
			    format(reason,128, "%s", params);

			Player[playerid][AFK] = true;
			new string[128];
			format(string, 128, "* %s is now set as AFK. (%s)", PlayerName(playerid), reason);
			SendClientMessageToAllEx(COLOR_ORANGE, string);

			SendClientMessageEx(playerid, COLOR_YELLOW, "* When you are back type /afk again.");
			
			//Player[playerid][AFKLabel] = Create3DTextLabel(reason, COLOR_ORANGE, X, Y, Z+0.7, 30, GetPlayerVirtualWorld(playerid));
			Update3DTextLabelText(Player[playerid][AFKLabel], COLOR_ORANGE, reason);
			Attach3DTextLabelToPlayer(Player[playerid][AFKLabel], playerid, 0.0, 0.0, 0.7);

			#if IRC == 1
			format(string, 200, "2[%d] 7* %s is now set as AFK. (%s)", playerid, PlayerName(playerid) ,reason);
			CallRemoteFunction("DC_IRCForceSay", "s", string);
			#endif

			new new_name[200];
			format(new_name, sizeof(new_name), "AFK_%s", PlayerName(playerid));
			Player[playerid][setToPlay] = false;
			TogglePlayerControllable(playerid, 0);
			Player[playerid][Status] = STATUS_AFK;
		}
		else
		{
			Player[playerid][AFK] = false;
			new string[128];
			format(string, 200, "* %s is now back from being AFK.", PlayerName(playerid));
			SendClientMessageToAllEx(COLOR_ORANGE, string);

			//Delete3DTextLabel(Player[playerid][AFKLabel]);
			Update3DTextLabelText(Player[playerid][AFKLabel], COLOR_ORANGE, " ");

			#if IRC == 1
			format(string, 200, "2[%d] 7* %s is now back from being AFK.", playerid, PlayerName(playerid));
			CallRemoteFunction("DC_IRCForceSay", "s", string);
			#endif

			Player[playerid][setToPlay] = true;
			TogglePlayerControllable(playerid, 1);
			Player[playerid][Status] = STATUS_PLAYING;
		}
	}
	return true;
	#pragma unused params
}

/*
	Skin Command
	Usage: /s <skin> || /skin <skin>
	Description: Allows player to change their skin while a team skin is not set.
	Access: All Players
*/

CMD:skin(playerid, params[])
{
	if(Server[EnableSkinChanging][Player[playerid][pTeam]] == false)
	    return SendClientMessageEx(playerid, COLOR_RED, "{FF0000}� Error: {FFFFFF}You cannot change skins now.");


	if(Config[skincmd] == 0)
	    return SendClientMessageEx(playerid, COLOR_RED, "{FF0000}� Error: {FFFFFF}Skin changing has been disabled.");

	//if(Round[Current] != -1)
	if(Player[playerid][pPlaying])
	    return SendClientMessageEx(playerid, COLOR_RED, "{FF0000}� Error: {FFFFFF}You cannot change skins during a round.");

	new idx, iString[256];
	iString = strtok(params, idx);

	if(isnull(iString)) {
	    SendClientMessageEx(playerid, COLOR_GREY, "Usage: {FFFFFF}/skin [skin id]");
	    return true;
	}

	idx = strval(iString);

	if(IsInvalidSkin(idx) || idx < MIN_SKIN_ID || idx > MAX_SKIN_ID) {
	    SendClientMessageEx(playerid, COLOR_RED, "{FF0000}� Error: {FFFFFF}Invalid Skin!");
	    return true;
	}

	SetPlayerSkin(playerid, idx);
	Player[playerid][pSkin] = idx;
	format(iString, 128, "Success: Changed skin to ID %d.", idx);

	SendClientMessageEx(playerid, COLOR_WHITE, iString);
	return true;
}

/*
	Sync Command
	Usage: /sync
	Description: Syncs a player.
	Access: All Players
*/

CMD:s(playerid, params[])
{
	SyncPlayer(playerid);
	return 1;
	#pragma unused params
}

CMD:sync(playerid, params[])
{
	SyncPlayer(playerid);
	return 1;
	#pragma unused params
}

/*
	Car Color Command
	Usage: /vcolor <color 1> <color 2>
	Description: Change player car color.
	Access: All Players
*/

CMD:vcolor(playerid,params[])
{

    new tmp[256],tmp2[256],Index; tmp = strtok(params,Index), tmp2 = strtok(params,Index);

    if(isnull(tmp)|| strval(tmp) < -1 || strval(tmp) > 126)// || !IsNumeric(tmp) || !IsNumeric(tmp2))
	return SendClientMessageEx(playerid,COLOR_GREY,"Usage: {FFFFFF}/vcolor [color 1] [color 2]  | -1 to reset");


	if(isnull(tmp2)) tmp2 = tmp;

	if(strval(tmp) == -1)
	{
		Player[playerid][pCarColor1] = -1;
		Player[playerid][pCarColor2] = -1;
 		SendClientMessageEx(playerid,COLOR_YELLOW,"* You have reset your default car color.");
	}
	else
	{
		if(!IsPlayerInAnyVehicle(playerid))
		return SendClientMessageEx(playerid,COLOR_GREY,"Error: You arent in a vehicle.");

		Player[playerid][pCarColor1] = strval(tmp);
		Player[playerid][pCarColor2] = strval(tmp2);

		new string[256];
		format(string,256,"** Colors changed - [Color 1: %d - Color 2: %d]",strval(tmp),strval(tmp2));
		SendClientMessageEx(playerid,COLOR_YELLOW,string);
	}
	return ChangeVehicleColor(GetPlayerVehicleID(playerid),strval(tmp),strval(tmp2));
}

/*
	Duel Command
	Usage: /duel [id]
	Description: Used to enter a duel.
	Access: All Players
*/

CMD:duel(playerid, params[])
{
	new idx;
	new tmp[256];
	new string[256];
	tmp = strtok(params, idx);

	Server[ValidDuels] = 0;
	for(new i = 1; i < sizeof(DuelName); i ++)
	{
	    if (DuelWorking[i]) {
			Server[ValidDuels] ++;
		}
	}

	new command_id = 1;
	if(!IsPlayerRootAdmin(playerid) || IsNumeric(tmp) || isnull(tmp))
	    command_id = 1;
	else if(strcmp(tmp, "setup", true)==0)
	    command_id = 2;
	else if(strcmp(tmp, "name", true)==0)
	    command_id = 3;
	else if(strcmp(tmp, "guns", true)==0)
	    command_id = 4;
	else if(strcmp(tmp, "invite", true)==0)
	    command_id = 5;

	new duel = strval(tmp);
	if(command_id == 1)
	{
		//if(Round[Current] != -1 || Server[EPRoundStarted] == true) SendClientMessageEx(playerid, COLOR_RED, "{FF0000}� Error: {FFFFFF}You cannot use this command while a round is being played.");
		if(Player[playerid][pPlaying] == true) SendClientMessageEx(playerid, COLOR_RED, "{FF0000}� Error: {FFFFFF}You cannot use this command while a round is being played.");
		else if(duel < 1 || duel > Server[ValidDuels] || isnull(tmp) || DuelWorking[duel] == false)
		{

	 		format(string,256,"Usage: {FFFFFF}/duel [1-%d|invite]",Server[ValidDuels]);

			new msg1[128], msg2[128];
			for(new i = 1; i < floatround(sizeof(DuelName)/3)+1; i ++)
			{
				if(strlen(DuelName[i]) > 1 && DuelWorking[i] == true)
				    format(msg1,128,"%s || %d: %s", msg1, i, DuelName[i]);
			}

			for(new i = floatround(sizeof(DuelName)/3) +1; i < floatround((sizeof(DuelName)*2)/3); i ++)
			{
				if(strlen(DuelName[i]) > 1 && DuelWorking[i] == true)
 				    format(msg2,128,"%s || %d: %s", msg2, i, DuelName[i]);
			}

			for(new i = floatround((sizeof(DuelName)*2)/3); i < sizeof(DuelName); i ++)
			{
				if(strlen(DuelName[i]) > 1 && DuelWorking[i] == true)
 				    format(msg2,128,"%s || %d: %s", msg2, i, DuelName[i]);
			}

			SendClientMessageEx(playerid, COLOR_GREY, string);

			if(strlen(msg1))
				SendClientMessageEx(playerid, COLOR_WHITE, msg1);
			if(strlen(msg2))
				SendClientMessageEx(playerid, COLOR_WHITE, msg2);

		}
		else
		{
		    OnPlayerEnterDuel(playerid,duel);
		}
	}
	else if(command_id == 2)
	{
    	tmp = strtok(params, idx);
		format(string,256,"Usage: {FFFFFF}/duel setup [1-%d]", MAX_DUELS);
		if(isnull(tmp) || 1 > strval(tmp) > MAX_DUELS)
		    return SendClientMessageEx(playerid, COLOR_GREY, string);



		DuelSetupID = strval(tmp);
		#if DATA_SYSTEM == 2
		if(!SqlDuelExist(DuelSetupID))
		{
			DuelWorking[DuelSetupID] = true;
		    CreateSqlDuel(DuelSetupID);
		}
		#endif
		SendClientMessageEx(playerid, COLOR_BUILDMODE, "[Duel Buildmode]: You may now use /saveduel command to setup the choosen duel.");
	}
	else if(command_id == 3)
	{
		new tmp2[256];
		tmp = strtok(params, idx);
		tmp2 = strtok(params, idx);

		format(string,256,"Usage: {FFFFFF}/duel name [1-%d]", MAX_DUELS);
		if(isnull(tmp) || 1 > strval(tmp) > 15 || isnull(tmp2))
		    return SendClientMessageEx(playerid, COLOR_GREY, string);


		format(DuelName[strval(tmp)],256,"%s",params[6+strlen(tmp)]);

		format(string,256,"[Duel Buildmode]: Duel %d name set to %s.", strval(tmp), params[6+strlen(tmp)]);
		SendClientMessageEx(playerid, COLOR_YELLOW,string);

		#if DATA_SYSTEM == 1
			format(string,256,"%s",params[6+strlen(tmp)]);
			dini_Set(Duelfile(strval(tmp)), "name", string);
		#elseif DATA_SYSTEM == 2
			UpdateSqlDuelStr(strval(tmp), "name", params[6+strlen(tmp)]);
		#endif
	}
	else if(command_id == 4)
	{
		new tmp2[256];
		tmp = strtok(params, idx);
		tmp2 = strtok(params, idx);
		format(string,256,"Usage: {FFFFFF}/duel guns [1-%d] [guns id]", MAX_DUELS);
		if(isnull(tmp) || 1 > strval(tmp) > 15 || isnull(tmp2))
		    return SendClientMessageEx(playerid, COLOR_GREY, string);


		new weapz[256], weaponsname[256], tmp3[256];
		weapz = " ";
		new WeaponsIDs[256];
        new index;

        format(WeaponsIDs,256,"%s",params[5+strlen(tmp2)]);

		for(new i = 0; i < 5; i ++)
		{
	        tmp3 = strtok(WeaponsIDs, index);
			if(!IsNumeric(tmp3) || 1 > strval(tmp3) > 45)
			    return SendClientMessageEx(playerid, COLOR_RED, "{FF0000}� Error: {FFFFFF}Invalid Weapon ID.");
		    else
		    {
				format(weapz,256,"%s%f,", weapz, float(strval(tmp3)));
			    DuelWeapons[strval(tmp)][i] = strval(tmp3);

				if(strval(tmp3) > 0)
				{
				    new wep[24];
					GetWeaponName(strval(tmp3), wep, 24);
			    	format(weaponsname,256,"%s %s",weaponsname, wep);
				}
			 }
		}

		format(string,256,"[Duel Buildmode]: Duel %d weapons set to %s.", strval(tmp), weaponsname);
		SendClientMessageEx(playerid, COLOR_YELLOW, string);

		#if DATA_SYSTEM == 1
			dini_Set(Duelfile(strval(tmp)),"guns", weapz);
		#elseif DATA_SYSTEM == 2
			UpdateSqlDuelStr(strval(tmp), "weapons", weapz);
		#endif
	}
	else if(command_id == 5)
	{
		new tmp2[256];
		tmp = strtok(params, idx);
		tmp2 = strtok(params, idx);
		//format(string,256, "test", MAX_DUELS);
		if(isnull(tmp) || isnull(tmp2))
		    return SendClientMessageEx(playerid, COLOR_GREY, "Usage: {FFFFFF}/duel invite [playerid] [gun id]");
		if(IsPlayerConnected(strval(tmp)))
		    return SendClientMessageEx(playerid, COLOR_RED, "{FF0000}� Error: {FFFFFF}That player is not connected!");
	}
	return 1;
}

/*
	Jetpack Command
	Usage: /jetpack
	Description: Spawns a jetpack
	Access: All players (when not in a round)
*/

CMD:jetpack(playerid, params[])
{
 	if(Player[playerid][pPlaying] && !IsPlayerAdmin3(playerid))
	 	SendClientMessageEx(playerid, COLOR_RED, "Error: You cannot use this command now.");
	else
	{
    	SetPlayerSpecialAction(playerid, 2);
		SendClientMessageEx(playerid, COLOR_YELLOW, "** Spawned a Jetpack.");
	}
	return 1;
	#pragma unused params
}

/*
	Goto Command
	Usage: /goto  [player id/name]
	Description: Teleports to the selected players
	Access: All players (when not in a round)
*/

CMD:goto(playerid,params[])
{
	new tmp[256], idx;
	tmp = strtok(params, idx);

    if(isnull(params)) return SendClientMessageEx(playerid,COLOR_GREY,"Usage: {FFFFFF}/goto [player id/name]");

    new id;

	if(!IsNumeric(params))
		id = ReturnPlayerID(params);
	else
		id = strval(params);

	if(Player[playerid][pPlaying] == true || Player[id][pPlaying] == true && !IsPlayerAdmin3(playerid))
		return SendClientMessageEx(playerid, COLOR_RED, "{FF0000}� Error: {FFFFFF}You cannot use this command now.");
	else if(Player[id][pDuel] > 0 || Player[playerid][pDuel] > 0)
		return SendClientMessageEx(playerid, COLOR_RED, "{FF0000}� Error: {FFFFFF}You cannot use this command now.");

	if(!IsPlayerConnected(id) || id == INVALID_PLAYER_ID || id == playerid)
		return SendClientMessageEx(playerid,COLOR_GREY,"Error: Player not found.");
	else if(Player[id][Specing] == true || Player[id][pSpawned] == false)
		return SendClientMessageEx(playerid,COLOR_GREY,"Error: You cannot teleport to that player now.");

	new string[256],Float:X,Float:Y,Float:Z;
	new int = GetPlayerInterior(id);
	SetPlayerInterior(playerid,int);
	SetPlayerVirtualWorld2(playerid,GetPlayerVirtualWorld(id));
	GetPlayerPos(id,X,Y,Z);

	if(IsPlayerInAnyVehicle(playerid) && GetPlayerVehicleSeat(playerid) == 0) {
		SetVehiclePos(GetPlayerVehicleID(playerid),X+1,Y,Z);
		LinkVehicleToInterior(GetPlayerVehicleID(playerid),int);
	} else {
		SetPlayerPos(playerid,X+1,Y,Z+2);
		if(IsPlayerInAnyVehicle(id)) {
			new temp_vid = Player[id][VehicleID];
		    if (VehicleInfo[temp_vid][pDriver] == id) {
		    	//SendClientMessageEx(playerid,COLOR_GREY,"f");
				if (VehicleInfo[temp_vid][pPass1] == -1 && GetVehicleMaxSeats(temp_vid) >= 2) {
					PutPlayerInVehicle(playerid, temp_vid, 1);
				} else if (VehicleInfo[temp_vid][pPass2] == -1 && GetVehicleMaxSeats(temp_vid) >= 3) {
					PutPlayerInVehicle(playerid, temp_vid, 2);
				} else if (VehicleInfo[temp_vid][pPass3] == -1 && GetVehicleMaxSeats(temp_vid) >= 4) {
					PutPlayerInVehicle(playerid, temp_vid, 3);
				}
		    	//SendClientMessageEx(playerid,COLOR_GREY,"TEST 2");
			}
		}
		//SendClientMessageEx(playerid,COLOR_GREY,"TEST 3");
	}

	format(string,256,"** %s teleported to you.", PlayerName(playerid));
	SendClientMessageEx(id, COLOR_YELLOW,string);
	format(string,256,"** You teleported to %s.",PlayerName(id));

	return SendClientMessageEx(playerid,COLOR_YELLOW,string);
}

/*
	Spawn Command
	Usage: /spawn <deathspot/set/reset>
	Description: Allows a player to set their own lobby/spawn spot.
	Access: All Players
*/

CMD:spawn(playerid, params[])
{

	new tmp[256], idx;
	new command_id;
	tmp = strtok(params, idx);
	new string[256];

	if(Round[Current] != -1) SendClientMessageEx(playerid, COLOR_RED, "{FF0000}� Error: {FFFFFF}A round is started!");
	else if(Player[playerid][loggedin] == false) return SendClientMessageEx(playerid, COLOR_RED, "{FF0000}� Error: {FFFFFF}You need to be logged in to use this command.");
	else if(isnull(tmp))
	{
		 SendClientMessageEx(playerid, COLOR_GREY, "Usage: {FFFFFF}/spawn [deathspot/set/reset]");
	}
	else
	{

		if(strcmp(tmp, "deathspot", true)==0)
		    command_id = 1;
		else if(strcmp(tmp, "set", true)==0)
		    command_id = 2;
		else if(strcmp(tmp, "reset", true)==0)
		    command_id = 3;

		if(command_id == 1)
		{
			format(string,256,"You have set your spawn location to your death spot.",string,GetPlayerInterior(playerid));
			SendClientMessageEx(playerid,COLOR_YELLOW,string);
			Player[playerid][SpawnType] = DEATH_SPOT;
		}
		if(command_id == 2)
		{
			format(string,256,"You have set your spawn location to your current spot.",string,GetPlayerInterior(playerid));
			SendClientMessageEx(playerid,COLOR_YELLOW,string);
			GetPlayerPos(playerid, Spawn[playerid][0], Spawn[playerid][1], Spawn[playerid][2]);
			Spawn[playerid][3] = float(GetPlayerInterior(playerid));
  			Player[playerid][SpawnType] = 2;
		}
		if(command_id == 3)
		{
			format(string,256,"You have reseted your spawn location.",string,GetPlayerInterior(playerid));
			SendClientMessageEx(playerid,COLOR_YELLOW,string);
			Spawn[playerid][0] = Lobby[0];
  			Spawn[playerid][1] = Lobby[1];
   			Spawn[playerid][2] = Lobby[2];
     		Spawn[playerid][3] = float(Config[LobbyInterior]);
      		Player[playerid][SpawnType] = 0;
		}
	}
	return 1;
}

/*
	Check Teams Command
	Usage: /teams || /scores
	Description: Returns a team member count.
	Access: Administrators
*/

CMD:teams(playerid, params[])
{
	//if(Round[Current] != -1 || Server[EPRoundStarted] == true ) SendClientMessageEx(playerid,COLOR_GREY,"Error: You cannot check teams until round is over!");
	//else {

	Round[atotal] = 0;
	Round[dtotal] = 0;

	for(new x=0; x<Server[HighestID]+1; x++)
	{
		if(IsPlayerConnected(x) && Player[x][pTeam] == T_AWAY && Player[x][setToPlay] && Player[x][pSpawned] == true)
		{
	    	Round[atotal]++;
		}
		if(IsPlayerConnected(x) && Player[x][pTeam] == T_HOME && Player[x][setToPlay] && Player[x][pSpawned] == true)
		{
		   Round[dtotal]++;
		}
	}
	// PTM ( Attack ): 5  -   NUB ( Defend): 4   -   Scores  PTM 2 - NUB

 	new string[170];


   	format(string,128, "%c %s (%s): %d    -    %s (%s): %d   -   Scores: %s %d - %d %s {FFFFF0}||| %s", 187, HomeName, HomeStatus, Round[dtotal], AwayName, AwayStatus, Round[atotal], HomeName, MatchInfo[HomeRoundsWon], MatchInfo[AwayRoundsWon], AwayName, PlayerName(playerid));
   	SendClientMessageToAllEx(COLOR_YELLOW,string);
   	/*format(string,128, "%c %s (%s) | Players: %d | Score: %d", 187, AwayName, AwayStatus, Round[atotal], MatchInfo[AwayRoundsWon]);
   	SendClientMessageToAllEx(GetTeamColor(1, T_AWAY), string);
   	format(string,128, "%c Rounds Played: %d/%d", 187, Server[PartialRounds], Server[RoundLimit]);
   	SendClientMessageToAllEx(COLOR_WHITE, string);*/

	//}
	return 1;
	#pragma unused params
	#pragma unused playerid
}

CMD:scores(playerid, params[]) return cmd_teams(playerid, params);

/*
	Search Command
	Usage: /search <base/tdm> <description>
	Description: Can be used to search for bases ot tdms by name.
	Access: All Players
*/

CMD:search(playerid, params[])
{
	new tmp[256], tmp2[256], idx;
	tmp = strtok(params, idx);
	tmp2 = strtok(params, idx);
	new command_id;

	if(isnull(tmp) || isnull(tmp2))
	{
		return SendClientMessageEx(playerid, COLOR_GREY, "Usage: {FFFFFF}/search [base/tdm] [about]");
	}
	else if(strlen(tmp2) < 2)
	{
		return SendClientMessageEx(playerid, COLOR_RED, "{FF0000}� Error: {FFFFFF}Your search query has to be atleast 2 characters long!");
	}
	else
	{
	    new string[128], fbase[256], bool:Found;

		if(strcmp(tmp, "base", true)==0)
		    command_id = 1;
		else if(strcmp(tmp, "tdm", true)==0)
		    command_id = 2;
		else
		{
			return SendClientMessageEx(playerid, COLOR_GREY, "Usage: {FFFFFF}/search [base/tdm] [about]");
		}


		if(command_id == 1)
		{
		    format(string,128,"** Searching for Bases with description %s",params[strlen(tmp)+1]);
		    SendClientMessageEx(playerid,COLOR_MARINE,string);
		    for(new i = 1; i <= Server[TotalBases]; i ++)
		    {
		        if(strfind(BaseVariables[i][About],params[strlen(tmp)+1],true) != -1)
		        {
		            format(string,128,"> Base id %d - %s",i,BaseVariables[i][About]);
		            SendClientMessageEx(playerid,COLOR_WHITE,string);
		            Found = true;
				}
			}

			if(Found == false)
			    SendClientMessageEx(playerid,COLOR_RED,"No matches found");

		    return 1;
		}
		else if(command_id==2)
		{
		    format(string,128,"** Searching for TDMs with description %s",params[strlen(tmp)+1]);
		    SendClientMessageEx(playerid,COLOR_MARINE,string);
		    for(new i = 1; i <= Server[TotalTDMs]; i ++)
		    {
		        fbase = TDMfile(i);
		        if(strfind(ArenaVariables[i][About],params[strlen(tmp)+1],true) != -1)
		        {
		            format(string,128,"> TDM id %d - %s",i,ArenaVariables[i][About]);
		            SendClientMessageEx(playerid,COLOR_WHITE,string);
		            Found = true;
				}
			}

			if(Found == false)
			    SendClientMessageEx(playerid,COLOR_RED,"No matches found");

		    return 1;
		}
	}

	return 1;
}

/*
	Vote Command
	Usage: /vote <base/tdm> [id]
	Description: Used to vote to start a round.
	Access: All Players
*/

CMD:vote(playerid, params[])
{
	new tmp[256], tmp2[256], idx;
	tmp = strtok(params, idx);
	tmp2 = strtok(params, idx);
	new command_id;

	new string[256];

	if(Round[Current] != -1 || Server[EPRoundStarted] == true) SendClientMessageEx(playerid, COLOR_RED, "{FF0000}� Error: {FFFFFF}A round is already started!");
	else if(Player[playerid][loggedin] == false) return SendClientMessageEx(playerid, COLOR_RED, "{FF0000}� Error: {FFFFFF}You need to be logged in to use this command.");
	else if(isnull(tmp) || isnull(tmp2))
	{
		return SendClientMessageEx(playerid, COLOR_GREY, "Usage: {FFFFFF}/vote [base/tdm] [id]");
	}
	else
	{
		if(strcmp(tmp, "base", true)==0)
		    command_id = 1;
		else if(strcmp(tmp, "tdm", true)==0)
		    command_id = 2;
		else
		{
			return SendClientMessageEx(playerid, COLOR_GREY, "Usage: {FFFFFF}/vote [base/tdm] [id]");
		}

		if(command_id == 1)
		{
		    new info[256];
			if(Player[playerid][pTeam] == T_HOME && Round[Attackers] == T_HOME ||  Player[playerid][pTeam] != T_HOME && Round[Attackers] == T_AWAY)
				return SendClientMessageEx(playerid, COLOR_RED, "{FF0000}� Error: {FFFFFF}Only defending team can vote for bases!");
			else if(Player[playerid][pVoted])
				return SendClientMessageEx(playerid, COLOR_RED, "{FF0000}� Error: {FFFFFF}You have already voted!");
			else
			{
			    new baseid = strval(tmp2);
			    if(baseid == -1) baseid = random(Server[TotalBases]);
			    if(baseid > Server[TotalBases] || baseid <= 0)  SendClientMessageEx(playerid, COLOR_RED, "{FF0000}� Error: {FFFFFF}That base doesnt exist. Type /bases to see the list of avaialable bases.");
			    else
			    {
				    Votes[baseid] = Votes[baseid] +1;
					Player[playerid][pVoted] = true;
				   	format(info,256,"%s vote info [Base id %d - %s - /vote base %d] ", PlayerName(playerid), baseid, BaseVariables[baseid][About], baseid);
				    SendClientMessageToAllEx(COLOR_YELLOW, info);

				    #if IRC == 1
					format(info,256,"8%s vote info [Base id %d - %s - /vote base %d] ", PlayerName(playerid), baseid, BaseVariables[baseid][About], baseid);
			    	CallRemoteFunction("DC_IRCForceSay", "s", info);
			    	#endif
			    	
					for(new x; x <= Server[HighestID]; x++)
					{
						PlayerPlaySound(x, 5400, 0, 0, 0);
					}

				    if(Votes[baseid] >= 3)
					{
					    Round[Voting] = false;
						StartBase(baseid);

					}
		 		    if(!Round[Voting])
				    {
				        Round[Voting] = true;
						new i;
				    	while((i < MAX_BASES) || (i <= Server[HighestID]+1))
				    	{
				    	    if(i < MAX_BASES) Votes[i] = 0; Votes[baseid] = 1;
				    	    if(i <= Server[HighestID]+1) Player[i][pVoted] = false; Player[playerid][pVoted] = true;
				    	    i++;
				    	}
				    	VoteMove();
					}
			    }
			}
	    }
	    else if(command_id == 2)
	    {
			if(Round[Current] != -1) SendClientMessageEx(playerid, COLOR_RED, "{FF0000}� Error: {FFFFFF}A round has already been started, you cant vote now!");
			else {
			    new tdm_id = strval(tmp2);
                if(tdm_id == -1) tdm_id = random(Server[TotalTDMs]);
		     	if(tdm_id > Server[TotalTDMs] || tdm_id <= 0) SendClientMessageEx(playerid, COLOR_RED, "{FF0000}� Error: {FFFFFF}That TDM doesnt exist. Type /tdms to see the list of available TDMs");
			    else {
				    Votes[tdm_id] = Votes[tdm_id] +1;
					Player[playerid][pVoted] = true;

					if(strlen(ArenaVariables[tdm_id][About]) > 3)
					{
			  			format(string,128,"%s vote info [TDM id %d - %s /vote tdm %d]", PlayerName(playerid), tdm_id, ArenaVariables[tdm_id][About],  tdm_id);
					    SendClientMessageToAllEx(COLOR_YELLOW, string);

                        #if IRC == 1
					    format(string,128,"8%s vote info [TDM id %d - %s /vote tdm %d]", PlayerName(playerid), tdm_id, ArenaVariables[tdm_id][About], tdm_id);
				    	CallRemoteFunction("DC_IRCForceSay", "s", string);
				    	#endif
					}
					else
					{
					    format(string,128,"%s vote info [TDM id %d - /vote tdm %d]", PlayerName(playerid), tdm_id, tdm_id);
					    SendClientMessageToAllEx(COLOR_YELLOW, string);

                        #if IRC == 1
					    format(string,128,"8%s vote info [TDM id %d - /vote tdm %d]", PlayerName(playerid), tdm_id, tdm_id);
				    	CallRemoteFunction("DC_IRCForceSay", "s", string);
				    	#endif
					}

					for(new x; x <= Server[HighestID]; x++)
					{
						PlayerPlaySound(x, 5400, 0, 0, 0);
					}
					
				    if(Votes[tdm_id] >= 6)
					{
					    Round[Voting] = false;
						StartTDM(tdm_id);
					}
				    if(!Round[Voting])
				    {
				        Round[Voting] = true;
						new i;
				    	while((i < MAX_ARENAS) || (i <= Server[HighestID]+1))
				    	{
				    	    if(i < MAX_ARENAS) Votes[i] = 0; Votes[tdm_id] = 1;
				    	    if(i <= Server[HighestID]+1) Player[i][pVoted] = false; Player[playerid][pVoted] = true;
				    	    i++;
				    	}
				    	VoteMove2();
					}
			    }
			}
	    }
	}
	return 1;
}

/*
	Help Command
	Usage: /help
	Description: Gives players helpful information.
	Access: All Players
*/

CMD:help(playerid, params[])
{
	new string[256];

	format(string,256,"* \"Deadly Combinations A/D\" v%d.%d.%d help:",VER_MAJOR, VER_MINOR, VER_REVISION);
	SendClientMessageEx(playerid,COLOR_ORANGE,string);
	SendClientMessageEx(playerid,COLOR_WHITE,"** Type /info and /credits for info about the gamemode");
	SendClientMessageEx(playerid,COLOR_WHITE,"** Type /rules to check the rules");
	SendClientMessageEx(playerid,COLOR_WHITE,"** Type /commands for a list of commands");
	return 1;
	#pragma unused params
}

/*
	Spec Command
	Usage: /spec [id/name/base/off]
	Description: Used to enter spectate mode.
	Access: All Players
*/

CMD:spec(playerid, params[])
{
  	new tmp[256], idx, specid;
	tmp = strtok(params, idx);

	if(isnull(tmp)) {
		SendClientMessageEx(playerid, COLOR_GREY, "Usage: {FFFFFF}/spec [id/name/base/off]");
		return 1;
	}

	if(strcmp(tmp, "off", true)==0)
	{
	 	if(Player[playerid][Specing] == true)
	 	{
	 	    StopSpectate(playerid);
			return 1;
		}
		else if(Player[playerid][SpecingBase] == true)
		{
	 	    Player[playerid][SpecingBase] = false;
			SpawnPlayerEx(playerid);
			return 1;
		}
		else
		{
		    Player[playerid][gSpectateID] = INVALID_PLAYER_ID;
			Player[playerid][Specing] = false;
		    return SendClientMessageEx(playerid, COLOR_RED, "{FF0000}� Error: {FFFFFF}You arent spectating anyone.");
		}
	}
	else if(strcmp(tmp, "base", true)==0)
	{
	    if(Round[Current] == -1 || Round[Gamemode] != BASE)
			return SendClientMessageEx(playerid, COLOR_RED, "{FF0000}� Error: {FFFFFF}You can only spectate a base when a base is being being played");
		else if(Player[playerid][pPlaying] == true)
			return SendClientMessageEx(playerid, COLOR_RED, "{FF0000}� Error: {FFFFFF}You cannot use this command while playing a round");
		else
		{
 			if(Player[playerid][Specing] == true)
				StopSpectate(playerid);

		    new Float:Floats[3];
			Floats[0] = BaseVariables[Round[Current]][BaseCheckpoint][0];
			Floats[1] = BaseVariables[Round[Current]][BaseCheckpoint][1];
			Floats[2] = BaseVariables[Round[Current]][BaseCheckpoint][2];

			new interior = BaseVariables[Round[Current]][Interior];

			SetPlayerCheckpoint(playerid, Floats[0], Floats[1], Floats[2], Config[cp_size]);
			SetPlayerInterior(playerid,interior);
			SetPlayerPos(playerid,Floats[0],Floats[1],Floats[2]-30);
			TogglePlayerControllable(playerid, false);
			SetPlayerWorldBoundsEx(playerid,9999.9,-9999.9,9999.9,-9999.9);
   			SetPlayerCameraLookAt(playerid,Floats[0],Floats[1],Floats[2]);
			Player[playerid][AltitudeIndex] = 50;

			Player[playerid][Altitude] = Floats[2]+Player[playerid][AltitudeIndex];
			new Float:Xc, Float:Yc;
			Xc = floatadd(Floats[0], floatmul(Player[playerid][AltitudeIndex]+10, floatsin(-Player[playerid][LoadingScreenRotationAngle], degrees)));
			Yc = floatadd(Floats[1], floatmul(Player[playerid][AltitudeIndex]+10, floatcos(-Player[playerid][LoadingScreenRotationAngle], degrees)));
			SetPlayerCameraPos(playerid, Xc, Yc, Player[playerid][Altitude]);

			TogglePlayerControllable(playerid, 0);
			SetPlayerVirtualWorld2(playerid, ROUND_VW);
			Player[playerid][SpecingBase] = true;

			SpecingBaseUpdate(playerid);
			SendClientMessageEx(playerid, COLOR_DARKGREY, "** You are now spectating the base. You can rotate the camera using SPRINT and JUMP keys.");
			SendClientMessageEx(playerid, COLOR_DARKGREY,"** Zoom in and out using ENTER and CROUCH. To exit type /spec off.");
		}
		return 1;
	}

	if(Config[spec] == 0) return SendClientMessage(playerid, COLOR_RED, "{FF0000}� Error: {FFFFFF}Spec is disabled.");
	if(!IsNumeric(params))
		specid = ReturnPlayerID(params);
	else
		specid = strval(params);

	if(!IsPlayerConnected(specid)) {
		SendClientMessageEx(playerid, COLOR_RED, "{FF0000}� Error: {FFFFFF}Player not found.");
		return 1;
	}
	else if(specid == playerid) {
  		SendClientMessageEx(playerid, COLOR_RED, "{FF0000}� Error: {FFFFFF}You cannot spectate yourself.");
		return 1;
	}
	else if(Player[playerid][pPlaying] == true && Player[playerid][pTeam] != T_REF) {
  		SendClientMessageEx(playerid, COLOR_RED, "{FF0000}� Error: {FFFFFF}You can only spectate if you are not in a round.");
		return 1;
	}
	else if(GetPlayerState(specid) == PLAYER_STATE_SPECTATING && Player[specid][gSpectateID] != INVALID_PLAYER_ID) {
		SendClientMessageEx(playerid, COLOR_RED, "{FF0000}� Error: {FFFFFF}Player spectating someone else");
		return 1;
	}
	else if(GetPlayerState(specid) != 1 && GetPlayerState(specid) != 2 && GetPlayerState(specid) != 3) {
 		SendClientMessageEx(playerid, COLOR_RED, "{FF0000}� Error: {FFFFFF}Player not spawned");
		return 1;
	}
	else if(!IsTeamTheSame(Player[specid][pTeam],Player[playerid][pTeam]))
	{
	    if(Player[playerid][pTeam] != T_REF && Round[Current] != -1)
		{
		    if (Player[specid][pDuel] != 0) {
		    } else {
				SendClientMessageEx(playerid, COLOR_RED, "{FF0000}� Error: {FFFFFF}You can only spectate your own team.");
				return 1;
			}
	    }
	}

	if(Player[playerid][Specing] == false)
	{
		SendClientMessageEx(playerid, COLOR_MARINE, "** You've entered spectator mode. You can scroll trought players using JUMP and SPRINT keys.");
		SendClientMessageEx(playerid, COLOR_MARINE, "** Press CROUCH key to change view and ENTER VEHICLE key to exit");
	} else {
		if(IsPlayerInAnyVehicle(Player[playerid][gSpectateID])) {
	    	HideVehicleHud(playerid, GetPlayerVehicleID(Player[playerid][gSpectateID]));
		}
	}

	if(IsPlayerInAnyVehicle(playerid)) {
	    HideVehicleHud(playerid, GetPlayerVehicleID(playerid));
	}

	StartSpectate(playerid, specid);
	return 1;
}

/*
	Server Info Command
	Usage: /serverinfo
	Description: Displays server info and stats.
	Access: All Players
*/

CMD:serverinfo(playerid, params[])
{
	new ServerTime = GetDateAndTime()-Server[Init];

    new string[256];

	format(string,256,"\"Deadly Combinations A/D\" v%d.%d.%d:",VER_MAJOR, VER_MINOR, VER_REVISION);
	SendClientMessageEx(playerid,COLOR_ORANGE,string);

   	format(string,256,"Started: %s (Online Time: %s)", StartedString,Convert(ServerTime)); //Knife
	SendClientMessageEx(playerid,COLOR_WHITE,string);
   	format(string,256,"Connections: %d | Total Timeouts: %d", Server[TotalConnections], Server[TotalCrashes]); //Knife
	SendClientMessageEx(playerid,COLOR_GREY,string);
   	format(string,256,"Round Kills: %d | Round Deaths: %d | Total Kills: %d | Total Deaths: %d", Server[ServerRoundKills], Server[ServerRoundDeaths],Server[ServerKills],Server[ServerDeaths]);
	SendClientMessageEx(playerid,COLOR_GREEN,string);

	new wepID, wepkills;
	for(new i = 0; i < MAX_COUNT_WEAPONS; i++) //All other weapons
	{
   		if(WeaponsKills[i]>0)
		{
			if(WeaponsKills[i]>wepkills)
			{
		   	    wepkills=WeaponsKills[i];
		   	    wepID= weaponsInfo[i][WID];
			}
		}
	}
	if(wepkills > 0)
	{
		new wepname[24];
   		GetWeaponName(wepID,wepname,24);
		format(string,256,"���� ���� ���� ����: %s (%d ų)", wepname, wepkills);
		SendClientMessageEx(playerid,COLOR_YELLOW,string);
	}
	return 1;

	#pragma unused params
}

CMD:d(playerid, params[]) {
	new Float:X, Float:Y, Float:Z;
	GetPlayerVelocity(playerid, X, Y, Z);
	if(Z < 0.0) return SendClientMessage(playerid, COLOR_RED, "{FF0000}� Error: {FFFFFF}You are falling.");
	new danceid;
	sscanf(params, "d", danceid);
	switch(danceid) {
	    case 1: return SetPlayerSpecialAction(playerid, SPECIAL_ACTION_DANCE1);
	    case 2: return SetPlayerSpecialAction(playerid, SPECIAL_ACTION_DANCE2);
	    case 3: return SetPlayerSpecialAction(playerid, SPECIAL_ACTION_DANCE3);
	    case 4: return SetPlayerSpecialAction(playerid, SPECIAL_ACTION_DANCE4);
	}
	return SendClientMessage(playerid, COLOR_GREY, "Usage: {FFFFFF}/d [1-4]");
}

/*
	Restore All Command
	Usage: /restoreall [playerid] [health] 
	Description: refills every player's HP that is in a round.
	Access: Administrator
*/

CMD:restoreall(playerid, params[]) {

    if(!IsPlayerAdmin3(playerid)) return SendClientMessageEx(playerid, COLOR_RED, "{FF0000}� Error: {FFFFFF}You need to be admin to do that!");

	if(Round[Current] == -1) return SendClientMessage(playerid, COLOR_RED, "{FF0000}� Error: {FFFFFF}A round is not started.");

	for(new i=0; i <= Server[HighestID]; i++) {
	    if(IsPlayerConnected(i) && Player[i][pPlaying] == true) {
	        SetPlayerArmour(i, Config[roundarmour]);
	        SetPlayerHealth(i, Config[roundhealth]);
	    }
	}
	new str[150];
	format(str, sizeof(str), "%s has restored everyone's HP!", PlayerName(playerid));
	SendClientMessageToAll(COLOR_YELLOW, str);
	return 1;
}


/*
	Set Health Command
	Usage: /sethealth [playerid] [health] || /sethp [playerid] [health]
	Description: Set the health of a player
	Access: Administrator
*/

CMD:sethealth(playerid, params[]) {
    if(!IsPlayerAdmin3(playerid)) return SendClientMessageEx(playerid, COLOR_RED, "{FF0000}� Error: {FFFFFF}You need to be admin to do that!");

    new id = -1, Float:hp;
	if(sscanf(params, "uf", id, hp)) return SendClientMessageEx(playerid, COLOR_RED, "Usage: {FFFFFF}/sethealth [player id/name] [health]");

	if(!IsPlayerConnected(id)) return SendClientMessageEx(playerid, COLOR_RED, "{FF0000}� Error: {FFFFFF}Player not found.");


    SetPlayerHealth(id, hp);

    new str[128];
    format(str, sizeof(str), "** %s has set %s's HP to: %0.2f", PlayerName(playerid), PlayerName(id), hp);
    SendClientMessageToAll(COLOR_YELLOW, str);

    return 1;
}

CMD:sethp(playerid, params[]) return cmd_sethealth(playerid, params);

/*
	Set Armour Command
	Usage: /setarmour [playerid] [armour] || /setarmor [playerid] [armor] || /setap [playerid] [armour]
	Description: Set the health of a player
	Access: Administrator
*/


CMD:setarmour(playerid, params[]) {
    if(!IsPlayerAdmin3(playerid)) return SendClientMessageEx(playerid, COLOR_RED, "{FF0000}� Error: {FFFFFF}You need to be admin to do that!");

    new id, Float:ar;
	if(sscanf(params, "uf", id, ar)) return SendClientMessageEx(playerid, COLOR_GREY, "Usage: {FFFFFF}/setarmour [player id/name] [armour]");

	if(!IsPlayerConnected(id)) return SendClientMessageEx(playerid, COLOR_RED, "{FF0000}� Error: {FFFFFF}Player not found.");

    SetPlayerArmour(id, ar);

    new str[128];
    format(str, sizeof(str), "** %s has set %s's Armour to: %0.2f", PlayerName(playerid), PlayerName(id), ar);
    SendClientMessageToAll(COLOR_YELLOW, str);

    return 1;
}

CMD:setap(playerid, params[]) return cmd_setarmour(playerid, params);
CMD:setarmor(playerid, params[]) return cmd_setarmour(playerid, params);


/*
	Net stats Command
	Usage: /netstats [id]
	Description: Gets a player's network stats.
	Access: Anyone
*/

CMD:netstats(playerid, params[]) {
	#if SAMP_VERSION == 1
		return SendClientMessageEx(playerid, COLOR_RED, "{FF0000}� Error: {FFFFFF}The gamemode needs to be set to SA-MP v0.3d to use this feature!");
	#else
		new id;
		if(sscanf(params, "u", id)) {
		    new stats[400+1];
        	GetNetworkStats(stats, sizeof(stats)); // get the servers networkstats
       		ShowPlayerDialog(playerid, 9, DIALOG_STYLE_MSGBOX, "Server's Network Stats", stats, "Close", "");
       		return 1;
       	}

		//return SendClientMessage(playerid, -1, "Usage: {FFFFFF} /netstats [playerid]");

		new stats[401], string[70];
	    GetPlayerNetworkStats(id, stats, sizeof(stats));

	    format(string, sizeof(string), "%s's Network Stats", PlayerName(id));

		ShowPlayerDialog(playerid,9,DIALOG_STYLE_MSGBOX,string,stats,"Close","");
		return 1;
	#endif
}

/*
	Show Results Command
	Usage: /showresults
	Description: Forces final results.
	Access: Administrator
*/

CMD:showresults(playerid, params[])
{
	if(!IsPlayerAdmin3(playerid)) return SendClientMessageEx(playerid, COLOR_RED, "{FF0000}� Error: {FFFFFF}You need to be admin to do that!");
	SendClientMessageToAllEx(COLOR_WHITE,"Loading Final Results Screen...");
	WriteMatchResults();
	HappyEnding();
	return 1;
	#pragma unused params
}

/*
	Save TDM Command
	Usage: /savetdm
	Description: Saves current tdm being edited or created.
	Access: Root Admin
*/

CMD:savetdm(playerid, params[])
{
	if(!IsPlayerRootAdmin(playerid)) return SendClientMessageEx(playerid, COLOR_RED, "{FF0000}� Error: {FFFFFF}You need to be admin to do that!");

	SendClientMessageEx(playerid,COLOR_BUILDMODE,"[TDM Buildmode]: Select the desired info to save. Press 'F' to leave");
    TogglePlayerControllable(playerid,false);
	ShowMenuForPlayer(CreateTDMMenu, playerid);
	return 1;
	#pragma unused params
}

/*
	Save Base Command
	Usage: /savebase
	Description: Saves current base being edited or created.
	Access: Root Admin
*/

CMD:savebase(playerid, params[])
{
	if(!IsPlayerRootAdmin(playerid)) return SendClientMessageEx(playerid, COLOR_RED, "{FF0000}� Error: {FFFFFF}You need to be admin to do that!");

	SendClientMessageEx(playerid,COLOR_BUILDMODE,"[Base Buildmode]: Select the desired info to save. Press 'F' to leave");
    TogglePlayerControllable(playerid,false);
	ShowMenuForPlayer(CreateBaseMenu, playerid);

	return 1;
	#pragma unused params
}

/*
	Save Duel Command
	Usage: /saveduel
	Description: Saves current duel being edited or created.
	Access: Root Admin
*/

CMD:saveduel(playerid, params[])
{
	if(!IsPlayerRootAdmin(playerid)) return SendClientMessageEx(playerid, COLOR_RED, "{FF0000}� Error: {FFFFFF}You need to be admin to do that!");

	SendClientMessageEx(playerid,COLOR_BUILDMODE,"[Duel Buildmode]: Select the desired Player Coord to save. Press 'F' to leave");
    TogglePlayerControllable(playerid,false);
	ShowMenuForPlayer(DuelSetupMenu, playerid);

	return 1;
	#pragma unused params
}

/*
	Save DM Command
	Usage: /savedm
	Description: Saves current dm being edited or created.
	Access: Root Admin
*/

CMD:savedm(playerid, params[])
{
	if(!IsPlayerRootAdmin(playerid)) return SendClientMessageEx(playerid, COLOR_RED, "{FF0000}� Error: {FFFFFF}You need to be admin to do that!");

	SendClientMessageEx(playerid,COLOR_BUILDMODE,"[DM Buildmode]: Select the desired data to save. Press 'F' to leave");
    TogglePlayerControllable(playerid,false);
	ShowMenuForPlayer(DMSetupMenu, playerid);

	return 1;
	#pragma unused params
}

/*
	Drop Weapons Command
	Usage: /dropweapons
	Description: Drop your current weapons
	Access: All Players
*/

CMD:dropweapons(playerid, params[])
{
    if(Round[Current] != -1 && Round[EplapsedTime] <= 30)
		return SendClientMessageEx(playerid, COLOR_RED, "{FF0000}� Error: {FFFFFF}You cannot drop your weapons now");
	DropWeapons(playerid);
	ResetPlayerWeapons(playerid);
	SendClientMessageEx(playerid, COLOR_MARINE, "** You've dropped your weapons");
	return 1;
	#pragma unused params
}

/*
	Info Command
	Usage: /info
	Description: Show all Gamemode Configs
	Access: All Players
*/

CMD:info(playerid, params[])
{

	new uav[64], pmsg[64], drop_mode[64], timer_mode[64], tk[64], skin[64], hud[64], veh[64], hint[64], lock[64], ve2[64];

	if(Server[PauseMessages]) {
		format(pmsg, sizeof(pmsg), "On");
	} else {
		format(pmsg, sizeof(pmsg), "Off");
	}

	if(Server[TkMode] ==false) {
		format(tk, sizeof(tk), "Enabled");
	} else {
		format(tk, sizeof(tk), "Disabled");
	}

	if(Server[EnableSkinChanging] ==false) {
		format(skin, sizeof(skin), "Disabled");
	} else {
		format(skin, sizeof(skin), "Enabled");
	}

	if(Server[UAVEnabled] ==false) {
		format(uav, sizeof(uav), "Disabled");
	} else {
		format(uav, sizeof(uav), "Enabled");
	}

	new tdlay[60];
	if(Server[MainTextdrawLayout] == 1) {
		format(tdlay, sizeof(hint), "Bottom");
	} else {
		format(tdlay, sizeof(hint), "HUD");
	}

	if(Server[WeaponDrop] ==false) {
		format(drop_mode, sizeof(drop_mode), "Disabled");
	} else {
		format(drop_mode, sizeof(drop_mode), "Enabled");
	}

	if(Server[TimerMode]) {
		format(timer_mode, sizeof(timer_mode), "On");
	} else {
		format(timer_mode, sizeof(timer_mode), "Off");
	}


	if(Server[LobbyVehicles]) {
		format(ve2, sizeof(ve2), "Enabled");
	} else {
		format(ve2, sizeof(ve2), "Disabled");
	}

	if(Server[AutoHUD]) {
		format(hud, sizeof(hud), "Enabled");
	} else {
		format(hud, sizeof(hud), "Disabled");
	}

	if(Server[AllowVehicleMod]) {
		format(veh, sizeof(veh), "Enabled");
	} else {
		format(veh, sizeof(veh), "Disabled");
	}

	new intr[24];
	if(Config[UseIntro]) {
		format(intr, sizeof(intr), "Enabled");
	} else {
		format(intr, sizeof(intr), "Disabled");
	}

	if(Server[DisplayHintMessages]) {
		format(hint, sizeof(hint), "On");
	} else {
		format(hint, sizeof(hint), "Off");
	}

	if(Server[serverLock]) {
		format(lock, sizeof(hint), "Yes");
	} else {
		format(lock, sizeof(hint), "No");
	}

	new sr[60];
	if(Server[SaveResults] == true) {
		format(sr, sizeof(sr), "On");
	} else {
		format(sr, sizeof(sr), "Off");
	}

	new ws[60];
	if(Config[weaponsystem] == WEAPONSYSTEM_MENU)
	{
		format(ws, sizeof(ws), "Choose yourself");
	}
	else if(Config[weaponsystem] == WEAPONSYSTEM_RANDOM)
	{
		format(ws, sizeof(ws), "Randomly Picked");
	}
	else if(Config[weaponsystem] == WEAPONSYSTEM_FULL)
	{
		format(ws, sizeof(ws), "Full Set");
	}

	new gameplay[60];
	if(Round[Gameplay] == WAR_ZONE)
	{
		format(gameplay, sizeof(gameplay), "War Zone");
	}
	else if(Round[Gameplay] == STEALTH)
	{
		format(gameplay, sizeof(gameplay), "Stealth & Survive");
	}
	else if(Round[Gameplay] == RUMBLE)
	{
		format(gameplay, sizeof(gameplay), "Rumble");
	}

	new duels[60];
	if(Server[AllowDuels] == true) {
		format(duels, sizeof(duels), "Enabled");
	} else {
		format(duels, sizeof(duels), "Disabled");
	}

	new fullset[128];
	format(fullset,128,">> Full Set Weapons: %s, %s, %s, %s, %s, %s", GetWepName(FullSet[1]), GetWepName(FullSet[2]), GetWepName(FullSet[3]), GetWepName(FullSet[4]), GetWepName(FullSet[5]), GetWepName(FullSet[6]));

    new string[256];
	format(string,256,"[%s] %s - \"Deadly Combinations A/D\" v%d.%d.%d:", ClanTag, CLAN_NAME, VER_MAJOR, VER_MINOR, VER_REVISION);
	SendClientMessageEx(playerid,COLOR_ORANGE,string);

	new gametype_msg[256];

	format(gametype_msg, sizeof(gametype_msg), ">> CP Time: %d secs | Round Time: %d mins | Global Health: %d - Armour: %d | Round Health: %d - Armour %d", Config[cp_time], Config[round_time], Config[globalhealth], Config[globalarmour], Config[roundhealth], Config[roundarmour]);
	SendClientMessageEx(playerid, COLOR_WHITE, gametype_msg);

	format(gametype_msg, sizeof(gametype_msg), ">> Duels: %s | CP Size: %d | TDM Gameplay: %s | Intro Cinematics: %s", duels, Config[cp_size], gameplay, intr );
	SendClientMessageEx(playerid, COLOR_WHITE, gametype_msg);

	format(gametype_msg, sizeof(gametype_msg), ">> Weapon System: %s | Weapon Drops: %s | Base Timer: %s | UAV: %s | TeamKill: %s", ws, drop_mode, timer_mode, uav, tk);
	SendClientMessageEx(playerid, COLOR_WHITE, gametype_msg);

	format(gametype_msg, sizeof(gametype_msg), ">> Vehicle Modding: %s | Lobby Vehicles: %s | Auto HUD: %s | Hint Messages: %s", veh, ve2, hud, hint);
	SendClientMessageEx(playerid, COLOR_WHITE, gametype_msg);

	format(gametype_msg, sizeof(gametype_msg), ">> Skin Changing: %s | Pause Messages: %s |  Server Locked: %s | Textdraw Layout: %s", skin, pmsg, lock, tdlay);
	SendClientMessageEx(playerid, COLOR_WHITE, gametype_msg);

	format(gametype_msg, sizeof(gametype_msg), ">> Saving Round Results to File: %s | Round Limit: %d | Nametag Draw Distance: %d ft.", sr, Server[RoundLimit], Config[NameTagDistance]);
	SendClientMessageEx(playerid, COLOR_WHITE, gametype_msg);

	if(Config[weaponsystem] == WEAPONSYSTEM_FULL)
		SendClientMessageEx(playerid, COLOR_WHITE, fullset);

	#if DATA_SYSTEM == 2
		new queries[100];
		format(queries, 100, ">> SQL Queries Executed: %d", Server[SQLQueriesExecuted]);
		SendClientMessageEx(playerid, COLOR_WHITE, queries);
	#endif

    return 1;
	#pragma unused params
}

/*
	Credits Command
	Usage: /credits
	Description: Gamemode credits.
	Access: All Players
*/

CMD:credits(playerid, params[])
{
    new tmptext[250];
	format(tmptext, sizeof(tmptext), "Deadly Combinations v%d.%d.%d was made by {FFFFF0}Raekwon {0099FF}& {FFFFF0}Devastator {0099FF}| Other Developers: {FFFFF0}Whitetiger & plaYmaker", VER_MAJOR, VER_MINOR, VER_REVISION);
	SendClientMessageEx(playerid,COLOR_LIGHTBLUE,tmptext);
	SendClientMessageEx(playerid,COLOR_WHITE,"{ADD8E6}Originally created for [KR] Killadel Rydaz clan. R.I.P. [KR] 2007 - 2009");
	SendClientMessageEx(playerid,COLOR_WHITE,"{B0C4DE}Credits: {F8F8FF}DracoBlue, mabako, Boylett, G-sTyLeZzZ, ILuSioN, Sneaky, Seif_, & Y_Less.");
	SendClientMessageEx(playerid,COLOR_WHITE,"{B0C4DE}Thanks to: {F8F8FF}Pablo, Rafs, MaTrIx4057, Al_Pacino, Trip, Raider, [U], [PTM], [ABK], [___] and the [KR] clan");
	SendClientMessageEx(playerid,COLOR_WHITE,"{F8F8FF}for suggestions, bug reports & testing.");
    return 1;
	#pragma unused params
}

/*
	Intro Command
	Usage: /intro
	Description: Shows players the intro cinematics
	Access: All Players
*/

CMD:intro(playerid, params[])
{
	if((!Player[playerid][inIntro]) && (!Player[playerid][pPlaying]) && (Player[playerid][pSpawned]))
	{
	    #if !defined SOUND_INTRO
		// only play this sound if the intro music isn't defined, NOT if the intro music is disabled, if its disabled they obviously don't want anything.
		PlayerPlaySound(playerid, 1142, 0, 0, 0);
		#else
		if(ConfigAudio[sndIntro] == true) {
	    	PlayAudioStreamForPlayerExEx(playerid, SOUND_INTRO);
		}
		#endif
		
		Player[playerid][inCmdIntro] = true;
		format(Player[playerid][TempIntroString],256," ");
		TextDrawBoxColor(text_fadeblack[playerid], 0x00000000);
	    Player[playerid][introStringIndex] = 0;
		Player[playerid][FirstIntroFlash] = false;
		Player[playerid][EndedIntro] = false;
		Player[playerid][inIntro] = true;
		Player[playerid][introIndex] = 0;
		Player[playerid][justConn] = false;
		Player[playerid][justClass] = true;
		Player[playerid][introOffset] = 0;
		TextDrawShowForPlayer(playerid, text_fadeblack[playerid]);
		TextDrawShowForPlayer(playerid, skip_intro);
		TextDrawBoxColor(text_fadeblack[playerid], 0x00000005);
		TextDrawShowForPlayer(playerid, intro_gmname[playerid]);
		TogglePlayerSpectating(playerid, true);
		TogglePlayerControllable(playerid,0);
		TextDrawSetString(intro_gmname[playerid], " ");
		
		Player[playerid][IntroPos] = random(sizeof(IntroPositions));
		Player[playerid][introTimer] = SetTimerEx("Intro", 25, true, "i", playerid);
	}
    return 1;
	#pragma unused params
}

/*
	Date Command
	Usage: /date
	Description: Shows players the current server date/time.
	Access: All Players
*/

CMD:date(playerid, params[])
{
	new tmp[128];
	new day, month, year, hour, minute, second, weekday;
	getdate(year, month, day);
	gettime(hour, minute, second);
	weekday = getweekday(year, month, day) - 1;

  	format(tmp, 128, " ! %s, %s %d%s, %d - %02d:%02d:%02d", WeekdayName[weekday], MonthName[month-1], day, GetOrdinalNumber(day), year, hour, minute, second);
	SendClientMessageEx(playerid, COLOR_ORANGE, tmp);
	return 1;
	#pragma unused params
}

/*
	Exit Command
	Usage: /exit
	Description: Remove players from duels
	Access: All Players
*/

CMD:exit(playerid, params[])
{
    if(Player[playerid][pDuel] < 1)
		return SendClientMessageEx(playerid, COLOR_RED, "Error: You are not in a duel");
    else if(InDuel[Player[playerid][pDuel]] > 1)
	    return SendClientMessageEx(playerid, COLOR_RED, "Error: The duel has already started, you cannot leave it now.");
    else
    {
        new string[128];
		format(string,128,"{37DB45}[Duel] {FFFFFF}\"%s\" {37DB45}has left the \"%s\" duel.", PlayerName(playerid), DuelName[Player[playerid][pDuel]]);
	    SendClientMessageToAllEx(COLOR_GREY, string);
		InDuel[Player[playerid][pDuel]] = 0;
		Player[playerid][pDuel] = 0;
		KillTimer(Player[playerid][duelTimer]);
		SpawnPlayerEx(playerid);
	    return 1;
	}
	#pragma unused params
}

/*
	Rules Command
	Usage: /rules
	Description: Gamemode rules.
	Access: All Players
*/

CMD:rules(playerid, params[])
{
    TimeTextForPlayer(playerid, text_rules, 6000);
    return 1;
	#pragma unused params
}

/*
	Commands Command
	Usage: /commands
	Description: Gives player a list of all commands.
	Access: All Players
*/

CMD:commands(playerid, params[])
{
    SendClientMessageEx(playerid,COLOR_DARKGREY,"** Player Commands:");
    SendClientMessageEx(playerid,COLOR_WHITE,"** Voting: /vote [base|tdm], /search [base|tdm], /bases, /tdms, /baseinfo");
    SendClientMessageEx(playerid,COLOR_WHITE,"** NickServ: /login, /register, /changepass, /group, /stats, /wstats [id|server]");
	SendClientMessageEx(playerid,COLOR_WHITE,"** Info: /serverinfo, /rules, /credits, /info, /help, /date");
    SendClientMessageEx(playerid,COLOR_WHITE,"** Admin Commands: /admin");
    SendClientMessageEx(playerid,COLOR_WHITE,"** Others: /car, /me, /hud, /afk, /cmd, /goto, /nick, /view, /sync");
	SendClientMessageEx(playerid,COLOR_WHITE,"   /spawn, /wlist, /intro, /getgun, /vcolor, /switch, /jetpack, /kill, /gunmenu, /exit");
	SendClientMessageEx(playerid,COLOR_WHITE,"   /teams, /dropweapons, /t, /skin, /duel, /teleport, /spec, /pass, /fight");
	SendClientMessageEx(playerid,COLOR_WHITE,"   /dm, /leave, /matches, /money, /blip");
	return 1;

	#pragma unused params
}

/*
	Admin Commands Command
	Usage: /admin
	Description: List of administrator commands.
	Access: All Players
*/

CMD:admin(playerid, params[])
{
    SendClientMessageEx(playerid,COLOR_DARKGREY,"** Admin Commands:");
    SendClientMessageEx(playerid,COLOR_DARKGREY,"==========================================================================");
    SendClientMessageEx(playerid,COLOR_WHITE,"** /start, /reload, /rem, /end, /add, /chat, /allvs, /pause, /admin, /resume");
	SendClientMessageEx(playerid,COLOR_WHITE,"** /lock, /unlock, /invert, /nochat, /vclear, /balance, /gethere, /setteam");
	SendClientMessageEx(playerid,COLOR_WHITE,"** /settime, /giveveh, /savetdm, /starttdm, /teamlock, /shuffle, /resetall, /setarmour");
	SendClientMessageEx(playerid,COLOR_WHITE,"** /stopvote, /givemenu, /teamskin, /saveduel, /savebase, /setplayer, /restoreall");
	SendClientMessageEx(playerid,COLOR_WHITE,"** /startbase, /removegun, /resetguns, /forcesync, /globalchat, /setweather, /sethealth");
	SendClientMessageEx(playerid,COLOR_WHITE,"** /resetscores, /resetbaseinfo, /showresults, /resetserverinfo, /config");
    SendClientMessageEx(playerid,COLOR_WHITE,"** Root Admin: /config, /b, /a, /reload, /delete, /deleteacc, /resetacc, /makeadmin");
  	SendClientMessageEx(playerid,COLOR_DARKGREY,"==========================================================================");
	return 1;
	#pragma unused params
}

/*
	Kill Command
	Usage: /kill
	Description: For players to kill themself.
	Access: All Players
*/

CMD:kill(playerid, params[])
{
	if (Player[playerid][Specing] == false) {
		SetPlayerHealth(playerid,0.0);
		Player[playerid][Suicided] = true;
	}
    return 1;
	#pragma unused params
}

/*
	Switch Command
	Usage: /switch
	Description: For players to switch teams.
	Access: All Players
*/

CMD:switch(playerid, params[])
{
	if(Player[playerid][pPlaying] || Player[playerid][Specing]) SendClientMessageEx(playerid,COLOR_GREY,"Error: You cannot change teams now.");
		else {
			DestroyMenu(switch_menu);
			new string[256];

 			switch_menu = CreateMenu("Switch Team", 1, 30.0, 150.0, 200.0, 200.0);


    		if (Config[autobalance] == 0) {
				format(string,256,">> %s (%s)", HomeName,HomeStatus);
				AddMenuItem(switch_menu, 0, string);

				format(string,256,">> Sub - %s", HomeName);
				AddMenuItem(switch_menu, 0, string);

				format(string,256,">> %s (%s)", AwayName,AwayStatus);
				AddMenuItem(switch_menu, 0, string);

				format(string,256,">> Sub - %s", AwayName);
				AddMenuItem(switch_menu, 0, string);

				format(string,256,">> ~y~~h~%s", RefName);
				AddMenuItem(switch_menu, 0, string);

				AddMenuItem(switch_menu, 0, ">> ~b~~h~Auto-Assign");
			} else {
				format(string,256,">> ~y~~h~%s", RefName);
				AddMenuItem(switch_menu, 0, string);

				AddMenuItem(switch_menu, 0, ">> ~b~~h~Auto-Assign");
			}

			ShowMenuForPlayer(switch_menu, playerid);
			TogglePlayerControllable(playerid, 0);
		}
	return 1;
	#pragma unused params
}

/*
	Gun Menu Command
	Usage: /gunmenu
	Description: For players to select weapons. Can be used withtin 30secs after a round has been started
	Access: All Players
*/

CMD:gunmenu(playerid, params[])
{
	if(!Player[playerid][pPlaying] && Round[Current] == -1) SendClientMessageEx(playerid,COLOR_GREY,"Error: You can only select weapons during a round!");
	else if(Config[weaponsystem] != WEAPONSYSTEM_MENU) return SendClientMessageEx(playerid,COLOR_GREY,"Error: You cannot use this command now.");
	else
	{
		    if(Round[Current] != -1)
			 {
		    	if(Round[EplapsedTime] <= 30)
		    	{
		    	    FixTeamWeapons(playerid);
		    	    ResetPlayerWeapons(playerid);
	    	     	Player[playerid][PrimaryWep] = 0;
				 	Player[playerid][PrimaryWepAmmo] = 0;
				 	Player[playerid][SecondaryWep] = 0;
				 	Player[playerid][SecondaryWepAmmo] = 0;
				  	Player[playerid][TerciaryWep] = 0;
				 	Player[playerid][TerciaryWepAmmo] = 0;
				 	Player[playerid][SpecialWep] = 0;
				 	Player[playerid][SpecialWepAmmo] = 0;

					for(new i = 0 ; i < MAX_WEAPONS; ++ i)
					{
					    if(WeaponsMenus[Option][i] == 5)
					    {
		                    TimeTextForPlayer(playerid, autowep, (Config[stop_counting]*1000)-1000);
		                    TimeTextForPlayer(playerid, autowep2, (Config[stop_counting]*1000)-1000);
		                    TimeTextForPlayer(playerid, autowep3, (Config[stop_counting]*1000)-1000);
		                   	TimeTextForPlayer(playerid, autowep4, (Config[stop_counting]*1000)-1000);
					        TimeTextForPlayer(playerid, autowep5, (Config[stop_counting]*1000)-1000);
					        break;
					    }
					}


					TryGunMenu(1, playerid);
					TogglePlayerControllable(playerid, 0);
				}
				else
				{
				    SendClientMessageEx(playerid,COLOR_GREY,"Error: You can only reselect weapons in first 30 seconds of round.");
				}
			}
		}
	return 1;
	#pragma unused params
}

/*
	Fighting Style Command
	Usage: /fight
	Description: Allows players to set there fighting style.
	Access: All Players
*/

CMD:fight(playerid, params[])
{
	if(Round[Current] != -1 || Server[EPRoundStarted] == true) SendClientMessageEx(playerid, COLOR_RED, "{FF0000}� Error: {FFFFFF}You cannot use this command while a round is being played.");
	ShowMenuForPlayer(fightmenu, playerid);
	TogglePlayerControllable(playerid, 0);
	return 1;
	#pragma unused params
}

/*
	Get Vehicle Command
	Usage: /car
	Description: Allows a player to spawn a vehicle
	Access: All Players
*/

CMD:v(playerid, params[])
{
	cmd_car(playerid, params);
	return 1;
}

CMD:vehicle(playerid, params[])
{
	cmd_car(playerid, params);
	return 1;
}

CMD:car(playerid, params[])
{
	if(Player[playerid][pDuel] > 0)
		return SendClientMessageEx(playerid, COLOR_RED, "{FF0000}� Error: {FFFFFF}You cannot use this command while in a duel.");
    else if (Player[playerid][pPlaying] && Round[Interior] != 0)
    {
    	SendClientMessageEx(playerid, COLOR_RED, "{FF0000}� Error: {FFFFFF}You cannot spawn a vehicle while playing a round inside an interior!");
    }
	else if(!Player[playerid][pPlaying])
	{
	    if(IsPlayerInAnyVehicle(playerid))
		{
			SendClientMessageEx(playerid, COLOR_RED, "{FF0000}� Error: {FFFFFF}You cannot spawn a vehicle while inside a vehicle!");
	 	}
	 	else if(Server[Vehicles] > Server[MaxVehicles]-1)
		{
			SendClientMessageEx(playerid, COLOR_RED, "{FF0000}� Error: {FFFFFF}Server has reached maximum amount of vehicles!");
	 	}
		else
		{
			if(Server[LobbyVehicles] == false)
				return SendClientMessageEx(playerid, COLOR_RED, "{FF0000}� Error: {FFFFFF}This command is disabled.");
			else
			{
				Success:
				if(strlen(params) > 1)
				{
				    for(new i = 0; i < MAX_SPAWNABLE_VEHICLES; i ++)
				    {
				    	if(strfind(SpawnableVehicles[i][VehName],params,true) != -1)
				    	{
				    	    if(SpawnableVehicles[i][A_Only] == true && !IsPlayerAdmin3(playerid))
				    	    {
								return SendClientMessageEx(playerid, COLOR_RED, "{FF0000}� Error: {FFFFFF}You cannot spawn this vehicle.");
							}
							else
							{
								SpawnVehicleForPlayer(playerid, SpawnableVehicles[i][VehID]);
							}
						    return 1;
				    	}
				    }
				    goto NoParams;
				}
				else
				{
				    NoParams:
					ShowMenuForPlayer(vehiclemenu, playerid);
					TogglePlayerControllable(playerid, 0);
				}
			}
		}
	}
	else if(Server[CantSpawnVehicle])
	{
		SendClientMessageEx(playerid, COLOR_RED, "{FF0000}� Error: {FFFFFF}You cannot spawn a vehicle now!");
	}
	else
	{
		if(Round[Current] != -1 && Round[Gamemode] == BASE)
		{
			if(Player[playerid][pTeam] == T_AWAY && Round[Attackers] == T_AWAY || Player[playerid][pTeam] == T_HOME && Round[Attackers] == T_HOME)
			{
			    if(Round[Attackers] == T_AWAY)
			    {
					if(!PlayerToPoint(VEH_SPAWN_DISTANCE, playerid, AwaySpawn[0], AwaySpawn[1], AwaySpawn[2]))
					{
				  		SendClientMessageEx(playerid, COLOR_RED, "{FF0000}� Error: {FFFFFF}You need to be within 150 ft from your base to spawn a vehicle!");
				    }
					else
					{
						goto Success;
					}
				}
				else
				{
					if(!PlayerToPoint(VEH_SPAWN_DISTANCE, playerid, HomeSpawn[0], HomeSpawn[1], HomeSpawn[2]))
					{
				  		SendClientMessageEx(playerid, COLOR_RED, "{FF0000}� Error: {FFFFFF}You need to be within 150 ft from your base to spawn a vehicle!");
				    }
					else
					{
						goto Success;
					}
				}
			}
			else
			{
			    SendClientMessageEx(playerid, COLOR_RED, "{FF0000}� Error: {FFFFFF}Only attackers can spawn vehicles!");
			}
		}
		else
		{
			SendClientMessageEx(playerid, COLOR_RED, "{FF0000}� Error: {FFFFFF}Vehicles can only be spawned during a round!");
		}
	}
	return 1;
	#pragma unused params
}

/*
	Pass Command
	Usage: /pass <password>
	Description: Used by players to enter server password if server is locked.
	Access: All Players
*/

CMD:pass(playerid,params[])
{
	if(Server[serverLock])
	{
		if(isnull(params))
	    	return SendClientMessageEx(playerid, COLOR_GREY, "Usage: {FFFFFF}/pass [server password]");

	    if(isStringSame(ServerPass, params, sizeof(ServerPass))) {
			SendClientMessageEx(playerid, COLOR_GREEN, "Password Accepted!");
			Player[playerid][lock_pass] = true;
		} else {
		    SendClientMessageEx(playerid, COLOR_RED, "Error: Incorrect Password!");
		}
	} else {
	    SendClientMessageEx(playerid, COLOR_RED, "Error: The server is not locked!");
	}
	return 1;
}

/*
	Bases List Command
	Usage: /bases
	Description: Used to view list of available bases.
	Access: All Players
*/

CMD:bases(playerid, params[])
{
	if(Player[playerid][pPlaying])
		return SendClientMessageEx(playerid, COLOR_RED, "{FF0000}� Error: {FFFFFF}You cannot use this command while playing a round!");
	else if(Player[playerid][pDuel] > 0)
		return SendClientMessageEx(playerid, COLOR_RED, "{FF0000}� Error: {FFFFFF}You cannot use this command while in a duel!");
	else
	{
		ShowBasesTextDraws(playerid);
	}
	return 1;
	#pragma unused params
}

/*
	Bases Info Command
	Usage: /basesinfo [baseid]
	Description: Used to show list of base info.
	Access: All Players
*/

CMD:baseinfo(playerid, params[])
{
	new tmp[256], idx;
	tmp = strtok(params, idx);

	new baseid;
	if(Round[Current] == -1 && isnull(tmp))
	{
		SendClientMessageEx(playerid, COLOR_GREY, "Usage: {FFFFFF}/baseinfo [base id]");
		return 1;
	}
	baseid = strval(tmp);

    if(Round[Current] != -1 && isnull(tmp))
    {
 	    baseid = Round[Current];
    }
    #if DATA_SYSTEM == 1
	    new basefile[256];
	    basefile = Basefile(baseid);
		if(!dini_Exists(basefile))
			return SendClientMessageEx(playerid, COLOR_GREY,"Error: This base doesn't exists.");
	#elseif DATA_SYSTEM == 2
		if(!SqlBaseExist(baseid))
			return SendClientMessageEx(playerid, COLOR_GREY,"Error: This base doesn't exists.");
	#endif

	ShowPlayerBaseInfo(playerid, baseid);
    return 1;
}

/*
	TDMs List Command
	Usage: /tdms
	Description: Used to view list of available tdms.
	Access: All Players
*/

CMD:tdms(playerid, params[])
{
	if(Player[playerid][pPlaying]) return SendClientMessageEx(playerid, COLOR_RED, "{FF0000}� Error: {FFFFFF}You cannot use this command while playing a round!");
	else if(Player[playerid][pDuel] > 0) return SendClientMessageEx(playerid, COLOR_RED, "{FF0000}� Error: {FFFFFF}You cannot use this command while in a duel");
	else
	{
		ShowArenasTextDraws(playerid);
	}
	return 1;
	#pragma unused params
}

/*
	View Command
	Usage: /view <base/tdm> [id]
	Description: Used to view/scroll through bases or tdms.
	Access: All Players
*/

CMD:view(playerid, params[])
{
	new tmp[256], idx;
	new command_id;
	tmp = strtok(params, idx);

	if(Player[playerid][pPlaying]) return SendClientMessageEx(playerid, COLOR_RED, "{FF0000}� Error: {FFFFFF}You cannot use this command while playing a round!");
	else if(isnull(params)) SendClientMessageEx(playerid, COLOR_GREY, "Usage: {FFFFFF}/view [base/tdm]");
	else if(Round[Current] != -1 && Player[playerid][pTeam] != T_REF) return SendClientMessageEx(playerid, COLOR_GREY, "{FF0000}� Error: {FFFFFF}Cannot spectate while a round is started, try switching to ref.");
	else
	{
		if(strcmp(tmp, "base", true)==0)
		    command_id = 1;
		else if(strcmp(tmp, "tdm", true)==0)
		    command_id = 2;

		tmp = strtok(params, idx);

		if(command_id==1)
		{
			new baseid;
		    if(Round[Current] == -1 && isnull(tmp))
		    {
				SendClientMessageEx(playerid, COLOR_GREY, "Usage: {FFFFFF}/view [base] [baseid]");
				return 1;
		    }

		    baseid = strval(tmp);

		    if(Round[Current] != -1 && isnull(tmp))
		    {
		 	    baseid = Round[Current];
		    }

			SendClientMessageEx(playerid, COLOR_DARKGREY, "Help: Cycle throught bases using SPRINT and JUMP keys. Press ENTER key to spawn and CROUCH key to leave.");
			Player[playerid][ViewBase] = true;
			SetPlayerToViewBase(playerid,baseid);

		}
		else if(command_id==2)
		{
			new baseid;
		    if(Round[Current] == -1 && isnull(tmp))
		    {
				SendClientMessageEx(playerid, COLOR_GREY, "Usage: {FFFFFF}/view [tdm] [tdm id]");
				return 1;
		    }

		    baseid = strval(tmp);

		    if(Round[Current] != -1 && isnull(tmp))
		    {
		 	    baseid = Round[Current];
		    }

			SendClientMessageEx(playerid, COLOR_DARKGREY, "Help: Cycle throught TDMs using SPRINT and JUMP keys. Press ENTER key to spawn and CROUCH key to leave.");
			Player[playerid][ViewTDM] = true;
			SetPlayerToViewTDM(playerid,baseid);

		}

	}
	return 1;
}

/*
	Weapon List Command
	Usage: /wlist
	Description: Display list of weapons in gun menus.
	Access: All Players
*/

CMD:wlist(playerid,params[])
{
	if(Player[playerid][pPlaying])
		return SendClientMessageEx(playerid, COLOR_RED, "{FF0000}� Error: {FFFFFF}You cannot use this command while playing a round!");

	TimeTextForPlayer(playerid, GunList_1, 10000);
	TimeTextForPlayer(playerid, GunList_2, 10000);
	TimeTextForPlayer(playerid, GunList_3, 10000);
	TimeTextForPlayer(playerid, GunList_4, 10000);
	TimeTextForPlayer(playerid, GunList_5, 10000);
	#pragma unused params
	return 1;
}

/*
	Get Gun Command
	Usage: /getgun <gunname>
	Description: Used to get a gun (lobby)
	Access: All Players
*/

CMD:getgun(playerid, params[])
{
	new tmp[256], idx;
	new weapon_id = -1;
	tmp = strtok(params, idx);
	new string[256];

	if(Config[LobbyWeapons] == 0) return SendClientMessageEx(playerid, COLOR_RED, "{FF0000}� Error: {FFFFFF}This command is disabled");
	if(Player[playerid][pPlaying] || Server[EPRoundStarted] == true) return SendClientMessageEx(playerid, COLOR_RED, "{FF0000}� Error: {FFFFFF}You cannot use this command now!");
	else if(Player[playerid][pDuel] != 0) SendClientMessageEx(playerid, COLOR_RED, "{FF0000}� Error: {FFFFFF}You cannot use this command when in a duel!");
	else if(IsPlayerInAnyVehicle(playerid)) return SendClientMessageEx(playerid, COLOR_RED, "{FF0000}� Error: {FFFFFF}You cannot use this command while in a vehicle!");
	else if(isnull(params))
	{
		SendClientMessageEx(playerid, COLOR_GREY, "Usage: {FFFFFF}/getgun [gun name]");
		SendClientMessageEx(playerid,COLOR_GREEN,"Available Weapons:");

		format(string,256," ");
		for(new i = 0; i < floatround(sizeof(AvailableWeapons)/4); i ++)
		{
		    if(strlen(AvailableWeapons[i]) >= 2)
		    {
				format(string,256,"%s  %s",string,AvailableWeapons[i]);
			}
		}
		if(strlen(string) > 2)
		{
			SendClientMessageEx(playerid,COLOR_GREEN,string);
		}

		format(string,256," ");
		for(new i = floatround(sizeof(AvailableWeapons)/4); i < floatround(sizeof(AvailableWeapons)/2); i ++)
		{
		    if(strlen(AvailableWeapons[i]) >= 2)
		    {
				format(string,256,"%s  %s",string,AvailableWeapons[i]);
			}
		}
		if(strlen(string) > 2)
		{
			SendClientMessageEx(playerid,COLOR_GREEN,string);
		}

		format(string,256," ");
		for(new i = (sizeof(AvailableWeapons)/2); i < floatround(sizeof(AvailableWeapons)-sizeof(AvailableWeapons)/4); i ++)
		{
		    if(strlen(AvailableWeapons[i]) >= 2)
		    {
				format(string,256,"%s  %s",string,AvailableWeapons[i]);
			}
		}
		if(strlen(string) > 2)
		{
			SendClientMessageEx(playerid,COLOR_GREEN,string);
		}

 		format(string,256," ");
		for(new i = floatround( (sizeof(AvailableWeapons)) - (sizeof(AvailableWeapons)/4)); i < floatround(sizeof(AvailableWeapons)); i ++)
		{
		    if(strlen(AvailableWeapons[i]) >= 2)
		    {
				format(string,256,"%s  %s",string,AvailableWeapons[i]);
			}
		}
		if(strlen(string) > 2)
		{
			SendClientMessageEx(playerid,COLOR_GREEN,string);
		}

	}
	else
	{
	    new slot;
		for(new i = 0; i < sizeof(AvailableWeapons); i ++)
		{
			if(strfind(AvailableWeapons[i],tmp,true) != -1)
			{
				weapon_id = AvailableWeaponsIDs[i];
				slot = i;
			}
		}
	    new temp_gid, temp_gammo;
	    GetPlayerWeaponData(playerid, GetSlot(weapon_id), temp_gid, temp_gammo);
		if (weapon_id == -1) {
			return SendClientMessageEx(playerid, COLOR_RED, "Error: Unavailable Weapon!");
		} else if(PlayerGuns[playerid][GetSlot(weapon_id)] == weapon_id) {
		    if (temp_gammo > 0) {
		   		return SendClientMessageEx(playerid, COLOR_RED, "Error: You already have that weapon.");
			}
		}
		PlayerGuns[playerid][GetSlot(weapon_id)] = weapon_id;
		PlayerAmmos[playerid][GetSlot(weapon_id)] = AvailableWeaponsAmmo[slot];
		new name[24];

		GetWeaponName(weapon_id,name,24);
	    if(weapon_id != 0) GivePlayerWeaponEx(playerid,weapon_id,AvailableWeaponsAmmo[slot]);

		format(string,256,"{FFFFFF}%c {37DB45}Weapon Acquired: {FFFFFF}%s {37DB45}- Ammo: {FFFFFF}%d - {37DB45}Slot: {FFFFFF}%d",187,name,AvailableWeaponsAmmo[slot], GetSlot(weapon_id));
		SendClientMessageEx(playerid,COLOR_GREY,string);

		return 1;
	}

	return 1;
}


/*
	Remove Gun Command
	Usage: /removegun <gunname>
	Description: Removes the selected gun.
	Access: All Players
*/

CMD:removegun(playerid, params[])
{
	new tmp[256], idx;
	new weapon_id = -1;
	tmp = strtok(params, idx);
	new string[256];

	if(Config[LobbyWeapons] == 0) return SendClientMessageEx(playerid, COLOR_RED, "{FF0000}� Error: {FFFFFF}This command is disabled");
	else if(Round[Current] != -1 || Server[EPRoundStarted] == true) SendClientMessageEx(playerid, COLOR_RED, "{FF0000}� Error: {FFFFFF}You cannot use this command when in a round!");
	else if(Player[playerid][pDuel] != 0) SendClientMessageEx(playerid, COLOR_RED, "{FF0000}� Error: {FFFFFF}You cannot use this command when in a duel!");
	else if(isnull(params))
	{
		SendClientMessageEx(playerid, COLOR_GREY, "Usage: {FFFFFF}/removegun [gun name]");
		SendClientMessageEx(playerid,COLOR_GREEN,"Available Weapons:");

		format(string,256," ");
		for(new i = 0; i < floatround(sizeof(AvailableWeapons)/4); i ++)
		{
		    if(strlen(AvailableWeapons[i]) >= 2)
		    {
				format(string,256,"%s  %s",string,AvailableWeapons[i]);
			}
		}
		if(strlen(string) > 2)
		{
			SendClientMessageEx(playerid,COLOR_GREEN,string);
		}

		format(string,256," ");
		for(new i = floatround(sizeof(AvailableWeapons)/4); i < floatround(sizeof(AvailableWeapons)/2); i ++)
		{
		    if(strlen(AvailableWeapons[i]) >= 2)
		    {
				format(string,256,"%s  %s",string,AvailableWeapons[i]);
			}
		}
		if(strlen(string) > 2)
		{
			SendClientMessageEx(playerid,COLOR_GREEN,string);
		}

		format(string,256," ");
		for(new i = (sizeof(AvailableWeapons)/2); i < floatround(sizeof(AvailableWeapons)-sizeof(AvailableWeapons)/4); i ++)
		{
		    if(strlen(AvailableWeapons[i]) >= 2)
		    {
				format(string,256,"%s  %s",string,AvailableWeapons[i]);
			}
		}
		if(strlen(string) > 2)
		{
			SendClientMessageEx(playerid,COLOR_GREEN,string);
		}

 		format(string,256," ");
		for(new i = floatround( (sizeof(AvailableWeapons)) - (sizeof(AvailableWeapons)/4)); i < floatround(sizeof(AvailableWeapons)); i ++)
		{
		    if(strlen(AvailableWeapons[i]) >= 2)
		    {
				format(string,256,"%s  %s",string,AvailableWeapons[i]);
			}
		}
		if(strlen(string) > 2)
		{
			SendClientMessageEx(playerid,COLOR_GREEN,string);
		}

	}
	else
	{

	    new slot;

		for(new i = 0; i < sizeof(AvailableWeapons); i ++)
		{
			if(strfind(AvailableWeapons[i],tmp,true) != -1)
			{
				weapon_id = AvailableWeaponsIDs[i];
				slot = i;
			}
		}
		if(weapon_id == -1) return SendClientMessageEx(playerid, COLOR_RED, "{FF0000}� Error: {FFFFFF}Unavailable Weapon!");

		if(PlayerGuns[playerid][GetSlot(weapon_id)] > 0)
		{
			PlayerGuns[playerid][GetSlot(weapon_id)] = 0;
			PlayerAmmos[playerid][GetSlot(weapon_id)] = 0;

			new name[24];
			GetWeaponName(weapon_id,name,24);
		    if(weapon_id != 0) GivePlayerWeaponEx(playerid,weapon_id,AvailableWeaponsAmmo[slot]);

			format(string,256,"** You sucessfully removed %s from your weapons.",name);
			SendClientMessageEx(playerid,COLOR_YELLOW,string);

			ResetPlayerWeapons(playerid);
			for(new slots = 0; slots < 13; slots++)
			{
				if(PlayerGuns[playerid][slots] > 0)
				{
					GivePlayerWeaponEx(playerid, PlayerGuns[playerid][slots], PlayerAmmos[playerid][slots]);
				}
			}
		}
		else
		{
		    return SendClientMessageEx(playerid, COLOR_RED, "{FF0000}� Error: {FFFFFF}You don't have this weapon");

		}



		return 1;
	}

	return 1;
}

/*
	Weapon Stats Command
	Usage: /wstats <playerid|server>
	Description: Displays weapons stats for a specific player or server.
	Access: All Players
*/

CMD:wstats(playerid,params[])
{
	new tmp[256],Index; tmp = strtok(params,Index);
 	new id;
	if(isnull(params))
	{
		ShowWeaponStats(playerid,playerid);
	}
	else
	{
        if(strcmp(params, "server", true)==0)
        {
		    new string[256];
			new wep[24];
			format(string,256,"** Server weapon usage:");
			SendClientMessageEx(playerid,COLOR_ORANGE, string);
			string = " ";
			for (new i = 0; i < 5; i++)
			{
				GetWeaponName(weaponsInfo[i][WID],wep,24);
				format(string,256,"%s || %s - Kills: %d", string, wep, WeaponsKills[i]);
			}
			SendClientMessageEx(playerid,COLOR_YELLOW,string);
			string = " ";
			for (new i = 5; i < 9; i++)
			{
				GetWeaponName(weaponsInfo[i][WID],wep,24);
				format(string,256,"%s || %s - Kills: %d", string, wep, WeaponsKills[i]);
			}
			SendClientMessageEx(playerid,COLOR_YELLOW,string);
			string = " ";
			for (new i = 9; i < MAX_COUNT_WEAPONS; i++)
			{
				GetWeaponName(weaponsInfo[i][WID],wep,24);
				format(string,256,"%s || %s - Kills: %d", string, wep, WeaponsKills[i]);
			}
			SendClientMessageEx(playerid,COLOR_YELLOW,string);
			return 1;
		}


		if(!IsNumeric(params))
			id = ReturnPlayerID(params);
		else
			id = strval(params);

		if(IsPlayerConnected(id) && id != INVALID_PLAYER_ID)
		ShowWeaponStats(playerid,id);

		else return
		SendClientMessageEx(playerid,COLOR_GREY,"Error: Player not found.");
	}
	return 1;
}


/*
	Stats Command
	Usage: /stats <playerid>
	Description: Used to get a players stats.
	Access: All Players
*/

CMD:stats(playerid,params[])
{
	new tmp[256],Index; tmp = strtok(params,Index);
 	new id;
	if(isnull(params))
	{
		ShowStats(playerid,playerid);
	}else{

		if(!IsNumeric(params))
			id = ReturnPlayerID(params);
		else
			id = strval(params);

		if(IsPlayerConnected(id) && id != INVALID_PLAYER_ID)
		ShowStats(playerid,id);

		else return
		SendClientMessageEx(playerid,COLOR_GREY,"Error: Player not found.");
	}
	return 1;
}

/*
	Hud Command
	Usage: /hud [activate/deactivate/track/auto]
	Description: For players to configure and use their player hud.
	Access: All Players
*/

CMD:hud(playerid, params[])
{

	new tmp[256], idx;
	new command_id;
	tmp = strtok(params, idx);
	new string[256];

	if(Player[playerid][loggedin] == false) return SendClientMessageEx(playerid, COLOR_RED, "{FF0000}� Error: {FFFFFF}You need to be logged in to use this command.");
	else if(isnull(tmp))
	{
		 SendClientMessageEx(playerid, COLOR_GREY, "Usage: {FFFFFF}/hud [activate/deactivate/track/auto]");
	}
	else if(Server[HUD] == false) return SendClientMessageEx(playerid, COLOR_GREY, "{FF0000}� Error: {FFFFFF}This command is disabled.");
	else
	{
		if(strcmp(tmp, "activate", true)==0)
		    command_id = 1;
		else if(strcmp(tmp, "deactivate", true)==0)
		    command_id = 2;
		else if(strcmp(tmp, "track", true)==0)
		    command_id = 3;
		else if(strcmp(tmp, "auto", true)==0)
		    command_id = 4;

		tmp = strtok(params, idx);
		if(command_id == 1)
		{
		    if(PlayerHUD[playerid][Activated] == false)
		    {
			    PlayerHUD[playerid][Type] = HUD_AUTO;
		   	 	PlayerHUD[playerid][Activated] = true;
		        SendClientMessageEx(playerid, COLOR_MARINE,"[HUD] You've activated your HUD system");
		        SendClientMessageEx(playerid, COLOR_WHITE,"[HUD] The current Tracking mode is Automatic (Closest team player will be tracked)");
		        SendClientMessageEx(playerid, COLOR_WHITE,"[HUD] If you want to track a specific player, type /hud track [id]");

			    if(Player[playerid][PlayerHUDTextDrawCreated] == false)
			    {
				//	CreatePlayerHUDTextDraws(playerid);
			    }
  				ShowHUDTextDraws(playerid);
		    }
		    else
		    {
		         SendClientMessageEx(playerid, COLOR_GREY, "[HUD] Your HUD system is already activated");
			}
		}
		else if(command_id == 2)
		{
		  	if(PlayerHUD[playerid][Activated] == true)
		    {
		   	 	PlayerHUD[playerid][Activated] = false;
		        SendClientMessageEx(playerid, COLOR_YELLOW,"[HUD] You've deactivated your HUD system");
				HideHUDTextDraws(playerid);
				DestroyPlayerHUDTextDraws(playerid);
		    }
		    else
		    {
		         SendClientMessageEx(playerid, COLOR_GREY,"[HUD] Your HUD system is already deactivated");
			}
		}
		else if(command_id == 3)
		{
  			if(PlayerHUD[playerid][Activated] == false)
				return SendClientMessageEx(playerid,COLOR_GREY,"Error: The HUD system must be activated");

		    if(isnull(tmp))
		    {
		        return SendClientMessageEx(playerid, COLOR_GREY,"Usage: {FFFFFF}/hud track [player id/name]");
		    }
			new id;
			if(!IsNumeric(tmp))
				id = ReturnPlayerID(tmp);
			else
				id = strval(tmp);

			if(IsPlayerConnected(id) && id != INVALID_PLAYER_ID)// && id != playerid)
			{
			    PlayerHUD[playerid][Type] = HUD_TRACK;
			    PlayerHUD[playerid][TrackingID] = id;
			    format(string,256,"[HUD] HUD System tracking id %d: %s",id, PlayerName(id));
			    SendClientMessageEx(playerid,COLOR_YELLOW,string);
			}
			else
			{
				return
					SendClientMessageEx(playerid,COLOR_GREY,"Error: Invalid player id!");
		    }
		}
		else if(command_id == 4)
		{
			if(PlayerHUD[playerid][Activated] == false)
				return SendClientMessageEx(playerid,COLOR_GREY,"Error: The HUD system must be activated");

			if(PlayerHUD[playerid][Type] == HUD_AUTO)
				return SendClientMessageEx(playerid,COLOR_GREY,"Error: Your HUD tracking system is already automatic");

		    PlayerHUD[playerid][Type] = HUD_AUTO;
			SendClientMessageEx(playerid,COLOR_YELLOW,"[HUD] Your sucessfully switched your HUD tracking mode to Automatic (Closest team player will be tracked)");

		}
	}
	return 1;
}

/*
	Teleport Command
	Usage: /t [#]
	Description: Used for teleports.
	Access: All Players
*/

CMD:t(playerid, params[])
{
	if(Player[playerid][pPlaying])
		return SendClientMessageEx(playerid, COLOR_RED, "{FF0000}� Error: {FFFFFF}You cannot use this command while playing a round!");
	new command_id;
	new string[256], tmp[256], idx, id = 0;
	tmp = strtok(params, idx);

	format(string,256,"Usage: {FFFFFF}/t [1-%d]",Server[HighestTeleID]);

	new msg1[256], msg2[256], msg3[256], msg4[256], msg5[256];
	for(new i = 1; i < Server[HighestTeleID]+1; i ++)
	{
	    if (strlen(msg1) < 100) {
	    	format(msg1,256,"%s || %s: %d", msg1, TeleportNames[i], i);
		} else if (strlen(msg2) < 100) {
	    	format(msg2,256,"%s || %s: %d", msg2, TeleportNames[i], i);
		} else if (strlen(msg3) < 100) {
	    	format(msg3,256,"%s || %s: %d", msg3, TeleportNames[i], i);
		} else if (strlen(msg4) < 100) {
	    	format(msg4,256,"%s || %s: %d", msg4, TeleportNames[i], i);
		} else if (strlen(msg5) < 100) {
	    	format(msg5,256,"%s || %s: %d", msg5, TeleportNames[i], i);
		}
	}

	if(isnull(tmp))
	{
		SendClientMessageEx(playerid, COLOR_GREY, string);
		if (strlen(msg1) > 3) SendClientMessageEx(playerid, COLOR_WHITE, msg1);
		if (strlen(msg2) > 3) SendClientMessageEx(playerid, COLOR_WHITE, msg2);
		if (strlen(msg3) > 3) SendClientMessageEx(playerid, COLOR_WHITE, msg3);
		if (strlen(msg4) > 3) SendClientMessageEx(playerid, COLOR_WHITE, msg4);
		if (strlen(msg5) > 3) SendClientMessageEx(playerid, COLOR_WHITE, msg5);

		if (IsPlayerAdmin3(playerid)) {
	 		SendClientMessageEx(playerid, COLOR_GREY, "Admin Usage: {FFFFFF}/t [set|name|create]");
		}
		return 1;
	}

	if(IsNumeric(tmp) || !IsPlayerAdmin3(playerid))
		command_id = 1;
	else if(strcmp(tmp, "set", true)==0)
	    command_id = 2;
	else if(strcmp(tmp, "name", true)==0)
	    command_id = 3;
	else if(strcmp(tmp, "create", true)==0)
	    command_id = 4;
	else
		return SendClientMessageEx(playerid, COLOR_GREY, string);

	if(command_id == 1)
	{
		id = strval(tmp);
		if(id < 1 || id > sizeof(TeleportAreas))
		{
			SendClientMessageEx(playerid, COLOR_RED, "Error: Invalid TP zone.");
			return 1;
		}
		if(Round[Current] == - 1)
		{
			format(string, 128, "** %s has teleported to %s (/t %d)",PlayerName(playerid), TeleportNames[id], id, id);
			SendClientMessageToAllEx(COLOR_YELLOW, string);
			SetPlayerInterior(playerid, 0);

            #if IRC == 1
			format(string, sizeof(string), "4** 7%s 14has teleported to TP Zone %d 4(%s)", PlayerName(playerid),id, TeleportNames[id]);
			CallRemoteFunction("DC_IRCForceSay", "s", string);
			#endif
		}
		if(id == 1)
		{
		    SetPlayerInterior(playerid,Config[LobbyInterior]);
	    	SetPlayerPos(playerid,Lobby[0]+2-random(2),Lobby[1]+2-random(2),Lobby[2]+2);
	    	return 1;
		}
		else
		{
			if(IsPlayerInAnyVehicle(playerid) && GetPlayerState(playerid) == 2)
			{
				LinkVehicleToInterior(GetPlayerVehicleID(playerid),floatround(TeleportAreas[id][3]));
				SetVehicleZAngle(GetPlayerVehicleID(playerid), 0.0);
				SetVehiclePos(GetPlayerVehicleID(playerid),TeleportAreas[id][0], TeleportAreas[id][1] , TeleportAreas[id][2]);
			}
			else
			{
			    SetPlayerInterior(playerid,floatround(TeleportAreas[id][3]));
				SetPlayerPos(playerid, TeleportAreas[id][0], TeleportAreas[id][1], TeleportAreas[id][2]+2);
			}
		}
	}
	else if(command_id == 2)
	{
		tmp = strtok(params, idx);
		format(string,256,"Usage: {FFFFFF}/t set [2-%d]",sizeof(TeleportAreas)-1);
	    if(isnull(tmp) || !IsNumeric(tmp) || strval(tmp) < 2 || strval(tmp) > sizeof(TeleportAreas)) return SendClientMessageEx(playerid, COLOR_GREY, string);

		GetPlayerPos(playerid, TeleportAreas[strval(tmp)][0], TeleportAreas[strval(tmp)][1], TeleportAreas[strval(tmp)][2]);
		TeleportAreas[strval(tmp)][3] = float(GetPlayerInterior(playerid));
		format(string,256,"** Teleport zone %d set to your current position.", strval(tmp));
		SendClientMessageEx(playerid, COLOR_YELLOW,string);

		#if DATA_SYSTEM == 1
			format(string,256,"%f,%f,%f,%f",TeleportAreas[strval(tmp)][0], TeleportAreas[strval(tmp)][1], TeleportAreas[strval(tmp)][2], TeleportAreas[strval(tmp)][3]);
			dini_Set(Teleportfile(strval(tmp)),"teleport", string);
		#elseif DATA_SYSTEM == 2
			format(string,256,"%f,%f,%f,%f",TeleportAreas[strval(tmp)][0], TeleportAreas[strval(tmp)][1], TeleportAreas[strval(tmp)][2], TeleportAreas[strval(tmp)][3]);
			UpdateSqlTeleStr(strval(tmp), "coords", string);
		#endif

		return 1;
	}
	else if(command_id == 3)
	{
		new tmp2[256];
		tmp = strtok(params, idx);
		tmp2 = strtok(params, idx);

		format(string,256,"Usage: {FFFFFF}/t name [2-%d] [name]",sizeof(TeleportAreas)-1);
	    if(isnull(tmp) || isnull(tmp2) || !IsNumeric(tmp) || strval(tmp) < 2 || strval(tmp) > sizeof(TeleportAreas)) return SendClientMessageEx(playerid, COLOR_GREY, string);

		format(TeleportNames[strval(tmp)],256,"%s",params[6+strlen(tmp)]);

		format(string,256,"** Teleport zone %d name set to %s.", strval(tmp), params[6+strlen(tmp)]);
		SendClientMessageEx(playerid, COLOR_YELLOW,string);

		#if DATA_SYSTEM == 1
			format(string,256,"%s",params[6+strlen(tmp)]);
			dini_Set(Teleportfile(strval(tmp)),"name", string);
		#elseif DATA_SYSTEM == 2
			format(string,256,"%s",params[6+strlen(tmp)]);
			UpdateSqlTeleStr(strval(tmp), "name", string);
		#endif

		return 1;
	}
	else if(command_id == 4)
	{
		tmp = strtok(params, idx);

		if (strlen(tmp) < 3) return SendClientMessageEx(playerid, COLOR_GREY, "Usage: {FFFFFF}/t create [name]");

		new teleid = Server[HighestTeleID]+1;

		new Float:PlayerPos[3];
		GetPlayerPos(playerid,PlayerPos[0],PlayerPos[1],PlayerPos[2]);

		format(string,256,"** Teleport \"%s\" created at your current position! (/t %d)", params[9], teleid);
		SendClientMessageEx(playerid, COLOR_YELLOW,string);

		format(string,256,"%f,%f,%f,%f", PlayerPos[0], PlayerPos[1], PlayerPos[2], float(GetPlayerInterior(playerid)));

		#if DATA_SYSTEM == 1
		    dini_Create(Teleportfile(teleid));
			dini_Set(Teleportfile(teleid), "name", params[9]);
			dini_Set(Teleportfile(teleid),"teleport", string);
		#elseif DATA_SYSTEM == 2
			CreateSqlTele(teleid, params[9], string);
		#endif

		return 1;
	}
	return 1;
}

/*
	PM Command
	Usage: /pm [id] [message]
	Description: For players to private message each other.
	Access: All Players
*/

CMD:pm(playerid, params[])
{
	new index = 0, tmp2[256];
    tmp2 = strtok(params, index);


	new pmplayerid = strval(tmp2);

	if (!IsPlayerConnected(pmplayerid))
	{
		SendClientMessageEx(playerid, COLOR_RED, "{FF0000}� Error: {FFFFFF}Player not found.");
		return 1;
	}

    if(isnull(tmp2))
	{
		SendClientMessageEx(playerid, COLOR_WHITE, "Usage: {FFFFFF}/pm [id] [message]");
		return 1;
	}

	strmid(tmp2, params, 2, strlen(params));

	if(isnull(params))
	{
		SendClientMessageEx(playerid, COLOR_WHITE, "Usage: {FFFFFF}/pm [id] [message]");
		return 1;
	}

	if(playerid == pmplayerid)
	{
		SendClientMessageEx(playerid, COLOR_RED, "{FF0000}� Error: {FFFFFF}You cannot PM yourself!");
		return 1;
	}

	new pm_str[256];
	format(pm_str, 256, "PM From %s (%d): {FFFFFF}%s", PlayerName(playerid), playerid, tmp2);
	SendClientMessageEx(pmplayerid, COLOR_YELLOW, pm_str);
	format(pm_str, 256, "PM Sent To %s (%d): {FFFFFF}%s", PlayerName(pmplayerid), pmplayerid, tmp2);
	SendClientMessageEx(playerid, COLOR_YELLOW, pm_str);
    return 1;
}

//-------------------------------------------------------------//
//********************** SA-MP Callbacks **********************//
//-------------------------------------------------------------//

public OnGameModeInit()
{

    Config[antisktime] = 5;
	//if(dini_Exists(BlockFile))
	//{
	//    printf("Server Blocked");
	//    SetTimer("Exit", 5000, false);
	//}
	//SetTimer("DamageTimer",250,true);

	new log[256];

	#if PROTECTED == 1
	{
    	new
			ServerIP[20],
	 		ServerPort;

		GetServerVarAsString("bind",ServerIP,20);
		ServerPort = GetServerVarAsInt("port");

		if(strcmp(ServerIP,PROTECTED_IP1,false,20) && strcmp(ServerIP,PROTECTED_IP2,false,20) || isnull(ServerIP)) // Check server IP.
		{
			print("This server has not the permission to use this gamemode.");
			print("Server shutting down in 5 seconds...");
			format(log,256,"Error: This server has not the permission to use this gamemode. \n\r");
			#if LOG_SYSTEM == 1
			WriteLog("server", log);
			#endif
			format(log,256,"Server shutting down in 5 seconds... \n\r");
			#if LOG_SYSTEM == 1
			WriteLog("server", log);
			#endif
			SetTimer("Exit",5000,false);
			return 0;
 		}
		else if(ServerPort != PROTECTED_PORT) // If  server port is different, end server.
		{
			print("This server has not the permission to use this gamemode.");
			print("Server shutting down in 5 seconds...");
			format(log,256,"Error: This server has not the permission to use this gamemode. \n\r");
			#if LOG_SYSTEM == 1
			WriteLog("server", log);
			#endif
			format(log,256,"Server shutting down in 5 seconds... \n\r");
			#if LOG_SYSTEM == 1
			WriteLog("server", log);
			#endif
			SetTimer("Exit",5000,false);
			return 0;
		}
	}
	#endif

	#if DATA_SYSTEM == 2
		if(!mysql_connect(MYSQL_SERVER, MYSQL_USER, MYSQL_DB, MYSQL_PASS))
		{
			printf("Could not connect to sql: %s", MYSQL_SERVER);
			printf("Server shutting down in 5 seconds...");
			format(log,256,"Error: Failed to connect to SQL server. \n\r");
			#if LOG_SYSTEM == 1
			WriteLog("server", log);
			#endif
			format(log,256,"Server shutting down in 5 seconds... \n\r");
			#if LOG_SYSTEM == 1
			WriteLog("server", log);
			#endif
			SetTimer("Exit", 5000, false);
		}
		mysql_debug(1);
	    DeleteAllSessions();
	#endif

	new ServerSlots = GetServerVarAsInt("maxplayers");
	if (ServerSlots > 100) {
		printf("Deadly Combinations supports a maximum of 100 server slots...");
		printf("Please change maxplayers in server.cfg to a lower number!");
		format(log,256,"Error: Max player slots too high! \n\r");
		#if LOG_SYSTEM == 1
		WriteLog("server", log);
		#endif
		format(log,256,"Server shutting down in 5 seconds... \n\r");
		#if LOG_SYSTEM == 1
		WriteLog("server", log);
		#endif
		SetTimer("Exit", 5000, false);
	}

	// Set some variable defaults
	Server[SQLQueriesExecuted] = 0;
	Server[NoChat] = false;
	Round[Current] = -1;
	Server[HighestID] =0;
	Round[Gamemode] =0;
	Round[Voting] = false;
	Server[serverLock] = false;
	Server[CantSpawnVehicle] = false;
	Server[SaveResults] = true;
	Server[RoundLimit] = 5;
	Server[AwayTeamSkin] = -1;
	Server[HomeTeamSkin] = -1;
	Round[AdminCanEnd] = false;
	Round[LoadScreen] = false;
	Round[Attackers] = T_AWAY;
	Round[DefTimeLost] = false;
	Server[EPRoundStarted] = false;
	Round[CapturedCheckpoint] = false;
	Server[EnableSkinChanging] = true;
	Server[Slots] = GetMaxPlayers();
	Server[GlobalChatEnabled] = true;
	MatchInfo[AwayRoundsWon] = 0, MatchInfo[HomeRoundsWon] = 0, MatchInfo[RoundsPlayed] = 0;

	if(Server[Slots] >= 250) {
	    Server[MaxVehicles] = 250;
	} else {
	    Server[MaxVehicles] = Server[Slots];
	}

	for(new i = 0; i < 6; i ++)
	{
		Server[EnableSkinChanging][i] = true;
		TeamLocked[i] = false;
	}

	// -----------------------------------
	// Track date and time of server start
	// -----------------------------------
	Server[Init] = GetDateAndTime();
	new hour,minute,second,year,month,day;
	gettime(hour, minute, second);
	getdate(year, month, day);
	format(StartedString,256,"%d/%d/%d - %d:%02d:%02d",month,day,year,hour,minute,second);
	// -----------------------------------

	format(log,256,"D.C. Gamemode Start \n\r");
	#if LOG_SYSTEM == 1
	WriteLog("server", log);
	#endif

	#if DATA_SYSTEM == 1

		for(new i = 0; i < 47; i ++)
		{
			if(IsValidWeaponID(i))
			{
			    new wepid_str[40];
			    format(wepid_str, 40, "%d", i);
				WeaponLimit[i][limit] = dini_Int(WeaponLimits_Config, wepid_str);
				WeaponLimit[i][home_used] = 0;
				WeaponLimit[i][away_used] = 0;

				if (IsValidWepSkillID(i)) {
					WeaponSkill[i] = dini_Int(WeaponSkill_Config, wepid_str);
				}
			}
		}

    #elseif DATA_SYSTEM == 2

		for(new i = 0; i < 47; i ++)
		{
			if(IsValidWeaponID(i))
			{
				WeaponLimit[i][limit] = GetSqlWepLimitData(i);
				WeaponLimit[i][home_used] = 0;
				WeaponLimit[i][away_used] = 0;

				if (IsValidWepSkillID(i)) {
					WeaponSkill[i] = GetSqlWepSkillData(i);
				}
			}
		}

	#endif

	UnsaveDeathMessages();

	PrepareForNextRotation(); // Resets all match info, used after Final Results screen normally

	// Set default team names
	HomeName = "Home";
	AwayName = "Away";
	RefName = "Referee";
	//-----------------------

	print("  ----------------------------------------------------");
	print("  Loading Deadly Combinations.....\n");
	LoadDuelAreas();		// Load the Duels areas
	LoadDMAreas();			// Load the DM areas
	LoadTeleportAreas();	// Load the teleport areas
	LoadServerInfo();		// Load server info
	LoadConfig();			// Load server configuration
	AddGetGunWeapons();		// Add all /getgun command's weapons
	CreateMenus();			// Create all gamemode menus
	CreateTextDraws();		// Create all gamemode textdraws
	LoadTotalBases();		// Load all bases
	LoadTotalTDMs();		// Load all tdms
	FixGaps();              // Fix gaps in the base and tdm id's
	LoadWeapons();			// Load all weapon system info
	CreatePingLabels();     // Creates labels used in player diagnostics
	print("\n  ----------------------------------------------------");
	
	// Set GameModeText
	new tmptext[200];
	#if DEBUG == 0
		#if defined BETA
			format(tmptext, sizeof(tmptext), "%s v%d.%d.%d [BETA %d]", SMALL_GM_NAME, VER_MAJOR, VER_MINOR, VER_REVISION, BETA);
	    #else
			format(tmptext, sizeof(tmptext), "%s v%d.%d.%d", SMALL_GM_NAME, VER_MAJOR, VER_MINOR, VER_REVISION);
		#endif
	#else
		#if defined BETA
			format(tmptext, sizeof(tmptext), "~%s v%d.%d.%d [BETA %d]", SMALL_GM_NAME, VER_MAJOR, VER_MINOR, VER_REVISION, BETA);
	    #else
			format(tmptext, sizeof(tmptext), "~%s v%d.%d.%d", SMALL_GM_NAME, VER_MAJOR, VER_MINOR, VER_REVISION);
		#endif
	#endif
    SetGameModeText(tmptext);
	//-----------------

	// Set server hostname
	new hostname[200];
	#if defined SPECIAL_HOSTNAME
	format(hostname, 200, "hostname %s", SPECIAL_HOSTNAME);
	SendRconCommand(hostname);
	#else
	format(hostname, 200, "hostname    �  Deadly Combinations ~ [%s]  �", ClanTag);
	SendRconCommand(hostname);
	#endif
	//--------------------

	#if DATA_SYSTEM == 2
	UpdateSqlRuntime("servname", hostname);
	UpdateSqlRuntime("map", "Lobby");
	new tempstr[100];
	format(tempstr, 100, "%d", GetServerVarAsInt("port"));
	UpdateSqlRuntime("port", tempstr);
	format(tempstr, 100, "%d", GetMaxPlayers());
	UpdateSqlRuntime("slots", tempstr);
	#endif

	// Some more server defualt configurations
	SetGravity(0.008);
	//AllowAdminTeleport(1);
	AllowInteriorWeapons(1);
	DisableInteriorEnterExits();
	EnableStuntBonusForAll(0);
	UsePlayerPedAnims();
	SetWorldTime(Config[thetime]);
	SetWeather(Config[weather]);
	//----------------------------------------
	#if defined WEB_URL
	new url[64];
	format(url,64,"weburl %s", WEB_URL);
	SendRconCommand(url);
	#endif
	SendRconCommand("mapname Lobby");
	//----------------------------------------

	ClearDeathMessages();

	// Send gamemode initiation messages to IRC echo
	#if IRC == 1
	SetTimer("IRC_Init_Msg", 5000, 0);
	#endif

	// Player classes, class selection
	AddPlayerClass(Config[skin_auto],Lobby[0],Lobby[1],Lobby[2],90.0,0,0,0,0,0,0);// Auto Assign
	AddPlayerClass(Config[skin_home],Lobby[0],Lobby[1],Lobby[2],90.0,0,0,0,0,0,0);// Home
	AddPlayerClass(Config[skin_subhome],Lobby[0],Lobby[1],Lobby[2],90.0,0,0,0,0,0,0);// Home Sub
	AddPlayerClass(Config[skin_away],Lobby[0],Lobby[1],Lobby[2],90.0,0,0,0,0,0,0);// Away
	AddPlayerClass(Config[skin_subaway],Lobby[0],Lobby[1],Lobby[2],90.0,0,0,0,0,0,0);// Away Sub
	AddPlayerClass(Config[skin_ref],Lobby[0],Lobby[1],Lobby[2],90.0,0,0,0,0,0,0);// The Ref
	//--------------------------------

	SetTimer("ShowServerMsg",500000,1);	// Show gamemode info/credit messageon timer
	SetTimer("DestroyEmptyVehicles", 45000, 1); // Destroys empty vehicles
	SetTimer("MainFunctions", 1000, 1); // Basic timer gm needs to perform many different things
	return 1;
}

public OnGameModeExit()
{
	SetGameModeText("N/A"); // Unset GameModeText
	SendRconCommand("weburl www.sa-mp.com"); // Unset Web URL
	SendRconCommand("mapname San Andreas"); // Unset Map

	#if DATA_SYSTEM == 2
	    DeleteAllSessions();
	#endif

	new log[256];
	format(log,256,"D.C. Gamemode Exit \n\r");
	printf(log);
	#if LOG_SYSTEM == 1
	WriteLog("server", log);
	#endif
	return 1;
}

public OnPlayerRequestClass(playerid, classid)
{
	SetPlayerVirtualWorld(playerid, CSEL_VW);
	Player[playerid][class_id] = classid;
	#if DEBUG == 0
		if(Player[playerid][justConn] && Config[UseIntro] == 1)
		{
			
		    TogglePlayerSpectating(playerid, 1);
			format(Player[playerid][TempIntroString],256," ");
			TextDrawBoxColor(text_fadeblack[playerid], 0x00000000);
		    Player[playerid][introStringIndex] = 0;
			Player[playerid][FirstIntroFlash] = false;
			Player[playerid][EndedIntro] = false;
			Player[playerid][inIntro] = true;
			Player[playerid][introIndex] = 0;
			Player[playerid][justConn] = false;
			Player[playerid][justClass] = true;
			Player[playerid][introOffset] = 0;
			TextDrawShowForPlayer(playerid, text_fadeblack[playerid]);
			TextDrawShowForPlayer(playerid, skip_intro);
			TextDrawBoxColor(text_fadeblack[playerid], 0x00000005);
			TextDrawShowForPlayer(playerid, intro_gmname[playerid]);
			TextDrawSetString(intro_gmname[playerid], " ");
			
			Player[playerid][introTimer] = SetTimerEx("Intro", 25, true, "i", playerid);
		    return 0;
		}
	#endif

	if(Player[playerid][inIntro]) {
	    return 0;
	}
	Player[playerid][RequestingClass] = true;

	#if DEBUG == 1
	printf("OnPlayerRequestClass(%s, %d)",PlayerName(playerid),classid);
	#endif

	SetTimerEx("GivePlayerCselWep", 25, false, "i", playerid);

	if(Player[playerid][FirstTime])
	{
		Player[playerid][csel_timer] = SetTimerEx("classsel_cam", 25, true, "i", playerid);
		#if SAMP_VERSION == 2
			StopAudioStreamForPlayerEx(playerid);
			#if defined SOUND_CLASSSELECT
			if(ConfigAudio[sndClassSelect] == true) {
			    PlayAudioStreamForPlayerExEx(playerid, SOUND_CLASSSELECT);
			}
			#endif
		#endif
	}

	if(Player[playerid][FirstTime] == true)
	{
	    Player[playerid][FirstTime] = false;
		SetPlayerCameraLookAt(playerid,CamPositions[Player[playerid][Camera]][0],CamPositions[Player[playerid][Camera]][1],CamPositions[Player[playerid][Camera]][2]);
		SetPlayerCameraPos(playerid,CamPositions[Player[playerid][Camera]][4],CamPositions[Player[playerid][Camera]][5],CamPositions[Player[playerid][Camera]][6]);
		SetPlayerPos(playerid, CamPositions[Player[playerid][Camera]][0],CamPositions[Player[playerid][Camera]][1],CamPositions[Player[playerid][Camera]][2]);
		SetPlayerInterior(playerid,floatround(CamPositions[Player[playerid][Camera]][7]));
		SetPlayerFacingAngle(playerid,CamPositions[Player[playerid][Camera]][3]);
	}

	//DestroyPlayerObject(playerid, Player[playerid][csel_object]);
	//Player[playerid][csel_object] = CreatePlayerObject(playerid, 18102, 0, 0, 0, 0, 0, 0); // lights
	//AttachObjectToPlayer(Player[playerid][csel_object], playerid, 0, 0, 5, 0, 0, 0);

	// Hide the round, lobby and other textdraws they
	// shouldnt be able to see
	HideRoundTextDrawsForPlayer(playerid);
	TextDrawHideForPlayer(playerid, MapNameTD);
    HideLobbyTextDrawsForPlayer(playerid);
	//TextDrawHideForPlayer(playerid, ScoreboardScore);
	TextDrawHideForPlayer(playerid, ScoreboardHome);
	TextDrawHideForPlayer(playerid, ScoreboardAway);
	TextDrawHideForPlayer(playerid, gamemsg_voting);
	TextDrawHideForPlayer(playerid, gamemsg_whowon);
	TextDrawHideForPlayer(playerid, TimerClock);
	TextDrawHideForPlayer(playerid, gamemsg_baseupdatehome);
	TextDrawHideForPlayer(playerid, gamemsg_baseupdateaway);
	TextDrawHideForPlayer(playerid, text_redflash);
	TextDrawHideForPlayer(playerid, gamemsg_cp);
	HideRequestClassTextDraws(playerid);
	//------------------------------------------------

	TextDrawHideForPlayer(playerid, text_fadeblack[playerid]);
	TextDrawHideForPlayer(playerid, intro_gmname[playerid]);

	// Get amount of team members for each team
	new ata, def;

	for(new i = 0; i <= Server[HighestID]; i++)
	{
	    if(IsPlayerConnected(i))
		{
		    if(Player[i][pTeam] == T_AWAY && Player[i][pSpawned])
		    {
				ata++;
			}
			else if(Player[i][pTeam] == T_HOME && Player[i][pSpawned])
		    {
				def++;
			}
		}
	}

	new string[100];

	TextDrawShowForPlayer(playerid,WideScreenUp);
	TextDrawShowForPlayer(playerid,WideScreenDown);

	// Class selection hud with team info
	new classhudstr[200];
	format(classhudstr, 200, "~y~A/D Status: ~w~~h~%s~n~~y~Rounds Won: ~w~~h~%d ~n~~y~Players: ~w~~h~%d", HomeStatus, MatchInfo[HomeRoundsWon], def);
	TextDrawSetString(classhud_home, classhudstr);
	format(classhudstr, 200, "~y~A/D Status: ~w~~h~%s~n~~y~Rounds Won: ~w~~h~%d ~n~~y~Players: ~w~~h~%d", AwayStatus, MatchInfo[AwayRoundsWon], ata);
	TextDrawSetString(classhud_away, classhudstr);

	// Set some variables right, just in case
	Player[playerid][pTeam] = T_NON;
    Player[playerid][pPlaying] = false;
    Player[playerid][setToPlay] = true;
    Player[playerid][pSpawned] = false;

	//SendClientMessage(playerid, COLOR_WHITE, "TESTER");
	switch(classid)
	{
 		case 0: // Auto-Assign
 		{
		  	format(string,100,"             ~b~~h~~h~Auto-Assign");
			TextDrawSetString(ClassTeams_Auto,string);
			TextDrawShowForPlayer(playerid,ClassTeams_Auto);
			Player[playerid][pClass] =5;
			SetPlayerSkin(playerid, Config[skin_auto]);
 		}
	  	case 1: // Home
	  	{
		    if(Config[autobalance])
			    return OnPlayerRequestClass(playerid, 4);

		  	format(string,100,"             %s",HomeName);
		  	TextDrawColor(ClassTeams_Home,GetTeamColor(1, T_HOME) | 0x000000FF);
			TextDrawSetString(ClassTeams_Home,string);
			TextDrawShowForPlayer(playerid,ClassTeams_Home);
			TextDrawShowForPlayer(playerid,classhud1);
			TextDrawShowForPlayer(playerid,classhud2);
			TextDrawBoxColor(classhud3, GetTeamColor(1, T_HOME) | 0x00000066);
			TextDrawShowForPlayer(playerid,classhud3);

			TextDrawShowForPlayer(playerid,classhud_home);
			Player[playerid][pClass] =0;
			if(Server[HomeTeamSkin] != -1) {
	    		SetPlayerSkin(playerid, Server[HomeTeamSkin]);
			} else {
				SetPlayerSkin(playerid, Config[skin_home]);
			}
 		}
 		case 2: // Home Sub
 		{
		    if(Config[autobalance])
			    return OnPlayerRequestClass(playerid, 0);

		  	format(string,100,"             %s ~w~Sub",HomeName);
   		  	TextDrawColor(ClassTeams_Subhome,GetTeamColor(1, T_HOME) | 0x000000FF);
			TextDrawSetString(ClassTeams_Subhome,string);
			TextDrawShowForPlayer(playerid,ClassTeams_Subhome);
			Player[playerid][pClass] =1;
			SetPlayerSkin(playerid, Config[skin_subhome]);
 		}
 	  	case 3: // Away
 		{
		    if(Config[autobalance])
			    return OnPlayerRequestClass(playerid, 4);

		  	format(string,100,"             %s",AwayName,AwayStatus);
      	  	TextDrawColor(ClassTeams_Away,GetTeamColor(1, T_AWAY) | 0x000000FF);
			TextDrawSetString(ClassTeams_Away,string);
			TextDrawShowForPlayer(playerid,ClassTeams_Away);
			TextDrawShowForPlayer(playerid,classhud1);
			TextDrawShowForPlayer(playerid,classhud2);
			TextDrawBoxColor(classhud3, GetTeamColor(1, T_AWAY) | 0x00000066);
			TextDrawShowForPlayer(playerid,classhud3);
			TextDrawShowForPlayer(playerid,classhud_away);
			Player[playerid][pClass] =2;
			if(Server[AwayTeamSkin] != -1) {
	    		//--SetPlayerSkin(playerid, Server[AwayTeamSkin]);
			} else {
				SetPlayerSkin(playerid, Config[skin_away]);
			}
		}
		case 4: // Away Sub
		{
		    if(Config[autobalance])
			    return OnPlayerRequestClass(playerid, 0);

		  	format(string,100,"             %s ~w~Sub",AwayName);
          	TextDrawColor(ClassTeams_Subaway,GetTeamColor(1, T_AWAY) | 0x000000FF);
			TextDrawSetString(ClassTeams_Subaway,string);
			TextDrawShowForPlayer(playerid,ClassTeams_Subaway);
			Player[playerid][pClass] =3;
			SetPlayerSkin(playerid, Config[skin_subaway]);
 		}
		case 5: // Referee
		{
			TextDrawSetString(ClassTeams_Ref,"               ~y~Referee");
			TextDrawShowForPlayer(playerid,ClassTeams_Ref);
			Player[playerid][pClass] =4;
			SetPlayerSkin(playerid, Config[skin_ref]);
		}
	}
    SetPlayerColor(playerid,COLOR_NOTSPAWNED);
    //PlayAudioStreamForPlayerExEx(playerid, "127.0.0.1/sounds/Otis.mp3");
    #if !defined SOUND_CLASSSELECT
    PlayerPlaySound(playerid, 1187, 0, 0, 0);
	#endif
	return 1;
}

public OnPlayerConnect(playerid)
{
	#if SAMP_VERSION == 2
		RemoveBuildingForPlayer(playerid, 7418, 1347.8984, 2149.5547, 10.0156, 0.25); // Wall around baseball stadium in LV
	    RemoveBuildingForPlayer(playerid, 16094, 191.1406, 1870.0391, 21.4766, 1000.0); // Fence around area 51

	    // Vending machines
	    RemoveBuildingForPlayer(playerid, 1302, 0.0, 0.0, 0.0, 9999.0);
		RemoveBuildingForPlayer(playerid, 1209, 0.0, 0.0, 0.0, 9999.0);
		RemoveBuildingForPlayer(playerid, 955, 0.0, 0.0, 0.0, 9999.0);
		RemoveBuildingForPlayer(playerid, 1755, 0.0, 0.0, 0.0, 9999.0);
		RemoveBuildingForPlayer(playerid, 1776, 0.0, 0.0, 0.0, 9999.0);
		
		// exploding barrels and gas tanks
		RemoveBuildingForPlayer(playerid, 1225, 0.0, 0.0, 0.0, 9999.0);
		RemoveBuildingForPlayer(playerid, 1244, 0.0, 0.0, 0.0, 9999.0);

	#endif
	
	Player[playerid][Damage] = 0;

	Player[playerid][justConn] = true;
	Player[playerid][pMoney] = false;
	Player[playerid][boundsSet] = false;

	Server[pConnected]++;
	Server[TotalConnections] ++;

	if(playerid > Server[HighestID]) {
		Server[HighestID] = playerid;
	}

	Player[playerid][State] = STATE_CONNECT;
	Player[playerid][Status] = STATUS_PLAYING;

	#if DEBUG == 1
	printf("OnPlayerConnect(%s)",PlayerName(playerid));
	#endif

	format(PlayerSavedNames[playerid],24,"%s",PlayerName2(playerid));
	format(PlayerRootNames[playerid],24,"%s",PlayerName2(playerid));
	for(new slots = 0; slots < 13; slots++)
	{
		PlayerGuns[playerid][slots] = 0;
	}

	Player[playerid][DM] = 0;
	Player[playerid][DMKills] = 0;
	Player[playerid][DMDeaths] = 0;
	Player[playerid][DMPlayTime] = 0;
	Player[playerid][DMKillSpree] = 0;
	Player[playerid][TempDMKills] = 0;
	Player[playerid][TempDMDeaths] = 0;

	Player[playerid][Camera] = random(sizeof(CamPositions));
	Player[playerid][ChatAllowed] = Server[GlobalChatEnabled];
	Player[playerid][Suicided] = false;
	Player[playerid][CanSync] = true;
	Player[playerid][CanScrollSpec] = true;
	Player[playerid][ChangedNick] = false;
	Player[playerid][FirstSpawn] = true;
	Player[playerid][Lobbytextdraws] = false;
	Player[playerid][Visible] = false;
	Player[playerid][PlayerHUDTextDrawCreated] = false;
	Player[playerid][PlayerHUDTextDrawShown] = false;
	Player[playerid][CancelDuel] = false;
	Player[playerid][ViewBase] = false;
	Player[playerid][ViewTDM] = false;
	Player[playerid][SpecingBase] = false;
	Player[playerid][superadmin] = false;
	Player[playerid][admin] = false;
	Player[playerid][pVoted] = false;
	Player[playerid][pPlaying] = false;
	Player[playerid][pSpawned] = false;
	Player[playerid][Specing] = false;
	Player[playerid][setToPlay] = false;
	Player[playerid][loggedin] = false;
	Player[playerid][vHud] = false;
	Player[playerid][GamemodeOwner] = false;
	Player[playerid][lock_pass] = false;
	Player[playerid][IgnoreSpawnCallback] = false;
	Player[playerid][IntroPos] = random(sizeof(IntroPositions));
	Player[playerid][FirstTime] = true;
	Player[playerid][inCmdIntro] = false;
	Player[playerid][registered] = false;
	Player[playerid][setToPlay] = true;
	Player[playerid][Damage] = 0;

	for(new i = 0; i < MAX_COUNT_WEAPONS; i++)
	{
		Player[playerid][pWeaponsDeaths][i] = 0;
		Player[playerid][pWeaponsKills][i] = 0;
	}

    Player[playerid][TempTime] = GetDateAndTime();
    Player[playerid][ViewTDMID] = 0;
    Player[playerid][ViewBaseID] = 0;
    Player[playerid][pCarColor1] = -1;
    Player[playerid][pCarColor2] = -1;
    Player[playerid][pLevel] = 0;
    Player[playerid][pDuel] = 0;

	Player[playerid][DuelsWon] = 0;
	Player[playerid][DuelsLost] = 0;
    Player[playerid][pArmour] = 0;
    Player[playerid][pHealth] = 0;
    Player[playerid][NamePrefix] = 4;
    Player[playerid][LastDamage] = 0;
    Player[playerid][pHits] = 0;
    Player[playerid][VehicleID] = -1;
    Player[playerid][InPickup] = -1;
	Player[playerid][RequestClassAngle] = 0.0;
	Player[playerid][CamRotationAngle] = 45.0;
	Player[playerid][RoundsPlayedEx] = 0;
	Player[playerid][Kills] = 0;
	Player[playerid][RoundKillsEx] = 0;
	Player[playerid][RoundDeathsEx] = 0;
	Player[playerid][Deaths] = 0;
	Player[playerid][TempKillSpree] = 0;
	Player[playerid][TempDeathSpree] = 0;
	Player[playerid][KillSpree] = 0;
	Player[playerid][DeathSpree] = 0;
	Player[playerid][CaptureTimes] = 0;
	Player[playerid][OnlineTime] = 0;
	Player[playerid][RoundScore] = 0;
	Player[playerid][SpawnType] = 0;
 	Player[playerid][pClass] = 0;
 	Player[playerid][PrimaryWep] = 0;
 	Player[playerid][PrimaryWepAmmo] = 0;
 	Player[playerid][SecondaryWep] = 0;
 	Player[playerid][SecondaryWepAmmo] = 0;
  	Player[playerid][TerciaryWep] = 0;
 	Player[playerid][TerciaryWepAmmo] = 0;
 	Player[playerid][SpecialWep] = 0;
 	Player[playerid][SpecialWepAmmo] = 0;
 	Player[playerid][pSkin] = -1;
 	Player[playerid][pScore] = 0;
	Player[playerid][InHappyEnding] = false;
	Player[playerid][AFK] = false;

    Player[playerid][NowTracking] = INVALID_PLAYER_ID;
 	Player[playerid][gSpectateID] = INVALID_PLAYER_ID;

	PlayerMatchInfo[playerid][TotalKills] = 0;
	PlayerMatchInfo[playerid][TotalDeaths] = 0;
	PlayerMatchInfo[playerid][RoundDeaths] = 0;
	PlayerMatchInfo[playerid][RoundKills] = 0;
	PlayerMatchInfo[playerid][Died] = false;
	PlayerMatchInfo[playerid][DidPlayMatch] = false;
	PlayerMatchInfo[playerid][PlayingMatch] = false;
	PlayerMatchInfo[playerid][StartedPlaying] = false;

	SetPlayerSkillLevel(playerid, WEAPONSKILL_PISTOL, WeaponSkill[22]);
	SetPlayerSkillLevel(playerid, WEAPONSKILL_PISTOL_SILENCED, WeaponSkill[23]);
	SetPlayerSkillLevel(playerid, WEAPONSKILL_DESERT_EAGLE, WeaponSkill[24]);
	SetPlayerSkillLevel(playerid, WEAPONSKILL_SHOTGUN, WeaponSkill[25]);
	SetPlayerSkillLevel(playerid, WEAPONSKILL_SAWNOFF_SHOTGUN, WeaponSkill[26]);
	SetPlayerSkillLevel(playerid, WEAPONSKILL_SPAS12_SHOTGUN, WeaponSkill[27]);
	SetPlayerSkillLevel(playerid, WEAPONSKILL_MICRO_UZI, WeaponSkill[28]);
	SetPlayerSkillLevel(playerid, WEAPONSKILL_MP5, WeaponSkill[29]);
	SetPlayerSkillLevel(playerid, WEAPONSKILL_AK47, WeaponSkill[30]);
	SetPlayerSkillLevel(playerid, WEAPONSKILL_M4, WeaponSkill[31]);
	SetPlayerSkillLevel(playerid, WEAPONSKILL_SNIPERRIFLE, WeaponSkill[34]);

	if(Server[AutoHUD] == true)
	{
		PlayerHUD[playerid][Activated] = true;
		PlayerHUD[playerid][Type] = HUD_AUTO;
	}


	new string[256], string2[256], ip[24];
	GetPlayerIp(playerid, ip,24);

	GetPlayerCountry(playerid, GeoIP[playerid][Country], 70);
	GetPlayerCity(playerid, GeoIP[playerid][City], 70);
	GetPlayerISP(playerid, GeoIP[playerid][ISP], 70);
	
	if (dini_Exists(GeoIP_MainFile) && !dini_Exists(GeoIP_CityFile)) {
	    format(string, 256, "{BABABA}%c {FFFFFF}%s {BABABA}(ID: %d) ���� ������ �����ϼ̽��ϴ�. (����: {FFFFFF}%s{BABABA})", 187, PlayerName(playerid), playerid, GeoIP[playerid][Country]);
	    format(string, 256, "{BABABA}%c {FFFFFF}%s {BABABA}(ID: %d) ���� ������ �����ϼ̽��ϴ�. (����: {FFFFFF}%s{BABABA})", 187, PlayerName(playerid), playerid, GeoIP[playerid][Country]);
	}

	else if (dini_Exists(GeoIP_MainFile) && dini_Exists(GeoIP_CityFile)) {
		format(string, 256, "{BABABA}%c {FFFFFF}%s {BABABA}(ID: %d) ���� ������ �����ϼ̽��ϴ�. (����: {FFFFFF}%s, %s{BABABA})", 187, PlayerName(playerid), playerid, GeoIP[playerid][City], GeoIP[playerid][Country]);
		format(string2, 256, "{BABABA}%c {FFFFFF}%s {BABABA}(ID: %d) ���� ������ �����ϼ̽��ϴ�. (����: {FFFFFF}%s, %s{BABABA}) (IP: {FFFFFF}%s{BABABA})", 187, PlayerName(playerid), playerid, GeoIP[playerid][City], GeoIP[playerid][Country], ip);
	} else {
		format(string, 256, "{BABABA}%c {FFFFFF}%s {BABABA}(ID: %d) ���� ������ �����ϼ̽��ϴ�.", 187, PlayerName(playerid), playerid);
		format(string2, 256, "{BABABA}%c {FFFFFF}%s {BABABA}(ID: %d) ���� ������ �����ϼ̽��ϴ�. (IP: {FFFFFF}%s{BABABA})", 187, PlayerName(playerid), playerid, ip);
	}
	
	new log[256];
	format(log,256,"[CONNECT] %s (IP: %s) (Location: %s, %s) (ISP: %s) \n\r", PlayerName(playerid), ip, GeoIP[playerid][City], GeoIP[playerid][Country], GeoIP[playerid][ISP]);
	#if LOG_SYSTEM == 1
	WriteLog("server", log);
	#endif


	for(new i = 0; i <= Server[HighestID]; i ++)
	{
	    if(IsPlayerConnected(i))
	    {
		    PlayerPlaySound(i, 1084, 0, 0, 0);
			if(IsPlayerRootAdmin(i) || IsPlayerAdmin3(i) || IsPlayerAdmin(i))
			{
				SendClientMessageEx(i,COLOR_GREY, string2);
			}
			else
			{
    			SendClientMessageEx(i,COLOR_GREY, string);
			}
		}
	}

	SendClientMessageEx(playerid, COLOR_LIGHTPURPLE, "{FFFFFF}! {7340DB}TangE A/D �� ���� ���� ȯ���մϴ�!");

	new onfoot, incar, weapon_rate, stream_rate;
	onfoot = GetServerVarAsInt("onfoot_rate");
	incar = GetServerVarAsInt("incar_rate");
	weapon_rate = GetServerVarAsInt("weapon_rate");
	stream_rate = GetServerVarAsInt("stream_rate");

	format(log, sizeof(log), "{FFFFFF}%c%c {BABABA}Server Data: {FFFFFF}onfoot_rate=%d, incar_rate=%d, weapon_rate=%d, stream_rate=%d", 187, 187, onfoot, incar, weapon_rate, stream_rate);
	SendClientMessageEx(playerid, COLOR_GREYBLUE, log);

	#if DATA_SYSTEM == 2
		AddNewGameSession(playerid, PlayerName(playerid), PlayerIp(playerid), GeoIP[playerid][Country]);
		if (!SqlCountryExist(GeoIP[playerid][Country])) {
			SqlCreateCountryRow(GeoIP[playerid][Country]);
		}
		SqlCountryUpdate(GeoIP[playerid][Country], "connections");
		if (IsPlayerInClan(playerid)) {
			if (!SqlClanExist(GetPlayerClanTag(playerid))) {
		    	SqlCreateClanRow(GetPlayerClanTag(playerid));
			}
			SqlClanUpdate(GetPlayerClanTag(playerid), "connections");
		}
	#endif

	SetPlayerColor(playerid, COLOR_NOTSPAWNED);

 	new logstring[256];

	if(Config[regmode] != 0) {
 	#if DATA_SYSTEM == 1
 		new pfile[200];
		format(pfile, sizeof(pfile), "combinations/players/%s.ini", nick_encode(PlayerName(playerid)));

 		if(dini_Exists(pfile))
		{
			new pip[24];
			GetPlayerIp(playerid, pip, 24);
			if(AuthByIP(pip, dini_Get(pfile,"lastloginip")) && Config[autologin] == 1)
			{
				new string3[256];
	  			LoadAccount(playerid); // load account, sets their variables correctly and loads info
				format(string3,256,"-NickServ- ����� ���������� �ڵ�-�α��� �Ǽ̽��ϴ�. [����: %s | ų: %d | ����: %d]", GetPlayerLevelName(playerid), Player[playerid][RoundKillsEx], Player[playerid][RoundDeathsEx]);
				SendClientMessageEx(playerid, COLOR_GREEN,  string3); // successful login
				Player[playerid][loggedin] = true; // yes, logged in
			} else {
				Player[playerid][registered] = true;
				format(logstring,256,"-NickServ- �� �г����� �̹� ���ԵǾ��ֽ��ϴ�.");
				SendClientMessageEx(playerid,COLOR_YELLOW,logstring);
			}
		}
	#elseif DATA_SYSTEM == 2
 		if(SqlUserExist(PlayerName(playerid)))
		{
			new pip[24];
			GetPlayerIp(playerid, pip, 24);
			if(SqlAuthByIP(pip, GetSqlUserDataStr(PlayerName(playerid), "lastloginip")) && Config[autologin] == 1)
			{
				new string3[256];
	  			LoadAccount(playerid); // load account, sets their variables correctly and loads info
	  			LoginGameSession(playerid);
				format(string3,256,"-NickServ- You were successfully auto-logged into your account. [Account ID: %d | Status: %s | Kills: %d | Deaths: %d]", GetSqlUserID(PlayerName(playerid)), GetPlayerLevelName(playerid), Player[playerid][RoundKillsEx], Player[playerid][RoundDeathsEx]);
				SendClientMessageEx(playerid, COLOR_GREEN,  string3); // successful login
				Player[playerid][loggedin] = true; // yes, logged in
			} else {
				Player[playerid][registered] = true;
				format(logstring,256,"-NickServ- This nickname is registered, please login in order to play.");
				SendClientMessageEx(playerid,COLOR_YELLOW,logstring);
			}
		}
	#endif
	}

	if(Server[serverLock])
	{
		Player[playerid][lock_pass] = false;
		SendClientMessageEx(playerid,COLOR_RED, "! SERVER LOCKED: ���� ��й�ȣ�� �Է��ϼ���! (/pass [��й�ȣ])");
		SendClientMessageEx(playerid,COLOR_RED, "! SERVER LOCKED: ��й�ȣ�� �Է����� ������ 30�� �Ŀ� ������ ����˴ϴ�.");
		SetTimerEx("CheckServPass", 30000, 0, "%d", playerid);
	}
	if(Round[Current] != -1)
	{
		if(Server[AutoReadd] == true)
		{
			for(new i = 0; i < SAVE_SLOTS; i ++)
			{
			    if(isStringSame(SaveVariables[i][pName], PlayerName(playerid), 24))
			    {
					Player[playerid][justConn] = false;
					return 1;
				}
			}
		}
	}
	return 1;
}

public OnPlayerStreamIn(playerid, forplayerid)
{
    if (Round[Current] != -1) MarkerStealth();
    
    SetPlayerTeam(playerid, GetPlayerTeam(playerid));
    SetPlayerTeam(forplayerid, GetPlayerTeam(forplayerid));
    return 1;
}

public OnPlayerStreamOut(playerid, forplayerid)
{
    if (Round[Current] != -1) MarkerStealth();
    return 1;
}

public OnPlayerSpawn(playerid)
{
	/*
	RemoveBuildingForPlayer(playerid, 9587, -2401.1406, 1544.9375, 23.5938, 0.25);
	RemoveBuildingForPlayer(playerid, 9621, -2401.1406, 1544.9375, 23.5938, 0.25);
	
	RemoveBuildingForPlayer(playerid, 713, -2022.2344, 933.8281, 43.7500, 9999999);
	RemoveBuildingForPlayer(playerid, 731, -2070.7109, 1194.4688, 45.4844, 9999999);
	RemoveBuildingForPlayer(playerid, 673, -2194.8594, 961.5469, 78.2344, 9999999);
	RemoveBuildingForPlayer(playerid, 715, -2093.0859, 937.1328, 77.3203, 9999999);
	RemoveBuildingForPlayer(playerid, 768, -2765.3359, 972.5078, 55.6094, 9999999);
	RemoveBuildingForPlayer(playerid, 733, -2210.8359, 1029.7656, 78.5469, 999999);
	RemoveBuildingForPlayer(playerid, 774, -2432.6250, 538.5469, 29.3438, 999999);
	RemoveBuildingForPlayer(playerid, 10012, -1767.9531, 1052.8984, 48.3047, 999999);
	RemoveBuildingForPlayer(playerid, 10146, -2021.7422, 900.1953, 57.0078, 999999);
	RemoveBuildingForPlayer(playerid, 9885, -2633.9844, 586.9688, 38.3125, 999999);
	*/

	#if SAMP_VERSION == 2
		if (ConfigAudio[sndChoppers] == false) {
			PlayerPlaySound(playerid, 1000, 0, 0, 0);
		}

		if(Player[playerid][IsAudioStreaming] == true) StopAudioStreamForPlayerEx(playerid);
	#endif
	
    TextDrawShowForPlayer(playerid,FPS[playerid]);
    if (!Player[playerid][pMoney]) {
    	TextDrawShowForPlayer(playerid, health_plus);
    }

	/*for(new x=0; x<Server[HighestID]+1; x++)
	{
	    if(GetPlayerState(x) == PLAYER_STATE_SPECTATING && Player[x][gSpectateID] == playerid)
		{
 			TogglePlayerSpectating(x, 1);
	        PlayerSpectatePlayer(x, playerid);
		}
	}*/

	Player[playerid][FirstTime] = true;
	Player[playerid][pSpawned] = true;

	Player[playerid][State] = STATE_UNPAUSED;
	#if DEBUG == 1
	printf("OnPlayerSpawn(%s)",PlayerName(playerid));
	#endif

	if(Player[playerid][IgnoreSpawnCallback] == true)
	{
	    Player[playerid][IgnoreSpawnCallback] = false;
	    return 0;
	}

	new firstspawn = Player[playerid][FirstSpawn];
	if(Player[playerid][FirstSpawn] == true)
	{
		Player[playerid][FirstSpawn] = false;
		TimeTextForPlayer(playerid, text_rules, 6000);
	}

	HideRequestClassTextDraws(playerid);

	TextDrawHideForPlayer(playerid,WideScreenUp);
	TextDrawHideForPlayer(playerid,WideScreenDown);

	TextDrawShowForPlayer(playerid, MapNameTD);
	TextDrawShowForPlayer(playerid, ScoreboardHome);
	TextDrawShowForPlayer(playerid, ScoreboardAway);

	if(Server[EPRoundStarted] == true)
		HideLobbyTextDrawsForPlayer(playerid);

	new bool:wasReAdded = false;

	if(Round[Current] != -1)
	{
	    if(Player[playerid][Lobbytextdraws] == true)
	    {
	    	HideLobbyTextDrawsForPlayer(playerid);
	    }
	    if(Player[playerid][Roundtextdraws] == false)
	    {
			ShowRoundTextDrawsForPlayer(playerid);
		}

		new string[256];
		if(Server[AutoReadd] == true)
		{
			for(new i = 0; i < SAVE_SLOTS; i ++)
			{
			    if(isStringSame(SaveVariables[i][pName], PlayerName(playerid), 24))
			    {
			        wasReAdded = true;
			        SetPlayerPos(playerid, SaveVariables[i][pCoords][0],SaveVariables[i][pCoords][1],SaveVariables[i][pCoords][2]+2);
		 			SetPlayerFacingAngle(playerid, SaveVariables[i][pCoords][3]);
					SetPlayerInterior(playerid, SaveVariables[i][pInterior]);
					SetPlayerVirtualWorld2(playerid, SaveVariables[i][pVWorld]);

					SetPlayerHealth(playerid,SaveVariables[i][pHealth]);
					SetPlayerArmour(playerid,SaveVariables[i][pArmour]);

					SetPlayerSkin(playerid, SaveVariables[i][pSkin]);

			        Player[playerid][pTeam] = SaveVariables[i][pTeam];
			        Player[playerid][pClass] = SaveVariables[i][pClass];

					Player[playerid][pScore] = SaveVariables[i][SvScore];
					PlayerMatchInfo[playerid][TotalKills] = SaveVariables[i][SvTotalKills];
					PlayerMatchInfo[playerid][TotalDeaths] = SaveVariables[i][SvTotalDeaths];

		       		Player[playerid][setToPlay] = true;
		  		   	SetPlayerColor(playerid,GetTeamColor(1, Player[playerid][pTeam])  | 0x000000FF);

					Player[playerid][pPlaying] = true;
					Player[playerid][Status] = STATUS_PLAYING;

            		if(Server[TkMode])
					{
	   					if(Player[playerid][pTeam] == T_AWAY) {
			   				SAMP_SetPlayerTeam(playerid,1);
	   					} else if(Player[playerid][pTeam] == T_HOME ) {
			   				SAMP_SetPlayerTeam(playerid,2);
   						} else if(Player[playerid][pTeam] == T_REF) {
	   		    			SAMP_SetPlayerTeam(playerid,3);
						}
	   				}

					if(Round[Gamemode] == BASE)
					{
						SetPlayerCheckpoint(playerid,Checkpoint[0],Checkpoint[1],Checkpoint[2],Config[cp_size]);
					}

			    	new numofweps = 0;
			    	for(new slots = 0; slots < 13; slots++)
					{
					    if(SaveVariables[i][pWeapons][slots] > 0)
					    {
					        new weapon1 = SaveVariables[i][pWeapons][slots];
             				if(Player[playerid][pTeam] == T_HOME && WeaponLimit[weapon1][limit] <= WeaponLimit[weapon1][home_used]) {
								TogglePlayerControllable(playerid, 0);
								TryGunMenu(1, playerid);
								SendClientMessage(playerid, COLOR_YELLOW, "{FF0000}� Error: {FFFFFF}����� ������ �ߺ��� �߰��߽��ϴ�, �ٸ� ���⸦ �����ϼ���.");
								break;
							}
							else if(Player[playerid][pTeam] == T_AWAY && WeaponLimit[weapon1][limit] <= WeaponLimit[weapon1][away_used]) {
								TogglePlayerControllable(playerid, 0);
								TryGunMenu(1, playerid);
								SendClientMessage(playerid, COLOR_YELLOW, "{FF0000}� Error: {FFFFFF}����� ������ �ߺ��� �߰��߽��ϴ�, �ٸ� ���⸦ �����ϼ���.");
								break;
							}
							// use <= BECAUSE the [team]_used var will +1 when they get their weps.
							
							if(Player[playerid][pTeam] == T_AWAY) WeaponLimit[weapon1][away_used]++;
							else if(Player[playerid][pTeam] == T_HOME) WeaponLimit[weapon1][home_used]++;
							
							
							GivePlayerWeaponEx(playerid,SaveVariables[i][pWeapons][slots],SaveVariables[i][pAmmo][slots]);
							numofweps++;
						}
      				}

					if(numofweps == 0) {
						TogglePlayerControllable(playerid, 0);
						TryGunMenu(1, playerid);
					}

					SaveVariables[i][pSkin] = 0;

			        SaveVariables[i][pCoords][0] = 0.0;
					SaveVariables[i][pCoords][1] = 0.0;
					SaveVariables[i][pCoords][2] = 0.0;
					SaveVariables[i][pCoords][3] = 0.0;

					format(SaveVariables[i][pName], 24," ");

					SaveVariables[i][pHealth] = 0.0;
					SaveVariables[i][pHealth] = 0.0;
					SaveVariables[i][pInterior] = 0;
					SaveVariables[i][pVWorld] = 0;

			        SaveVariables[i][pTeam] = 0;

			        SaveVariables[i][pClass] = 0;

			    	for(new slots = 0; slots < 13; slots++)
					{
						SaveVariables[i][pWeapons][slots] = 0;
						SaveVariables[i][pAmmo][slots] = 0;
					}


			        format(string,256,"** %s ���� ��⿡ �� �����Ǽ̽��ϴ�.", PlayerName(playerid));
			    	SendClientMessageToAllEx(COLOR_ORANGE, string);

					SetCameraBehindPlayer(playerid);
					SetTimerEx("FixCam", 300, false, "i", playerid);

					if(Round[Paused] >= 1) {
						TogglePlayerControllable(playerid, 0);
						if(Round[Paused] == 2 && Config[autopause] == 1) {
						    StartUnpause(3);
						}
					}
			    }
			}
		}
	}

	if (!wasReAdded) {
		for(new i = 0; i < MAX_PLAYERS; i ++)
		{
		    if(isStringSame(BeyondDiscon[i][pName], RemoveClanTagFromName(playerid), 24))
		    {
				BeyondDiscon_Load(playerid, i);
			}
		}
	}

	if(!Player[playerid][pPlaying] && Server[DisplayHintMessages] == true && Player[playerid][InHappyEnding] == false)
	{
		new rand = random(sizeof(HintMessages));
		TimeTextForPlayer(playerid, text_hint[rand], 10000);
	}

	PlayerPlaySound(playerid, 1188, 0, 0, 0);

	if(!Player[playerid][AFK])
	{
		Player[playerid][setToPlay] = true;
	}
	switch(Player[playerid][pClass])
	{
	    case 0: //Home
	    {
		    if(Round[Current] != -1 && Player[playerid][pPlaying])
				SetPlayerColor(playerid,GetTeamColor(1, T_HOME)  | 0x000000FF);
			else
				SetPlayerColor(playerid,GetTeamColor(0, T_HOME)  | 0x000000FF);

			Player[playerid][pTeam] = T_HOME;
			Player[playerid][pClass] =0;

            #if DATA_SYSTEM == 2
				SetTeamGameSession(playerid, HomeName);
			#endif
	    }
	    case 1: //Sub home
	    {
			SetPlayerColor(playerid,GetTeamColor(0, T_HOME)  | 0x000000FF);
			Player[playerid][pTeam] = T_SUBHOME;
			Player[playerid][setToPlay] = false;
			Player[playerid][pClass] =1;
			new tname[256];
			format(tname, 256, "Sub %s", HomeName);
            #if DATA_SYSTEM == 2
				SetTeamGameSession(playerid, tname);
			#endif

	    }
   		case 2: //Away Team
		{
		    if(Round[Current] != -1 && Player[playerid][pPlaying])
				SetPlayerColor(playerid,GetTeamColor(1, T_AWAY)  | 0x000000FF);
			else
				SetPlayerColor(playerid,GetTeamColor(0, T_AWAY)  | 0x000000FF);

			Player[playerid][pTeam] = T_AWAY;
			Player[playerid][pClass] =2;

            #if DATA_SYSTEM == 2
				SetTeamGameSession(playerid, AwayName);
			#endif
		}
		case 3: //Sub away
		{
			SetPlayerColor(playerid,GetTeamColor(0, T_AWAY)  | 0x000000FF);
			Player[playerid][pTeam] = T_SUBAWAY;
			Player[playerid][setToPlay] = false;
			Player[playerid][pClass] =3;
			new tname[256];
			format(tname, 256, "Sub %s", AwayName);

            #if DATA_SYSTEM == 2
				SetTeamGameSession(playerid, tname);
			#endif
		}
		case 4:// Ref
	    {
			SetPlayerColor(playerid,COLOR_REF);
			Player[playerid][pTeam] = T_REF;
			Player[playerid][pClass] =4;

            #if DATA_SYSTEM == 2
				SetTeamGameSession(playerid, RefName);
			#endif
		}
	}
	/*new skin = GetCurrentSkin(playerid);
	new string[10];
	format(string, sizeof(string), "%d", skin);
	printf(string);
	SetCameraBehindPlayer(playerid);*/
	SetTimerEx("SetPlayerSkinEx", 0, 0, "d", playerid);
	// using call local function instead of just regularly calling the function fixes some massive client crashing issues, for some reason...
	//CallLocalFunction("SetPlayerSkinEx", "d", playerid);

	if(Round[Current] != -1 || Server[EPRoundStarted] == true)
	{
		if(Round[Gamemode] == TDM && (Round[Gameplay] == WAR_ZONE || Round[Gameplay] == RUMBLE) && Player[playerid][setToPlay] == true)
		{
			Player[playerid][pPlaying] = true;
			AttackerVehicle[playerid][hasSpawned] = false;
		    PlayerPlaySound(playerid,1057,0.0,0.0,0.0);
			TogglePlayerControllable(playerid,1);
			SetCameraBehindPlayer(playerid);
			PlayerSpawnKillProtection(playerid);
			SetTimerEx("SetPlayerHealthEx",Config[antisktime], false, "id", playerid, Config[roundhealth]);
			SetTimerEx("SetPlayerArmourEx",Config[antisktime], false, "id", playerid, Config[roundarmour]);
			SetTimerEx("StrapUp", Config[antisktime], false, "i", playerid);

			Player[playerid][Status] = STATUS_PLAYING;
			Player[playerid][setToPlay] = true;

			SetPlayerInterior(playerid, Round[Interior]);

			if(Config[forcetime] == -1) SetWorldTime(Round[WorldTime]);
			else SetWorldTime(Config[forcetime]);

		    SetPlayerVirtualWorld2(playerid,ROUND_VW);

			if(Round[Gamemode] == BASE)
			{
				SetPlayerCheckpoint(playerid,Checkpoint[0],Checkpoint[1],Checkpoint[2],Config[cp_size]);
			}

		   	SetPlayerWorldBoundsEx(playerid,MaxX,MinX,MaxY,MinY);

			if(Player[playerid][pTeam] == T_AWAY)
			{
			    Round[atotal]++;
			    SetTimerEx("SetPlayerPosEx", 150, 0, "dfff", playerid, AwaySpawn[0], AwaySpawn[1], AwaySpawn[2]+2);
			   	//SetPlayerPos(playerid,AwaySpawn[0],AwaySpawn[1],AwaySpawn[2]+2);
			   	SetPlayerColor(playerid,GetTeamColor(1, T_AWAY) | 0x000000FF);
			   	if(Server[TkMode]) {
			   		SAMP_SetPlayerTeam(playerid,1);
				}
			} else if(Player[playerid][pTeam] == T_HOME) {
				Round[dtotal]++;
				SetTimerEx("SetPlayerPosEx", 150, 0, "dfff", playerid, HomeSpawn[0],HomeSpawn[1],HomeSpawn[2]+2);
			   	//SetPlayerPos(playerid,HomeSpawn[0],HomeSpawn[1],HomeSpawn[2]+2);
			   	SetPlayerColor(playerid,GetTeamColor(1, T_HOME) | 0x000000FF);
			   	if(Server[TkMode]) {
			   		SAMP_SetPlayerTeam(playerid,2);
				}
			} else if(Player[playerid][pTeam] == T_REF && Config[RefMode] == 1)
			{
			    SetTimerEx("SetPlayerPosEx", 150, 0, "dfff", playerid, Checkpoint[0],Checkpoint[1],Checkpoint[2]+2);
       			//SetPlayerPos(playerid,Checkpoint[0],Checkpoint[1],Checkpoint[2]+2);
			    SetPlayerColor(playerid,COLOR_REF);
			    if(Server[TkMode]) {
			    	SAMP_SetPlayerTeam(playerid,3);
				}
			} else {
			    #if DEBUG == 1
			    new string[128];
			    format(string, sizeof(string), "playerid: %d, team: %d, bounds set: %d, settoplay: %d, vworld: %d, interior: %d");
				SendClientMessageToAll(COLOR_YELLOW, "Player failed to add in a Respawn TDM, here's some debug that came back:");
				SendClientMessageToAll(COLOR_YELLOW, string);
				#endif
			}
			SetCameraBehindPlayer(playerid);
			SetTimerEx("FixCam", 300, false, "i", playerid);
			OnPlayerLeaveCheckpoint(playerid);

			if(firstspawn) {
			    TryGunMenu(1, playerid);
			    TogglePlayerControllable(playerid, 0);
			}
			return 1;
		}
	}

	if(Player[playerid][pPlaying] == true && (Round[Current] != -1))
	{
		SetPlayerVirtualWorld2(playerid, ROUND_VW);
		return 1;
	}

	// Player not playing (in lobby)
	if(Player[playerid][SpawnType] != LOBBY_SPAWN)
	{
		SetPlayerInterior(playerid,floatround(Spawn[playerid][3]));
		SetPlayerPos(playerid,Spawn[playerid][0], Spawn[playerid][1],Spawn[playerid][2]+2);
	}
	else
	{
		SetPlayerInterior(playerid,Config[LobbyInterior]);
		SetPlayerPos(playerid,Lobby[0]+2-random(2),Lobby[1]+2-random(2),Lobby[2]+2);
	}

	//PlayerSpawnKillProtection(playerid);
	SetTimerEx("SetPlayerArmourEx",Config[antisktime], false, "id", playerid, Config[globalarmour]);
	SetTimerEx("SetPlayerHealthEx",Config[antisktime], false, "id", playerid, Config[globalhealth]);
	SetPlayerVirtualWorld2(playerid, LOBBY_VW);

	SetTimerEx("FixCam", 300, false, "i", playerid);

	SetPlayerTeam(playerid,playerid);
	SetPlayerWorldBoundsEx(playerid,9999.9,-9999.9,9999.9,-9999.9);
	if(Config[LobbyWeapons] == 1)
	{
		if(Player[playerid][DM] == 0) SetTimerEx("GiveLobbyWeapons",Config[antisktime], false, "i", playerid);

	}
	else
	{
	    ResetPlayerWeapons(playerid);
	}

	DisablePlayerCheckpoint(playerid);

	if(Player[playerid][DM] != 0)
	{
	    OnPlayerEnterDM(playerid, Player[playerid][DM], false);
	}

	return 1;
}


public OnPlayerRequestSpawn(playerid)
{
    if(Server[serverLock] == true && Player[playerid][lock_pass] == false)
    {
   		SendClientMessageEx(playerid, COLOR_DARKRED, "������ ����ֽ��ϴ�, ������ �ϱ����� ��й�ȣ�� �Է��ϼ���!");
		return 0;
	}

	if(Config[regmode] == 2 && Player[playerid][loggedin] == false)
    {
   		SendClientMessageEx(playerid, COLOR_DARKRED, "Error: ����� �ݵ�� ������ �ϼž� �մϴ�. (/register)!");
		return 0;
	}

	#if DEBUG == 0
    if(Player[playerid][registered] == true && Player[playerid][loggedin] == false && Config[regmode] != 0)
    {
   		SendClientMessageEx(playerid, COLOR_DARKRED, "-NickServ- �� �г����� �̹� ���ԵǾ��ֽ��ϴ�, �α����� �ϱ����� ��й�ȣ�� �Է��ϼ���!");
		return 0;
	}
	#endif
	if(TeamLocked[Player[playerid][pClass]] == true)
	{
		SendClientMessageEx(playerid, COLOR_DARKRED, "Error: �� ���� ��Ȱ��ȭ �Ǿ��ֽ��ϴ�!");
	    return 0;
	}

	if(Player[playerid][inIntro])
	{
	    return 0;
	}

	Player[playerid][Camera] ++;
	if(Player[playerid][Camera] >= sizeof(CamPositions))
	    Player[playerid][Camera] = 0;

	#if DEBUG == 1
	printf("OnPlayerRequestSpawn(%s)",PlayerName(playerid));
	#endif

	Player[playerid][RequestingClass] = false;

	new string[128];
	new tempclass = Player[playerid][pClass];
 	switch(tempclass)
	{
		case 5: //Auto Assign
		{
			Player[playerid][Status] = STATUS_PLAYING;
		  	new tname[256];

		  	if(GetTeamWithLessMembers() == T_AWAY) tname = AwayName;
		  	else if(GetTeamWithLessMembers() == T_HOME) tname = HomeName;

            Player[playerid][pClass] = GetTeamWithLessMembers();

		   	format(string,128,"%c \"%s\" ���� \"%s\" ������ �����ϼ̽��ϴ�. (Auto-Assign)",187,PlayerName(playerid),tname);
			SendClientMessageToAllEx(GetTeamColor(1, Player[playerid][pClass]), string);

			#if IRC == 1
			format(string,128,"2***7 \2;%s\2; 14has joined the the 7%s14 team (Auto-Assign)!",PlayerName(playerid), tname);
			CallRemoteFunction("DC_IRCForceSay", "s", string);
			#endif
		}
		case 2:
		{

			Player[playerid][Status] = STATUS_PLAYING;
		   	format(string,128,"%c \"%s\" ���� \"%s\" ������ �����ϼ̽��ϴ�.",187,PlayerName(playerid),AwayName);
			SendClientMessageToAllEx(GetTeamColor(1, T_AWAY), string);

			#if IRC == 1
	  		format(string,128,"2***7 \2;%s\2; 14has joined the 3%s14 team!",PlayerName(playerid), AwayName);
			CallRemoteFunction("DC_IRCForceSay", "s", string);
			#endif
		}
		case 3:
		{
		   	format(string,128,"%c \"%s\" ���� �ĺ����� \"%s\" ������ �����ϼ̽��ϴ�.",187,PlayerName(playerid),AwayName);
			SendClientMessageToAllEx(GetTeamColor(1, T_AWAY), string);
	 		Player[playerid][Status] = STATUS_SUB;

			#if IRC == 1
		  	format(string,128,"2***7 \2;%s\2; 14has spawned as a substitute for the 3%s14 team!",PlayerName(playerid), AwayName);
		   	CallRemoteFunction("DC_IRCForceSay", "s", string);
		   	#endif
		}
	    case 0:
	    {
  			Player[playerid][Status] = STATUS_PLAYING;
		    format(string,128,"%c \"%s\" ���� \"%s\" ������ �����ϼ̽��ϴ�.",187,PlayerName(playerid),HomeName);
			SendClientMessageToAllEx(GetTeamColor(1, T_HOME), string);

			#if IRC == 1
		    format(string,128,"2***7 \2;%s\2; 14has joined the 12%s14 team!",PlayerName(playerid), HomeName);
		    CallRemoteFunction("DC_IRCForceSay", "s", string);
		    #endif

	    }
	    case 1:
		{
		   	format(string,128,"%c \"%s\" ���� �ĺ����� \"%s\" ������ �����ϼ̽��ϴ�.",187,PlayerName(playerid),HomeName);
			SendClientMessageToAllEx(GetTeamColor(1, T_HOME), string);
		 	Player[playerid][Status] = STATUS_SUB;

		 	#if IRC == 1
		  	format(string,128,"2***7 \2;%s\2; 14has spawned as a substitute for the 12%s14 team!",PlayerName(playerid), HomeName);
		   	CallRemoteFunction("DC_IRCForceSay", "s", string);
		   	#endif

		}
		case 4:
		{
			Player[playerid][Status] = STATUS_PLAYING;
		 	format(string,128,"%c \"%s\" ���� \"%s\" ������ �����ϼ̽��ϴ�.",187,PlayerName(playerid),RefName);
			SendClientMessageToAllEx(COLOR_YELLOW, string);

			#if IRC == 1
		    format(string,128,"2***7 \2;%s\2; 14spawned as a 8%s14!",PlayerName(playerid), RefName);
		    CallRemoteFunction("DC_IRCForceSay", "s", string);
		    #endif
		}
	}
	Player[playerid][justClass] = true;
	KillTimer(Player[playerid][csel_timer]);
	DestroyObject(Player[playerid][csel_object]);
	return 1;
}

public OnPlayerDeath(playerid,killerid,reason)
{
	#if SAMP_VERSION == 2
		StopAudioStreamForPlayerEx(playerid);

		#if defined SOUND_GOTKILL
		    if (IsPlayerConnected(killerid) && ConfigAudio[sndGotKill] == true) {
				PlayAudioStreamForPlayerExEx(killerid, SOUND_GOTKILL);
			}
		#endif
		#if defined SOUND_GOTKILLED
		    if (ConfigAudio[sndGotKilled] == true) {
				PlayAudioStreamForPlayer(playerid, SOUND_GOTKILLED);
				// NOT Play Audio Stream For Player Ex Ex - DO NOT CHANGE
			}
		#endif
	#endif
	
	if(Player[playerid][DM] != 0)
    {
        UpdateDMScoreboards();
        SetTimer("UpdateDMScoreboards", 1000, false);
	}

	if (!IsPlayerInAnyVehicle(playerid) && Player[playerid][SurfingVehicleID] != INVALID_VEHICLE_ID) {
		HideVehicleHud(playerid, Player[playerid][SurfingVehicleID]);
		Player[playerid][SurfingVehicleID] = INVALID_VEHICLE_ID;
	}

	#if DATA_SYSTEM == 2
		SqlCountryUpdate(GeoIP[playerid][Country], "deaths");
		if (IsPlayerInClan(playerid)) {
			SqlClanUpdate(GetPlayerClanTag(playerid), "deaths");
		}
		if (IsPlayerConnected(killerid)) {
		    SqlCountryUpdate(GeoIP[killerid][Country], "kills");
		    if (IsPlayerInClan(killerid)) {
				SqlClanUpdate(GetPlayerClanTag(killerid), "kills");
			}
		}
	#endif

    TextDrawHideForPlayer(playerid,FPS[playerid]);

	Player[playerid][pSpawned] = false;

	TextDrawSetString(text_deathmsg, Config[DeathMsg]);
	TimeTextForPlayer(playerid, text_deathmsg,  4500);

	Player[playerid][isRaging] = true;
	SetTimerEx("PlayerStopRaging",15000,0,"i", playerid);

	for(new x=0; x<Server[HighestID]+1; x++)
	{
		if(!IsPlayerConnected(x)) continue;
	    if(GetPlayerState(x) == PLAYER_STATE_SPECTATING && Player[x][gSpectateID] == playerid)
		{
		   	if(Player[x][pTeam] == T_REF)
			   	AdvanceSpectate(x);
		   	else
			   	AdvanceTeamSpectate(x);
		}
	}

	if(Player[playerid][Suicided] == true)
	{
		Player[playerid][Suicided] = false;
	    killerid = INVALID_PLAYER_ID;
	    reason = 255;
	}

	if(Player[playerid][VehicleID] > -1)
	{
	    HideVehicleHud(playerid, Player[playerid][VehicleID]);
	    Player[playerid][VehicleID] = -1;
	}

	Player[playerid][vHud] = false;

	#if DEBUG == 1
	if(IsPlayerConnected(killerid))
		printf("OnPlayerDeath(%s, %s, %d)",PlayerName(playerid),PlayerName(killerid),reason);
	else
		printf("OnPlayerDeath(%s)",PlayerName(playerid));
	#endif

	Player[playerid][pSpawned] = false;
	new bool:Temp_pPlaying;
	if(Player[playerid][pPlaying] == true)
	{
		Temp_pPlaying = true;
	}
	else
	{
		Temp_pPlaying = false;
 	}


	Player[playerid][pPlaying] = false;

	new Float:health = 0;
	new Float:armour = 0;
	new Float:Distance;

	Server[ServerDeaths]++;
	if(IsPlayerConnected(killerid))
		Server[ServerKills]++;

	if(Round[Current] != -1)
	{
		HideRoundTextDrawsForPlayer(playerid);
		if (Player[playerid][pTeam] == T_HOME) {
			WeaponLimit[Player[playerid][PrimaryWep]][home_used] --;
			WeaponLimit[Player[playerid][SecondaryWep]][home_used] --;
			WeaponLimit[Player[playerid][TerciaryWep]][home_used] --;
			WeaponLimit[Player[playerid][SpecialWep]][home_used] --;
		} else if (Player[playerid][pTeam] == T_AWAY) {
			WeaponLimit[Player[playerid][PrimaryWep]][away_used] --;
			WeaponLimit[Player[playerid][SecondaryWep]][away_used] --;
			WeaponLimit[Player[playerid][TerciaryWep]][away_used] --;
			WeaponLimit[Player[playerid][SpecialWep]][away_used] --;
		}
	}

    if(reason == 51 && !IsPlayerInAnyVehicle(killerid))
	{
		for(new i = 0; i < 13; i++)
		{
			new w, a;
			GetPlayerWeaponData(killerid,i,w, a);
			if (w == 16)
			{
	    	    reason = 16;
			}
			else if(w == 35)
			{
	    	    reason = 35;
			}
		}
	}

	if(Player[playerid][DM] != 0)
	{
	   	if(Round[Current] == -1)
		{
			if(killerid == INVALID_PLAYER_ID)
	   	     	SendDeathMessage(INVALID_PLAYER_ID,playerid,reason);
			 else
	 		    SendDeathMessage(killerid, playerid, reason);
		}

		GetPlayerHealth(killerid,health);
		GetPlayerArmour(killerid,armour);
		Distance = GetDistanceBetweenPlayers(killerid, playerid);

		new string2[256];
	    if(killerid == INVALID_PLAYER_ID)
			format(string2,256,"{700000}[DM] {FFFFFF}\"%s\" {700000}���� �׾����ϴ�. {980000}(�ڻ�){700000}", PlayerName(playerid));
		else
		    format(string2,256,"{700000}[DM] {FFFFFF}\"%s\"{700000} ���� {FFFFFF}\"%s\"{700000} �� �׿����ϴ�. {700000}(HP: %d / %.1f ft) ����: %s ", PlayerName(killerid), PlayerName(playerid), floatround(health+armour),Distance, GetWepName(reason));

		if(Round[Current] == -1) SendClientMessageToDMPlayer(Player[playerid][DM], COLOR_WHITE, string2);

	    if(IsPlayerConnected(killerid))
	    {
	        Player[killerid][DMKills] ++;
	        Player[killerid][TempDMKills] ++;
	        Player[killerid][DMKillSpree] ++;

	        if(Player[killerid][DMKillSpree] == 3 || Player[killerid][DMKillSpree] == 6 || Player[killerid][DMKillSpree] == 10)
	        {
				new string[200];
				format(string,200,"{700000}[DM] {FFFFFF}\"%s\"{700000} ���� �������� %d ų�� �ϼ̽��ϴ�!", PlayerName(killerid), Player[killerid][DMKillSpree]);
				if(Round[Current] == -1) SendClientMessageToDMPlayer(Player[playerid][DM], COLOR_WHITE, string);
				SetPlayerHealth(killerid, 100.0);
				SetPlayerArmour(killerid, 100.0);
				GameTextForPlayer(killerid, "~r~> ~y~Killing Spree ~r~<", 3000, 6);
			}
	    }
	    Player[playerid][DMDeaths] ++;
	    Player[playerid][DMKillSpree] = 0;
	    Player[playerid][TempDMDeaths] ++;
	    SetPlayerHealth(playerid, 100.0);
	    SpawnPlayerEx(playerid);
		return 1;
	}
	if(Round[Current] != -1 && IsPlayerConnected(killerid) && Player[killerid][pPlaying] == true)
	{
	    if (!Round[FirstBlood]) {
	    	new fblood[200];
	    	format(fblood, 200, "~w~~r~%s > %s", RemoveClanTagFromName(killerid), RemoveClanTagFromName(playerid));
	    	TextDrawSetString(text_firstblood2, fblood);
	    	TimeTextForAll(text_firstblood, 3500);
	    	TimeTextForAll(text_firstblood2, 3500);
	    	Round[FirstBlood] = true;
	    	
	    	#if defined SOUND_FIRSTBLOOD
	    		if (ConfigAudio[sndFirstBlood] == true) {
			        for(new i; i <= Server[HighestID]; i++)
			        {
			            if(IsPlayerConnected(i))
			            {
			            	PlayAudioStreamForPlayerExEx(i, SOUND_FIRSTBLOOD);
			            }
					}
				}
			#endif
		}

    	if(reason == 51 && !IsPlayerInAnyVehicle(killerid))
		{
			if(Player[killerid][PrimaryWep] == 16 || Player[killerid][SecondaryWep] == 16 || Player[killerid][TerciaryWep] == 16 || Player[killerid][SpecialWep] == 16) reason = 16;
			if(Player[killerid][PrimaryWep] == 35 || Player[killerid][SecondaryWep] == 35 || Player[killerid][TerciaryWep] == 35 || Player[killerid][SpecialWep] == 35) reason = 35;
		}

		if((GetPlayerState(killerid) == PLAYER_STATE_DRIVER && Player[killerid][pTeam] != Player[playerid][pTeam] && (reason == 50 || reason == 49 || reason == 28 || reason == 29 || reason == 32)))
		{
		    if(reason == 50)
			{
				if(killerid != INVALID_PLAYER_ID && IsPlayerConnected(killerid))
				{
					new string[128];
					format(string,128,"*** %s ���� �︮���� ���� %s ���� �׿� ��⿡�� ������մϴ� ***",PlayerName(killerid), PlayerName(playerid));
					SendClientMessageToAllEx(COLOR_DARKRED,string);
					FixTeamWeapons(killerid);
    				SetPlayerInterior(killerid, 0);
					SetPlayerPos(killerid, 1422.0106,1557.5284,10.8203+100);
					Player[killerid][pPlaying] = false;
					SetPlayerHealth(killerid, 0);
 				}
			}
			else if(reason == 29 || reason == 28 || reason == 32)
			{
				new string[128];
				format(string,128,"*** %s ���� ����̺� ���̷� %s ���� �׿� ��⿡�� ������մϴ� ***",PlayerName(killerid), PlayerName(playerid));
				SendClientMessageToAllEx(COLOR_DARKRED,string);
				SetPlayerInterior(killerid, 0);
				FixTeamWeapons(killerid);
				SetPlayerPos(killerid, 1422.0106,1557.5284,10.8203+100);
				Player[killerid][pPlaying] = false;
				SetPlayerHealth(killerid, 0);
			}
			else if(reason == 49)
			{
				new string[128];
				format(string,128,"*** %s ���� �������� %s ���� �׿� ��⿡�� ������մϴ� ***",PlayerName(killerid), PlayerName(playerid));
				SendClientMessageToAllEx(COLOR_DARKRED,string);
				SetPlayerInterior(killerid, 0);
				FixTeamWeapons(killerid);
				SetPlayerPos(killerid, 1422.0106,1557.5284,10.8203+100);
				Player[killerid][pPlaying] = false;
				SetPlayerHealth(killerid, 0);
			}
            SetTimerEx("RespawnPlayerInRound", 1000, false, "i", playerid);
			return 1;
		}

		Player[killerid][RoundScore]++;
		Server[ServerRoundKills]++;

	}
    DuelCheck(playerid,killerid);

	if(Round[Current] == -1)
	{
 		SendDeathMessage(killerid, playerid, reason);

 		// only save the death reasons when it actually shows on the kill list?

 		DeathList[5][killer] = DeathList[4][killer];
		DeathList[5][whodead] = DeathList[4][whodead];
		DeathList[5][deadreason] = DeathList[4][deadreason];

		DeathList[4][killer] = DeathList[3][killer];
		DeathList[4][whodead] = DeathList[3][whodead];
		DeathList[4][deadreason] = DeathList[3][deadreason];

		DeathList[3][killer] = DeathList[2][killer];
		DeathList[3][whodead] = DeathList[2][whodead];
		DeathList[3][deadreason] = DeathList[2][deadreason];

    	DeathList[2][killer] = DeathList[1][killer];
		DeathList[2][whodead] = DeathList[1][whodead];
		DeathList[2][deadreason] = DeathList[1][deadreason];

		DeathList[1][killer] = killerid;
		DeathList[1][whodead] = playerid;
		DeathList[1][deadreason] = reason;

	 	if(Player[playerid][SpawnType] == DEATH_SPOT && Player[playerid][pDuel] == 0)
	    {
			GetPlayerPos(playerid, Spawn[playerid][0], Spawn[playerid][1], Spawn[playerid][2]);
			Spawn[playerid][3] = float(GetPlayerInterior(playerid));
	    }
	}
	else if(Round[Current]!= -1 && !Temp_pPlaying)
	{
	}
	else
	{
	    if(GetPlayerWeapon(killerid) == 16)reason = 16;
	 	else if(GetPlayerWeapon(killerid) == 35)reason = 35;
    	else if(GetPlayerWeapon(killerid) == 36)reason = 36;

		SendDeathMessage(killerid, playerid, reason);

		// only save the death reasons when it actually shows on the kill list?

		DeathList[5][killer] = DeathList[4][killer];
		DeathList[5][whodead] = DeathList[4][whodead];
		DeathList[5][deadreason] = DeathList[4][deadreason];

		DeathList[4][killer] = DeathList[3][killer];
		DeathList[4][whodead] = DeathList[3][whodead];
		DeathList[4][deadreason] = DeathList[3][deadreason];

		DeathList[3][killer] = DeathList[2][killer];
		DeathList[3][whodead] = DeathList[2][whodead];
		DeathList[3][deadreason] = DeathList[2][deadreason];

    	DeathList[2][killer] = DeathList[1][killer];
		DeathList[2][whodead] = DeathList[1][whodead];
		DeathList[2][deadreason] = DeathList[1][deadreason];

		DeathList[1][killer] = killerid;
		DeathList[1][whodead] = playerid;
		DeathList[1][deadreason] = reason;

	}

    Player[playerid][Deaths]++;

    #if DATA_SYSTEM == 2
		SetDeathsGameSession(playerid, Player[playerid][Deaths]);
	#endif

	if(IsPlayerConnected(killerid))
	{
		Player[killerid][Kills]++;
		#if DATA_SYSTEM == 2
			SetKillsGameSession(killerid, Player[killerid][Kills]);
		#endif
	}

	if(Round[Current] >= 1 && Temp_pPlaying == true && reason != 50 && reason != 49)
	{
	    if(Server[AutoSpec] == true && Config[spec] != 1) {
			SetTimerEx("AutoSpectate",200,0,"i",playerid);
		}
		if(Server[WeaponDrop] == true) {
    		DropWeapons(playerid);
		}

     	Player[playerid][TempKillSpree] =0;
  		Player[playerid][TempDeathSpree]++;

		if(Player[playerid][TempDeathSpree] >= Player[playerid][DeathSpree])
	  		Player[playerid][DeathSpree] = Player[playerid][TempDeathSpree];

		Server[ServerRoundDeaths]++;
	    Player[playerid][Status] = STATUS_DEAD;

		TeamInfo[Player[playerid][pTeam]][RoundDeaths] ++;
		TeamInfo[Player[playerid][pTeam]][TotalDeaths] ++;

	    Player[playerid][RoundDeathsEx]++;
		PlayerMatchInfo[playerid][PlayingMatch] = false;
		PlayerMatchInfo[playerid][Died] = true;
		PlayerMatchInfo[playerid][TotalDeaths] ++;
		PlayerMatchInfo[playerid][RoundDeaths] ++;

	    if(IsPlayerConnected(killerid))
		{
	 		Player[killerid][TempKillSpree]++;
			Player[killerid][TempDeathSpree] =0;

	 		if(Player[killerid][TempKillSpree] >= Player[killerid][KillSpree])
		  		Player[killerid][KillSpree] = Player[killerid][TempKillSpree];

			switch(Player[killerid][TempKillSpree]) {
				case 5, 10, 15, 20, 25, 30, 35, 40, 45, 50, 55, 60, 65, 70, 75, 80, 85, 90, 95, 100:
				{
			    	new string[256];
			    	format(string,256,"** %s ���� �������� %d ų�� �ϼ̽��ϴ�!", PlayerName(killerid), Player[killerid][TempKillSpree]);

					#if defined SOUND_KILLSPREE
			    		if (ConfigAudio[sndKillSpree] == true) {
							for(new i; i <= Server[HighestID]; i++)
					        {
					            if(IsPlayerConnected(i))
					            {
					            	PlayAudioStreamForPlayerExEx(i, SOUND_KILLSPREE);
					            }
							}
						}
					#endif
			    	SendClientMessageToAllEx(COLOR_WHITE, "=====================================================================");
			    	SendClientMessageToAllEx(COLOR_ORANGE, string);
			    	SendClientMessageToAllEx(COLOR_WHITE, "=====================================================================");
				}
			}

			for(new i = 0; i < MAX_COUNT_WEAPONS; i++) if(reason == weaponsInfo[i][WID])
			{
				WeaponsKills[i]++;
				Player[killerid][pWeaponsKills][i]++;
		   		Player[playerid][pWeaponsDeaths][i] ++;
			}

			Player[killerid][pScore] ++;
			TeamInfo[Player[killerid][pTeam]][TotalKills] ++;
    		TeamInfo[Player[killerid][pTeam]][RoundKills] ++;
			Player[killerid][RoundKillsEx]++;
			PlayerMatchInfo[killerid][TotalKills] ++;
			PlayerMatchInfo[killerid][RoundKills] ++;
		}

	    if(Player[playerid][pTeam] == T_REF)
		{
	    	if(IsPlayerConnected(killerid))
			{
		       	SetPlayerHealth(killerid,0); // Kill the killer of the Ref
			}
		}

		if(IsPlayerConnected(killerid))
		{
			new killer_msg[200];
			GetPlayerHealth(killerid,health);
			GetPlayerArmour(killerid,armour);
			Distance = GetDistanceBetweenPlayers(killerid, playerid);

			format(killer_msg,200,"* %s ���� %s ���� �׿����ϴ�. (HP: %d / %.1f ft) ����: %s",PlayerName(killerid), PlayerName(playerid), floatround(health+armour),Distance, GetWepName(reason));
            #if LOG_SYSTEM == 1
			WriteLog("rounds", killer_msg);
			#endif
			if(Player[killerid][pTeam] == T_AWAY)
			{
				SendClientMessageToAllEx(GetTeamColor(1, T_AWAY),killer_msg);
			}
			else if(Player[killerid][pTeam] == T_HOME)
			{
				SendClientMessageToAllEx(GetTeamColor(1, T_HOME),killer_msg);
			}
		}
	}

	if(IsPlayerConnected(killerid)) {
		GetPlayerHealth(killerid,health);
		GetPlayerArmour(killerid,armour);
		Distance = GetDistanceBetweenPlayers(killerid, playerid);

		format(KillerInfo[playerid],256,"%s (HP: %d / %0.2f ft) %s",PlayerName(killerid), floatround(health+armour),Distance, GetWepName(reason));

		if(Round[Current] == -1) {
  			SetPlayerScore(killerid,Player[killerid][pScore]);
		}
	}

    Player[playerid][pSpawned] = false;
	OnPlayerLeaveCheckpoint(playerid);

	new tname[128];
	switch(Player[playerid][pTeam])
    {
		case T_AWAY: format(tname, sizeof(tname), "%s", AwayName);
		case T_HOME: format(tname, sizeof(tname), "%s",HomeName);
	}

	new Float:x2, Float:y, Float:z;
	GetPlayerPos(playerid, x2, y, z);
	CreateExplosion(x2, y, z-15, 12, 10.0);
	

    ResetPlayerWeapons(playerid);
	SetPlayerVirtualWorld2(playerid, DEATH_VW);

	if(Round[Current] >= 1)
	{
	    if((Temp_pPlaying) && (Player[killerid][pPlaying]))
		{
	        if(Player[playerid][pTeam] == Player[killerid][pTeam])
			{
	            new tkmsg[200];
	            format(tkmsg, sizeof(tkmsg), "** ��ų | ��: %s | %s ���� %s ���� �׿����ϴ�. (%s)", tname, PlayerName(killerid), PlayerName(playerid), GetWepName(reason));
       			SendClientMessageToAllEx(COLOR_DARKGREY,tkmsg);
				#if IRC == 1
				format(tkmsg, sizeof(tkmsg), "14** Teamkill | Team: %s | %s killed %s. (%s)", tname, PlayerName(killerid), PlayerName(playerid), GetWepName(reason));
				CallRemoteFunction("DC_IRCForceSay", "s", tkmsg);
				#endif
			}
	    }
	}

	SetPlayerHealth(playerid, 100.0);
    SpawnPlayerEx(playerid);
    
 	CallRemoteFunction("DC_PlayerLeftRound", "d", playerid);
 	
 	
    return 1;
}

public OnPlayerText(playerid,text[])
{
	#if DEBUG == 1
	printf("OnPlayerText(%s, %s)",PlayerName(playerid),text);
	#endif

	if(Server[NoChat] == true)
	    return 0;
	    
	    
	if((text[0] == '#'))
	{
	    new string[256];
        if(strfind(PlayerName(playerid),ClanTag,true) == -1)return 1;
        else
        {
		    format(string,256,"[Clan Chat] %s: %s", PlayerName(playerid), text[1]);
	        for(new i; i <= Server[HighestID]; i++)
	        {
	            if(IsPlayerConnected(i))
	            {
	            	if(strfind(PlayerName(i),ClanTag,true) != -1)
	            	{
	                	SendClientMessageEx(i, COLOR_ORANGE, string);
	                }
	            }
			}
		}
		#if LOG_SYSTEM == 1
			format(string,256,"[Clan Chat] [%s] %s: %s", ClanTag, PlayerName(playerid), text[1]);
        	WriteLog("chat", string);
        #endif
  		return 0;
	}

	if((Server[GlobalChatEnabled] == false && !IsPlayerAdmin3(playerid) && Player[playerid][ChatAllowed] == false) || Player[playerid][ChatAllowed] == false)
	{
	    new string[128], tmpcolour, name[256];
	    switch(Player[playerid][pTeam])
        {
	        case T_REF:{ tmpcolour = COLOR_YELLOW, name = RefName; }
	        case T_HOME:{ tmpcolour = GetTeamColor(0, T_HOME), name = HomeName; }
	        case T_SUBHOME:{ tmpcolour = GetTeamColor(0, T_HOME), name = HomeName; }
	        case T_AWAY:{ tmpcolour = GetTeamColor(0, T_AWAY), name = AwayName; }
	        case T_SUBAWAY:{ tmpcolour = GetTeamColor(0, T_AWAY), name = AwayName; }
	        default:
	        {
	            SendClientMessageEx(playerid, COLOR_GREY, "����� �� ä���� �� �� ���� �� �Դϴ�.");
         		return 0;
			}
	    }
       	format(string,128,"[%s | %s]: %s", name, PlayerName(playerid), text[0]);
	    for(new i; i <= Server[HighestID]; i++)
	    {
	    	if(IsPlayerConnected(i) && Player[i][pSpawned])
	        {
	            if(Player[playerid][pTeam] == Player[i][pTeam])
	            {
	              	PlayerPlaySound(i,1057,0.0,0.0,0.0);
	               	SendClientMessageEx(i, tmpcolour, string);
	            }
	            else if(Player[playerid][pTeam] == T_AWAY && Player[i][pTeam] == T_SUBAWAY)
	            {
	               	PlayerPlaySound(i,1057,0.0,0.0,0.0);
	               	SendClientMessageEx(i, tmpcolour, string);
	            }
	            else if(Player[playerid][pTeam] == T_HOME && Player[i][pTeam] == T_SUBHOME)
	            {
	               	PlayerPlaySound(i,1057,0.0,0.0,0.0);
	               	SendClientMessageEx(i, tmpcolour, string);
	            }
	        }
    	}
		#if LOG_SYSTEM == 1
		    if (Player[playerid][pTeam] == T_HOME || Player[playerid][pTeam] == T_SUBHOME) {
				format(string,256,"[HOME] %s: %s", PlayerName(playerid), text[0]);
            } else if(Player[playerid][pTeam] == T_AWAY && Player[playerid][pTeam] == T_SUBAWAY) {
				format(string,256,"[AWAY] %s: %s", PlayerName(playerid), text[0]);
            } else if(Player[playerid][pTeam] == T_REF) {
				format(string,256,"[REFEREE] %s: %s", PlayerName(playerid), text[0]);
            }
        	WriteLog("chat", string);
        #endif
	    return 0;
	}

	if(Round[Current] == -1 || Config[classic_chat] == 1) {
		if((text[0] == ';') || (text[0] == '!'))
		{
		    new string[128], tmpcolour, name[256];
	        switch(Player[playerid][pTeam])
	        {
	            case T_REF:{ tmpcolour = COLOR_YELLOW, name = RefName; }
	            case T_HOME:{ tmpcolour = GetTeamColor(0, T_HOME), name = HomeName; }
	            case T_SUBHOME:{ tmpcolour = GetTeamColor(0, T_HOME), name = HomeName; }
	            case T_AWAY:{ tmpcolour = GetTeamColor(0, T_AWAY), name = AwayName; }
	            case T_SUBAWAY:{ tmpcolour = GetTeamColor(0, T_AWAY), name = AwayName; }
	            default:
	            {
	                SendClientMessageEx(playerid, COLOR_GREY, "����� �� ä���� �� �� ���� �� �Դϴ�.");
	                return 0;
				}
	        }

		    format(string,128,"[%s | %s]: %s", name, PlayerName(playerid), text[1]);
	        for(new i; i <= Server[HighestID]; i++)
	        {
	            if(IsPlayerConnected(i) && Player[i][pSpawned])
	            {
	                if(Player[playerid][pTeam] == Player[i][pTeam])
	                {
	                	PlayerPlaySound(i,1057,0.0,0.0,0.0);
	                	SendClientMessageEx(i, tmpcolour, string);
	                }
	                else if(Player[playerid][pTeam] == T_AWAY && Player[i][pTeam] == T_SUBAWAY)
	                {
	                	PlayerPlaySound(i,1057,0.0,0.0,0.0);
	                	SendClientMessageEx(i, tmpcolour, string);
	                }
	                else if(Player[playerid][pTeam] == T_HOME && Player[i][pTeam] == T_SUBHOME)
	                {
	                	PlayerPlaySound(i,1057,0.0,0.0,0.0);
	                	SendClientMessageEx(i, tmpcolour, string);
	                }
	            }
	        }
			#if LOG_SYSTEM == 1
			    if (Player[playerid][pTeam] == T_HOME || Player[playerid][pTeam] == T_SUBHOME) {
					format(string,256,"[HOME] %s: %s", PlayerName(playerid), text[1]);
	            } else if(Player[playerid][pTeam] == T_AWAY && Player[playerid][pTeam] == T_SUBAWAY) {
					format(string,256,"[AWAY] %s: %s", PlayerName(playerid), text[1]);
	            } else if(Player[playerid][pTeam] == T_REF) {
					format(string,256,"[REFEREE] %s: %s", PlayerName(playerid), text[1]);
	            }
	        	WriteLog("chat", string);
	        #endif
		    return 0;
		} else {
			#if LOG_SYSTEM == 1
			    new string[256];
				format(string,256,"%s: %s", PlayerName(playerid), text[0]);
	   			WriteLog("chat", string);
    		#endif
	    	return 1;
		}
	} else {
	   	if(text[0] == ';' || text[0] == '!')
		{
			format(text, 256, "[%d] %s", playerid, text[1]);
			return 1;
		}
		else
		{
			new string[128], tmpcolour, name[256];
	        switch(Player[playerid][pTeam])
	        {
	            case T_REF:{ tmpcolour = COLOR_YELLOW, name = RefName; }
	            case T_HOME:{ tmpcolour = GetTeamColor(0, T_HOME), name = HomeName; }
	            case T_SUBHOME:{ tmpcolour = GetTeamColor(0, T_HOME), name = HomeName; }
	            case T_AWAY:{ tmpcolour = GetTeamColor(0, T_AWAY), name = AwayName; }
	            case T_SUBAWAY:{ tmpcolour = GetTeamColor(0, T_AWAY), name = AwayName; }
	            default:
	            {
	                SendClientMessageEx(playerid, COLOR_GREY, "����� �� ä���� �� �� ���� �� �Դϴ�.");
	                return 0;
				}
	        }

		    format(string,128,"[%s | %s]: %s", name, PlayerName(playerid), text[0]);
		 	for(new i = 0; i <= Server[HighestID]; i++)
			{
			   	if(IsPlayerConnected (i) && Player[i][pSpawned])
				{
					if(Player[playerid][pTeam] == Player[i][pTeam])
	                {
	                	PlayerPlaySound(i,1057,0.0,0.0,0.0);
	                	SendClientMessageEx(i, tmpcolour, string);
	                }
	                else if(Player[playerid][pTeam] == T_AWAY && Player[i][pTeam] == T_SUBAWAY)
	                {
	                	PlayerPlaySound(i,1057,0.0,0.0,0.0);
	                	SendClientMessageEx(i, tmpcolour, string);
	                }
	                else if(Player[playerid][pTeam] == T_HOME && Player[i][pTeam] == T_SUBHOME)
	                {
	                	PlayerPlaySound(i,1057,0.0,0.0,0.0);
	                	SendClientMessageEx(i, tmpcolour, string);
	                }
				}
			}
			#if LOG_SYSTEM == 1
			    if (Player[playerid][pTeam] == T_HOME || Player[playerid][pTeam] == T_SUBHOME) {
					format(string,256,"[HOME] %s: %s", PlayerName(playerid), text[0]);
	            } else if(Player[playerid][pTeam] == T_AWAY && Player[playerid][pTeam] == T_SUBAWAY) {
					format(string,256,"[AWAY] %s: %s", PlayerName(playerid), text[0]);
	            } else if(Player[playerid][pTeam] == T_REF) {
					format(string,256,"[REFEREE] %s: %s", PlayerName(playerid), text[0]);
	            }
	        	WriteLog("chat", string);
        	#endif
		}
		return 0;
	}
}

public OnPlayerInteriorChange(playerid, newinteriorid, oldinteriorid)
{
	#if DEBUG == 1
	printf("OnPlayerInteriorChange(%s, %d, %d)",PlayerName(playerid),newinteriorid, oldinteriorid);
	#endif

	new x = 0;
	while(x!=Server[HighestID]+1) {
	    if( IsPlayerConnected(x) &&	GetPlayerState(x) == PLAYER_STATE_SPECTATING &&
			Player[x][gSpectateID] == playerid && Player[x][gSpectateType] == SPECTATE_TYPE_PLAYER)
   		{
   		    SetPlayerInterior(x,newinteriorid);
		}
		x++;
	}
}

public OnPlayerEnterVehicle(playerid,vehicleid)
{
	#if DEBUG == 1
	printf("OnPlayerEnterVehicle(%s, %d)",PlayerName(playerid),vehicleid);
	#endif
	return 1;
}

public OnPlayerExitVehicle(playerid, vehicleid) {
	#if DEBUG == 1
	printf("OnPlayerExitVehicle(%s, %d)",PlayerName(playerid),vehicleid);
	#endif
	return 1;
}

public OnPlayerStateChange(playerid, newstate, oldstate)
{
	#if DEBUG == 1
	printf("OnPlayerStateChange(%s, %d, %d)",PlayerName(playerid),newstate,oldstate);
	#endif

	#if SAMP_VERSION == 2
		#if defined SOUND_VEHICLERADIO
			if (ConfigAudio[sndVehicleRadio] == true) {
				if(newstate == PLAYER_STATE_DRIVER || newstate == PLAYER_STATE_PASSENGER)
				{
					PlayAudioStreamForPlayerExEx(playerid, SOUND_VEHICLERADIO);
				}
			}
		#endif

		if(oldstate == PLAYER_STATE_DRIVER || oldstate == PLAYER_STATE_PASSENGER)
		{
		    StopAudioStreamForPlayerEx(playerid);
		}
	#endif
	
	switch(oldstate)
	{
		case PLAYER_STATE_SPECTATING:
		{
 		    Player[playerid][gSpectateID] = INVALID_PLAYER_ID;
		    Player[playerid][Specing] = false;
		    HideSpecTD(playerid);
		}
	}

	switch(newstate)
	{
		case PLAYER_STATE_DRIVER:
		{
		    SetPlayerArmedWeapon(playerid,0);
  			new vid = GetPlayerVehicleID(playerid);
		    VehicleInfo[vid][pDriver] = playerid;
		    Player[playerid][VehicleID] = vid;
			ShowVehicleHud(playerid, vid);

			for(new x=0; x<Server[HighestID]+1; x++)
			{
			    if(!IsPlayerConnected(x)) continue;
			    if(GetPlayerState(x) == PLAYER_STATE_SPECTATING && Player[x][gSpectateID] == playerid) {
			        TogglePlayerSpectating(x, 1);
			        PlayerSpectateVehicle(x, vid);
			    	ShowVehicleHud(x, vid);
			        Player[x][gSpectateType] = SPECTATE_TYPE_VEHICLE;
				}
			}
			if((Player[playerid][pTeam] == T_AWAY && Round[Attackers] != T_AWAY) || (Player[playerid][pTeam] == T_HOME && Round[Attackers] != T_HOME)) {
				if(Player[playerid][pPlaying] == true && Round[Gamemode] == BASE) {
					RemovePlayerFromVehicle(playerid);
					SendClientMessage(playerid, COLOR_RED, "** ����� ������ ž���� �� �����ϴ�.");
				}
			}
			TextDrawHideForPlayer(playerid, fps_text[playerid]);
			TextDrawShowForPlayer(playerid, fps_text[playerid]);
		}
		case PLAYER_STATE_PASSENGER:
		{
		    SetPlayerArmedWeapon(playerid,0);
  			new vid = GetPlayerVehicleID(playerid);
		    Player[playerid][VehicleID] = vid;
    		ShowVehicleHud(playerid, vid);

		    if(VehicleInfo[vid][pPass1] == -1)
		        VehicleInfo[vid][pPass1] = playerid;
		    else if(VehicleInfo[vid][pPass2] == -1)
		        VehicleInfo[vid][pPass2] = playerid;
		    else if(VehicleInfo[vid][pPass3] == -1)
		        VehicleInfo[vid][pPass3] = playerid;

			for(new x=0; x<Server[HighestID]+1; x++)
			{
			    if(!IsPlayerConnected(x)) continue;
			    if(GetPlayerState(x) == PLAYER_STATE_SPECTATING && Player[x][gSpectateID] == playerid)
				{
			        TogglePlayerSpectating(x, 1);
			        PlayerSpectateVehicle(x, vid);
			    	ShowVehicleHud(x, vid);
			        Player[x][gSpectateType] = SPECTATE_TYPE_VEHICLE;
				}
			}
			if((Player[playerid][pTeam] == T_AWAY && Round[Attackers] != T_AWAY) || (Player[playerid][pTeam] == T_HOME && Round[Attackers] != T_HOME)) {
				if(Player[playerid][pPlaying] == true && Round[Gamemode] == BASE) {
					RemovePlayerFromVehicle(playerid);
					SendClientMessage(playerid, COLOR_RED, "** ����� ������ Ż �� �����ϴ�.");
				}
			}
			TextDrawHideForPlayer(playerid, fps_text[playerid]);
			TextDrawShowForPlayer(playerid, fps_text[playerid]);
		}
		case PLAYER_STATE_ONFOOT:
		{
		    if(oldstate == PLAYER_STATE_DRIVER || oldstate == PLAYER_STATE_PASSENGER)
			{
			    new vid = Player[playerid][VehicleID];

		        if(VehicleInfo[vid][pDriver] == playerid)
					VehicleInfo[vid][pDriver] = -1;
				else if(VehicleInfo[vid][pPass1] == playerid)
					VehicleInfo[vid][pPass1] = -1;
				else if(VehicleInfo[vid][pPass2] == playerid)
			 		VehicleInfo[vid][pPass2] = -1;
				else if(VehicleInfo[vid][pPass3] == playerid)
					VehicleInfo[vid][pPass3] = -1;

		        Player[playerid][VehicleID] = -1;
		        HideVehicleHud(playerid, vid);
				for(new x=0; x<Server[HighestID]+1; x++)
				{
				    if(!IsPlayerConnected(x)) continue;
				    if(GetPlayerState(x) == PLAYER_STATE_SPECTATING && Player[x][gSpectateID] == playerid)
					{
				        TogglePlayerSpectating(x, 1);
				        PlayerSpectatePlayer(x, playerid);
				    	HideVehicleHud(x, vid);
				        Player[x][gSpectateType] = SPECTATE_TYPE_PLAYER;
					}
				}
		    }
			TextDrawHideForPlayer(playerid, fps_text[playerid]);
			TextDrawShowForPlayer(playerid, fps_text[playerid]);
		}
		case PLAYER_STATE_SPAWNED:
		{
			TextDrawHideForPlayer(playerid, fps_text[playerid]);
			TextDrawShowForPlayer(playerid, fps_text[playerid]);
			if (Player[playerid][DM] != 0) {
			    TextDrawShowForPlayer(playerid, DMScores[Player[playerid][DM]]);
			}
		}
		case PLAYER_STATE_NONE:
		{
			TextDrawHideForPlayer(playerid, fps_text[playerid]);
			for(new x = 0; x < MAX_DMS; x ++)
			{
				TextDrawHideForPlayer(playerid, DMScores[x]);
			}
		}
		case PLAYER_STATE_SPECTATING:
		{
			TextDrawHideForPlayer(playerid, fps_text[playerid]);
			for(new x = 0; x < MAX_DMS; x ++)
			{
				TextDrawHideForPlayer(playerid, DMScores[x]);
			}
		}
		case PLAYER_STATE_WASTED:
		{
			TextDrawHideForPlayer(playerid, fps_text[playerid]);
			for(new x = 0; x < MAX_DMS; x ++)
			{
				TextDrawHideForPlayer(playerid, DMScores[x]);
			}
		}
	}
	return 1;
}

public OnRconLoginAttempt(ip[], password[], success) {
	new pip[MAX_PLAYER_NAME];
	for(new i=0; i < Server[HighestID]+1; ++i) {
	    if(IsPlayerConnected(i)) {
			GetPlayerIp(i, pip, sizeof(pip));
			if(!strcmp(ip, pip, true)) {
				new str[128];
				if(success) format(str, sizeof(str), "%s ���� RCON �α����� �ϼ̽��ϴ�.", PlayerName(i));
				else format(str, sizeof(str), "%s ���� RCON �α��ο� �����ϼ̽��ϴ�.", PlayerName(i));
				SendClientMessageToAll(COLOR_ORANGE, str);
				break;
			}
		}
	}
	return 1;
}


public OnPlayerDisconnect(playerid, reason)
{
	/*if (Player[playerid][AFK]) {
		Delete3DTextLabel(Player[playerid][AFKLabel]);
	}*/

	for(new x=0; x<Server[HighestID]+1; x++)
	{
	    if(!IsPlayerConnected(x)) continue;
	    if(GetPlayerState(x) == PLAYER_STATE_SPECTATING && Player[x][gSpectateID] == playerid)
		{
		   	if(Player[x][pTeam] == T_REF)
			   	AdvanceSpectate(x);
		   	else
			   	AdvanceTeamSpectate(x);
		}
	}

	if(playerid == Server[HighestID]+1) {
	    new highID=0;
		for(new x=0; x<Server[HighestID]+1; x++)
		{
	    	if(IsPlayerConnected(x))
	    	{
	    	    if(x>highID) {
	    	        highID = x;
	    	    }
	    	}
		}
		Server[HighestID] = highID;
	}
	if(GetPlayerState(playerid) == PLAYER_STATE_SPECTATING && IsPlayerConnected(Player[playerid][gSpectateID])) {
	    StopSpectate(playerid);
	}


	if (Player[playerid][pPlaying] && Round[Current] != -1) {
		FixTeamWeapons(playerid);
	}

	for(new x=0; x<Server[HighestID]+1; x++)
	{
	    if(IsPlayerConnected(x))
	    {
	        if(Player[x][NowTracking] == playerid)
	        {
				HideHUDTextDraws(x);
	        }
		    if(GetPlayerState(x) == PLAYER_STATE_SPECTATING && Player[x][gSpectateID] == playerid)
			{
			    if(!IsPlayerConnected(x)) continue;
			   	if(Player[x][pTeam] == T_REF)
				   	AdvanceSpectate(x);
			   	else
				   	AdvanceTeamSpectate(x);
			}
		}
	}

	KillTimer(Player[playerid][introTimer]);

	if(Player[playerid][pDuel] > 0)
	{
		for(new i = 0; i<=Server[HighestID]; i++)
		{
			if(IsPlayerConnected(i))
			{
				if(Player[i][pDuel] == Player[playerid][pDuel])
				{
					if(Player[i][pTeam] == T_AWAY || Player[i][pTeam] == T_HOME)
				    	Player[i][setToPlay] = true;

					if(Player[i][pPlaying] == true) { // oh oh, some serious shit happend.
                        InDuel[Player[i][pDuel]] = 0;
						Player[i][pDuel] = 0;
						return 1;
					}

				    SpawnPlayerEx(i);
					SetPlayerVirtualWorld2(i,LOBBY_VW);
					SendClientMessageEx(i, COLOR_GREY, "* ����� �ڵ����� ��󿡼� �����ϼ̽��ϴ�. (���� ����)");
					InDuel[Player[i][pDuel]] = 0;
					Player[i][pDuel] = 0;
				}
			}
		}
	}

	if (Server[PartialRounds] > 0 || Round[Current] != -1) {
	    BeyondDiscon_Save(playerid);
	}

	if(Player[playerid][PlayerHUDTextDrawCreated] == true)
	{
	    DestroyPlayerHUDTextDraws(playerid);
	}

	if(Player[playerid][loggedin]) {
		SaveAccount(playerid);
	}

	#if DEBUG == 1
	printf("OnPlayerDisconnect(%s, %d)",PlayerName(playerid),reason);
	#endif

	Server[pConnected]--;

	new string[356];

	format(string,256,"%s",PlayerRootNames[playerid]);
	SetPlayerName(playerid,string);

	Player[playerid][vHud] = false;

	new log[256];
	switch (reason)
	{
 		case 0:
    	{
    	    Server[TotalCrashes] ++;

   			if(Player[playerid][pPlaying] == true /*&& Round[EplapsedTime] >= 5 && Round[LoadScreen] == false*/)
   			{
   		        new Float:PlayerHealth, Float:PlayerArmour;
	        	GetPlayerHealth(playerid,PlayerHealth);
				GetPlayerArmour(playerid,PlayerArmour);
				format(string, 356, "{BABABA}%c {FFFFFF}%s {BABABA}(ID: %d) ���� �������� �����ϼ̽��ϴ�. {FF0000}(�ñ�) {FFFFFF}(Health: %.1f - Armour: %.1f)", 187,PlayerName(playerid), playerid, PlayerHealth, PlayerArmour);
				
			}
			else
			{
				format(string, 356, "{BABABA}%c {FFFFFF}%s {BABABA}(ID: %d) ���� �������� �����ϼ̽��ϴ�. {FF0000}(�ñ�)", 187,PlayerName(playerid),playerid);
			}
			SendClientMessageToAllEx(COLOR_GREY, string);
			format(log,256,"[DISCONNECT] %s (Reason: Timed Out) \n\r", PlayerName(playerid));
			#if LOG_SYSTEM == 1
			WriteLog("server", log);
			#endif

		}
		case 1:
 		{
 		    if (Player[playerid][isRaging]) {
 		        new Float:PlayerHealth, Float:PlayerArmour;
	        	GetPlayerHealth(playerid,PlayerHealth);
				GetPlayerArmour(playerid,PlayerArmour);
				if(Player[playerid][pPlaying] == true /*&& Round[EplapsedTime] >= 5 && Round[LoadScreen] == false*/)
				    format(string, 356, "{BABABA}%c {FFFFFF}%s {BABABA}(ID: %d) ���� �������� �����ϼ̽��ϴ�. {FF0000}(RAGE QUIT) {FFFFFF}(Health: %.1f - Armour: %.1f)", 187,PlayerName(playerid),playerid, PlayerHealth, PlayerArmour);
				else
					format(string, 356, "{BABABA}%c {FFFFFF}%s {BABABA}(ID: %d) ���� �������� �����ϼ̽��ϴ�. {FF0000}(RAGE QUIT)", 187,PlayerName(playerid),playerid);
				SendClientMessageToAllEx(COLOR_GREY, string);
				format(log,256,"[DISCONNECT] %s (Reason: RAGE QUIT) \n\r", PlayerName(playerid));
				#if LOG_SYSTEM == 1
				WriteLog("server", log);
				#endif
				//new rage_msg[200];
				//format(rage_msg, 200, "~y~%s ~r~RAGE QUIT", PlayerName(playerid));
 		    } else {
 		        new Float:PlayerHealth, Float:PlayerArmour;
	        	GetPlayerHealth(playerid,PlayerHealth);
				GetPlayerArmour(playerid,PlayerArmour);
				if(Player[playerid][pPlaying] == true /*&& Round[EplapsedTime] >= 5 && Round[LoadScreen] == false*/)
					format(string, 356, "{BABABA}%c {FFFFFF}%s {BABABA}(ID: %d) ���� �������� �����ϼ̽��ϴ�. {FF0000}(����) {FFFFFF}(Health: %.1f - Armour: %.1f)", 187,PlayerName(playerid),playerid, PlayerHealth, PlayerArmour);
				else
					format(string, 356, "{BABABA}%c {FFFFFF}%s {BABABA}(ID: %d) ���� �������� �����ϼ̽��ϴ�. {FF0000}(����)", 187,PlayerName(playerid),playerid);
				SendClientMessageToAllEx(COLOR_GREY, string);
				format(log,256,"[DISCONNECT] %s (Reason: Quit) \n\r", PlayerName(playerid));
				#if LOG_SYSTEM == 1
				WriteLog("server", log);
				#endif
			}
		}
		case 2:
	 	{
	 	    new Float:PlayerHealth, Float:PlayerArmour;
	        GetPlayerHealth(playerid,PlayerHealth);
			GetPlayerArmour(playerid,PlayerArmour);
			if(Player[playerid][pPlaying] == true /*&& Round[EplapsedTime] >= 5 && Round[LoadScreen] == false*/)
				format(string, 356, "{BABABA}%c {FFFFFF}%s {BABABA}(ID: %d) ���� �������� �����ϼ̽��ϴ�. {FF0000}(ű/��) {FFFFFF}(Health: %.1f - Armour: %.1f)", 187,PlayerName(playerid),playerid);
			else
				format(string, 356, "{BABABA}%c {FFFFFF}%s {BABABA}(ID: %d) ���� �������� �����ϼ̽��ϴ�. {FF0000}(ű/��)", 187,PlayerName(playerid),playerid);
			SendClientMessageToAllEx(COLOR_GREY, string);
			format(log,256,"[DISCONNECT] %s (Reason: Kicked) \n\r", PlayerName(playerid));
			#if LOG_SYSTEM == 1
			WriteLog("server", log);
			#endif
		}
	}

    Player[playerid][pSkin] = -1;
    Player[playerid][pDuel] = 0;
    Player[playerid][pSpawned] = false;

	Player[playerid][setToPlay] = true;

	Player[playerid][loggedin] = false;
	Player[playerid][admin] = false;
	Player[playerid][superadmin] = false;

	Player[playerid][DM] = 0;
	Player[playerid][DMKills] = 0;
	Player[playerid][DMDeaths] = 0;
	Player[playerid][DMKillSpree] = 0;
	Player[playerid][TempDMKills] = 0;
	Player[playerid][TempDMDeaths] = 0;

	Player[playerid][PrimaryWep] =0;
	Player[playerid][PrimaryWepAmmo] =0;
	Player[playerid][SecondaryWep] =0;
	Player[playerid][SecondaryWepAmmo] =0;
  	Player[playerid][TerciaryWep] = 0;
 	Player[playerid][TerciaryWepAmmo] = 0;
	Player[playerid][SpecialWep] =0;
	Player[playerid][SpecialWepAmmo] =0;

	Player[playerid][IgnoreSpawnCallback] = false;

	Player[playerid][secondsPlayed] =0;
	if(IsPlayerInAnyVehicle(playerid))
	{
		HideVehicleHud(playerid, Player[playerid][VehicleID]);
	}

	for(new x=0; x<Server[HighestID]+1; x++) {
		PlayerPlaySound(x, 1085, 0, 0, 0);
	}

	#if DATA_SYSTEM == 2
		DeleteGameSession(playerid);
	#endif

	if(Server[AutoReadd] == true && Round[Current] != -1 && Player[playerid][pPlaying] == true /*&& Round[LoadScreen] == false*/ && (Player[playerid][pTeam] == T_HOME || Player[playerid][pTeam] == T_AWAY))
	{
		StorePlayerVariables(playerid);
		if(Config[autopause] == 1) PauseRound(2);
	}

	Player[playerid][pPlaying] = false;

	if(Player[playerid][DM] != 0)
    {
        UpdateDMScoreboards();
        SetTimer("UpdateDMScoreboards", 1000, false);
	}
	return 1;
}

public OnPlayerCommandReceived(playerid, cmdtext[])
{
	#if DEBUG == 1
	printf("OnPlayerCommandReceived(%s, %s)",PlayerName(playerid),cmdtext);
	#endif

	new tmp[256], idx;
	tmp = strtok(cmdtext, idx);

	if (strcmp(tmp, "/commands", true) == 0 || strcmp(tmp, "/info", true) == 0 || strcmp(tmp, "/help", true) == 0 || strcmp(tmp, "/pm", true) == 0 || strcmp(tmp, "/credits", true) == 0) {
		return 1;
 	}
 	else if (strcmp(tmp, "/login", true) == 0 || strcmp(tmp, "/stats", true) == 0 || strcmp(tmp, "/group", true) == 0 || strcmp(tmp, "/wstats", true) == 0 || strcmp(tmp, "/register", true) == 0 || strcmp(tmp, "/changepass", true) == 0) {
		return 1;
 	}
	else if (strcmp(tmp, "/lock", true) == 0 || strcmp(tmp, "/pass", true) == 0 || strcmp(tmp, "/unlock", true) == 0) {
		return 1;
 	}

	else if(Player[playerid][inCmdIntro] == true)
	{
		SendClientMessageEx(playerid, COLOR_RED, "{FF0000}� Error: {FFFFFF}��Ʈ�ο����� ��ɾ ����� �� �����ϴ�.");
		return 0;
	}
	else if(Player[playerid][InHappyEnding] == true)
	{
		SendClientMessageEx(playerid, COLOR_RED, "{FF0000}� Error: {FFFFFF}�� ����� ������ ������ ��ٸ�����.");
		return 0;
	}

	else if(!Player[playerid][pSpawned] && !IsPlayerRootAdmin(playerid))
	{
		SendClientMessageEx(playerid, COLOR_RED, "{FF0000}� Error: {FFFFFF}��ɾ ����ϱ� ���� ���� �ϼž� �մϴ�.");
		return 0;
	}

	else if(Round[Current] != -1 && Round[LoadScreen] == true && Player[playerid][pPlaying] == true)
	{
		SendClientMessageEx(playerid, COLOR_RED, "{FF0000}� Error: {FFFFFF}BASE/TDM�� �ε�� ������ ��ɾ ����� �� �����ϴ�.");
		return 0;
	}

	else if(Player[playerid][AFK] == true && strcmp(tmp, "/afk", true) != 0)
	{
		SendClientMessageEx(playerid, COLOR_RED, "{FF0000}� Error: {FFFFFF}����� AFK ���� ��ȯ�Ǿ����ϴ�, (/afk)�� �ٽ� �Ϲ� ���� ��ȯ�� �� �ֽ��ϴ�.");
		return 0;
	}

	else if(Player[playerid][Specing] == true || Player[playerid][SpecingBase] == true)
	{
	    if (strcmp(tmp, "/spec", true) != 0) {
			SendClientMessageEx(playerid, COLOR_RED, "{FF0000}� Error: {FFFFFF}������ ���� �߿��� ����� �� �����ϴ�, (/spec exit)�� ������ �׸��� �� �ֽ��ϴ�.");
			return 0;
		}
	}

	else if(Player[playerid][pDuel] > 0 && strcmp(tmp, "/exit", true) != 0 && strcmp(tmp, "/kill", true) != 0)
	{
		SendClientMessageEx(playerid, COLOR_RED, "{FF0000}� Error: {FFFFFF}��󿡼��� ����� �� �����ϴ�, (/exit)�� ������ �� �ֽ��ϴ�.");
		return 0;
	}

	else if(Player[playerid][DM] > 0 && strcmp(tmp, "/leave", true) != 0 && strcmp(tmp, "/dm", true) != 0)
	{
		SendClientMessageEx(playerid, COLOR_RED, "{FF0000}� Error: {FFFFFF}DM �߿��� ����� �� �����ϴ�, (/leave)�� ������ �� �ֽ��ϴ�.");
		return 0;
	}

	/* In case you wanna log all player commands, uncomment this
	#if LOG_SYSTEM == 1
	new string[256];
	format(string,256,"%s %c /%s.", PlayerName(playerid), 175, tmp);
    WriteLog("commands", string);
	#endif*/

	return 1;
}

public OnPlayerEnterCheckpoint(playerid)
{
	if(Player[playerid][pTeam] != Round[Attackers] && !IsPlayerInAnyVehicle(playerid)
	&& Player[playerid][State] != STATE_PAUSED && Player[playerid][pPlaying])
	{
		Round[TimeInCP] = Config[cp_time];
		Round[PlayerOnCP] = false;
	}
	return 1;
}

public OnPlayerLeaveCheckpoint(playerid)
{
	if(Player[playerid][pTeam] == Round[Attackers])
	{
		SetPlayerColor(playerid, GetTeamColor(1, Player[playerid][pTeam]) | 0x000000FF);
	}
	return 1;
}

public OnPlayerPickUpPickup(playerid,pickupid)
{
    if(Pickups[pickupid][creation_time] != 0)
	{
	  	new string[128], wepname[24];
 		GetWeaponName(Pickups[pickupid][weapon], wepname,24);
		format(string,128,"** Press 'TAB' to pickup a %s with %d ammo.", wepname,  Pickups[pickupid][ammo]);
		SendClientMessageEx(playerid, COLOR_YELLOW, string);
		Player[playerid][InPickup] = pickupid;
		SetTimerEx("ClearPlayerPickup",5000,0,"ii",playerid,pickupid);
	}
	return 1;
}

public OnPlayerExitedMenu(playerid) {
	new Menu:CurrentMenu = GetPlayerMenu(playerid);

	if(CurrentMenu == vehiclemenu)
	{
		TogglePlayerControllable(playerid, 1);
	}

	if(CurrentMenu == fightmenu)
	{
		TogglePlayerControllable(playerid, 1);
	}

	if(CurrentMenu == switch_menu) {
		TogglePlayerControllable(playerid, 1);
	}

	if(CurrentMenu == vehiclemenu_suv || CurrentMenu == vehiclemenu_bikes || CurrentMenu == vehiclemenu_car || CurrentMenu == vehiclemenu_low || CurrentMenu == vehiclemenu_air || CurrentMenu == vehiclemenu_boats || CurrentMenu == vehiclemenu_sports || CurrentMenu == vehiclemenu_other) {
		ShowMenuForPlayer(vehiclemenu, playerid);
	}

	if(CurrentMenu == CreateBaseMenu || CurrentMenu == CreateTDMMenu)
	{
		TogglePlayerControllable(playerid, 1);
	}

	if(CurrentMenu == primarymenu || CurrentMenu == secondarymenu || CurrentMenu == specialmenu || CurrentMenu == wepdone_menu)
	{
	    if(Round[Current] == -1) return 1;
	    if(Round[Paused] >= 1) TogglePlayerControllable(playerid, false);
		ShowMenuForPlayer(CurrentMenu,playerid);
	}

	if(CurrentMenu == DuelSetupMenu) {
		TogglePlayerControllable(playerid, 1);
	}

	if(Player[playerid][pPlaying] == true && Round[Paused] >= 1) {
	    TogglePlayerControllable(playerid, 0);
	}
	return 1;
}

public OnVehicleDeath(vehicleid)
{
	SetTimerEx("DestroyVehicle2", 4000, false, "i", vehicleid);
	return 1;
}

public OnPlayerSelectedMenuRow(playerid, row)
{
	new Menu:CurrentMenu = GetPlayerMenu(playerid);

	if(CurrentMenu == DMSetupMenu)
	{
		TogglePlayerControllable(playerid, true);
	    new string[256];
		switch(row)
		{
  			case 0: //Player 1 Pos
			{
				GetPlayerPos(playerid, DMCoords[DMSetupID][0], DMCoords[DMSetupID][1], DMCoords[DMSetupID][2]);
                DMCoords[DMSetupID][7] = float(GetPlayerInterior(playerid));

				format(string,256,"[DM Buildmode]: DM %d center coord set to your current position.", DMSetupID);
				SendClientMessageEx(playerid, COLOR_BUILDMODE,string);

				format(string,256,"%f,%f,%f,%f",DMCoords[DMSetupID][0], DMCoords[DMSetupID][1], DMCoords[DMSetupID][2],DMCoords[DMSetupID][7]);

				#if DATA_SYSTEM == 1
					dini_Set(DMfile(DMSetupID),"center", string);
				#elseif DATA_SYSTEM == 2
					UpdateSqlDM(DMSetupID, "center", string);
				#endif
	        }
	        case 1: //Min
			{
			    new Float:zzz;
				GetPlayerPos(playerid, DMCoords[DMSetupID][4], DMCoords[DMSetupID][5], zzz);

				format(string,256,"[DM Buildmode]: DM %d min coord set to your current position.", DMSetupID);
				SendClientMessageEx(playerid, COLOR_BUILDMODE,string);

				format(string,256,"%f,%f",DMCoords[DMSetupID][4], DMCoords[DMSetupID][5]);

				#if DATA_SYSTEM == 1
					dini_Set(DMfile(DMSetupID),"min", string);
				#elseif DATA_SYSTEM == 2
					UpdateSqlDM(DuelSetupID, "min", string);
				#endif
	        }
    	    case 2: //Max
			{
			    new Float:zzz;
				GetPlayerPos(playerid, DMCoords[DMSetupID][5], DMCoords[DMSetupID][6], zzz);

				format(string,256,"[DM Buildmode]: DM %d max coord set to your current position.", DMSetupID);
				SendClientMessageEx(playerid, COLOR_BUILDMODE,string);

				format(string,256,"%f,%f",DMCoords[DMSetupID][5], DMCoords[DMSetupID][6]);

				#if DATA_SYSTEM == 1
					dini_Set(DMfile(DMSetupID),"max", string);
				#elseif DATA_SYSTEM == 2
					UpdateSqlDM(DuelSetupID, "max", string);
				#endif
	        }
		}
	}

	if(CurrentMenu == DuelSetupMenu)
	{
		TogglePlayerControllable(playerid, true);
	    new string[256];
		switch(row)
		{
  			case 0: //Player 1 Pos
			{
				GetPlayerPos(playerid, DuelCoords[DuelSetupID][0], DuelCoords[DuelSetupID][1], DuelCoords[DuelSetupID][2]);
				GetPlayerFacingAngle(playerid, DuelCoords[DuelSetupID][3]);

				format(string,256,"[Duel Buildmode]: Duel %d player 1 coord set to your current position.", DuelSetupID);
				SendClientMessageEx(playerid, COLOR_BUILDMODE,string);

				format(string,256,"%f,%f,%f,%f",DuelCoords[DuelSetupID][0], DuelCoords[DuelSetupID][1], DuelCoords[DuelSetupID][2], DuelCoords[DuelSetupID][3]);

				#if DATA_SYSTEM == 1
					dini_Set(Duelfile(DuelSetupID), "p1", string);
				#elseif DATA_SYSTEM == 2
					UpdateSqlDuelStr(DuelSetupID, "p1", string);
				#endif
	        }
	        case 1: //Player 2 Pos
			{
				GetPlayerPos(playerid, DuelCoords[DuelSetupID][4], DuelCoords[DuelSetupID][5], DuelCoords[DuelSetupID][6]);
				DuelCoords[DuelSetupID][8] = float(GetPlayerInterior(playerid));
   				GetPlayerFacingAngle(playerid, DuelCoords[DuelSetupID][7]);

				format(string,256,"[Duel Buildmode]: Duel %d player 2 coord set to your current position.", DuelSetupID);
				SendClientMessageEx(playerid, COLOR_BUILDMODE,string);

				format(string,256,"%f,%f,%f,%f,%f",DuelCoords[DuelSetupID][4], DuelCoords[DuelSetupID][5], DuelCoords[DuelSetupID][6], DuelCoords[DuelSetupID][7], DuelCoords[DuelSetupID][8]);

				#if DATA_SYSTEM == 1
					dini_Set(Duelfile(DuelSetupID), "p2", string);
				#elseif DATA_SYSTEM == 2
					UpdateSqlDuelStr(DuelSetupID, "p2", string);
				#endif
	        }
		}
	}

	if(CurrentMenu == SetTheWorldTime)
	{
		new string[256];
		if(row == 0)
		{
		        #if DATA_SYSTEM == 1
					dini_IntSet(CreateFileString,"time",0);
					format(string,256, "[Buildmode]: %s ~> World Time Set ~> %d",CreateFileString,0);
				#elseif DATA_SYSTEM == 2
				    if(WorkingOnFileType == 1) { // base
				    	UpdateSqlBaseInt(WorkingOnFileID, "time", 0);
				    } else { // tdm
				    	UpdateSqlTDMInt(WorkingOnFileID, "time", 0);
					}
					format(string,256, "[Buildmode]: %d ~> World Time Set ~> %d",WorkingOnFileID,0);
				#endif

				SendClientMessageEx(playerid,COLOR_BUILDMODE,string);
				//printf("%s",string);
				TogglePlayerControllable(playerid,true);
		}
	  	else
	  	{

		    #if DATA_SYSTEM == 1
				dini_IntSet(CreateFileString,"time",row*4);
				format(string,256, "[Buildmode]: %s ~> World Time Set ~> %d",CreateFileString,row*4);
			#elseif DATA_SYSTEM == 2
			    if(WorkingOnFileType == 1) { // base
			    	UpdateSqlBaseInt(WorkingOnFileID, "time", row*4);
			    } else { // tdm
			    	UpdateSqlTDMInt(WorkingOnFileID, "time", row*4);
				}
				format(string,256, "[Buildmode]: %d ~> World Time Set ~> %d",WorkingOnFileID,row*4);
			#endif
			SendClientMessageEx(playerid,COLOR_BUILDMODE,string);
			//printf("%s",string);
			TogglePlayerControllable(playerid,true);
  		}
	}

	if(CurrentMenu == CreateTDMMenu)
	{
	    TogglePlayerControllable(playerid,true);
		new string[256];
		new Float:PlayerPos[3];
		GetPlayerPos(playerid,PlayerPos[0],PlayerPos[1],PlayerPos[2]);
		switch(row)
		{
  			case 0: //Def Spawn
			{
				format(string,256, "%f,%f,%f\n",PlayerPos[0],PlayerPos[1],PlayerPos[2]);
				#if DATA_SYSTEM == 1
					dini_Set(CreateFileString,"def",string);
				#elseif DATA_SYSTEM == 2
				    UpdateSqlTDMStr(WorkingOnFileID, "def", string);
  			 	#endif

				format(string,256, "[TDM Buildmode]: %s ~> Defenders Spawn ~> %f,%f,%f",CreateFileString,PlayerPos[0],PlayerPos[1],PlayerPos[2]);
				SendClientMessageEx(playerid,COLOR_BUILDMODE,string);

   				//printf("%s",string);
			}
   			case 1: //Ata Spawn
			{
				format(string,256, "%f,%f,%f\n",PlayerPos[0],PlayerPos[1],PlayerPos[2]);

				#if DATA_SYSTEM == 1
					dini_Set(CreateFileString,"ata",string);
				#elseif DATA_SYSTEM == 2
				    UpdateSqlTDMStr(WorkingOnFileID, "ata", string);
				#endif

				format(string,256, "[TDM Buildmode]: %s ~> Attackers Spawn ~> %f,%f,%f",CreateFileString,PlayerPos[0],PlayerPos[1],PlayerPos[2]);
				SendClientMessageEx(playerid,COLOR_BUILDMODE,string);
   				//printf("%s",string);
			}
  			case 2: //CP
			{
			    format(string,256, "%f,%f,%f\n",PlayerPos[0],PlayerPos[1],PlayerPos[2]);

				#if DATA_SYSTEM == 1
					dini_Set(CreateFileString,"home",string);
					dini_IntSet(CreateFileString,"interior",GetPlayerInterior(playerid));
				#elseif DATA_SYSTEM == 2
				    UpdateSqlTDMStr(WorkingOnFileID, "home", string);
				    UpdateSqlTDMInt(WorkingOnFileID, "interior", GetPlayerInterior(playerid));
				#endif

				format(string,256, "[TDM Buildmode]: %s ~> Checkpoint ~> %f,%f,%f",CreateFileString,PlayerPos[0],PlayerPos[1],PlayerPos[2]);
				SendClientMessageEx(playerid,COLOR_BUILDMODE,string);
   				//printf("%s",string);
			}
    		case 3: //World Time
			{
				ShowMenuForPlayer(SetTheWorldTime,playerid);
				TogglePlayerControllable(playerid,false);
			}
      		case 4: //Min Coord
			{
			    format(string,256, "%f,%f",PlayerPos[0],PlayerPos[1]);
				#if DATA_SYSTEM == 1
					dini_Set(CreateFileString,"min",string);
				#elseif DATA_SYSTEM == 2
				    UpdateSqlTDMStr(WorkingOnFileID, "min", string);
				#endif

				format(string,256, "[TDM Buildmode]: %s ~> Min Coords ~> %f,%f",CreateFileString,PlayerPos[0],PlayerPos[1]);
				SendClientMessageEx(playerid,COLOR_BUILDMODE,string);
   				//printf("%s",string);
			}
      		case 5: //Max Coord
			{
				format(string,256, "%f,%f\n",PlayerPos[0],PlayerPos[1]);
				#if DATA_SYSTEM == 1
					dini_Set(CreateFileString,"max",string);
				#elseif DATA_SYSTEM == 2
				    UpdateSqlTDMStr(WorkingOnFileID, "max", string);
				#endif

				format(string,256, "[TDM Buildmode]: %s ~> Max Coords ~> %f,%f",CreateFileString,PlayerPos[0],PlayerPos[1]);
				SendClientMessageEx(playerid,COLOR_BUILDMODE,string);
   				//printf("%s",string);
			}
		}
	}

	if(CurrentMenu == CreateBaseMenu)
	{
	    TogglePlayerControllable(playerid,true);
		new string[256];
		new Float:PlayerPos[3];
		GetPlayerPos(playerid,PlayerPos[0],PlayerPos[1],PlayerPos[2]);
		switch(row)
		{
  			case 0: //Def Spawn
			{
				#if DATA_SYSTEM == 1
				    format(string,256, "%f,%f,%f\n",PlayerPos[0],PlayerPos[1],PlayerPos[2]);
					dini_Set(CreateFileString,"d_0",string);
				#elseif DATA_SYSTEM == 2
					new string1[256], string2[256], string3[256];
				    format(string1,256, "%f",PlayerPos[0]);
				    format(string2,256, "%f",PlayerPos[1]);
				    format(string3,256, "%f",PlayerPos[2]);
				    UpdateSqlBaseStr(WorkingOnFileID, "d_x", string1);
				    UpdateSqlBaseStr(WorkingOnFileID, "d_y", string2);
				    UpdateSqlBaseStr(WorkingOnFileID, "d_z", string3);
				#endif

				format(string,256, "[Base Buildmode]: %s ~> Defenders Spawn ~> %f,%f,%f",CreateFileString,PlayerPos[0],PlayerPos[1],PlayerPos[2]);
				SendClientMessageEx(playerid,COLOR_BUILDMODE,string);
   				//printf("%s",string);
			}
   			case 1: //Ata Spawn
			{
 				#if DATA_SYSTEM == 1
				    format(string,256, "%f,%f,%f\n",PlayerPos[0],PlayerPos[1],PlayerPos[2]);
					dini_Set(CreateFileString,"a_0",string);
				#elseif DATA_SYSTEM == 2
					new string1[256], string2[256], string3[256];
				    format(string1,256, "%f",PlayerPos[0]);
				    format(string2,256, "%f",PlayerPos[1]);
				    format(string3,256, "%f",PlayerPos[2]);
				    UpdateSqlBaseStr(WorkingOnFileID, "a_x", string1);
				    UpdateSqlBaseStr(WorkingOnFileID, "a_y", string2);
				    UpdateSqlBaseStr(WorkingOnFileID, "a_z", string3);
				#endif
   			    format(string,256, "[Base Buildmode]: %s ~> Attackers Spawn ~> %f,%f,%f",CreateFileString,PlayerPos[0],PlayerPos[1],PlayerPos[2]);
				SendClientMessageEx(playerid,COLOR_BUILDMODE,string);
   				//printf("%s",string);
			}
  			case 2: //CP
			{
 				#if DATA_SYSTEM == 1
				    format(string,256, "%f,%f,%f\n",PlayerPos[0],PlayerPos[1],PlayerPos[2]);
					dini_Set(CreateFileString,"home",string);
					dini_IntSet(CreateFileString,"interior",GetPlayerInterior(playerid));
				#elseif DATA_SYSTEM == 2
					new string1[256], string2[256], string3[256];
				    format(string1,256, "%f",PlayerPos[0]);
				    format(string2,256, "%f",PlayerPos[1]);
				    format(string3,256, "%f",PlayerPos[2]);
				    UpdateSqlBaseStr(WorkingOnFileID, "home_x", string1);
				    UpdateSqlBaseStr(WorkingOnFileID, "home_y", string2);
				    UpdateSqlBaseStr(WorkingOnFileID, "home_z", string3);
				    UpdateSqlBaseInt(WorkingOnFileID, "interior", GetPlayerInterior(playerid));
				#endif

			    format(string,256, "[Base Buildmode]: %d ~> Checkpoint ~> %f,%f,%f",CreateFileString,PlayerPos[0],PlayerPos[1],PlayerPos[2]);
				SendClientMessageEx(playerid,COLOR_BUILDMODE,string);
   				//printf("%s",string);
			}
    		case 3: //World Time
			{
				ShowMenuForPlayer(SetTheWorldTime,playerid);
				TogglePlayerControllable(playerid,false);
			}
		}
	}
	if(CurrentMenu == vehiclemenu)
	{
	    switch(row)
	    {
	        case 0: //Aircraft
	        {
	            if(GetPlayerInterior(playerid)==0) {
		       		ShowMenuForPlayer(vehiclemenu_air, playerid);
				} else {
				    ShowMenuForPlayer(vehiclemenu, playerid);
				    SendClientMessageEx(playerid, COLOR_RED, "{FF0000}� Error: {FFFFFF}�ǹ� ���ο����� ����⸦ ��ȯ�� �� �����ϴ�!");
				}
		    }
		    case 1: //4-Door SUV
		    {
			    ShowMenuForPlayer(vehiclemenu_suv, playerid);
		    }
		    case 2: //4-Door Car
		    {
		    	ShowMenuForPlayer(vehiclemenu_car, playerid);
		    }
		    case 3: //Boats
		    {
		    	if(GetPlayerInterior(playerid)==0) {
		        	ShowMenuForPlayer(vehiclemenu_boats, playerid);
				} else {
				    ShowMenuForPlayer(vehiclemenu, playerid);
				    SendClientMessageEx(playerid, COLOR_RED, "{FF0000}� Error: {FFFFFF}�ǹ� ���ο����� ��Ʈ�� ��ȯ�� �� �����ϴ�!");
				}
			}
			case 4: //Sports
			{
		 		ShowMenuForPlayer(vehiclemenu_sports, playerid);
		 	}
			case 5: //Lowriders
			{
				ShowMenuForPlayer(vehiclemenu_low, playerid);
			}
			case 6: //Bikes
			{
				ShowMenuForPlayer(vehiclemenu_bikes, playerid);
			}
 			case 7: //Other
			{
				ShowMenuForPlayer(vehiclemenu_other, playerid);
			}
		}
	}

	if(CurrentMenu == fightmenu)
	{
	    #if DATA_SYSTEM == 1
			new file[200];
			format(file, sizeof(file), "combinations/players/%s.ini", nick_encode(PlayerName(playerid)));
		#endif
	    switch(row)
	    {
	        case 0: //Normal
	        {
	            #if DATA_SYSTEM == 1
		            dini_IntSet(file,"fightstyle", FIGHT_STYLE_NORMAL);
	            #elseif DATA_SYSTEM == 2
                	UpdateSqlUserDataInt(playerid, "fightstyle", FIGHT_STYLE_NORMAL);
	            #endif
	            SetPlayerFightingStyle(playerid, FIGHT_STYLE_NORMAL);
				SendClientMessageEx(playerid, COLOR_YELLOW, "** ����� ������ �⺻���� �����Ǿ����ϴ�!");
				TogglePlayerControllable(playerid, 1);
		    }
		    case 1: //Boxing
		    {
		       	#if DATA_SYSTEM == 1
		            dini_IntSet(file,"fightstyle", FIGHT_STYLE_BOXING);
	            #elseif DATA_SYSTEM == 2
                	UpdateSqlUserDataInt(playerid, "fightstyle", FIGHT_STYLE_BOXING);
	            #endif
	            SetPlayerFightingStyle(playerid, FIGHT_STYLE_BOXING);
				SendClientMessageEx(playerid, COLOR_YELLOW, "** ����� ������ Boxing ���� �����Ǿ����ϴ�!");
				TogglePlayerControllable(playerid, 1);
		    }
		    case 2: //Kung Fu
		    {
                #if DATA_SYSTEM == 1
		            dini_IntSet(file,"fightstyle", FIGHT_STYLE_KUNGFU);
	            #elseif DATA_SYSTEM == 2
                	UpdateSqlUserDataInt(playerid, "fightstyle", FIGHT_STYLE_KUNGFU);
	            #endif
	            SetPlayerFightingStyle(playerid, FIGHT_STYLE_KUNGFU);
				SendClientMessageEx(playerid, COLOR_YELLOW, "** ����� ������ Kung Fu �� �����Ǿ����ϴ�!");
				TogglePlayerControllable(playerid, 1);
		    }
		    case 3: //Knee Head
		    {
		        #if DATA_SYSTEM == 1
		            dini_IntSet(file,"fightstyle", FIGHT_STYLE_KNEEHEAD);
	            #elseif DATA_SYSTEM == 2
                	UpdateSqlUserDataInt(playerid, "fightstyle", FIGHT_STYLE_KNEEHEAD);
	            #endif
	            SetPlayerFightingStyle(playerid, FIGHT_STYLE_KNEEHEAD);
				SendClientMessageEx(playerid, COLOR_YELLOW, "** ����� ������ Knee Head �� �����Ǿ����ϴ�!");
				TogglePlayerControllable(playerid, 1);
			}
			case 4: //Grab Kick
			{
			    #if DATA_SYSTEM == 1
		            dini_IntSet(file,"fightstyle", FIGHT_STYLE_GRABKICK);
	            #elseif DATA_SYSTEM == 2
                	UpdateSqlUserDataInt(playerid, "fightstyle", FIGHT_STYLE_GRABKICK);
	            #endif
	            SetPlayerFightingStyle(playerid, FIGHT_STYLE_GRABKICK);
				SendClientMessageEx(playerid, COLOR_YELLOW, "** ����� ������ Grab Kick ���� �����Ǿ����ϴ�!");
				TogglePlayerControllable(playerid, 1);
		 	}
			case 5: //Elbow
			{
			    #if DATA_SYSTEM == 1
		            dini_IntSet(file,"fightstyle", FIGHT_STYLE_ELBOW);
	            #elseif DATA_SYSTEM == 2
                	UpdateSqlUserDataInt(playerid, "fightstyle", FIGHT_STYLE_ELBOW);
	            #endif
	            SetPlayerFightingStyle(playerid, FIGHT_STYLE_ELBOW);
				SendClientMessageEx(playerid, COLOR_YELLOW, "** ����� ������ Elbow �� �����Ǿ����ϴ�!");
				TogglePlayerControllable(playerid, 1);
			}
		}
	}
	if(CurrentMenu == vehiclemenu_air)
	{
       	if(VehicleForAdmins[1][row] == true && !IsPlayerAdmin3(playerid))
		{
			SendClientMessageEx(playerid, COLOR_RED, "{FF0000}� Error: {FFFFFF}���� �ȿ����� ��ȯ�� �� �����ϴ�!");
  		 	TogglePlayerControllable(playerid, true);
		}
		else
		{
			SpawnVehicleForPlayer(playerid, VehicleMenuID[1][row]);
		}
	}
	if(CurrentMenu == vehiclemenu_suv)
	{
       	if(VehicleForAdmins[2][row] == true && !IsPlayerAdmin3(playerid))
		{
			SendClientMessageEx(playerid, COLOR_RED, "{FF0000}� Error: {FFFFFF}���� �ȿ����� ��ȯ�� �� �����ϴ�!");
  		 	TogglePlayerControllable(playerid, true);
		}
		else
		{
			SpawnVehicleForPlayer(playerid, VehicleMenuID[2][row]);
		}
	}
	if(CurrentMenu == vehiclemenu_car)
	{
       	if(VehicleForAdmins[3][row] == true && !IsPlayerAdmin3(playerid))
		{
			SendClientMessageEx(playerid, COLOR_RED, "{FF0000}� Error: {FFFFFF}���� �ȿ����� ��ȯ�� �� �����ϴ�!");
  		 	TogglePlayerControllable(playerid, true);
		}
		else
		{
			SpawnVehicleForPlayer(playerid, VehicleMenuID[3][row]);
		}
	}
	if(CurrentMenu == vehiclemenu_boats)
	{
       	if(VehicleForAdmins[4][row] == true && !IsPlayerAdmin3(playerid))
		{
			SendClientMessageEx(playerid, COLOR_RED, "{FF0000}� Error: {FFFFFF}���� �ȿ����� ��ȯ�� �� �����ϴ�!");
			TogglePlayerControllable(playerid, true);
		}
		else
		{
			SpawnVehicleForPlayer(playerid, VehicleMenuID[4][row]);
		}
	}
	if(CurrentMenu == vehiclemenu_sports)
	{
       	if(VehicleForAdmins[5][row] == true && !IsPlayerAdmin3(playerid))
		{
			SendClientMessageEx(playerid, COLOR_RED, "{FF0000}� Error: {FFFFFF}���� �ȿ����� ��ȯ�� �� �����ϴ�!");
			TogglePlayerControllable(playerid, true);
		}
		else
		{
			SpawnVehicleForPlayer(playerid, VehicleMenuID[5][row]);
		}
	}
	if(CurrentMenu == vehiclemenu_low)
	{
       	if(VehicleForAdmins[6][row] == true && !IsPlayerAdmin3(playerid))
		{
			SendClientMessageEx(playerid, COLOR_RED, "{FF0000}� Error: {FFFFFF}���� �ȿ����� ��ȯ�� �� �����ϴ�!");
			TogglePlayerControllable(playerid, true);
		}
		else
		{
			SpawnVehicleForPlayer(playerid, VehicleMenuID[6][row]);
		}
	}
	if(CurrentMenu == vehiclemenu_bikes)
	{
       	if(VehicleForAdmins[7][row] == true && !IsPlayerAdmin3(playerid))
		{
			SendClientMessageEx(playerid, COLOR_RED, "{FF0000}� Error: {FFFFFF}���� �ȿ����� ��ȯ�� �� �����ϴ�!");
			TogglePlayerControllable(playerid, true);
		}
		else
		{
			SpawnVehicleForPlayer(playerid, VehicleMenuID[7][row]);
		}
	}
	if(CurrentMenu == vehiclemenu_other)
	{
       	if(VehicleForAdmins[8][row] == true && !IsPlayerAdmin3(playerid))
		{
			SendClientMessageEx(playerid, COLOR_RED, "{FF0000}� Error: {FFFFFF}���� �ȿ����� ��ȯ�� �� �����ϴ�!");
			TogglePlayerControllable(playerid, true);
		}
		else
		{
			SpawnVehicleForPlayer(playerid, VehicleMenuID[8][row]);
		}
	}

	if(CurrentMenu == switch_menu)
	{
	    if(TeamLocked[row] == true)
	    {
	    	ShowMenuForPlayer(switch_menu, playerid);
	        SendClientMessageEx(playerid, COLOR_RED, "Error: �� ���� ��Ȱ��ȭ�Ǿ��ֽ��ϴ�.");
			return 1;
		}
		new string[128];
		TogglePlayerControllable(playerid, 1);

		if (Config[autobalance] == 0) {
			switch(row)
			{
				case 0: //Home
				{
					if(Player[playerid][pTeam] != T_HOME)
				    {
						format(string,128,"** %s ���� %s ������ �����ϼ̽��ϴ�.", PlayerName(playerid),GetTeamName(T_HOME));
						SendClientMessageToAllEx(COLOR_YELLOW,string);
			            SetPlayerTeamEx(playerid, T_HOME);
			            #if DATA_SYSTEM == 2
			            	SetTeamGameSession(playerid, HomeName);
						#endif
					}
				}
				case 1: //Home Sub
				{
					if(Player[playerid][pTeam] != T_SUBHOME)
				    {
						format(string,128,"** %s ���� %s ������ �����ϼ̽��ϴ�.", PlayerName(playerid),GetTeamName(T_SUBHOME));
						SendClientMessageToAllEx(COLOR_YELLOW,string);
			            SetPlayerTeamEx(playerid, T_SUBHOME);
						new tname[256];
						format(tname, 256, "Sub %s", HomeName);

			            #if DATA_SYSTEM == 2
			            	SetTeamGameSession(playerid, tname);
						#endif
					}
				}
				case 2: //Away
				{
					if(Player[playerid][pTeam] != T_AWAY)
				    {
						format(string,128,"** %s ���� %s ������ �����ϼ̽��ϴ�.", PlayerName(playerid),GetTeamName(T_AWAY));
						SendClientMessageToAllEx(COLOR_YELLOW,string);
			            SetPlayerTeamEx(playerid, T_AWAY);

			            #if DATA_SYSTEM == 2
			            	SetTeamGameSession(playerid, AwayName);
						#endif
					}
	   			}
				case 3: //Away Sub
				{
					if(Player[playerid][pTeam] != T_SUBAWAY)
				    {
						format(string,128,"** %s ���� %s ������ �����ϼ̽��ϴ�.", PlayerName(playerid),GetTeamName(T_SUBAWAY));
						SendClientMessageToAllEx(COLOR_YELLOW,string);
			            SetPlayerTeamEx(playerid, T_SUBAWAY);
						new tname[256];
						format(tname, 256, "Sub %s", AwayName);

			            #if DATA_SYSTEM == 2
			            	SetTeamGameSession(playerid, tname);
						#endif
					}
				}
				case 4: //Ref
				{
					if(Player[playerid][pTeam] != T_REF)
				    {
						format(string,128,"** %s ���� %s ������ �����ϼ̽��ϴ�.", PlayerName(playerid),GetTeamName(T_REF));
						SendClientMessageToAllEx(COLOR_YELLOW,string);
			            SetPlayerTeamEx(playerid, T_REF);

			            #if DATA_SYSTEM == 2
			            	SetTeamGameSession(playerid, RefName);
						#endif
					}
				}
	  			case 5: //Auto-Assign
				{
				    if(Player[playerid][pTeam] != GetTeamWithLessMembers())
				    {
						format(string,128,"** %s ���� %s ������ �����ϼ̽��ϴ�.", PlayerName(playerid),GetTeamName(GetTeamWithLessMembers()));
						SendClientMessageToAllEx(COLOR_YELLOW,string);
					    SetPlayerTeamEx(playerid, GetTeamWithLessMembers());

			            #if DATA_SYSTEM == 2
			            	SetTeamGameSession(playerid, GetTeamName(GetTeamWithLessMembers()));
						#endif
					}
				}
			}
		} else {
			switch(row)
			{
				case 0: //Ref
				{
					if(Player[playerid][pTeam] != T_REF)
				    {
						format(string,128,"** %s ���� %s ������ �����ϼ̽��ϴ�.", PlayerName(playerid),GetTeamName(T_REF));
						SendClientMessageToAllEx(COLOR_YELLOW,string);
			            SetPlayerTeamEx(playerid, T_REF);

			            #if DATA_SYSTEM == 2
			            	SetTeamGameSession(playerid, RefName);
						#endif
					}
				}
	  			case 1: //Auto-Assign
				{
				    if(Player[playerid][pTeam] != GetTeamWithLessMembers())
				    {
						format(string,128,"** %s ���� %s ������ �����ϼ̽��ϴ�.", PlayerName(playerid),GetTeamName(GetTeamWithLessMembers()));
						SendClientMessageToAllEx(COLOR_YELLOW,string);
					    SetPlayerTeamEx(playerid, GetTeamWithLessMembers());

			            #if DATA_SYSTEM == 2
			            	SetTeamGameSession(playerid, GetTeamName(GetTeamWithLessMembers()));
						#endif
					}
				}
			}
		}

	}

	if(CurrentMenu == primarymenu)
	{
	    if(Player[playerid][pPlaying] == false) return 1;
	    
	    new string[256];
		if(row < WeaponsMenus[PrimaryCount])
		{
 		 	Player[playerid][PrimaryWep] = 0;
		 	Player[playerid][PrimaryWepAmmo] = 0;
		 	Player[playerid][SecondaryWep] = 0;
		 	Player[playerid][SecondaryWepAmmo] = 0;
		  	Player[playerid][TerciaryWep] = 0;
		 	Player[playerid][TerciaryWepAmmo] = 0;
		 	Player[playerid][SpecialWep] = 0;
		 	Player[playerid][SpecialWepAmmo] = 0;

			Player[playerid][PrimaryWep] = WeaponsMenus[PrimaryMenuIDs][row];
			Player[playerid][PrimaryWepAmmo] = WeaponsMenus[wAmmo][WeaponsMenus[PrimaryMenuIDs][row]];

			if (Player[playerid][pTeam] == T_HOME && WeaponLimit[WeaponsMenus[PrimaryMenuIDs][row]][home_used] >= WeaponLimit[WeaponsMenus[PrimaryMenuIDs][row]][limit]) {
				new thelimit[200];
			    format(thelimit, 200, "�� ����� �̹� �ٸ� �������� �����߽��ϴ�! (%d) %s", WeaponLimit[WeaponsMenus[PrimaryMenuIDs][row]][limit], GetWepName(WeaponsMenus[PrimaryMenuIDs][row]));
			   	SendClientMessageEx(playerid, COLOR_RED, thelimit);
 		 		Player[playerid][PrimaryWep] = 0;
		 		Player[playerid][PrimaryWepAmmo] = 0;
		 		TryGunMenu(1, playerid);
			} else if (Player[playerid][pTeam] == T_AWAY && WeaponLimit[WeaponsMenus[PrimaryMenuIDs][row]][away_used] >= WeaponLimit[WeaponsMenus[PrimaryMenuIDs][row]][limit]) {
				new thelimit[200];
				format(thelimit, 200, "�� ����� �̹� �ٸ� �������� �����߽��ϴ�! (%d) %s", WeaponLimit[WeaponsMenus[PrimaryMenuIDs][row]][limit], GetWepName(WeaponsMenus[PrimaryMenuIDs][row]));
			   	SendClientMessageEx(playerid, COLOR_RED, thelimit);
 		 		Player[playerid][PrimaryWep] = 0;
		 		Player[playerid][PrimaryWepAmmo] = 0;
		 		TryGunMenu(1, playerid);
			} else {
				format(string,sizeof(string),"* %s (%d ��) ����",GetWepName(WeaponsMenus[PrimaryMenuIDs][row]), WeaponsMenus[wAmmo][WeaponsMenus[PrimaryMenuIDs][row]]);
				SendClientMessageEx(playerid, COLOR_YELLOW, string);
				TryGunMenu(2, playerid);
				//ShowMenuForPlayer(secondarymenu, playerid);
				if (Player[playerid][pTeam] == T_HOME) {
					WeaponLimit[WeaponsMenus[PrimaryMenuIDs][row]][home_used]++;
				} else if (Player[playerid][pTeam] == T_AWAY) {
					WeaponLimit[WeaponsMenus[PrimaryMenuIDs][row]][away_used]++;
				}
			}
		}
		else
		{
			TryGunMenu(2, playerid);
			//ShowMenuForPlayer(secondarymenu, playerid);
		}
		if(Round[Paused] >= 1) TogglePlayerControllable(playerid, false);
	}
	if(CurrentMenu == secondarymenu)
	{
	    if(Player[playerid][pPlaying] == false) return 1;
	    new string[256];
		if(row < WeaponsMenus[SecondaryCount])
		{
		    if(!CheckFreeWeapon(playerid, WeaponsMenus[SecondaryMenuIDs][row]))
		    {
				SendClientMessageEx(playerid, COLOR_RED,"Error: ����� �̹� �� ���Կ� ���⸦ �����ϼ̽��ϴ�.");
				return ShowMenuForPlayer(secondarymenu, playerid);
			}

			Player[playerid][SecondaryWep] = WeaponsMenus[SecondaryMenuIDs][row];
			Player[playerid][SecondaryWepAmmo] = WeaponsMenus[wAmmo][WeaponsMenus[SecondaryMenuIDs][row]];

			if (Player[playerid][pTeam] == T_HOME && WeaponLimit[WeaponsMenus[SecondaryMenuIDs][row]][home_used] >= WeaponLimit[WeaponsMenus[SecondaryMenuIDs][row]][limit]) {
				new thelimit[200];
			    format(thelimit, 200, "�� ����� �̹� �ٸ� �������� �����߽��ϴ�! (%d) %s", WeaponLimit[WeaponsMenus[SecondaryMenuIDs][row]][limit], GetWepName(WeaponsMenus[SecondaryMenuIDs][row]));
			   	SendClientMessageEx(playerid, COLOR_RED, thelimit);
 		 		Player[playerid][SecondaryWep] = 0;
		 		Player[playerid][SecondaryWepAmmo] = 0;
		 		ShowMenuForPlayer(secondarymenu, playerid);
			} else if (Player[playerid][pTeam] == T_AWAY && WeaponLimit[WeaponsMenus[SecondaryMenuIDs][row]][away_used] >= WeaponLimit[WeaponsMenus[SecondaryMenuIDs][row]][limit]) {
				new thelimit[200];
			    format(thelimit, 200, "�� ����� �̹� �ٸ� �������� �����߽��ϴ�! (%d) %s", WeaponLimit[WeaponsMenus[SecondaryMenuIDs][row]][limit], GetWepName(WeaponsMenus[SecondaryMenuIDs][row]));
			   	SendClientMessageEx(playerid, COLOR_RED, thelimit);
 		 		Player[playerid][SecondaryWep] = 0;
		 		Player[playerid][SecondaryWepAmmo] = 0;
		 		ShowMenuForPlayer(secondarymenu, playerid);
			} else {
				format(string,sizeof(string),"* %s (%d ��) ����",GetWepName(WeaponsMenus[SecondaryMenuIDs][row]), Player[playerid][SecondaryWepAmmo]);
				SendClientMessageEx(playerid, COLOR_YELLOW, string);
				if (Player[playerid][pTeam] == T_HOME) {
					WeaponLimit[WeaponsMenus[SecondaryMenuIDs][row]][home_used]++;
				} else if (Player[playerid][pTeam] == T_AWAY) {
					WeaponLimit[WeaponsMenus[SecondaryMenuIDs][row]][away_used]++;
				}
				TryGunMenu(3, playerid);
				//ShowMenuForPlayer(terciarymenu, playerid);
			}
		}
		else if(row == WeaponsMenus[SecondaryCount])
		{
		    // they clicked next
		    TryGunMenu(3, playerid);
		}
		else
		{
		    // they clicked back
		 	if (Player[playerid][pTeam] == T_HOME) {
		 		WeaponLimit[Player[playerid][PrimaryWep]][home_used] --;
		 		WeaponLimit[Player[playerid][SecondaryWep]][home_used] --;
		 		WeaponLimit[Player[playerid][TerciaryWep]][home_used] --;
		 		WeaponLimit[Player[playerid][SpecialWep]][home_used] --;
			} else if (Player[playerid][pTeam] == T_AWAY) {
		 		WeaponLimit[Player[playerid][PrimaryWep]][away_used] --;
		 		WeaponLimit[Player[playerid][SecondaryWep]][away_used] --;
		 		WeaponLimit[Player[playerid][TerciaryWep]][away_used] --;
		 		WeaponLimit[Player[playerid][SpecialWep]][away_used] --;
			}
			Player[playerid][PrimaryWep] = 0;
		 	Player[playerid][PrimaryWepAmmo] = 0;

		 	TryGunMenuBack(1, playerid);
			//ShowMenuForPlayer(primarymenu, playerid);
 		}
 		if(Round[Paused] >= 1) TogglePlayerControllable(playerid, false);
	}
	if(CurrentMenu == terciarymenu)
	{
	    if(Player[playerid][pPlaying] == false) return 1;
	    new string[256];
		if(row < WeaponsMenus[TerciaryCount])
		{
		    if(!CheckFreeWeapon(playerid, WeaponsMenus[TerciaryMenuIDs][row]))
		    {
				SendClientMessageEx(playerid, COLOR_RED,"Error: ����� �̹� �� ���Կ� ���⸦ �����ϼ̽��ϴ�.");
				return ShowMenuForPlayer(terciarymenu, playerid);
			}

			Player[playerid][TerciaryWep] = WeaponsMenus[TerciaryMenuIDs][row];
			Player[playerid][TerciaryWepAmmo] = WeaponsMenus[wAmmo][WeaponsMenus[TerciaryMenuIDs][row]];

			if (Player[playerid][pTeam] == T_HOME && WeaponLimit[WeaponsMenus[TerciaryMenuIDs][row]][home_used] >= WeaponLimit[WeaponsMenus[TerciaryMenuIDs][row]][limit]) {
				new thelimit[200];
			    format(thelimit, 200, "�� ����� �̹� �ٸ� �������� �����߽��ϴ�! (%d) %s", WeaponLimit[WeaponsMenus[TerciaryMenuIDs][row]][limit], GetWepName(WeaponsMenus[TerciaryMenuIDs][row]));
			   	SendClientMessageEx(playerid, COLOR_RED, thelimit);
 		 		Player[playerid][TerciaryWep] = 0;
		 		Player[playerid][TerciaryWepAmmo] = 0;
		 		ShowMenuForPlayer(terciarymenu, playerid);
			} else if (Player[playerid][pTeam] == T_AWAY && WeaponLimit[WeaponsMenus[TerciaryMenuIDs][row]][away_used] >= WeaponLimit[WeaponsMenus[TerciaryMenuIDs][row]][limit]) {
				new thelimit[200];
			    format(thelimit, 200, "�� ����� �̹� �ٸ� �������� �����߽��ϴ�! (%d) %s", WeaponLimit[WeaponsMenus[TerciaryMenuIDs][row]][limit], GetWepName(WeaponsMenus[TerciaryMenuIDs][row]));
			   	SendClientMessageEx(playerid, COLOR_RED, thelimit);
 		 		Player[playerid][TerciaryWep] = 0;
		 		Player[playerid][TerciaryWepAmmo] = 0;
		 		ShowMenuForPlayer(terciarymenu, playerid);
			} else {
				format(string,sizeof(string),"* %s (%d ��) ����",GetWepName(WeaponsMenus[TerciaryMenuIDs][row]), Player[playerid][TerciaryWepAmmo]);
				SendClientMessageEx(playerid, COLOR_YELLOW, string);
				//ShowMenuForPlayer(specialmenu, playerid);
				TryGunMenu(4, playerid);
				if (Player[playerid][pTeam] == T_HOME) {
					WeaponLimit[WeaponsMenus[TerciaryMenuIDs][row]][home_used]++;
				} else if (Player[playerid][pTeam] == T_AWAY) {
					WeaponLimit[WeaponsMenus[TerciaryMenuIDs][row]][away_used]++;
				}
			}

		}
		else if(row == WeaponsMenus[TerciaryCount])
		{
			TryGunMenu(4, playerid);
		}
		else
		{
		    // they clicked back
			//ShowMenuForPlayer(secondarymenu, playerid);
		 	TryGunMenuBack(2, playerid);
		 	if (Player[playerid][pTeam] == T_HOME) {
		 		WeaponLimit[Player[playerid][SecondaryWep]][home_used] --;
		 		WeaponLimit[Player[playerid][TerciaryWep]][home_used] --;
		 		WeaponLimit[Player[playerid][SpecialWep]][home_used] --;
			} else if (Player[playerid][pTeam] == T_AWAY) {
		 		WeaponLimit[Player[playerid][SecondaryWep]][away_used] --;
		 		WeaponLimit[Player[playerid][TerciaryWep]][away_used] --;
		 		WeaponLimit[Player[playerid][SpecialWep]][away_used] --;
			}
			Player[playerid][SecondaryWep] = 0;
		 	Player[playerid][SecondaryWepAmmo] = 0;
		}
		if(Round[Paused] >= 1) TogglePlayerControllable(playerid, false);
	}
	if(CurrentMenu == specialmenu)
	{
	    if(Player[playerid][pPlaying] == false) return 1;
	    new string[256];
		if(row < WeaponsMenus[SpecialCount])
		{
		    if(!CheckFreeWeapon(playerid, WeaponsMenus[SpecialMenuIDs][row]))
		    {
				SendClientMessageEx(playerid, COLOR_RED,"Error: ����� �̹� �� ���Կ� ���⸦ �����ϼ̽��ϴ�.");
				return ShowMenuForPlayer(specialmenu, playerid);
			}

			Player[playerid][SpecialWep] = WeaponsMenus[SpecialMenuIDs][row];
			Player[playerid][SpecialWepAmmo] = WeaponsMenus[wAmmo][WeaponsMenus[SpecialMenuIDs][row]];

			if (Player[playerid][pTeam] == T_HOME && WeaponLimit[WeaponsMenus[SpecialMenuIDs][row]][home_used] >= WeaponLimit[WeaponsMenus[SpecialMenuIDs][row]][limit]) {
				new thelimit[200];
			    format(thelimit, 200, "�� ����� �̹� �ٸ� �������� �����߽��ϴ�! (%d) %s", WeaponLimit[WeaponsMenus[SpecialMenuIDs][row]][limit], GetWepName(WeaponsMenus[SpecialMenuIDs][row]));
			   	SendClientMessageEx(playerid, COLOR_RED, thelimit);
 		 		Player[playerid][SpecialWep] = 0;
		 		Player[playerid][SpecialWepAmmo] = 0;
		 		ShowMenuForPlayer(specialmenu, playerid);
			} else if (Player[playerid][pTeam] == T_AWAY && WeaponLimit[WeaponsMenus[SpecialMenuIDs][row]][away_used] >= WeaponLimit[WeaponsMenus[SpecialMenuIDs][row]][limit]) {
				new thelimit[200];
			    format(thelimit, 200, "�� ����� �̹� �ٸ� �������� �����߽��ϴ�! (%d) %s", WeaponLimit[WeaponsMenus[SpecialMenuIDs][row]][limit], GetWepName(WeaponsMenus[SpecialMenuIDs][row]));
			   	SendClientMessageEx(playerid, COLOR_RED, thelimit);
 		 		Player[playerid][SpecialWep] = 0;
		 		Player[playerid][SpecialWepAmmo] = 0;
		 		ShowMenuForPlayer(specialmenu, playerid);
			} else {
				format(string,sizeof(string),"* %s (%d ��) ����",GetWepName(WeaponsMenus[SpecialMenuIDs][row]), Player[playerid][SpecialWepAmmo]);
				SendClientMessageEx(playerid, COLOR_YELLOW, string);
				ShowMenuForPlayer(wepdone_menu, playerid);
				if (Player[playerid][pTeam] == T_HOME) {
					WeaponLimit[WeaponsMenus[SpecialMenuIDs][row]][home_used]++;
				} else if (Player[playerid][pTeam] == T_AWAY) {
					WeaponLimit[WeaponsMenus[SpecialMenuIDs][row]][away_used]++;
				}
			}
		}
		else if(row == WeaponsMenus[SpecialCount])
		{
		    // they clicked next
			ShowMenuForPlayer(wepdone_menu, playerid);
		}
		else
		{
		    // they clicked back
			//ShowMenuForPlayer(terciarymenu, playerid);
		 	TryGunMenuBack(3, playerid);
		 	if (Player[playerid][pTeam] == T_HOME) {
		 		WeaponLimit[Player[playerid][TerciaryWep]][home_used] --;
		 		WeaponLimit[Player[playerid][SpecialWep]][home_used] --;
			} else if (Player[playerid][pTeam] == T_AWAY) {
		 		WeaponLimit[Player[playerid][TerciaryWep]][away_used] --;
		 		WeaponLimit[Player[playerid][SpecialWep]][away_used] --;
			}
			Player[playerid][TerciaryWep] = 0;
		 	Player[playerid][TerciaryWepAmmo] = 0;
		}
		if(Round[Paused] >= 1) TogglePlayerControllable(playerid, false);
	}

	if(CurrentMenu == wepdone_menu)
	{
	    if(Player[playerid][pPlaying] == false) return 1;
		switch(row)
		{
			case 0: //start 0ver
			{
				//ShowMenuForPlayer(primarymenu, playerid);
		 		TryGunMenuBack(1, playerid);
			 	if (Player[playerid][pTeam] == T_HOME) {
		 			WeaponLimit[Player[playerid][PrimaryWep]][home_used] --;
		 			WeaponLimit[Player[playerid][SecondaryWep]][home_used] --;
		 			WeaponLimit[Player[playerid][TerciaryWep]][home_used] --;
		 			WeaponLimit[Player[playerid][SpecialWep]][home_used] --;
				} else if (Player[playerid][pTeam] == T_AWAY) {
		 			WeaponLimit[Player[playerid][PrimaryWep]][away_used] --;
		 			WeaponLimit[Player[playerid][SecondaryWep]][away_used] --;
		 			WeaponLimit[Player[playerid][TerciaryWep]][away_used] --;
		 			WeaponLimit[Player[playerid][SpecialWep]][away_used] --;
				}
			 	Player[playerid][PrimaryWep] = 0;
			 	Player[playerid][PrimaryWepAmmo] = 0;
			 	Player[playerid][SecondaryWep] = 0;
			 	Player[playerid][SecondaryWepAmmo] = 0;
			  	Player[playerid][TerciaryWep] = 0;
			 	Player[playerid][TerciaryWepAmmo] = 0;
			 	Player[playerid][SpecialWep] = 0;
			 	Player[playerid][SpecialWepAmmo] = 0;
			}
			case 1: //finished
			{
			    HideMenuForPlayer(wepdone_menu, playerid);
			    SetTimerEx("AllowCameraControl",500,false, "i", playerid);
				ResetPlayerWeapons(playerid);
				ClearAnimations(playerid);
			    if(Round[LoadScreen] == false)
			    {
					if(Round[Paused] < 1) TogglePlayerControllable(playerid, 1);
					StrapUp(playerid);
				}
			}
		}
	}
	return 1;
}

forward OnPlayerWepStateChange(playerid, oldstate, newstate);
public OnPlayerWepStateChange(playerid, oldstate, newstate)
{
	if ((newstate == WEAPONSTATE_RELOADING) && (Round[Current] != -1) && Player[playerid][pPlaying] == true) {
	    if ((Player[playerid][pTeam] == T_HOME) || (Player[playerid][pTeam] == T_AWAY)) {
	        if (GetPlayerWeapon(playerid) == 16) {
	            if (Config[classic_chat] == 1) {
	        		OnPlayerText(playerid, "!FIRE IN THE HOLE! [Frag Grenade]");
				} else {
	        		OnPlayerText(playerid, "FIRE IN THE HOLE! [Frag Grenade]");
				}
	        }
	    }
	}
	return 1;
}

forward OnPlayerUpdate(playerid);
public OnPlayerUpdate(playerid)
{
	Player[playerid][Tickrate]++;

	//if (GetPlayerState(playerid) != PLAYER_STATE_SPECTATING) {
	//    Player[playerid][gSpectateID] = INVALID_PLAYER_ID;
	//}

	new drunk2 = GetPlayerDrunkLevel(playerid);
	if(drunk2 < 100)
	{
	    SetPlayerDrunkLevel(playerid,2000);
	}
	else
	{
	    if(Player[playerid][DLlast] != drunk2)
	    {
	        new fps = Player[playerid][DLlast] - drunk2;
	        if((fps > 0) && (fps < 200))
			Player[playerid][FPS2] = fps;
			Player[playerid][DLlast] = drunk2;
		}
	}

	if(Player[playerid][State] != STATE_CONNECT) {
		Player[playerid][LastUpdate] = Server[ServerTicks];
		if(Player[playerid][State] == STATE_PAUSED) {
		    //OnPlayerUnpause(playerid);
		}
		Player[playerid][State] = STATE_UNPAUSED;
	}

	new wepstate = GetPlayerWeaponState(playerid);
	if (wepstate != Player[playerid][WepState]) {
	    OnPlayerWepStateChange(playerid, Player[playerid][WepState], wepstate);
	    Player[playerid][WepState] = wepstate;
	}

	new Float:PlayerHealth, Float:PlayerArmour;
	GetPlayerHealth(playerid,PlayerHealth);
	GetPlayerArmour(playerid,PlayerArmour);
	new Float:Total = PlayerArmour + PlayerHealth;
	if ((!Player[playerid][pMoney]) || (Round[Current] != -1)) {
		SetPlayerMoney(playerid,-floatround(Total));
		EnableStuntBonusForPlayer(playerid, 0);
	} else if (Player[playerid][pMoney]) {
		EnableStuntBonusForPlayer(playerid, 1);
	}

	if(Player[playerid][pHealth]+Player[playerid][pArmour] > PlayerHealth+PlayerArmour)
	{
	    Player[playerid][IJustLost] = floatround((Player[playerid][pHealth]+Player[playerid][pArmour]) - (PlayerHealth+PlayerArmour));
		if(Player[playerid][pHits] == 0)
		{
			Player[playerid][LastDamage] = floatround((Player[playerid][pHealth]+Player[playerid][pArmour]) - (PlayerHealth+PlayerArmour));
		}
		else
		{
			Player[playerid][LastDamage] += floatround((Player[playerid][pHealth]+Player[playerid][pArmour]) - (PlayerHealth+PlayerArmour));
		}

	    Player[playerid][pHits] ++;


	    SetTimerEx("ResetPlayerHits",1600, false, "ii", playerid, Player[playerid][pHits]);
	    new string[256];
		if(Player[playerid][pHits] == 1)
		    format(string,256,"~w~%d Hit ~n~~r~%d dmg", Player[playerid][pHits],Player[playerid][LastDamage]);
		else
		    format(string,256,"~w~%d Hits ~n~~r~%d dmg", Player[playerid][pHits],Player[playerid][LastDamage]);

	    TextDrawSetString(DamageTexts[playerid], string);
	    TextDrawShowForPlayer(playerid,DamageTexts[playerid]);

		if(Config[diag] == 1) {
	    	new diff_hpmsg[70];

			if(Player[playerid][pHits] < 3) format(diff_hpmsg, sizeof(diff_hpmsg), "{33CC00}%d {FFFFFF}Hits, {FF3300}-%d", Player[playerid][pHits], Player[playerid][LastDamage]);
	    	else if(Player[playerid][pHits] <= 7) format(diff_hpmsg, sizeof(diff_hpmsg), "{FFFF00}%d {FFFFFF}Hits, {FF3300}-%d", Player[playerid][pHits], Player[playerid][LastDamage]);
	    	else format(diff_hpmsg, sizeof(diff_hpmsg), "{FF3300}%d {FFFFFF}Hits, {FF3300}-%d", Player[playerid][pHits], Player[playerid][LastDamage]);

			
            Update3DTextLabelText(Player[playerid][DmgLabel], COLOR_WHITE, diff_hpmsg);
			Attach3DTextLabelToPlayer(Player[playerid][DmgLabel], playerid, 0.0, 0.0, 0.7);
			
			SetTimerEx("ResetDmgLabel", 2000, 0, "d", playerid);

	    	//SetPlayerChatBubble(playerid, diff_hpmsg, COLOR_WHITE, Config[NameTagDistance], 2000);
	    }

	    KillTimer(dmg_update_timer[playerid]);
	    dmg_update_timer[playerid] = SetTimerEx("HideDamage",1500,false,"ii",playerid, Player[playerid][pHits]);
	}
	if(PlayerHealth != Player[playerid][pHealth])
	{
		OnPlayerHealthChange(playerid,PlayerHealth);
    	Player[playerid][pHealth] = PlayerHealth;
	}
	if(PlayerArmour != Player[playerid][pArmour])
	{
		OnPlayerArmourChange(playerid,PlayerArmour);
		Player[playerid][pArmour] = PlayerArmour;
	}

    new keys, ud, lr;
	GetPlayerKeys(playerid, keys, ud, lr);

	if(Config[joypad] == true) {
	    if ((ud != 128 && ud != 0 && ud != -128) || (lr != 128 && lr != 0 && lr != -128)) {
	        new str[128];
	        format(str, sizeof(str), "\"%s\" ���� \"Joypad\" �������� ű �Ǽ̽��ϴ�.", PlayerName(playerid));
	        SendClientMessageToAllEx(COLOR_YELLOW, str);
	        Kick(playerid);
		}
	}

	new surf = GetPlayerSurfingVehicleID(playerid);
	if (surf != Player[playerid][SurfingVehicleID]) {
	    OnPlayerSurfingVehChange(playerid, Player[playerid][SurfingVehicleID], surf);
	}

	if(Player[playerid][pPlaying] == true) {
	    if(Round[Paused] > 0) {
	        return 0; // returning 0 in OnPlayerUpdate makes it so the player's will not appear to run in place when pressing keys.
	    }
	}
	if(Player[playerid][InHappyEnding] == true) {
		if(keys != 0 || ud != 0 || lr != 0)
	    	return 0; // don't send updates to the server for awkward key presses of players.
	}

	return 1;
}

public OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
	if(Player[playerid][inIntro]) {
		if(newkeys == KEY_FIRE)
		{
			Player[playerid][introIndex] = 999;
			return 1;
		}
	}

	if(GetPlayerState(playerid) == PLAYER_STATE_SPECTATING && Player[playerid][gSpectateID] != INVALID_PLAYER_ID)
	{
		if(newkeys == KEY_SPRINT)
		{
		    if(Player[playerid][pTeam] == T_REF) AdvanceSpectate(playerid);
		    else AdvanceTeamSpectate(playerid);
			return 1;
		}
		else if(newkeys == KEY_JUMP)
		{
	    	if(Player[playerid][pTeam] == T_REF) ReverseSpectate(playerid);
		    else ReverseTeamSpectate(playerid);
	    	return 1;
		}
		else if(newkeys == 16)
		{
	    	StopSpectate(playerid);
	    	return 1;
		}
		if(newkeys == KEY_CROUCH)
		{
		    if(GetPlayerState(Player[playerid][gSpectateID]) == PLAYER_STATE_ONFOOT)
			{
				switch(Player[playerid][gSpectateType])
		    	{
					case 1:
					{
						Player[playerid][gSpectateType] = 2;
						PlayerSpectatePlayer(playerid,Player[playerid][gSpectateID],2);
					}
					case 2:
					{
						Player[playerid][gSpectateType] = 3;
						PlayerSpectatePlayer(playerid,Player[playerid][gSpectateID],3);
					}
					case 3:
					{
						Player[playerid][gSpectateType] = 1;
						PlayerSpectatePlayer(playerid,Player[playerid][gSpectateID],1);
					}
					default:{
						Player[playerid][gSpectateType] = 1;
						PlayerSpectatePlayer(playerid,Player[playerid][gSpectateID],1);
					}
				}
			}
		    else if(IsPlayerInAnyVehicle(Player[playerid][gSpectateID]))
		    {
		    	switch(Player[playerid][gSpectateType])
		    	{
					case 1:
					{
						Player[playerid][gSpectateType] = 2;
						PlayerSpectateVehicle(playerid,Player[playerid][gSpectateID],2);
					}
					case 2:
					{
						Player[playerid][gSpectateType] = 3;
						PlayerSpectateVehicle(playerid,Player[playerid][gSpectateID],3);
					}
					case 3:
					{
						Player[playerid][gSpectateType] = 1;
						PlayerSpectateVehicle(playerid,Player[playerid][gSpectateID],1);
					}
					default:
					{
						Player[playerid][gSpectateType] = 1;
						PlayerSpectateVehicle(playerid,Player[playerid][gSpectateID],1);
					}
				}
			}
		}
	}

	if(newkeys == 160 && (!GetPlayerWeapon(playerid) || GetPlayerWeapon(playerid) == 1) && !IsPlayerInAnyVehicle(playerid) && Player[playerid][pSpawned])
	{
	    SyncPlayer(playerid);
	    return 1;
	}

	if(Server[UAVEnabled] == true)
	{
		if(Round[Current] != -1 && Player[playerid][pPlaying] == true && Player[playerid][Visible] == false && !IsPlayerInAnyVehicle(playerid))
		{
		    if((newkeys & KEY_FIRE || newkeys & KEY_SECONDARY_ATTACK) && newkeys & 128 && (Player[playerid][pTeam] == T_HOME || Player[playerid][pTeam] == T_AWAY) && IsWeaponUAV(GetPlayerWeapon(playerid)))
		    {
 				Player[playerid][Visible] = true;
 				SetTimerEx("TurnInvisible",1000,false,"i", playerid);
				for (new x = 0; x <= Server[HighestID]; x++)
				{
					if(IsPlayerConnected(x))
					{
					    if(Player[x][pPlaying] == true)
					    {
						    SetPlayerMarkerForPlayer(x,playerid, ReturnColorFromDistance(playerid, GetDistanceBetweenPlayers(x, playerid)));
						}
					}
				}
			}
		}
	}
	if(Player[playerid][InPickup] != -1)
	{
		if((newkeys & 1) && GetPlayerState(playerid) == PLAYER_STATE_ONFOOT)
		{
	     	new pickupid = Player[playerid][InPickup];
	     	if(pickupid != INVALID_PICKUP && Pickups[pickupid][weapon] > 0)
	     	{
			    if(PlayerToPoint(3.0, playerid,Pickups[pickupid][Pos_x],Pickups[pickupid][Pos_y],Pickups[pickupid][Pos_z]))
			    {
			        new string[128], wepname[24];
	  		 		GetWeaponName(Pickups[pickupid][weapon], wepname,24);
					format(string,256,"** %s (%d ��)�� �����ϼ̽��ϴ�.", wepname,  Pickups[pickupid][ammo]);
					SendClientMessageEx(playerid, COLOR_YELLOW, string);
					if(Pickups[pickupid][weapon] != 0) GivePlayerWeaponEx(playerid,Pickups[pickupid][weapon], Pickups[pickupid][ammo]);
					SetTimerEx("DestroyPickupEx",100,0,"i",pickupid);
					Player[playerid][InPickup] = -1;
			    }
			}
		}
	}
	if(IsPlayerInAnyVehicle(playerid) && GetPlayerState(playerid) == PLAYER_STATE_DRIVER && !Player[playerid][pPlaying])
	{
  		if(newkeys == 2 && Server[AllowVehicleMod] == true)
		{
            new vcolor1=random(126);
            new vcolor2=random(126);

       	    ApplyVehicleStuff(GetPlayerVehicleID(playerid));
			if(Player[playerid][pCarColor1] == -1)
			{
	   	        ChangeVehicleColor(GetPlayerVehicleID(playerid), vcolor1, vcolor2);
			}
		}
    }

	if(Player[playerid][ViewBase] == true)
	{
		if(newkeys == KEY_SPRINT)
		{
			Player[playerid][ViewBaseID] ++;
 			if(Player[playerid][ViewBaseID] > Server[TotalBases])
			{
				Player[playerid][ViewBaseID] = 1;
			}
			SetPlayerToViewBase(playerid,Player[playerid][ViewBaseID]);
		}
        else if(newkeys == KEY_JUMP)
		{
        	Player[playerid][ViewBaseID] --;
        	if(Player[playerid][ViewBaseID] == 0)
        	{
        		Player[playerid][ViewBaseID] = Server[TotalBases];
			}
			SetPlayerToViewBase(playerid,Player[playerid][ViewBaseID]);
        }
        else if(newkeys == 16)
		{
			GameTextForPlayer(playerid," ",1000,3);
	       	Player[playerid][ViewBaseID] = 0;
	       	Player[playerid][ViewBase] = false;
			SetCameraBehindPlayer(playerid);
			TogglePlayerControllable(playerid, true);
        }
        else if(newkeys == KEY_CROUCH)
		{
    		GameTextForPlayer(playerid," ",1000,3);
       		Player[playerid][ViewBaseID] = 0;
       		Player[playerid][ViewBase] = false;
			SpawnPlayerEx(playerid);
		}
  	}

	if(Player[playerid][ViewTDM] == true)
	{
 		if(newkeys == KEY_SPRINT)
		 {
       		Player[playerid][ViewTDMID] ++;
      		if(Player[playerid][ViewTDMID] > Server[TotalTDMs])
   			{
       			Player[playerid][ViewTDMID] = 1;
			}
			SetPlayerToViewTDM(playerid,Player[playerid][ViewTDMID]);
		}
        else if(newkeys == KEY_JUMP)
		{
            Player[playerid][ViewTDMID] --;
            if(Player[playerid][ViewTDMID] == 0)
        	{
        		Player[playerid][ViewTDMID] = Server[TotalTDMs];
			}
			SetPlayerToViewTDM(playerid,Player[playerid][ViewTDMID]);
        }
        else if(newkeys == 16)
		{
			GameTextForPlayer(playerid," ",1000,3);
      		Player[playerid][ViewTDMID] = 0;
       		Player[playerid][ViewTDM] = false;
			SetCameraBehindPlayer(playerid);
			TogglePlayerControllable(playerid, true);
        }
        else if(newkeys == KEY_CROUCH)
		{
    		GameTextForPlayer(playerid," ",1000,3);
           	Player[playerid][ViewTDMID] = 0;
           	Player[playerid][ViewTDM] = false;
			SpawnPlayerEx(playerid);
    	}
	}
    return 1;
}
public OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
    if(dialogid == 1)
    {
        if (response) {
        	cmd_me(playerid, inputtext);
        }
    }
    if(dialogid == 2)
    {
        if (response) {
        	cmd_nick(playerid, inputtext);
        }
    }
    if(dialogid == 3)
    {
        if (response) {
        	cmd_login(playerid, inputtext);
        }
    }
    if(dialogid == 4)
    {
        if (response) {
        	cmd_register(playerid, inputtext);
        }
    }
    if(dialogid == 6)
    {
		if(!response)
		{
			return 1;
		}
		new matchid = listitem + 1;
		DisplayMatchInfo(playerid, matchid);
    }
    #if SAMP_VERSION == 2
    
    if(dialogid == 7) // Audio Config
    {
		if(!response)
		{
			return 1;
		}
		if (listitem == 0) { // Voice Messages
            ConfigAudio[sndVoiceMsgs] = (ConfigAudio[sndVoiceMsgs] == true) ? false : true;
            
            #if DATA_SYSTEM == 1
            	dini_IntSet(AudioFile, "voicemsgs", ConfigAudio[sndVoiceMsgs]);
            #elseif DATA_SYSTEM == 2
                MySQLCheck();
				new query[200];
				format(query, sizeof(query), "UPDATE dc_audio SET data = '%d' WHERE var = '%s'", ConfigAudio[sndVoiceMsgs], "voicemsgs");
				mysql_query(query);
				Server[SQLQueriesExecuted]++;
            #endif
				
		} else if (listitem == 1) { // Helicopters
			ConfigAudio[sndChoppers] = (ConfigAudio[sndChoppers] == true) ? false : true;
			
			switch (ConfigAudio[sndChoppers]) {
			    case true:
				{
					for(new i = 0; i <= Server[HighestID]; i ++)
					{
	    				if(IsPlayerConnected(i)) {
	    				    PlayerPlaySound(playerid, 1001, 0, 0, 0);
						}
					}
				}
				case false:
				{
					for(new i = 0; i <= Server[HighestID]; i ++)
					{
	    				if(IsPlayerConnected(i)) {
	    				    PlayerPlaySound(playerid, 1000, 0, 0, 0);
						}
					}
				}
			}
			
            #if DATA_SYSTEM == 1
            	dini_IntSet(AudioFile, "choppers", ConfigAudio[sndChoppers]);
            #elseif DATA_SYSTEM == 2
                MySQLCheck();
				new query[200];
				format(query, sizeof(query), "UPDATE dc_audio SET data = '%d' WHERE var = '%s'", ConfigAudio[sndChoppers], "choppers");
				mysql_query(query);
				Server[SQLQueriesExecuted]++;
            #endif
		} else if (listitem == 3) { // Custom Vehicle Radio
			ConfigAudio[sndVehicleRadio] = (ConfigAudio[sndVehicleRadio] == true) ? false : true;
			
			#if DATA_SYSTEM == 1
            dini_IntSet(AudioFile, "vehicleradio", ConfigAudio[sndVehicleRadio]);
            #elseif DATA_SYSTEM == 2
                MySQLCheck();
				new query[200];
				format(query, sizeof(query), "UPDATE dc_audio SET data = '%d' WHERE var = '%s'", ConfigAudio[sndVehicleRadio], "vehicleradio");
				mysql_query(query);
				Server[SQLQueriesExecuted]++;
            #endif
				
		} else if (listitem == 5) { // First Blood
			ConfigAudio[sndFirstBlood] = (ConfigAudio[sndFirstBlood] == true) ? false : true;
			
			#if DATA_SYSTEM == 1
            dini_IntSet(AudioFile, "firstblood", ConfigAudio[sndFirstBlood]);
            #elseif DATA_SYSTEM == 2
                MySQLCheck();
				new query[200];
				format(query, sizeof(query), "UPDATE dc_audio SET data = '%d' WHERE var = '%s'", ConfigAudio[sndFirstBlood], "firstblood");
				mysql_query(query);
				Server[SQLQueriesExecuted]++;
            #endif
				
		} else if (listitem == 6) { // Got Kill
			ConfigAudio[sndGotKill] = (ConfigAudio[sndGotKill] == true) ? false : true;
			
			#if DATA_SYSTEM == 1
            dini_IntSet(AudioFile, "gotkill", ConfigAudio[sndGotKill]);
            #elseif DATA_SYSTEM == 2
                MySQLCheck();
				new query[200];
				format(query, sizeof(query), "UPDATE dc_audio SET data = '%d' WHERE var = '%s'", ConfigAudio[sndGotKill], "gotkill");
				mysql_query(query);
				Server[SQLQueriesExecuted]++;
            #endif
				
		} else if (listitem == 7) { // Got Killed
			ConfigAudio[sndGotKilled] = (ConfigAudio[sndGotKilled] == true) ? false : true;
			
			#if DATA_SYSTEM == 1
            dini_IntSet(AudioFile, "gotkilled", ConfigAudio[sndGotKilled]);
            #elseif DATA_SYSTEM == 2
                MySQLCheck();
				new query[200];
				format(query, sizeof(query), "UPDATE dc_audio SET data = '%d' WHERE var = '%s'", ConfigAudio[sndGotKilled], "gotkilled");
				mysql_query(query);
				Server[SQLQueriesExecuted]++;
            #endif
			
		} else if (listitem == 8) { // Round Starting
			ConfigAudio[sndRoundStarting] = (ConfigAudio[sndRoundStarting] == true) ? false : true;
			
			#if DATA_SYSTEM == 1
            dini_IntSet(AudioFile, "roundstarting", ConfigAudio[sndRoundStarting]);
            #elseif DATA_SYSTEM == 2
                MySQLCheck();
				new query[200];
				format(query, sizeof(query), "UPDATE dc_audio SET data = '%d' WHERE var = '%s'", ConfigAudio[sndRoundStarting], "roundstarting");
				mysql_query(query);
				Server[SQLQueriesExecuted]++;
            #endif
				
		} else if (listitem == 9) { // Round Started
			ConfigAudio[sndRoundStarted] = (ConfigAudio[sndRoundStarted] == true) ? false : true;
			
			#if DATA_SYSTEM == 1
            dini_IntSet(AudioFile, "roundstarted", ConfigAudio[sndRoundStarted]);
            #elseif DATA_SYSTEM == 2
                MySQLCheck();
				new query[200];
				format(query, sizeof(query), "UPDATE dc_audio SET data = '%d' WHERE var = '%s'", ConfigAudio[sndRoundStarted], "roundstarted");
				mysql_query(query);
				Server[SQLQueriesExecuted]++;
            #endif

		} else if (listitem == 10) { // Kill Spree
			ConfigAudio[sndKillSpree] = (ConfigAudio[sndKillSpree] == true) ? false : true;
			
			#if DATA_SYSTEM == 1
            dini_IntSet(AudioFile, "killspree", ConfigAudio[sndKillSpree]);
            #elseif DATA_SYSTEM == 2
                MySQLCheck();
				new query[200];
				format(query, sizeof(query), "UPDATE dc_audio SET data = '%d' WHERE var = '%s'", ConfigAudio[sndKillSpree], "killspree");
				mysql_query(query);
				Server[SQLQueriesExecuted]++;
            #endif
			
		} else if (listitem == 11) { // Duel
			ConfigAudio[sndDuel] = (ConfigAudio[sndDuel] == true) ? false : true;
			
			#if DATA_SYSTEM == 1
            dini_IntSet(AudioFile, "duel", ConfigAudio[sndDuel]);
            #elseif DATA_SYSTEM == 2
                MySQLCheck();
				new query[200];
				format(query, sizeof(query), "UPDATE dc_audio SET data = '%d' WHERE var = '%s'", ConfigAudio[sndDuel], "duel");
				mysql_query(query);
				Server[SQLQueriesExecuted]++;
            #endif
			
		} else if (listitem == 12) { // Paused
			ConfigAudio[sndPaused] = (ConfigAudio[sndPaused] == true) ? false : true;
			
			#if DATA_SYSTEM == 1
            dini_IntSet(AudioFile, "paused", ConfigAudio[sndPaused]);
            #elseif DATA_SYSTEM == 2
                MySQLCheck();
				new query[200];
				format(query, sizeof(query), "UPDATE dc_audio SET data = '%d' WHERE var = '%s'", ConfigAudio[sndPaused], "paused");
				mysql_query(query);
				Server[SQLQueriesExecuted]++;
            #endif
			
		} else if (listitem == 13) { // Final results greater than 5 music
			ConfigAudio[sndFinalResults] = (ConfigAudio[sndFinalResults] == true) ? false : true;
			
			#if DATA_SYSTEM == 1
            dini_IntSet(AudioFile, "finalresults", ConfigAudio[sndFinalResults]);
            #elseif DATA_SYSTEM == 2
                MySQLCheck();
				new query[200];
				format(query, sizeof(query), "UPDATE dc_audio SET data = '%d' WHERE var = '%s'", ConfigAudio[sndFinalResults], "finalresults");
				mysql_query(query);
				Server[SQLQueriesExecuted]++;
            #endif
			
		} else if (listitem == 14) { // Intro
		    ConfigAudio[sndIntro] = (ConfigAudio[sndIntro] == true) ? false : true;
		    
		    #if DATA_SYSTEM == 1
            dini_IntSet(AudioFile, "intro", ConfigAudio[sndIntro]);
            #elseif DATA_SYSTEM == 2
                MySQLCheck();
				new query[200];
				format(query, sizeof(query), "UPDATE dc_audio SET data = '%d' WHERE var = '%s'", ConfigAudio[sndIntro], "intro");
				mysql_query(query);
				Server[SQLQueriesExecuted]++;
            #endif
		} else if (listitem == 15) { // Class selection
		    ConfigAudio[sndClassSelect] = (ConfigAudio[sndClassSelect] == true) ? false : true;

		    #if DATA_SYSTEM == 1
            dini_IntSet(AudioFile, "classselection", ConfigAudio[sndClassSelect]);
            #elseif DATA_SYSTEM == 2
                MySQLCheck();
				new query[200];
				format(query, sizeof(query), "UPDATE dc_audio SET data = '%d' WHERE var = '%s'", ConfigAudio[sndClassSelect], "classselection");
				mysql_query(query);
				Server[SQLQueriesExecuted]++;
            #endif
		}
		
		ShowAudioConfig(playerid);
    }
    #endif
    
    if(dialogid == 9) return 1; // netstats dialog
    return 1;
}

public OnPlayerClickPlayer(playerid, clickedplayerid, source)
{
	new str[10];
	format(str, sizeof(str), "%d", clickedplayerid);
	cmd_netstats(playerid, str);
	ShowStats(playerid,clickedplayerid);
    return 1;
}

public OnEnterExitModShop(playerid, enterexit, interiorid)
{
    if(enterexit == 1) {
        HideVehicleHud(playerid, GetPlayerVehicleID(playerid));
    } else {
        ShowVehicleHud(playerid, GetPlayerVehicleID(playerid));
    }
    return 1;
}

//-----------------------------------------------------------------//
//********************** Secondary Functions **********************//
//-----------------------------------------------------------------//

forward IRC_Init_Msg();
public IRC_Init_Msg()
{
	new ns_tmp[256];
	format(ns_tmp, sizeof(ns_tmp), "7Deadly Combinations by Raekwon & Devastator 14| 4v%d.%d.%d14... Initiated", VER_MAJOR, VER_MINOR, VER_REVISION);
	CallRemoteFunction("DC_IRCForceSay", "s", ns_tmp);
	#if defined WEB_URL
	format(ns_tmp,256,"14[%s] 7(%s)", ClanTag, WEB_URL);
	#else
	format(ns_tmp,256,"14[%s]", ClanTag);
	#endif
	CallRemoteFunction("DC_IRCForceSay", "s", ns_tmp);
}

#pragma unused IRC_Init_Msg

forward VoteMove();
public VoteMove()
{
	TextDrawHideForAll(gamemsg_voting);
	if((Round[Current] != -1) || !Round[Voting]) return 0;
	new string[256];
    Round[VotingTime]--;
    format(string,256, "~h~~w~Base Voting Has Started!~n~All ~b~~h~Defenders~w~ May Vote~n~~y~Time: ~w~(~r~%d~w~)",Round[VotingTime]);
	TextDrawSetString(gamemsg_voting,string);

	for(new i = 0; i <= Server[HighestID]; i ++)
	{
	    if(IsPlayerConnected(i) && Player[i][pSpawned]) {
			TextDrawShowForPlayer(i, gamemsg_voting);
		}
	}

    if(Round[VotingTime] <= 0)
    {
		Round[Voting] = false;

		new GreaterVotesBaseID;
		for(new i = 0; i <= Server[TotalBases]; i ++)
		{
			if(i != GreaterVotesBaseID)
			{
				if(Votes[i] > Votes[GreaterVotesBaseID])
				{
					GreaterVotesBaseID = i;
				}
			}
		}
		StartBase(GreaterVotesBaseID);

  		return 1;
    }

    SetTimer("VoteMove",1000,0);
    return 0;
}

forward VoteMove2();
public VoteMove2()
{
	TextDrawHideForAll(gamemsg_voting);
	if((Round[Current] != -1) || !Round[Voting]) return 0;
	new string[256];
    Round[VotingTime]--;
    format(string,256, "~h~~w~TDM Voting Has Started!~n~All ~b~~h~Players~w~ May Vote~n~~y~Time: ~w~(~r~%d~w~)",Round[VotingTime]);
	TextDrawSetString(gamemsg_voting,string);

	for(new i = 0; i <= Server[HighestID]; i ++)
	{
	    if(IsPlayerConnected(i) && Player[i][pSpawned]) {
			TextDrawShowForPlayer(i, gamemsg_voting);
		}
	}

    if(Round[VotingTime] <= 0)
    {
		Round[Voting] = false;

		new GreaterVotesTDMID;
		for(new i = 0; i <= Server[TotalTDMs]; i ++)
		{
			if(i != GreaterVotesTDMID)
			{
				if(Votes[i] > Votes[GreaterVotesTDMID])
				{
					GreaterVotesTDMID = i;
				}
			}
		}
		StartTDM(GreaterVotesTDMID);

  		return 1;
    }
    SetTimer("VoteMove2",1000,0);
    return 0;
}

FixTeamWeapons(playerid)
{
	if(Player[playerid][pTeam] == T_HOME)
	{
		WeaponLimit[Player[playerid][PrimaryWep]][home_used] --;
		WeaponLimit[Player[playerid][SecondaryWep]][home_used] --;
		WeaponLimit[Player[playerid][TerciaryWep]][home_used] --;
		WeaponLimit[Player[playerid][SpecialWep]][home_used] --;
	}
	else if(Player[playerid][pTeam] == T_AWAY)
	{
		WeaponLimit[Player[playerid][PrimaryWep]][away_used] --;
		WeaponLimit[Player[playerid][SecondaryWep]][away_used] --;
		WeaponLimit[Player[playerid][TerciaryWep]][away_used] --;
		WeaponLimit[Player[playerid][SpecialWep]][away_used] --;
	}
}

forward StartBase(baseid);
public StartBase(baseid)
{
	for(new x = 0; x < sizeof(DamageData); x ++)
	{
	   DamageData[x][xplayer] = 0;
	}

	#if DATA_SYSTEM == 1
	    new fbase[200];
		fbase = Basefile(baseid);
		if(!dini_Exists(fbase))
		return SendClientMessageToAllEx(COLOR_GREY,"Base ���ۿ� �����ϼ̽��ϴ�!");
	#elseif DATA_SYSTEM == 2
		if(!SqlBaseExist(baseid))
		return SendClientMessageToAllEx(COLOR_GREY,"Base ���ۿ� �����ϼ̽��ϴ�!");
	#endif

	Round[EplapsedTime] = 0;
	Round[Gamemode] = BASE;
	for(new i = 0; i <= Server[HighestID]; i++)Player[i][pVoted] = false;

	MatchInfo[RoundsPlayed]++;

	TextDrawHideForAll(gamemsg_voting);

	Round[atotal] =0;
	Round[dtotal] =0;

	for(new x=0; x<Server[HighestID]+1; x++)
	{
		if(IsPlayerConnected(x) && Player[x][pTeam] == T_AWAY && Player[x][setToPlay] && Player[x][pSpawned] == true)
		{
	    	Round[atotal]++;
	    }
		if(IsPlayerConnected(x) && Player[x][pTeam] == T_HOME && Player[x][setToPlay] && Player[x][pSpawned] == true)
		{
		   Round[dtotal]++;
		}
		
		if(IsPlayerConnected(x) && Player[x][pDuel] > 0) {
		    Player[x][InDuelWhenRound] = true;
		} else Player[x][InDuelWhenRound] = false;
	}

	#if DEBUG == 1
	    Round[atotal]++;
	    Round[dtotal]++;
	#endif

	if((Round[atotal]<1) || (Round[dtotal]<1) || (Round[atotal] < Config[plimit]) || (Round[dtotal] < Config[plimit])) {
		new string[128];
		format(string,128,"Error: Base %d �� �÷��̾ �����Ͽ� ������ �� �����ϴ�, {FF0000}�ּ� �÷��̾�: %d!", baseid, Config[plimit]);
		SendClientMessageToAllEx(COLOR_GREY,string);
	} else if(Round[atotal] > Config[maxplimit] || Round[dtotal] > Config[maxplimit]) {
	    new string[128];
		format(string,128,"Error: Base %d �� �÷��̾ �ʹ� ���� ������ �� �����ϴ�, {FF0000}�ִ� �÷��̾�: %d!", baseid, Config[maxplimit]);
		SendClientMessageToAllEx(COLOR_GREY,string);
	} else if(Round[Gamemode] == TDM) {
		new string[128];
		format(string,128,"Error: Base %d �� �̹� ��Ⱑ ���۵Ǿ� ������ �� �����ϴ�.", baseid);
		SendClientMessageToAllEx(COLOR_GREY,string);
	} else {

		Round[WinnerTeam] = T_NON;
		//SendClientMessageToAllEx(COLOR_RED, "DEBUG: Round[WinnerTeam] set to T_NON 0 on line 13689 in combinations.pwn!");
		Round[LoadScreen] = true;
		Round[Paused] = 0;
		Round[PlayerOnCP] = false;
		Round[TimeInCP] = Config[cp_time];
		CreateRoundMenus();
		KillTimer(BaseTimer);
        DestroyPickups();
        SetRecentBase(baseid);

		Round[Current] = baseid;
        new string[256];
		new bname[200];
		if(strlen(BaseVariables[baseid][About]) <= 14)
		{
			format(bname, 200, "~y~~h~Base #%d ~w~~b~~p~~h~~h~%s", Round[Current], BaseVariables[baseid][About]);
		}
		else
		{
			format(bname, 200, "~y~~h~Base #%d ~n~~w~~b~~p~~h~~h~%s", Round[Current], BaseVariables[baseid][About]);
		}
		TextDrawSetString(MapNameTD, bname);

//		format(string,128,"Base number %d starts in %d seconds...", Round[Current], Config[stop_counting]);
//		SendClientMessageToAllEx(COLOR_WHITE,string);

        #if IRC == 1
		format(string,128,"14Base number2 %d 14starts in %d seconds...", Round[Current], Config[stop_counting]);
		CallRemoteFunction("DC_IRCForceSay", "s", string);
		#endif

		format(string, sizeof(string), "mapname Base: %d", baseid);
		SendRconCommand(string);

		Round[WorldTime] = BaseVariables[baseid][WorldTime];
		if(Round[WorldTime] == -1) Round[WorldTime] = Config[thetime];
		if(Config[forcetime] == -1) SetWorldTime(Round[WorldTime]);
		else SetWorldTime(Config[forcetime]);

		Round[Interior] = BaseVariables[baseid][Interior];

		BaseVariables[baseid][TimesPlayed] ++;

		#if DATA_SYSTEM == 1
			dini_IntSet(fbase,"played",BaseVariables[baseid][TimesPlayed]);
		#elseif DATA_SYSTEM == 2
			UpdateSqlBaseInt(baseid, "played", BaseVariables[baseid][TimesPlayed]);
		#endif

		HomeSpawn[0] = BaseVariables[baseid][DefSpawn][0];
		HomeSpawn[1] = BaseVariables[baseid][DefSpawn][1];
		HomeSpawn[2] = BaseVariables[baseid][DefSpawn][2];

		AwaySpawn[0] = BaseVariables[baseid][AttSpawn][0];
		AwaySpawn[1] = BaseVariables[baseid][AttSpawn][1];
		AwaySpawn[2] = BaseVariables[baseid][AttSpawn][2];

		Checkpoint[0] = BaseVariables[baseid][BaseCheckpoint][0];
		Checkpoint[1] = BaseVariables[baseid][BaseCheckpoint][1];
		Checkpoint[2] = BaseVariables[baseid][BaseCheckpoint][2];

		if(Round[Attackers] == T_HOME)
		{
			HomeSpawn[0] = BaseVariables[baseid][AttSpawn][0];
			HomeSpawn[1] = BaseVariables[baseid][AttSpawn][1];
			HomeSpawn[2] = BaseVariables[baseid][AttSpawn][2];

			AwaySpawn[0] = BaseVariables[baseid][DefSpawn][0];
			AwaySpawn[1] = BaseVariables[baseid][DefSpawn][1];
			AwaySpawn[2] = BaseVariables[baseid][DefSpawn][2];
		}

	    Server[LastRoundPlayed] = baseid;
	    Server[LastGamemodePlayed] = 1;
		TeamInfo[T_AWAY][RoundKills] = 0;
		TeamInfo[T_AWAY][RoundDeaths] = 0;
  		TeamInfo[T_HOME][RoundKills] = 0;
		TeamInfo[T_HOME][RoundDeaths] = 0;
		TeamInfo[T_AWAY][Won] = false;
  		TeamInfo[T_HOME][Won] = false;
   		TeamInfo[T_AWAY][CapturedCP] = false;
  		TeamInfo[T_HOME][CapturedCP] = false;
   		TeamInfo[T_AWAY][TimeLimitedReached] = false;
  		TeamInfo[T_HOME][TimeLimitedReached] = false;
		Round[AdminCanEnd] = true;
		ClearDeathMessages();

		new hour,minute,second;
		new year, month,day;
		gettime(hour, minute, second);
		getdate(year, month, day);
		format(RoundStartTime,256,"%d:%02d:%02d",hour,minute,second);
		format(RoundStartTime2,256,"%d:%02d",hour,minute);
    	Round[RoundStartTimeInt] = GetDateAndTime();
		ClearVehicles();
		HideLobbyTextDraws();
		
		Round[CPLabel] = Create3DTextLabel("Capture The Checkpoint", COLOR_RED, Checkpoint[0], Checkpoint[1], Checkpoint[2]+0.8, float(Config[NameTagDistance]), ROUND_VW, true);

	    for(new i = 0; i <= Server[HighestID]; i++)
	   	{
		   	Player[i][pVoted] = false;
		   	if(IsPlayerConnected(i) && Player[i][AFK] == false && Player[i][setToPlay] && ((Player[i][pTeam] == T_REF) || (Player[i][pTeam] == T_AWAY) || (Player[i][pTeam] == T_HOME)))
			{
			    //new Menu:CurrentMenu = GetPlayerMenu(i);
			    if (IsValidMenu(GetPlayerMenu(i))) {
					HideMenuForPlayer(GetPlayerMenu(i), i);
				}
 				//PlayerMatchInfo[i][RoundDeaths] = 0;
				//PlayerMatchInfo[i][RoundKills] = 0;
				PlayerMatchInfo[i][Died] = false;
				PlayerMatchInfo[i][PlayingMatch] = true;
				PlayerMatchInfo[i][DidPlayMatch] = true;
    			PlayerMatchInfo[i][StartedPlaying] = true;

                
				if(Player[i][pTeam] == T_AWAY)
				{
					if(Round[Attackers] == T_AWAY)
					{
					    SendClientMessageEx(i,COLOR_WHITE,"** ����� ���� ���� �Դϴ�!");
					   	/*if (Config[cp_size] > 0) {
	   						Player[i][CPLabel] = CreatePlayer3DTextLabel(i, "Capture The Checkpoint", COLOR_RED, Checkpoint[0], Checkpoint[1], Checkpoint[2]+0.8, 30);
						}*/
					} else {
						SendClientMessageEx(i,COLOR_WHITE,"** ����� ���� ��� �Դϴ�!");
					}
					Round[started_away]++;
				}
				if(Player[i][pTeam] == T_HOME)
				{
   					if(Round[Attackers] == T_HOME)
   					{
					    SendClientMessageEx(i,COLOR_WHITE,"** ����� ���� ���� �Դϴ�!");
					   	/*if (Config[cp_size] > 0) {
	   						Player[i][CPLabel] = CreatePlayer3DTextLabel(i, "Capture The Checkpoint", COLOR_RED, Checkpoint[0], Checkpoint[1], Checkpoint[2]+0.8, 30);
						}*/
					} else {
						SendClientMessageEx(i,COLOR_WHITE,"** ����� ���� ��� �Դϴ�!");
					}
					Round[started_home]++;
				}

				if (Player[i][DM] != 0) {
					OnPlayerLeaveDM(i, Player[i][DM]);
                }
                
                #if SAMP_VERSION == 2
					#if defined SOUND_ROUNDSTARTING
						if (ConfigAudio[sndRoundStarting] == true) {
							PlayAudioStreamForPlayerExEx(i, SOUND_ROUNDSTARTING);
						}
					#endif

					if (ConfigAudio[sndVoiceMsgs] == true) {
					    format(nextStreamURL, 256, "http://translate.google.com/translate_tts?q=Players prepare, a round is about to begin");
					    SetTimerEx("PlayAudioStreamForPlayerExEx", 3000, 0, "i", i);
					}
				#endif
				
				Player[i][RoundsPlayedEx]++;
				Server[TotalRounds] ++;
				ResetPlayerWeapons(i);
			    Player[i][RoundScore] = 0;
			    Player[i][PossibleDamage] = 0;
			    Player[i][PossibleHits] = 0;
				Player[i][Status] = STATUS_PLAYING;
				Player[i][ViewBase] = false;
				Player[i][ViewTDM] = false;
				InDuel[Player[i][pDuel]] = 0;
				Player[i][pDuel] =0;
				if(Player[i][Specing] == true)
				{
			    	StopSpectate(i);
				}
				
				TextDrawHideForPlayer(i, MapNameTD);
				TextDrawHideForPlayer(i, ScoreboardHome);
				TextDrawHideForPlayer(i, ScoreboardAway);
		   		TogglePlayerControllable(i,0);
		   		SetPlayerInterior(i,Round[Interior]);
		   		SetPlayerHealth(i,100);
		   		Player[i][pPlaying] = true;
		   		Player[i][pVoted] = false;
		   		PlayerPlaySound(i, 1185, 0, 0, 0);
		   		SetPlayerHealth(i, Config[roundhealth]);
		   		SetPlayerArmour(i, Config[roundarmour]);

		   		SetPlayerPos(i,Checkpoint[0]-20+random(40),Checkpoint[1]-20+random(40),Checkpoint[2]);
		   		SetPlayerWorldBoundsEx(i,9999.9,-9999.9,9999.9,-9999.9);

				Player[i][AltitudeIndex] = 50;
				Player[i][Altitude] = Checkpoint[2]+Player[i][AltitudeIndex];
				HideLobbyTextDrawsForPlayer(i);
				TogglePlayerSpectating(i, 1);
				new Float:Xc, Float:Yc;
				Xc = floatadd(Checkpoint[0], floatmul(Player[i][AltitudeIndex]+10, floatsin(-Player[i][LoadingScreenRotationAngle], degrees)));
				Yc = floatadd(Checkpoint[1], floatmul(Player[i][AltitudeIndex]+10, floatcos(-Player[i][LoadingScreenRotationAngle], degrees)));
				SetPlayerCameraPos(i, Xc, Yc, Player[i][Altitude]);
		   		SetPlayerCameraLookAt(i,Checkpoint[0],Checkpoint[1],Checkpoint[2]);

		   		SetPlayerCheckpoint(i,Checkpoint[0],Checkpoint[1],Checkpoint[2],Config[cp_size]);

		   		SetPlayerMapIcon(i, 0, Checkpoint[0], Checkpoint[1], Checkpoint[2], 19, 0);
		   		TogglePlayerControllable(i,false); //whitetiger test
                Player[i][ControlledCamera] = false;
				if(Player[i][pTeam] != T_REF)
				{
					ResetPlayerWeapons(i);
					if(Config[weaponsystem] == WEAPONSYSTEM_MENU)
					{
					    Player[i][ChosenWeapons] = false;
						TryGunMenu(1, i);
						//SendClientMessage(i, COLOR_WHITE, "JUST SHOWED YOU PRIM MENU!");
   						//TimeTextForPlayer(i, GunList_5, (Config[stop_counting]*1000)-1000);

						for(new __i = 0 ; __i < MAX_WEAPONS; ++ __i)
						{
						    if(WeaponsMenus[Option][__i] == 5)
						    {
                              	TimeTextForPlayer(i, autowep, (Config[stop_counting]*1000)-1000);
                        		TimeTextForPlayer(i, autowep2, (Config[stop_counting]*1000)-1000);
                        		TimeTextForPlayer(i, autowep3, (Config[stop_counting]*1000)-1000);
                        		TimeTextForPlayer(i, autowep4, (Config[stop_counting]*1000)-1000);
						        TimeTextForPlayer(i, autowep5, (Config[stop_counting]*1000)-1000);
						        break;
						    }
						}
					}
					else
					{
					    StrapUp(i);
						//SendClientMessage(i, COLOR_WHITE, "WEAPON SYSTEM IS NOT MENU!");
					}
				}
		   	} else Player[i][pPlaying] = false;
	   	}
	   	SpawnAllPlayersInCircle(Checkpoint[0], Checkpoint[1], Checkpoint[2]);

		TextDrawSetString(gamemsg_baseupdateaway, " ");
		TextDrawSetString(awayhud, " ");
		ShowRoundTextDraws();
		Round[StopCounting] = Config[stop_counting];
		Server[CantSpawnVehicle] = true;
		SetTimer("BaseCountdown",0,0);

		if(Config[RotateCameraEx] == 1)
		{
			SetTimer("CamUpdate", 25, 0);
		}
	 	for(new i = 0; i < MAX_BASES; i++)
		{
			Votes[i] = 0;
		}
	}

	return 1;
}

forward BaseCountdown(bool:redo);
public BaseCountdown()
{
	Round[StopCounting]--;
	new string[128];
	if(Server[MainTextdrawLayout] == 1)
	{
		format(string,128,"                         ~w~Base ~y~%d ~w~starting in ~r~ %d ~w~seconds",Round[Current],Round[StopCounting]);
		TextDrawSetString(gamemsg_baseupdatehome,string);
	}
	else
	{
		format(string,128,"~w~Base ~y~%d~n~~w~starting in~n~~r~%d ~w~seconds",Round[Current],Round[StopCounting]);
		TextDrawSetString(homehud,string);
	}

	if(Round[StopCounting] <= 0)
	{
		OnBaseLoadFinish();
	}
	else
	{
		SetTimer("BaseCountdown",1000,0);
		for(new i; i <= Server[HighestID]; i++)
		{
			//PlayerPlaySound(i,1056,0.0,0.0,0.0);
		}
	}
}

forward OnBaseLoadFinish();
public OnBaseLoadFinish()
{
	Round[LoadScreen] = false;
	new string[256];
	new fbase[256]; fbase = GetCurrentFile();

	new Float:health = 0;
	new Float:armour = 0;
	new Float:away_health = 0;
	new Float:home_health = 0;

    for(new i = 0; i <= Server[HighestID]; i++)
    {

	   	if(IsPlayerConnected(i) && Player[i][setToPlay] && Player[i][pTeam] != T_NON && Player[i][pSpawned])
		{
			if(Round[Attackers] == T_AWAY)
			{
				SetPlayerMapIcon(i, 1, AwaySpawn[0],AwaySpawn[1],AwaySpawn[2], 31, 0);
			}
			else
			{
				SetPlayerMapIcon(i, 1, HomeSpawn[0],HomeSpawn[1],HomeSpawn[2], 31, 0);
			}

			PlayerPlaySound(i,1057,0.0,0.0,0.0);
 			//SpawnPlayerEx(i);
			TogglePlayerSpectating(i, 0);
			TextDrawShowForPlayer(i, MapNameTD);
			TextDrawShowForPlayer(i, ScoreboardHome);
			TextDrawShowForPlayer(i, ScoreboardAway);
 			CallRemoteFunction("DC_PlayerEnteredRound", "d", i);
 			SetCameraBehindPlayer(i);
			//PlayerSpawnKillProtection(i);
			SetTimerEx("SetPlayerHealthEx",Config[antisktime], false, "id", i, Config[roundhealth]);
			SetTimerEx("SetPlayerArmourEx",Config[antisktime], false, "id", i, Config[roundarmour]);
			SetTimerEx("StrapUp", Config[antisktime], false, "i", i);

			#if SAMP_VERSION == 2
				#if defined SOUND_ROUNDSTARTED
					if (ConfigAudio[sndRoundStarted] == true) {
						PlayAudioStreamForPlayerExEx(i, SOUND_ROUNDSTARTED);
					}
				#endif

				if (ConfigAudio[sndVoiceMsgs] == true) {
					format(nextStreamURL, 256, "http://translate.google.com/translate_tts?q=Base number %d, %s has started", Round[Current], BaseVariables[Round[Current]][About]);
					SetTimerEx("PlayAudioStreamForPlayerExEx", 3000, 0, "i", i);
				}
			#endif
			
			HideMenuForPlayer(primarymenu, i);
			HideMenuForPlayer(secondarymenu, i);
			HideMenuForPlayer(specialmenu, i);
			HideMenuForPlayer(wepdone_menu, i);
			Player[i][Status] = STATUS_PLAYING;
			
			ShowRegularTextDrawsForPlayer(i);

			if(!Server[TimerMode])
			{
				TextDrawHideForPlayer(i,TimerClock);
			}
		    else
		    {
				TextDrawShowForPlayer(i,TimerClock);
			}

	   		if(Player[i][pTeam] == T_AWAY)
	   		{
	   			GetPlayerHealth(i,health);
				GetPlayerArmour(i,armour);
				away_health=away_health+health+armour;

			   	SetPlayerPos(i,AwaySpawn[0]+2-random(2),AwaySpawn[1]+2-random(2),AwaySpawn[2]+2);
	   			SetPlayerWorldBoundsEx(i,9999.9,-9999.9,9999.9,-9999.9);
			   	SetPlayerColor(i,GetTeamColor(1, T_AWAY)  | 0x000000FF);
			   	if(Server[TkMode]) {
			   		SAMP_SetPlayerTeam(i,1);
				}
	   		} else if(Player[i][pTeam] == T_HOME ) {
	   			GetPlayerHealth(i,health);
				GetPlayerArmour(i,armour);
				home_health=home_health+health+armour;

			   	SetPlayerPos(i,HomeSpawn[0]+2-random(2),HomeSpawn[1]+2-random(2),HomeSpawn[2]+2);
			   	SetPlayerWorldBoundsEx(i,9999.9,-9999.9,9999.9,-9999.9);
			   	SetPlayerColor(i,GetTeamColor(1, T_HOME)  | 0x000000FF);
      			if(Server[TkMode]) {
			   		SAMP_SetPlayerTeam(i,2);
				}
   			} else if(Player[i][pTeam] == T_REF)
	   		{
	   		    SetPlayerWorldBoundsEx(i,9999.9,-9999.9,9999.9,-9999.9);
	   		    SetPlayerColor(i,COLOR_REF);
	   		    if (Config[RefMode] == 2) { // they go into spectate and not spawn
   					SendClientMessageEx(i, COLOR_MARINE, "** ����� (/spec)���� ������ �� �ֽ��ϴ�.");
	   		    } else {
	   		    	SetPlayerPos(i,Checkpoint[0]+2-random(2),Checkpoint[1]+2-random(2),Checkpoint[2]+2);
	   		    }
	   		    if(Server[TkMode]) {
	   		    	SAMP_SetPlayerTeam(i,3);
				}
	   		}

            if (Config[RefMode] == 2 && Player[i][pTeam] == T_REF) {
                Player[i][pPlaying] = false;
            } else {
				SetPlayerInterior(i, BaseVariables[Round[Current]][Interior]);
			}

		   	TogglePlayerControllable(i,true);

			if(Round[Attackers] == Player[i][pTeam] && Server[DisplayHintMessages] == true) {
		   		SendClientMessageEx(i, COLOR_GREYBLUE, "Hint: /car or /v)���� ������ ��ȯ�� �� �ֽ��ϴ�.");
			}

	//	   	SetTimerEx("SyncPlayer", 1500, 0, "%d", i);
	   	}
   	}

	//SpawnTeamInCircle(T_HOME,HomeSpawn[0],HomeSpawn[1],HomeSpawn[2]);
	//SpawnTeamInCircle(T_AWAY,AwaySpawn[0],AwaySpawn[1],AwaySpawn[2]);
	//SpawnTeamInCircle(T_REF,Checkpoint[0],Checkpoint[1],Checkpoint[2]);

	TeamInfo[T_HOME][RoundHealth] = floatround(home_health);
	TeamInfo[T_AWAY][RoundHealth] = floatround(away_health);

	TextDrawColor(home_tdamage,GetTeamColor(1, T_HOME) | 0x000000FF);
	TextDrawColor(away_tdamage,GetTeamColor(1, T_AWAY) | 0x000000FF);

   	Round[ModeMin] = Config[round_time];
   	Round[ModeSec] = 0;

	Round[FirstBlood] = false;

   	BaseUpdate();
	new tped =  BaseVariables[Round[Current]][TimesPlayed];

	format(string,128,"Base #%d - %s - ���� || %d ȸ�� | ���� �¸�: %d | ��� �¸�: %d",
	Round[Current], BaseVariables[Round[Current]][About],  tped-1, BaseVariables[Round[Current]][AttWins], BaseVariables[Round[Current]][DefWins]);

	SendClientMessageToAllEx(COLOR_WHITE,string);

	#if IRC == 1
	format(string,128,"14Base2 %d 14- %s - started!", Round[Current], BaseVariables[Round[Current]][About]);
	CallRemoteFunction("DC_IRCForceSay", "s", string);
	#endif

	NametagTimer = SetTimer("NameTagStealth",1200,0);

	if(Server[HUD] == true)
		HUDUpdateTimer = SetTimer("HUDUpdate",1000,1);

	Server[CantSpawnVehicle] = false;
    for(new i = 0; i <= Server[HighestID]; i++)
	{
		AttackerVehicle[i][hasSpawned] = false;
		TogglePlayerControllable(i,true);
	   	if(IsPlayerConnected(i) && Player[i][pPlaying] && Player[i][pTeam] == Round[Attackers] && Server[DisplayHintMessages] == true)
		{
			SendClientMessageEx(i, 0x0F58CFFF, "Help: (/car or /v)���� ������ ��ȯ�� �� �ֽ��ϴ�.");
		}
		if(IsPlayerConnected(i) && Player[i][pPlaying] && Server[DisplayHintMessages] == true)
		{
			SendClientMessageEx(i, COLOR_DARKGREY, "Help: (/gunmenu)���� ���⸦ �ٽ� ������ �� �ֽ��ϴ�.");
		}
	}
	SetTimer("FixPlayersTeams", 3000, false);
	
	if(Round[Paused] >= 1) PauseRound(2);
}

new bool:FlashOrNot = false;
forward BaseUpdate();
public BaseUpdate()
{
	TextDrawHideForAll(text_redflash);
	TextDrawHideForAll(gamemsg_cp);

	if(Round[Current] == -1)
		return 1;

	Round[EplapsedTime]++;

	if(Server[TimerMode]) {
	    if(Round[Paused] == 0)
	    {
	    	Round[ModeSec]--;
		}
		else { BaseTimer = SetTimer("BaseUpdate",1000,0); return 0; }
		
		if((Round[ModeMin] ==0) && (Round[ModeSec] ==0)) {
	   		if(Round[Attackers] == T_AWAY)
				Round[WinnerTeam] = T_HOME;
			else
			    Round[WinnerTeam] = T_AWAY;

			Round[WinType] = TIME_LIMIT;
			Round[DefTimeLost] = true;
			EndRound();
			return 1;
		}
		if(Round[ModeSec] < 0) {
			Round[ModeSec] = 59;
			Round[ModeMin]--;
		}
		if(Round[ModeMin] == 1 && Round[ModeSec] >= 57) {
            for(new i = 0; i <= Server[HighestID]; i++) if(IsPlayerConnected(i) && Player[i][pPlaying] == true) {
			    new idx = 60 - Round[ModeSec];
		        PlayerPlaySound(i,1147,0.0,0.0,0.0);
		       	switch(idx) {
		       	    case 0: {
	 					GameTextForPlayer(i, "~n~~n~~n~~r~~>~ 2 minute ~y~Warning ~<~",1100,4);
	 				}
	 				case 1: {
	 					GameTextForPlayer(i, "~n~~n~~n~~n~~b~~>~ 2 minute ~r~Warning ~<~",1100,4);
	 				}
	 				case 2: {
	 					GameTextForPlayer(i, "~n~~n~~n~~n~~n~~g~~>~ 2 minute ~p~Warning ~<~",1100,4);
	 				}
	 				case 3: {
	 					GameTextForPlayer(i, "~n~~n~~n~~n~~n~~n~~h~~r~~>~ 2 minute ~y~Warning ~<~",1100,4);
	 				}
	 			}
	 		}
     	}
	 	if(Round[ModeMin] == 0 && Round[ModeSec] < 30 && Round[ModeSec] >= 27) {
           	for(new i = 0; i <= Server[HighestID]; i++) if(IsPlayerConnected(i) && Player[i][pPlaying] == true) {
		       	new idx = 30 - Round[ModeSec];
		       	PlayerPlaySound(i,1147,0.0,0.0,0.0);
		        switch(idx) {
		       	    case 0: {
	 					GameTextForPlayer(i, "~n~~n~~n~~r~~>~ 30 second ~y~Warning ~<~",1100,4);
	 				}
	 				case 1: {
	 					GameTextForPlayer(i, "~n~~n~~n~~n~~b~~>~ 30 second ~r~Warning ~<~",1100,4);
	 				}
	 				case 2: {
	 					GameTextForPlayer(i, "~n~~n~~n~~n~~n~~g~~>~ 30 second ~p~Warning ~<~",1100,4);
	 				}
	 				case 3: {
	 					GameTextForPlayer(i, "~n~~n~~n~~n~~n~~n~~h~~r~~>~ 30 second ~y~Warning ~<~",1100,4);
	 				}
	 			}
      		}
	 	}
	}


	new string[256];

    new Float:health = 0;
	new Float:armour = 0;
	new Float:away_health = 0;
	new Float:home_health = 0;

	new hometeamplayers=0;
	new awayteamplayers=0;

	for(new x=0; x<Server[HighestID]+1; x++)
	{
	    if(IsPlayerConnected(x))
	    {
	        new Float:PlayerHealth, Float:PlayerArmour;
        	GetPlayerHealth(x,PlayerHealth);
			GetPlayerArmour(x,PlayerArmour);
			new Float:Total = PlayerArmour + PlayerHealth;
			if(Player[x][pPlaying] == true)
			{
				SetPlayerScore(x, floatround(Total));
			}
			else
			{
				SetPlayerScore(x, 0);
			}

			if((Player[x][pTeam] ==T_AWAY) && (Player[x][pPlaying]))
			{
			    awayteamplayers++;
				GetPlayerHealth(x,health);
				GetPlayerArmour(x,armour);
				away_health=away_health+health+armour;
			}
			if((Player[x][pTeam] ==T_HOME) && (Player[x][pPlaying]))
			{
				hometeamplayers++;
				GetPlayerHealth(x,health);
				GetPlayerArmour(x,armour);
				home_health=home_health+health+armour;
			}
		}
	}

	//
	new old_home_hp, old_away_hp, new_home_hp, new_away_hp, away_dmg, home_dmg;
	old_home_hp = TeamInfo[T_HOME][RoundHealth];
	old_away_hp = TeamInfo[T_AWAY][RoundHealth];
	new_home_hp = floatround(home_health);
	new_away_hp = floatround(away_health);
	TeamInfo[T_HOME][RoundHealth] = new_home_hp;
	TeamInfo[T_AWAY][RoundHealth] = new_away_hp;
	away_dmg = new_away_hp - old_away_hp;
	home_dmg = new_home_hp - old_home_hp;
	TeamInfo[T_HOME][TempDamage] = TeamInfo[T_HOME][TempDamage] + home_dmg;
	TeamInfo[T_AWAY][TempDamage] = TeamInfo[T_AWAY][TempDamage] + away_dmg;


	new hpmsg[50];

	if (new_home_hp < old_home_hp) {
		if (Server[MainTextdrawLayout] == 1) {
			format(hpmsg, 50, "~w~~r~%d", TeamInfo[T_HOME][TempDamage]);
		} else {
			format(hpmsg, 50, "%s ~w~~r~%d", HomeName, TeamInfo[T_HOME][TempDamage]);
		}
	    TextDrawSetString(home_tdamage, hpmsg);
 		for(new i = 0; i <= Server[HighestID]; i++)
		{
 			if(IsPlayerConnected(i) && TeamInfo[T_HOME][TempDamage] < 0)
			{
			    KillTimer(Round[TeamDmgTimerHome]);
			    TextDrawShowForPlayer(i, home_tdamage);
			}
		}
		Round[TeamDmgTimerHome] = SetTimer("HideTeamDamageHome", 3000, false);
	}

	if (new_away_hp < old_away_hp) {
		if (Server[MainTextdrawLayout] == 1) {
			format(hpmsg, 50, "~w~~r~%d", TeamInfo[T_AWAY][TempDamage]);
		} else {
			format(hpmsg, 50, "%s ~w~~r~%d", AwayName, TeamInfo[T_AWAY][TempDamage]);
		}
	    TextDrawSetString(away_tdamage, hpmsg);
 		for(new i = 0; i <= Server[HighestID]; i++)
		{
 			if(IsPlayerConnected(i) && TeamInfo[T_AWAY][TempDamage] < 0)
			{
			    KillTimer(Round[TeamDmgTimerAway]);
			    TextDrawShowForPlayer(i, away_tdamage);
			}
		}
		Round[TeamDmgTimerAway] = SetTimer("HideTeamDamageAway", 3000, false);
	}


	#if DEBUG == 0
	if((awayteamplayers<1)) {
		Round[HPLeft] = floatround(home_health);
		if(TeamInfo[T_AWAY][RoundKills] == 0 && TeamInfo[T_AWAY][RoundDeaths] == 0 && TeamInfo[T_HOME][RoundKills] == 0 && TeamInfo[T_HOME][RoundDeaths] == 0) {
			Round[WinnerTeam] = T_NON;
			//SendClientMessageToAllEx(COLOR_RED, "DEBUG: Round[WinnerTeam] set to T_NON 0 on line 14227 in combinations.pwn!");
		} else {
			Round[WinnerTeam] = T_HOME;
		}
		Round[WinType] = ELIMINATION;
	  	EndRound();
	}

	if((hometeamplayers<1)) {
		Round[HPLeft] = floatround(away_health);
		if(TeamInfo[T_AWAY][RoundKills] == 0 && TeamInfo[T_AWAY][RoundDeaths] == 0 && TeamInfo[T_HOME][RoundKills] == 0 && TeamInfo[T_HOME][RoundDeaths] == 0) {
			Round[WinnerTeam] = T_NON;
			//SendClientMessageToAllEx(COLOR_RED, "DEBUG: Round[WinnerTeam] set to T_NON 0 on line 14239 in combinations.pwn!");
		} else {
			Round[WinnerTeam] = T_AWAY;
		}
		Round[WinType] = ELIMINATION;
	  	EndRound();
	}
	#endif


	Round[PlayerOnCP] = false;
	for(new i = 0; i <= Server[HighestID]; i++)
	{
 		if(IsPlayerConnected(i) && Player[i][pTeam] == Round[Attackers] && Player[i][pSpawned] && GetPlayerState(i) != PLAYER_STATE_SPECTATING)
		{
			if(IsPlayerInCheckpoint(i) && !IsPlayerInAnyVehicle(i) && Player[i][State] != STATE_PAUSED)
			{
				Round[PlayerOnCP] = true;
				SetPlayerColor(i, COLOR_WHITE);
				Round[TimeInCP] --;
				new str[90];
				format(str, sizeof(str), "{FF3300}���� ���� ��... ({FFFFFF}%d{FF3300})", Round[TimeInCP]);
				Update3DTextLabelText(Round[CPLabel], COLOR_RED, str);
				if(Config[cplayout] == 1) continue;
				else break;
			}
		}
	}

	if(Round[PlayerOnCP] == false)
	{
	    Round[TimeInCP] = Config[cp_time];
		Update3DTextLabelText(Round[CPLabel], COLOR_RED, "������");
	}/* else {
		Round[TimeInCP]--;
	}*/

	if(Round[TimeInCP] <= 0)
	{
		for(new x = 0; x <= Server[HighestID]; x++)
		{
	 		if(IsPlayerConnected(x) && Player[x][pTeam] == Round[Attackers] && Player[x][pSpawned])
			{
				if(IsPlayerInCheckpoint(x))
				{
					Player[x][CaptureTimes] ++;
				}

			}
		}
		Round[CapturedCheckpoint] = true;
		Round[WinType] = CHECKPOINT;
		Round[WinnerTeam] = Round[Attackers];
		EndRound();
	}

	/*if(hometeamplayers > Round[started_home]) Round[started_home] = hometeamplayers;
	if(awayteamplayers > Round[started_away]) Round[started_away] = awayteamplayers;*/
	
	if(Server[MainTextdrawLayout] == 1)
	{
		format(string,256,"              %s: ~w~%d~b~~h~/~w~%d  ~r~Life: ~w~%d",HomeName,hometeamplayers,Round[started_home],floatround(home_health));
		TextDrawSetString(gamemsg_baseupdatehome,string);
  		format(string,256,"%s: ~w~%d~b~~h~/~w~%d  ~r~Life: ~w~%d",AwayName,awayteamplayers,Round[started_away],floatround(away_health));
		TextDrawSetString(gamemsg_baseupdateaway,string);
	}
	else
	{
		format(string,256,"%s~n~~y~Alive: ~w~%d~b~/~w~%d ~r~Life: ~w~%d",HomeName,hometeamplayers,Round[started_home],floatround(home_health));
		TextDrawSetString(homehud,string);
		format(string,256,"%s~n~~y~Alive: ~w~%d~b~/~w~%d ~r~Life: ~w~%d",AwayName,awayteamplayers,Round[started_away],floatround(away_health));
		TextDrawSetString(awayhud,string);
	}

	if(Server[TimerMode]) {
		if(Round[ModeMin] >= 7) format(string,256,"%02d:%02d",Round[ModeMin],Round[ModeSec]);
		else if(Round[ModeMin] >= 5) format(string,256,"~g~%02d:%02d",Round[ModeMin],Round[ModeSec]);
		else format(string,256,"~r~%02d:%02d",Round[ModeMin],Round[ModeSec]);
		TextDrawSetString(TimerClock, string);
		new str[256];
		format(str, sizeof(str), "mapname Base: %d [%02d:%02d]", Round[Current], Round[ModeMin], Round[ModeSec]);
		SendRconCommand(str);
	}

	if(Round[TimeInCP] != Config[cp_time]) {
		format(string,256,"~w~~y~Checkpoint Infiltration:~w~~r~ %d",Round[TimeInCP]);
		TextDrawSetString(gamemsg_cp, string);
		for(new i = 0; i <= Server[HighestID]; i++)
		{
		    if(IsPlayerConnected(i)) {
		    	PlayerPlaySound(i, 1039, 0, 0, 0);
		    }
		}
	}

    new gm_text[200];
    format(gm_text, sizeof(gm_text), "%s - %d / %s - %d", HomeName, MatchInfo[HomeRoundsWon], AwayName, MatchInfo[AwayRoundsWon]);
	SetGameModeText(gm_text);

	for(new i = 0; i <= Server[HighestID]; i++)
	{
		if(Player[i][pTeam] == T_REF && Player[i][pPlaying]) {
			SetPlayerArmour(i,100);
			SetPlayerHealth(i,100);
			ResetPlayerWeapons(i);
		}

		if(Round[TimeInCP] != Config[cp_time]) {
			TextDrawShowForPlayer(i,gamemsg_cp);
		} else {
			TextDrawHideForPlayer(i,gamemsg_cp);
		}

		new Float:health2 = 0;
		new Float:armour2 = 0;
		GetPlayerHealth(i,health2);
		GetPlayerArmour(i,armour2);

		if(Player[i][pPlaying]) {

			if(Round[PlayerOnCP])
			{
				if(Round[TimeInCP] == 10) {
					TextDrawShowForPlayer(i, text_redflash);
				} else if(Round[TimeInCP] == 9) {
					TextDrawHideForPlayer(i, text_redflash);
				} else if(Round[TimeInCP] == 8) {
					TextDrawShowForPlayer(i, text_redflash);
				} else if(Round[TimeInCP] == 7) {
					TextDrawHideForPlayer(i, text_redflash);
				} else if(Round[TimeInCP] == 6) {
					TextDrawShowForPlayer(i, text_redflash);
				} else if(Round[TimeInCP] == 5) {
					TextDrawHideForPlayer(i, text_redflash);
				} else if(Round[TimeInCP] == 4) {
					TextDrawShowForPlayer(i, text_redflash);
				} else if(Round[TimeInCP] == 3) {
					TextDrawHideForPlayer(i, text_redflash);
				} else if(Round[TimeInCP] == 2) {
					TextDrawShowForPlayer(i, text_redflash);
				} else if(Round[TimeInCP] == 1) {
					TextDrawHideForPlayer(i, text_redflash);
				}
				if(Round[TimeInCP] != Config[cp_time]) PlayerPlaySound(i, 14800, 0, 0, 0); // siren
			}
			else PlayerPlaySound(i, 0, 0, 0, 0);

			/*if(Round[TimeInCP] <= 5 && Round[PlayerOnCP]) {
	   		    PlayerPlaySound(i, 1135,0,0,0); //baseball bat hit ped
	   		} else if(Round[TimeInCP] <=  19 && Round[PlayerOnCP]) {
	   		    PlayerPlaySound(i, 1058,0,0,0); //mission complete
	   		}*/
	   		
		}
	}

	MarkerTimer = SetTimer("MarkerStealth",1000,0);
    BaseTimer = SetTimer("BaseUpdate",1000,0);
    return 0;
}

forward StartTDM(tdm_id);
public StartTDM(tdm_id)
{
	Round[EplapsedTime] = 0;
   	Round[ModeMin] = Config[round_time];
	Round[Gamemode] = TDM;
	for(new i = 0; i <= Server[HighestID]; i++)Player[i][pVoted] = false;
	MatchInfo[RoundsPlayed]++;
	TextDrawHideForAll(gamemsg_voting);

	new awayteamplayers=0;
	new hometeamplayers=0;

	for(new x=0; x<Server[HighestID]+1; x++)
	{
		if(IsPlayerConnected(x) && Player[x][pTeam] == T_AWAY && Player[x][setToPlay] && Player[x][pSpawned] == true)
		{
			awayteamplayers++;
	    }
		if(IsPlayerConnected(x) && Player[x][pTeam] == T_HOME && Player[x][setToPlay] && Player[x][pSpawned] == true)
		{
		   hometeamplayers++;
		}
	}

	#if DEBUG == 1
	    awayteamplayers++;
	    hometeamplayers++;
	#endif
	new string[128];
	if((awayteamplayers<1 || hometeamplayers<1) || (Round[atotal] < Config[plimit]) || (Round[dtotal] < Config[plimit]) && Round[Gameplay] == STEALTH) {
		format(string,128,"Error: TDM %d �� �÷��̾ �����Ͽ� ������ �� �����ϴ�, {FF0000}�ּ� �÷��̾�: %d!", tdm_id, Config[plimit]);
		SendClientMessageToAllEx(COLOR_GREY,string);
	} else if(Round[atotal] > Config[maxplimit] || Round[dtotal] > Config[maxplimit]) {
		format(string,128,"Error: TDM %d �� �÷��̾ �ʹ� ���� ������ �� �����ϴ�, {FF0000}�ִ� �÷��̾�: %d!", tdm_id, Config[maxplimit]);
		SendClientMessageToAllEx(COLOR_GREY,string);
	} else if(Round[Gamemode] == BASE) {
		format(string,128,"Error: TDM %d �� ��Ⱑ �̹� ���� ���̹Ƿ� ������ �� �����ϴ�!", tdm_id);
		SendClientMessageToAllEx(COLOR_GREY,string);
	} else {
		CreateRoundMenus();
		Round[LoadScreen] = true;
		Round[WinnerTeam] = T_NON;
		//SendClientMessageToAllEx(COLOR_RED, "DEBUG: Round[WinnerTeam] set to T_NON 0 on line 14425 in combinations.pwn!");

		KillTimer(TDMTimer);
		new farena[256];
		Round[Current] = tdm_id;
		SetRecentTDM(tdm_id);
//		format(string,128,"TDM number %d starts in %d seconds...", Round[Current], Config[stop_counting]);
//		SendClientMessageToAllEx(COLOR_WHITE,string);

        #if IRC == 1
		format(string,128,"TDM number2 %d 14starts in %d seconds...", Round[Current], Config[stop_counting]);
		CallRemoteFunction("DC_IRCForceSay", "s", string);
		#endif


		farena = TDMfile(tdm_id);

	   	new arenaname[128];
		if(strlen(ArenaVariables[tdm_id][About]) > 3)
		{
			format(arenaname, 128, "~y~~h~TDM #%d ~w~~b~~p~~h~~h~%s", Round[Current], ArenaVariables[tdm_id][About]);
		}
		else if(strlen(ArenaVariables[tdm_id][About]) >= 14)
		{
			format(arenaname, 128, "~y~~h~TDM #%d ~n~~w~~b~~p~~h~~h~%s", Round[Current], ArenaVariables[tdm_id][About]);
		}
		else
		{
	   		format(arenaname,128,"~y~~h~Team Deathmatch ~w~~b~~p~~h~~h~#%d", Round[Current]);
		}

		TextDrawSetString(MapNameTD, arenaname);

		format(string, sizeof(string), "mapname TDM: %d", tdm_id);
		SendRconCommand(string);
		DestroyPickups();
		Round[WorldTime] = ArenaVariables[tdm_id][WorldTime];
		if(Round[WorldTime] == -1) Round[WorldTime] = Config[thetime];
		if(Config[forcetime] == -1) SetWorldTime(Round[WorldTime]);
		else SetWorldTime(Config[forcetime]);

		Round[Interior] = ArenaVariables[tdm_id][Interior];

		HomeSpawn[0] = ArenaVariables[tdm_id][DefSpawn][0];
		HomeSpawn[1] = ArenaVariables[tdm_id][DefSpawn][1];
		HomeSpawn[2] = ArenaVariables[tdm_id][DefSpawn][2];

		AwaySpawn[0] = ArenaVariables[tdm_id][AttSpawn][0];
		AwaySpawn[1] = ArenaVariables[tdm_id][AttSpawn][1];
		AwaySpawn[2] = ArenaVariables[tdm_id][AttSpawn][2];

		Checkpoint[0] = ArenaVariables[tdm_id][ArenaCheckpoint][0];
		Checkpoint[1] = ArenaVariables[tdm_id][ArenaCheckpoint][1];
		Checkpoint[2] = ArenaVariables[tdm_id][ArenaCheckpoint][2];

		MinX = ArenaVariables[tdm_id][Min_X];
		MinY = ArenaVariables[tdm_id][Min_y];
		MaxX = ArenaVariables[tdm_id][Max_X];
		MaxY = ArenaVariables[tdm_id][Max_Y];

	    Server[LastRoundPlayed] = tdm_id;
		TeamInfo[T_AWAY][RoundKills] = 0;
		TeamInfo[T_AWAY][RoundDeaths] = 0;
		TeamInfo[T_HOME][RoundKills] = 0;
		TeamInfo[T_HOME][RoundDeaths] = 0;
		TeamInfo[T_AWAY][Won] = false;
		TeamInfo[T_HOME][Won] = false;
		TeamInfo[T_AWAY][CapturedCP] = false;
		TeamInfo[T_HOME][CapturedCP] = false;
		TeamInfo[T_AWAY][TimeLimitedReached] = false;
		TeamInfo[T_HOME][TimeLimitedReached] = false;
		Round[AdminCanEnd] = true;
		ClearDeathMessages();

		new hour,minute,second;
		new year, month,day;
		gettime(hour, minute, second);
		getdate(year, month, day);
		format(RoundStartTime,256,"%d:%02d:%02d",hour,minute,second);
		format(RoundStartTime2,256,"%d:%02d",hour,minute);
    	Round[RoundStartTimeInt] = GetDateAndTime();

	    Server[LastGamemodePlayed] = 2;
		TeamInfo[T_AWAY][RoundKills] = 0;
		TeamInfo[T_AWAY][RoundDeaths] = 0;
 		TeamInfo[T_HOME][RoundKills] = 0;
		TeamInfo[T_HOME][RoundDeaths] = 0;
		TeamInfo[T_AWAY][Won] = false;
 		TeamInfo[T_HOME][Won] = false;
		TeamInfo[T_AWAY][CapturedCP] = false;
		TeamInfo[T_HOME][CapturedCP] = false;
		TeamInfo[T_AWAY][TimeLimitedReached] = false;
		TeamInfo[T_HOME][TimeLimitedReached] = false;
		ClearVehicles();
		HideLobbyTextDraws();
	    for(new i = 0; i <= Server[HighestID]; i++)
	   	{
		   	Player[i][pVoted] = false;
		   	if(IsPlayerConnected(i) && Player[i][AFK] == false && Player[i][setToPlay] &&((Player[i][pTeam] == T_REF) || (Player[i][pTeam] == T_AWAY) || (Player[i][pTeam] == T_HOME)))
			{
			    if (IsValidMenu(GetPlayerMenu(i))) {
					HideMenuForPlayer(GetPlayerMenu(i), i);
				}
   				//PlayerMatchInfo[i][RoundDeaths] = 0;
				//PlayerMatchInfo[i][RoundKills] = 0;
				PlayerMatchInfo[i][Died] = false;
				PlayerMatchInfo[i][PlayingMatch] = true;
				PlayerMatchInfo[i][DidPlayMatch] = true;
    			PlayerMatchInfo[i][StartedPlaying] = true;

				if(Player[i][pTeam] == T_AWAY)
					Round[started_away]++;
				else if(Player[i][pTeam] == T_HOME)
			    	Round[started_home]++;

                if (Player[i][DM] != 0) {
					OnPlayerLeaveDM(i, Player[i][DM]);
                }

				Player[i][RoundsPlayedEx]++;
				Server[TotalRounds] ++;
   				ResetPlayerWeapons(i);
   		    	Player[i][RoundScore] = 0;
				Player[i][Status] = STATUS_PLAYING;
   				SetPlayerWorldBoundsEx(i,9999.9,-9999.9,9999.9,-9999.9);
   				Player[i][ViewBase] = false;
				Player[i][ViewTDM] = false;
				SetPlayerVirtualWorld2(i, ROUND_VW);
				if(Player[i][Specing] == true)
				{
			    	StopSpectate(i);
				}
				
				TextDrawHideForPlayer(i, MapNameTD);
				TextDrawHideForPlayer(i, ScoreboardHome);
				TextDrawHideForPlayer(i, ScoreboardAway);
				
			    TogglePlayerControllable(i,0);
			    TogglePlayerSpectating(i, 1);
			    HideLobbyTextDrawsForPlayer(i);
		   		SetPlayerInterior(i,Round[Interior]);
		   		SetPlayerHealth(i,100);
		   		Player[i][pPlaying] = true;
		   		Player[i][pVoted] = false;
		   		SetPlayerPos(i,Checkpoint[0]-20+random(40),Checkpoint[1]-20+random(40),Checkpoint[2]+2);
		   		
		   		#if SAMP_VERSION == 2
					#if defined SOUND_ROUNDSTARTING
						if (ConfigAudio[sndRoundStarting] == true) {
							PlayAudioStreamForPlayerExEx(i, SOUND_ROUNDSTARTING);
						}
					#endif

					if (ConfigAudio[sndVoiceMsgs] == true) {
						format(nextStreamURL, 256, "http://translate.google.com/translate_tts?q=Players prepare, a round is about to begin");
						SetTimerEx("PlayAudioStreamForPlayerExEx", 3000, 0, "i", i);
					}
			    #endif
			    
				Player[i][AltitudeIndex] = 50;
				Player[i][Altitude] = Checkpoint[2]+Player[i][AltitudeIndex];
				new Float:Xc, Float:Yc;
				Xc = floatadd(Checkpoint[0], floatmul(Player[i][AltitudeIndex]+10, floatsin(-Player[i][LoadingScreenRotationAngle], degrees)));
				Yc = floatadd(Checkpoint[1], floatmul(Player[i][AltitudeIndex]+10, floatcos(-Player[i][LoadingScreenRotationAngle], degrees)));
				SetPlayerCameraPos(i, Xc, Yc, Player[i][Altitude]);
		   		SetPlayerCameraLookAt(i,Checkpoint[0],Checkpoint[1],Checkpoint[2]);

		   		PlayerPlaySound(i, 1183, 0, 0, 0);
				SetPlayerHealth(i,100.0);
		   		TogglePlayerControllable(i,false);
				Player[i][ControlledCamera] = false;
				if(Player[i][pTeam] != T_REF)
				{
					ResetPlayerWeapons(i);
					if(Config[weaponsystem] == WEAPONSYSTEM_MENU)
					{
					    Player[i][ChosenWeapons] = false;
						TryGunMenu(1, i);

						for(new __i = 0 ; __i < MAX_WEAPONS; ++ __i)
						{
						    if(WeaponsMenus[Option][__i] == 5)
						    {
		                        TimeTextForPlayer(i, autowep, (Config[stop_counting]*1000)-1000);
		                        TimeTextForPlayer(i, autowep2, (Config[stop_counting]*1000)-1000);
		                        TimeTextForPlayer(i, autowep3, (Config[stop_counting]*1000)-1000);
		                        TimeTextForPlayer(i, autowep4, (Config[stop_counting]*1000)-1000);
						        TimeTextForPlayer(i, autowep5, (Config[stop_counting]*1000)-1000);
						        break;
						    }
						}
					}
					else
					{
					    StrapUp(i);
					}
				}
		   	} else Player[i][pPlaying] = false;
	   	}
		SpawnAllPlayersInCircle(Checkpoint[0], Checkpoint[1], Checkpoint[2]);

    	if(Config[RotateCameraEx] == 1)
		{
			SetTimer("CamUpdate", 25, 0);
		}
		TextDrawSetString(gamemsg_baseupdateaway, " ");
		TextDrawSetString(awayhud, " ");
		ShowRoundTextDraws();

	   	FlashOrNot=true;
		Round[StopCounting] = Config[stop_counting];
		Round[TDMGangZone] = GangZoneCreate(MinX,MinY,MaxX,MaxY);
		GangZoneShowForAll(Round[TDMGangZone], 0xCBA407BB);
		GangZoneFlashForAll(Round[TDMGangZone], 0x383838BB);
		SetTimer("TDMCountdown",0,0);
	 	for(new i = 0; i < MAX_ARENAS; i++) Votes[i] = 0;
	}
}

forward TDMCountdown(bool:redo);
public TDMCountdown()
{
	Round[StopCounting]--;
	new string[128];

	if(Server[MainTextdrawLayout] == 1)
	{
		format(string,128,"                         ~w~TDM ~y~%d ~w~starting in ~r~ %d ~w~seconds",Round[Current],Round[StopCounting]);
		TextDrawSetString(gamemsg_baseupdatehome,string);
	}
	else
	{
		format(string,128,"~w~TDM ~y~%d~n~~w~starting in~n~~r~%d ~w~seconds",Round[Current],Round[StopCounting]);
		TextDrawSetString(homehud,string);
	}

	if(Round[StopCounting] <= 0)
	{
		OnTDMLoadFinish();
	}
	else
	{
		SetTimer("TDMCountdown",1000,0);
		/*for(new i; i <= Server[HighestID]; i++)
		{
			PlayerPlaySound(i,1056,0.0,0.0,0.0);
		}*/
	}
}

forward OnTDMLoadFinish();
public OnTDMLoadFinish()
{
	Round[LoadScreen] = false;
 	Round[ModeSec] = 0;

	new Float:away_health, Float:home_health;
    for(new i = 0; i <= Server[HighestID]; i++)
    {
	   	if(IsPlayerConnected(i) && Player[i][setToPlay] && Player[i][pTeam] != T_NON && Player[i][pSpawned])
		{
			if(Server[TimerMode]) {
				TextDrawShowForPlayer(i, TimerClock);
			}
		   	SetPlayerWorldBoundsEx(i,MaxX,MinX,MaxY,MinY);
		   	ShowRegularTextDrawsForPlayer(i);
		   	TextDrawShowForPlayer(i, MapNameTD);
			TextDrawShowForPlayer(i, ScoreboardHome);
			TextDrawShowForPlayer(i, ScoreboardAway);
			TogglePlayerSpectating(i, 0);
		   	TogglePlayerControllable(i,true);
			HideMenuForPlayer(primarymenu, i);
			HideMenuForPlayer(secondarymenu, i);
			HideMenuForPlayer(specialmenu, i);
			HideMenuForPlayer(wepdone_menu, i);
			Player[i][Status] = STATUS_PLAYING;
		    DisablePlayerCheckpoint(i);
		    PlayerPlaySound(i,1057,0.0,0.0,0.0);
	  		SetCameraBehindPlayer(i);
	  		//SpawnPlayerEx(i);
			PlayerSpawnKillProtection(i);
			SetTimerEx("SetPlayerHealthEx",Config[antisktime], false, "id", i, Config[roundhealth]);
			SetTimerEx("SetPlayerArmourEx",Config[antisktime], false, "id", i, Config[roundarmour]);
			SetTimerEx("StrapUp", Config[antisktime], false, "i", i);

		   	#if SAMP_VERSION == 2
				#if defined SOUND_ROUNDSTARTED
					if (ConfigAudio[sndRoundStarted] == true) {
						PlayAudioStreamForPlayerExEx(i, SOUND_ROUNDSTARTED);
					}
				#endif

				if (ConfigAudio[sndVoiceMsgs] == true) {
					format(nextStreamURL, 256, "http://translate.google.com/translate_tts?q=Team deathmatch number %d, %s has started", Round[Current], ArenaVariables[Round[Current]][About]);
					SetTimerEx("PlayAudioStreamForPlayerExEx", 3000, 0, "i", i);
				}
			#endif
			
 			CallRemoteFunction("DC_PlayerEnteredRound", "d", i);

			if(!Server[TimerMode])
			{
				TextDrawHideForPlayer(i,TimerClock);
			}
		    else
		    {
				TextDrawShowForPlayer(i,TimerClock);
			}

	   		if(Player[i][pTeam] == T_AWAY)
	   		{
			   	SetPlayerPos(i,AwaySpawn[0]+2-random(2),AwaySpawn[1]+2-random(2),AwaySpawn[2]+2);
			   	SetPlayerColor(i,GetTeamColor(1, T_AWAY)  | 0x000000FF);
			   	if(Server[TkMode]) {
			   		SAMP_SetPlayerTeam(i,1);
				}
			 	new Float:hp, Float:ar;
				GetPlayerHealth(i, hp);
				GetPlayerArmour(i, ar);
				away_health = away_health+hp+ar;
	   		}
	  		else if(Player[i][pTeam] == T_HOME)
   			{

			   	SetPlayerPos(i,HomeSpawn[0]+2-random(2),HomeSpawn[1]+2-random(2),HomeSpawn[2]+2);
			   	SetPlayerColor(i,GetTeamColor(1, T_HOME)  | 0x000000FF);
			   	if(Server[TkMode]) {
			   		SAMP_SetPlayerTeam(i,2);
				}
				new Float:hp, Float:ar;
				GetPlayerHealth(i, hp);
				GetPlayerArmour(i, ar);
				home_health = home_health+hp+ar;

	   		}
		   	else if(Player[i][pTeam] == T_REF)
	   		{
	   		    SetPlayerPos(i,Checkpoint[0],Checkpoint[1],Checkpoint[2]+2);
	   		    SetPlayerColor(i,COLOR_REF);

	   		    if (Config[RefMode] == 2) { // they go into spectate and not spawn
					new specid;
    				for(new x = 0; x <= Server[HighestID]; x++)
   					{
   					    if (IsPlayerConnected(x) && Player[x][pTeam] == T_HOME) {
   					        specid = x;
   					        x = 9999999;
   					    }
   					}
					SetTimerEx("StartSpectate",500,false,"ii",i, specid);
					Player[i][Specing] = true;
	   		    }

	   		    if(Server[TkMode]) {
	   		    	SAMP_SetPlayerTeam(i,3);
				}
	   		}

	  		TogglePlayerControllable(i,1);
	   	}
   	}

	//SpawnTeamInCircle(T_HOME,HomeSpawn[0],HomeSpawn[1],HomeSpawn[2]);
	//SpawnTeamInCircle(T_AWAY,AwaySpawn[0],AwaySpawn[1],AwaySpawn[2]);
	//SpawnTeamInCircle(T_REF,Checkpoint[0],Checkpoint[1],Checkpoint[2]);
	Server[CantSpawnVehicle] = true;
//	format(string,128,"TDM #%d started!", Round[Current]);
//	SendClientMessageToAllEx(COLOR_WHITE,string);

    TeamInfo[T_HOME][RoundHealth] = floatround(home_health);
	TeamInfo[T_AWAY][RoundHealth] = floatround(away_health);

	Round[FirstBlood] = false;

   	TDMUpdate();
	NametagTimer = SetTimer("NameTagStealth",1200,0);

	if(Server[HUD] == true)
		HUDUpdateTimer = SetTimer("HUDUpdate",1000,1);

	#if IRC == 1
	new string[128];
	format(string, sizeof(string),"14TDM 2%d 14started!", Round[Current]);
	CallRemoteFunction("DC_IRCForceSay", "s", string);
	#endif

	SetTimer("FixPlayersTeams", 3000, false);

	GangZoneStopFlashForAll(Round[TDMGangZone]);
	GangZoneHideForAll(Round[TDMGangZone]);
}

forward TDMUpdate();
public TDMUpdate()
{
	if(Round[Current] == -1) return 1;

	Round[EplapsedTime]++;

	if(Server[TimerMode]) {
	    if(Round[Paused] == 0)
	    {
	    	Round[ModeSec]--;
		}
		else { TDMTimer = SetTimer("TDMUpdate",1000,0); return 0; }
		if((Round[ModeMin] ==0) && (Round[ModeSec] ==0)) {

		    if(TeamInfo[T_AWAY][RoundDeaths] > TeamInfo[T_HOME][RoundDeaths])
		    {
		        Round[WinnerTeam] = T_HOME;
		    }
		    else if(TeamInfo[T_HOME][RoundDeaths] > TeamInfo[T_AWAY][RoundDeaths])
		    {
		        Round[WinnerTeam] = T_AWAY;
		    }
		    else
			{
				Round[WinnerTeam] = T_NON;
				//SendClientMessageToAllEx(COLOR_RED, "DEBUG: Round[WinnerTeam] set to T_NON 0 on line 14780 in combinations.pwn!");
			}

			EndRound();
			return 1;
		}
		if(Round[ModeSec] < 0)
		{
			Round[ModeSec] = 59;
			Round[ModeMin]--;

		}
	}

	if(Round[ModeSec] == 35 ||  Round[ModeSec] == 5)
	{
	  	for (new i = 0; i <= Server[HighestID]; i++)
		{
		    if(IsPlayerConnected(i))
		    {
				for (new x = 0; x <= Server[HighestID]; x++)
				{
					if(IsPlayerConnected(x))
					{
					    if(Player[x][pPlaying] == true)
					    {
			 				SetPlayerMarkerForPlayer(x,i,GetPlayerColor(i) | 0x00000044);
						}
					}
				}
			}
		}
	}

	if(FlashOrNot == true)
	{
		GangZoneHideForAll(Round[TDMGangZone]);
		GangZoneShowForAll(Round[TDMGangZone],GetTeamColor(1, T_HOME) | 0x00000099);
		FlashOrNot = false;
	}
	else if(FlashOrNot == false)
	{
		GangZoneHideForAll(Round[TDMGangZone]);
		GangZoneShowForAll(Round[TDMGangZone],GetTeamColor(1, T_AWAY) | 0x00000099);
		FlashOrNot = true;
	}

	new string[256];

    new Float:health = 0;
	new Float:armour = 0;
	new Float:away_health = 0;
	new Float:home_health = 0;

	new hometeamplayers=0;
	new awayteamplayers=0;


	for(new x=0; x<Server[HighestID]+1; x++)
	{
	    if(IsPlayerConnected(x))
	    {
	        new Float:PlayerHealth, Float:PlayerArmour;
        	GetPlayerHealth(x,PlayerHealth);
			GetPlayerArmour(x,PlayerArmour);
			new Float:Total = PlayerArmour + PlayerHealth;
			if(Player[x][pPlaying] == true)
			{
				SetPlayerScore(x, floatround(Total));
			}
			else
			{
				SetPlayerScore(x, 0);
			}

			new Float:PlayerPos[3];
			GetPlayerPos(x,PlayerPos[0],PlayerPos[1],PlayerPos[2]);
			/*if (Player[x][boundsSet]) {
				if (PlayerPos[0] > Player[x][bounds_xmax] || PlayerPos[1] > Player[x][bounds_ymax] || PlayerPos[0] < Player[x][bounds_xmin] || PlayerPos[1] < Player[x][bounds_ymin]) {
					// they are out of bounds by bug abusing
					SyncPlayer(x);
				}
			}*/

			if((Player[x][pTeam] ==T_AWAY) && (Player[x][pPlaying]))
			{
			    awayteamplayers++;
				GetPlayerHealth(x,health);
				GetPlayerArmour(x,armour);
				away_health=away_health+health+armour;
			}
			if((Player[x][pTeam] ==T_HOME) && (Player[x][pPlaying]))
			{
				hometeamplayers++;
				GetPlayerHealth(x,health);
				GetPlayerArmour(x,armour);
				home_health=home_health+health+armour;
			}
		}
	}

	new old_home_hp, old_away_hp, new_home_hp, new_away_hp, away_dmg, home_dmg;
	old_home_hp = TeamInfo[T_HOME][RoundHealth];
	old_away_hp = TeamInfo[T_AWAY][RoundHealth];
	new_home_hp = floatround(home_health);
	new_away_hp = floatround(away_health);
	TeamInfo[T_HOME][RoundHealth] = new_home_hp;
	TeamInfo[T_AWAY][RoundHealth] = new_away_hp;
	away_dmg = new_away_hp - old_away_hp;
	home_dmg = new_home_hp - old_home_hp;
	TeamInfo[T_HOME][TempDamage] = TeamInfo[T_HOME][TempDamage] + home_dmg;
	TeamInfo[T_AWAY][TempDamage] = TeamInfo[T_AWAY][TempDamage] + away_dmg;

	new hpmsg[50];

	if (new_home_hp < old_home_hp) {
		if (Server[MainTextdrawLayout] == 1) {
			format(hpmsg, 50, "~w~~r~%d", TeamInfo[T_HOME][TempDamage]);
		} else {
			format(hpmsg, 50, "%s ~w~~r~%d", HomeName, TeamInfo[T_HOME][TempDamage]);
		}
	    TextDrawSetString(home_tdamage, hpmsg);
 		for(new i = 0; i <= Server[HighestID]; i++)
		{
 			if(IsPlayerConnected(i) && Player[i][pPlaying])
			{
			    KillTimer(Round[TeamDmgTimerHome]);
			    TextDrawShowForPlayer(i, home_tdamage);
			}
		}
		Round[TeamDmgTimerHome] = SetTimer("HideTeamDamageHome", 3000, false);
	}

	if (new_away_hp < old_away_hp) {
		if (Server[MainTextdrawLayout] == 1) {
			format(hpmsg, 50, "~w~~r~%d", TeamInfo[T_AWAY][TempDamage]);
		} else {
			format(hpmsg, 50, "%s ~w~~r~%d", AwayName, TeamInfo[T_AWAY][TempDamage]);
		}
	    TextDrawSetString(away_tdamage, hpmsg);
 		for(new i = 0; i <= Server[HighestID]; i++)
		{
 			if(IsPlayerConnected(i) && Player[i][pPlaying])
			{
			    KillTimer(Round[TeamDmgTimerAway]);
			    TextDrawShowForPlayer(i, away_tdamage);
			}
		}
		Round[TeamDmgTimerAway] = SetTimer("HideTeamDamageAway", 3000, false);
	}

	#if DEBUG == 0
	if(Round[Gameplay] == STEALTH)
	{
		if((awayteamplayers<1)) {
			Round[HPLeft] = floatround(home_health);
			if(TeamInfo[T_AWAY][RoundKills] == 0 && TeamInfo[T_AWAY][RoundDeaths] == 0 && TeamInfo[T_HOME][RoundKills] == 0 && TeamInfo[T_HOME][RoundDeaths] == 0) {
				Round[WinnerTeam] = T_NON;
				//SendClientMessageToAllEx(COLOR_RED, "DEBUG: Round[WinnerTeam] set to T_NON 0 on line 14887 in combinations.pwn!");
			} else {
				Round[WinnerTeam] = T_HOME;
			}
		  	EndRound();
		}

		if((hometeamplayers<1)) {
			Round[HPLeft] = floatround(away_health);
			if(TeamInfo[T_AWAY][RoundKills] == 0 && TeamInfo[T_AWAY][RoundDeaths] == 0 && TeamInfo[T_HOME][RoundKills] == 0 && TeamInfo[T_HOME][RoundDeaths] == 0) {
				Round[WinnerTeam] = T_NON;
				//SendClientMessageToAllEx(COLOR_RED, "DEBUG: Round[WinnerTeam] set to T_NON 0 on line 14899 in combinations.pwn!");
			} else {
				Round[WinnerTeam] = T_AWAY;
			}
		  	EndRound();
		}
	}
	#endif

	if(Round[Gameplay] == RUMBLE)
	{

		if (TeamInfo[T_AWAY][RoundKills] > Config[tdmpoints]) {

			Round[WinnerTeam] = T_AWAY;
		  	EndRound();
		}
		if (TeamInfo[T_HOME][RoundKills] > Config[tdmpoints]) {

			Round[WinnerTeam] = T_HOME;
		  	EndRound();
		}
	}

	if(Round[Gameplay] == STEALTH)
	{
		if(Server[MainTextdrawLayout] == 1)
		{
			format(string,256,"              %s: ~w~%d~b~~h~/~w~%d  ~r~Life: ~w~%d",HomeName,hometeamplayers,Round[started_home],floatround(home_health));
			TextDrawSetString(gamemsg_baseupdatehome,string);
	  		format(string,256,"%s: ~w~%d~b~~h~/~w~%d  ~r~Life: ~w~%d",AwayName,awayteamplayers,Round[started_away],floatround(away_health));
			TextDrawSetString(gamemsg_baseupdateaway,string);
		}
		else
		{
			format(string,256,"%s~n~~y~Alive: ~w~%d~b~/~w~%d ~r~Life: ~w~%d",HomeName,hometeamplayers,Round[started_home],floatround(home_health));
			TextDrawSetString(homehud,string);
			format(string,256,"%s~n~~y~Alive: ~w~%d~b~/~w~%d ~r~Life: ~w~%d",AwayName,awayteamplayers,Round[started_away],floatround(away_health));
			TextDrawSetString(awayhud,string);
		}
	}
	else if(Round[Gameplay] == RUMBLE)
	{
		if(Server[MainTextdrawLayout] == 1)
		{
			format(string,256,"              %s: ~w~%d",HomeName, TeamInfo[T_HOME][RoundKills]);
			TextDrawSetString(gamemsg_baseupdatehome,string);
			format(string,256,"              %s: ~w~%d",AwayName, TeamInfo[T_AWAY][RoundKills]);
			TextDrawSetString(gamemsg_baseupdateaway,string);
		}
		else
		{
			format(string,256,"%s~n~~w~%d", HomeName, TeamInfo[T_HOME][RoundKills]);
			TextDrawSetString(homehud,string);
			format(string,256,"%s~n~~w~%d", AwayName, TeamInfo[T_AWAY][RoundKills]);
			TextDrawSetString(awayhud,string);
		}
	}
	else
	{
		if(Server[MainTextdrawLayout] == 1)
		{
			format(string,256,"              %s  Score: ~w~%d",HomeName,TeamInfo[T_AWAY][RoundDeaths]);
			TextDrawSetString(gamemsg_baseupdatehome,string);
	  		format(string,256,"%s  Score: ~w~%d",AwayName, TeamInfo[T_HOME][RoundDeaths]);
			TextDrawSetString(gamemsg_baseupdateaway,string);
		}
		else
		{
			format(string,256,"%s~n~~y~Score: ~w~%d",HomeName,TeamInfo[T_AWAY][RoundDeaths]);
			TextDrawSetString(homehud,string);
			format(string,256,"%s~n~~y~Score: ~w~%d",AwayName, TeamInfo[T_HOME][RoundDeaths]);
			TextDrawSetString(awayhud,string);
		}
	}

	if(Server[TimerMode]) {
		format(string,256,"%02d:%02d",Round[ModeMin],Round[ModeSec]);
		TextDrawSetString(TimerClock, string);
		new str[256];
		format(str, sizeof(str), "mapname TDM: %d [%02d:%02d]", Round[Current], Round[ModeMin], Round[ModeSec]);
		SendRconCommand(str);
	}

    new gm_text[200];
    format(gm_text, sizeof(gm_text), "%s - %d / %s - %d", HomeName, MatchInfo[HomeRoundsWon], AwayName, MatchInfo[AwayRoundsWon]);
	SetGameModeText(gm_text);

	for(new i = 0; i <= Server[HighestID]; i++)
	{
		if(Player[i][pTeam] ==T_REF) {
			SetPlayerArmour(i,100);
			SetPlayerHealth(i,100);
			ResetPlayerWeapons(i);
		}

		new Float:health2 = 0;
		new Float:armour2 = 0;
		GetPlayerHealth(i,health2);
		GetPlayerArmour(i,armour2);

	}

	MarkerTimer = SetTimer("MarkerStealth",1000,0);
    TDMTimer = SetTimer("TDMUpdate",1000,0);
    return 0;
}

forward SetPlayerArmourEx(playerid, armour);
public SetPlayerArmourEx(playerid, armour)
{
	SetPlayerArmour(playerid, armour);
}

forward SetPlayerHealthEx(playerid, health);
public SetPlayerHealthEx(playerid, health)
{
	SetPlayerHealth(playerid, health);
}

forward GiveLobbyWeapons(playerid);
public GiveLobbyWeapons(playerid)
{
	// -- Players's /getgun weapons
	for(new slots = 0; slots < 13; slots++)
	{
		if(PlayerGuns[playerid][slots] > 0)
		{
			GivePlayerWeaponEx(playerid, PlayerGuns[playerid][slots], PlayerAmmos[playerid][slots]);
		}
	}
}


forward PlayerSpawnKillProtection(playerid);
public PlayerSpawnKillProtection(playerid)
{
	SetPlayerArmour(playerid, 100.0);
	SetPlayerHealth(playerid, 100.0);

	SetPlayerArmour(playerid, 1337.0);
	SetPlayerHealth(playerid, 1337.0);
}

forward StrapUp(playerid);
public StrapUp(playerid)
{
    TogglePlayerControllable(playerid, true);
	Player[playerid][ChosenWeapons] = true;
	//SetPlayerArmedWeapon(playerid, 0);
	ResetPlayerWeapons(playerid);

	for(new i= 0; i < MAX_WEAPONS; i ++) //Given auto weapons
	{
	    if(WeaponsMenus[Option][i] == 5)
	    {
	        if(i != 0) GivePlayerWeaponEx(playerid, i, WeaponsMenus[wAmmo][i]);
	    }
	}
	switch(Config[weaponsystem])
	{
	    case WEAPONSYSTEM_MENU:
	    {
			if(Player[playerid][PrimaryWep] != 0) GivePlayerWeaponEx(playerid, Player[playerid][PrimaryWep], Player[playerid][PrimaryWepAmmo]);
			if(Player[playerid][SecondaryWep] != 0) GivePlayerWeaponEx(playerid, Player[playerid][SecondaryWep], Player[playerid][SecondaryWepAmmo]);
			if(Player[playerid][TerciaryWep] != 0) GivePlayerWeaponEx(playerid, Player[playerid][TerciaryWep], Player[playerid][TerciaryWepAmmo]);
			if(Player[playerid][SpecialWep] != 0) GivePlayerWeaponEx(playerid, Player[playerid][SpecialWep], Player[playerid][SpecialWepAmmo]);

			if(Player[playerid][SecondaryWep] == 0 && Player[playerid][TerciaryWep] == 0 && Player[playerid][SpecialWep] == 0 && Player[playerid][PrimaryWep] == 0 && Round[Gamemode] != TDM) {

				TimeTextForPlayer(playerid, autowep,  6000);
 		    	TimeTextForPlayer(playerid, autowep2, 6000);
        		TimeTextForPlayer(playerid, autowep3, 6000);
				TimeTextForPlayer(playerid, autowep4, 6000);
        		TimeTextForPlayer(playerid, autowep5, 6000);

				TogglePlayerControllable(playerid, 0);
				TryGunMenu(1, playerid);
				return 1;
			}
			new str[128];
			
			format(str, sizeof(str), "%s\n%s\n%s\n%s\n", GetWeaponNameEx(Player[playerid][PrimaryWep]), GetWeaponNameEx(Player[playerid][SecondaryWep]), GetWeaponNameEx(Player[playerid][TerciaryWep]), GetWeaponNameEx(Player[playerid][SpecialWep]));

			Update3DTextLabelText(Player[playerid][AFKLabel], COLOR_RED, str);
			Attach3DTextLabelToPlayer(Player[playerid][AFKLabel], playerid, 0.0, 0.0, 0.7);
			SetTimerEx("ResetAFKLabel", 20000, 0, "d", playerid);
			
		}
		case WEAPONSYSTEM_RANDOM:
		{
  			GiveRandomWeapons(playerid);
	    }
     	case WEAPONSYSTEM_FULL:
	    {
 		    if(FullSet[1] != 0) GivePlayerWeaponEx(playerid, FullSet[1], 9999);
 		    if(FullSet[2] != 0) GivePlayerWeaponEx(playerid, FullSet[2], 9999);
 		    if(FullSet[3] != 0) GivePlayerWeaponEx(playerid, FullSet[3], 9999);
 		    if(FullSet[4] != 0) GivePlayerWeaponEx(playerid, FullSet[4], 9999);
 		    if(FullSet[5] != 0) GivePlayerWeaponEx(playerid, FullSet[5], 9999);
 		    if(FullSet[6] != 0) GivePlayerWeaponEx(playerid, FullSet[6], 9999);

 		    if(Server[explosives] == true)
 		    {
  		    	GivePlayerWeaponEx(playerid, 16, 2);
 		    }
		}
     	case WEAPONSYSTEM_WW:
	    {
 		    GivePlayerWeaponEx(playerid, 31, 9999); //m4
 		    GivePlayerWeaponEx(playerid, 27, 9999); //combat
 		    GivePlayerWeaponEx(playerid, 24, 9999); // deagle
		}
     	case WEAPONSYSTEM_RW:
	    {
 		    GivePlayerWeaponEx(playerid, 26, 9999); //sawns
 		    GivePlayerWeaponEx(playerid, 28, 9999); //uzis
		}
	}
	if(Round[Paused] >= 1) TogglePlayerControllable(playerid, false);
	else ClearAnimations(playerid);
	return 1;
}

stock GiveRandomWeapons(playerid)
{
	new rand = random(5);
	if(rand==1) {
	} else if(rand==2) {
		GivePlayerWeaponEx(playerid,23,2000); // Silenced 9mm Pistol
	} else {
		GivePlayerWeaponEx(playerid,24,2000); // Desert Eagle
		}
	rand = random(2);
	if(rand==1) {
		GivePlayerWeaponEx(playerid,25,2000); // Shotgun
	} else {
		GivePlayerWeaponEx(playerid,27,2000); // Combat Shotgun
	}
	rand = random(2);
	if(rand==1) {
		GivePlayerWeaponEx(playerid,29,2000); // SMG
	}
	rand = random(3);
	if(rand==1) {
		GivePlayerWeaponEx(playerid,30,2000); // AK-47
	} else {
		GivePlayerWeaponEx(playerid,31,2000); // m4
	}
	rand = random(3);
	if(rand==1) {
		GivePlayerWeaponEx(playerid,33,50); // Country Rifle
	} else {
		GivePlayerWeaponEx(playerid,34,50); // Sniper Rifle
	}

	if(Server[explosives] == true)
    {
		rand = random(20);
		if(rand==10) {
			GivePlayerWeaponEx(playerid,18,1); // Molotov
		}
		else if(rand > 5 && rand < 10) {
		    GivePlayerWeaponEx(playerid, 16,2); //greneade
		}
		else if(rand > 10 && rand < 15) {
			GivePlayerWeaponEx(playerid, 35, 1); //RPG
		}
	}
}

forward Float:GetDistanceBetweenPlayers(p1,p2);
public Float:GetDistanceBetweenPlayers(p1,p2)
{
	new Float:x1,Float:y1,Float:z1,Float:x2,Float:y2,Float:z2;

	if(!IsPlayerConnected(p1) || !IsPlayerConnected(p2))
	{
		return -1.00;
	}
	GetPlayerPos(p1,x1,y1,z1);
	GetPlayerPos(p2,x2,y2,z2);

	return floatsqroot(floatpower(floatabs(floatsub(x2,x1)),2)+floatpower(floatabs(floatsub(y2,y1)),2)+floatpower(floatabs(floatsub(z2,z1)),2));
}

forward Float:GetPlayerDistanceToPoint(p1,Float:x2,Float:y2,Float:z2);
public Float:GetPlayerDistanceToPoint(p1,Float:x2,Float:y2,Float:z2)
{
	new Float:x1,Float:y1,Float:z1;

	if(!IsPlayerConnected(p1))
	{
		return -1.00;
	}
	GetPlayerPos(p1,x1,y1,z1);

	return floatsqroot(floatpower(x1 - x2, 2) + floatpower(y1 - y2, 2) + floatpower(z1 - z2, 2));
//	return floatsqroot(floatpower(floatabs(floatsub(x2,x1)),2)+floatpower(floatabs(floatsub(y2,y1)),2)+floatpower(floatabs(floatsub(z2,z1)),2));
}

forward StartSpectate(playerid,specid);
public StartSpectate(playerid,specid)
{
	if (Player[playerid][CanScrollSpec] == false)
    {
    	return 0;
    }
    printf("StartSpectate(%d, %d), 1", playerid, specid);


    Player[playerid][CanScrollSpec] = false;
    SetTimerEx("EnableScrollSpec",250,false,"i",playerid);

    printf("StartSpectate(%d, %d), 2", playerid, specid);

    if(Player[playerid][Specing] == true)
    {
    	printf("StartSpectate(%d, %d), 3", playerid, specid);

        new specyou_text_[256], specyou_text2_[256], specyou_text3_[256], specingP_[MAX_PLAYERS];
        strcat(specyou_text_, "~y~~b~Spectating you~w~", 25);//format(specyou_text_, sizeof(specyou_text_), "~y~~b~Spectating You~w~");

        printf("StartSpectate(%d, %d), 4", playerid, specid);

        specyou_text2_ = "\0";//specyou_text2_ = " ";
        new tempid = -1;
        printf("StartSpectate(%d, %d), 5", playerid, specid);
        for (new x = 0; x <= Server[HighestID]; x++) // foreach player...
        {
            if(!IsPlayerConnected(x)) continue;
            tempid = Player[x][gSpectateID];
            printf("StartSpectate(%d, %d), 6", playerid, specid);
            if(GetPlayerState(x) == PLAYER_STATE_SPECTATING && Player[x][gSpectateID] == Player[playerid][gSpectateID] && x != playerid)
            {
                printf("StartSpectate(%d, %d), 7", playerid, specid);
                specingP_[tempid] ++;
				specyou_text3_ = specyou_text2_;
                format(specyou_text2_, sizeof(specyou_text2_), "%s~n~ - %s", specyou_text3_, PlayerName(x));
            }
        }
        printf("StartSpectate(%d, %d), 8", playerid, specid);

        specyou_text3_ = specyou_text_;
        format(specyou_text_, sizeof(specyou_text_), "%s%s", specyou_text3_, specyou_text2_);
        printf("Test 8 Debug - %s", specyou_text_); // See if it prints anything, else it will be "" = Textdraw crash
        printf("tempid: %d", tempid);

        if(!IsPlayerConnected(tempid)) return 0;

        TextDrawHideForPlayer(tempid, specingYou[tempid]);
        TextDrawSetString(specingYou[tempid], specyou_text_);

        printf("StartSpectate(%d, %d), 9", playerid, specid);

        if (specingP_[tempid] > 0)
        {
        	printf("StartSpectate(%d, %d), 10", playerid, specid);

            TextDrawShowForPlayer(tempid, specingYou[tempid]);
        }
        else
        {
	    	printf("StartSpectate(%d, %d), 11", playerid, specid);
            TextDrawSetString(specingYou[tempid], "_");
            TextDrawHideForPlayer(tempid, specingYou[tempid]);
        }

        // reformat the old players textdraw before changing gSpectateID
	}

    printf("StartSpectate(%d, %d), 12", playerid, specid);
    HideLobbyTextDrawsForPlayer(playerid);
    printf("raekwon is a noob");
    HideSpecTD(playerid);
    printf("StartSpectate(%d, %d), 13", playerid, specid);

    TogglePlayerSpectating(playerid, 1);
    Player[playerid][gSpectateID] = specid;
    Player[playerid][Specing] = true;
    printf("StartSpectate(%d, %d), 14", playerid, specid);

    if(IsPlayerInAnyVehicle(specid))
    {
	    printf("StartSpectate(%d, %d), 15", playerid, specid);
        PlayerSpectateVehicle(playerid, GetPlayerVehicleID(specid));
        Player[playerid][gSpectateType] = SPECTATE_TYPE_VEHICLE;
        ShowVehicleHud(playerid, GetPlayerVehicleID(specid));
    }
    else
    {
        printf("StartSpectate(%d, %d), 16", playerid, specid);
        PlayerSpectatePlayer(playerid, specid);
        Player[playerid][gSpectateType] = SPECTATE_TYPE_PLAYER;
    }

	printf("StartSpectate(%d, %d), 17", playerid, specid);
    SetPlayerVirtualWorld2(playerid,GetPlayerVirtualWorld(specid));
    SetPlayerInterior(playerid,GetPlayerInterior(specid));

    printf("StartSpectate(%d, %d), 18", playerid, specid);

    new string[256];
    new Float:PlayerHealth, Float:PlayerArmour;
    GetPlayerHealth(specid,PlayerHealth);
    GetPlayerArmour(specid,PlayerArmour);
    printf("StartSpectate(%d, %d), 19", playerid, specid);
    format(string,sizeof(string),"~w~~h~~w~ %s ~n~~n~~y~Armor: %d ~n~~r~Health: %d", PlayerName(specid), floatround(PlayerArmour),floatround(PlayerHealth));

    printf(string);

    TextDrawSetString(Player[specid][SpecText],string);

    printf("StartSpectate(%d, %d), 20", playerid, specid);

    TextDrawShowForPlayer(playerid,Player[specid][SpecText]);
    TextDrawShowForPlayer(playerid,WideScreenUp);
    TextDrawShowForPlayer(playerid,WideScreenDown);
    TextDrawShowForPlayer(playerid,specweps1);
    printf("StartSpectate(%d, %d), 21", playerid, specid);
    TextDrawShowForPlayer(playerid,specweps2);
    TextDrawShowForPlayer(playerid,specweps4);
    TextDrawShowForPlayer(playerid,specweps5[playerid]);
    TextDrawShowForPlayer(playerid,specfps[playerid]);
    printf("StartSpectate(%d, %d), 22", playerid, specid);

    new specyou_text[256], specyou_text2[256], specyou_text3[256], specingP[MAX_PLAYERS];
    strcat(specyou_text, "~y~~b~Spectating You~w~", 25);//format(specyou_text, sizeof(specyou_text), "~y~~b~Spectating You~w~");
    printf("StartSpectate(%d, %d), 23", playerid, specid);

    specyou_text2 = "\0";//specyou_text2 = " ";
    for (new x = 0; x <= Server[HighestID]; x++) // foreach player...
    {
        if(IsPlayerConnected(x) && GetPlayerState(x) == PLAYER_STATE_SPECTATING && Player[x][gSpectateID] == specid)
        {
            printf("StartSpectate(%d, %d), 24", playerid, specid);
            specingP[specid] ++;
            specyou_text3 = specyou_text2;
            format(specyou_text2, sizeof(specyou_text2), "%s~n~ - %s", specyou_text3, PlayerName(x));
            printf("StartSpectate(%d, %d), 25", playerid, specid);
        }
	}

	specyou_text3 = specyou_text;
    format(specyou_text, sizeof(specyou_text), "%s%s", specyou_text3, specyou_text2);
    printf(specyou_text);
    TextDrawSetString(specingYou[specid], specyou_text);
    printf("StartSpectate(%d, %d), 26", playerid, specid);

    if (specingP[specid] > 0)
    {
        printf("StartSpectate(%d, %d), 27", playerid, specid);
        TextDrawShowForPlayer(specid, specingYou[specid]);
    }
    else
    {
     	printf("StartSpectate(%d, %d), 28", playerid, specid);
        TextDrawSetString(specingYou[specid], "_");
        TextDrawHideForPlayer(specid, specingYou[specid]);
    }
	return 1;
}


stock StopSpectate(playerid)
{
	printf("StopSpectate(%d) part 1", playerid);
	Player[playerid][CanScrollSpec] = true;
	HideSpecTD(playerid);
	printf("StopSpectate(%d) part 2", playerid);
	new specid = Player[playerid][gSpectateID];

	//if (IsPlayerConnected(Player[playerid][gSpectateID])) {
    //	TextDrawHideForPlayer(playerid,Player[specid][SpecText]);
	//}

	//TextDrawHideForPlayer(playerid,specweps1);
	//TextDrawHideForPlayer(playerid,specweps2);
	//TextDrawHideForPlayer(playerid,specweps4);
	//TextDrawHideForPlayer(playerid,specweps5[playerid]);
	//TextDrawHideForPlayer(playerid,specfps[playerid]);
	//TextDrawHideForPlayer(playerid,specweps5[Player[playerid][gSpectateID]]);
	//TextDrawHideForPlayer(playerid,specfps[Player[playerid][gSpectateID]]);

//	HideAllSpecTextdrawsForPlayer(playerid);

//	Player[playerid][Specing] = false;
	TogglePlayerSpectating(playerid, 0);
	printf("StopSpectate(%d) part 3", playerid);

	if(IsPlayerInAnyVehicle(Player[playerid][gSpectateID])) {
		HideVehicleHud(playerid, GetPlayerVehicleID(Player[playerid][gSpectateID]));
	}

	Player[playerid][gSpectateID] = INVALID_PLAYER_ID;
	Player[playerid][gSpectateType] = SPECTATE_TYPE_NONE;
	Player[playerid][Specing] = false;
	printf("StopSpectate(%d) part 4", playerid);
	SetPlayerInterior(playerid,Config[LobbyInterior]);
	SetPlayerPos(playerid,Lobby[0]+2-random(2),Lobby[1]+2-random(2),Lobby[2]+2);

	new specyou_text[256], specyou_text2[256], specingP[MAX_PLAYERS];
	format(specyou_text, 256, "~y~~b~Spectating You~w~");
	printf("StopSpectate(%d) part 5", playerid);
	specyou_text2 = " ";
	for (new x = 0; x <= Server[HighestID]; x++) // foreach player...
	{
	    if(IsPlayerConnected(x) && GetPlayerState(x) == PLAYER_STATE_SPECTATING && Player[x][gSpectateID] == specid)
	    {
			specingP[specid] ++;
			format(specyou_text2, 256, "%s~n~ - %s", specyou_text2, PlayerName(x));
		}
	}
	printf("StopSpectate(%d) part 6", playerid);
	format(specyou_text, 256, "%s%s", specyou_text, specyou_text2);
	TextDrawSetString(specingYou[specid], specyou_text);

	if (specingP[specid] > 0) {
		TextDrawShowForPlayer(specid, specingYou[specid]);
	} else {
		TextDrawSetString(specingYou[specid], " ");
		TextDrawHideForPlayer(specid, specingYou[specid]);
	}
	printf("StopSpectate(%d) part 7", playerid);
	return 1;
}

/*
stock StopSpectate(playerid)
{
	Player[playerid][CanScrollSpec] = true;
	HideAllSpecTD(playerid);

	new specid = Player[playerid][gSpectateID];

	//if (IsPlayerConnected(Player[playerid][gSpectateID])) {
    //	TextDrawHideForPlayer(playerid,Player[specid][SpecText]);
	//}

	//TextDrawHideForPlayer(playerid,specweps1);
	//TextDrawHideForPlayer(playerid,specweps2);
	//TextDrawHideForPlayer(playerid,specweps4);
	//TextDrawHideForPlayer(playerid,specweps5[playerid]);
	//TextDrawHideForPlayer(playerid,specfps[playerid]);
	//TextDrawHideForPlayer(playerid,specweps5[Player[playerid][gSpectateID]]);
	//TextDrawHideForPlayer(playerid,specfps[Player[playerid][gSpectateID]]);

//	HideAllSpecTextdrawsForPlayer(playerid);

//	Player[playerid][Specing] = false;
	TogglePlayerSpectating(playerid, 0);


	if(IsPlayerInAnyVehicle(Player[playerid][gSpectateID])) {
		HideVehicleHud(playerid, GetPlayerVehicleID(Player[playerid][gSpectateID]));
	}

	Player[playerid][gSpectateID] = INVALID_PLAYER_ID;
	Player[playerid][gSpectateType] = SPECTATE_TYPE_NONE;
	Player[playerid][Specing] = false;

	SetPlayerInterior(playerid,Config[LobbyInterior]);
	SetPlayerPos(playerid,Lobby[0]+2-random(2),Lobby[1]+2-random(2),Lobby[2]+2);

	new specyou_text[256], specyou_text2[256], specingP[MAX_PLAYERS];
	format(specyou_text, 256, "~y~~b~Spectating You~w~");

	specyou_text2 = " ";
	for (new x = 0; x <= Server[HighestID]; x++) // foreach player...
	{
	    if(IsPlayerConnected(x) && GetPlayerState(x) == PLAYER_STATE_SPECTATING && Player[x][gSpectateID] == specid)
	    {
			specingP[specid] ++;
			format(specyou_text2, 256, "%s~n~ - %s", specyou_text2, PlayerName(x));
		}
	}

	format(specyou_text, 256, "%s%s", specyou_text, specyou_text2);
	TextDrawSetString(specingYou[specid], specyou_text);

	if (specingP[specid] > 0) {
		TextDrawShowForPlayer(specid, specingYou[specid]);
	} else {
		TextDrawSetString(specingYou[specid], " ");
		TextDrawHideForPlayer(specid, specingYou[specid]);
	}

	return 1;
}
*/

stock ConnectedPlayers()
{
	new count;
	for(new x=0; x<Server[HighestID]+1; x++) {
	    if(IsPlayerConnected(x)) {
			count++;
		}
	}
	return count;
}

stock GetPlayerID(name[])
{
    for(new i = 0; i <= Server[HighestID]; i++)
    {
        if(IsPlayerConnected(i))
        {
            if(strfind(PlayerName(i),name,true) != -1)
            {
                return i;
            }
		}
    }
    return INVALID_PLAYER_ID;
}

/*
CheckHighestServerID()
{
	new highest = -1;
	for(new i = MAX_PLAYERS; i >= 0; i--)
	{
		if(IsPlayerConnected(i))
		{
			highest = i; break;
		}
	}
	return highest;
}
*/

// === > Text Draws stocks < ===
/*ShowLobbyTextDrawsForPlayer(playerid)
{
	Player[playerid][Lobbytextdraws] = true;
	if((Config[LobbyTD] == 1) && (!Player[playerid][inCmdIntro])) {
		//TextDrawShowForPlayer(playerid, gamemsg_lobby);
		//TextDrawShowForPlayer(playerid, Link2);
		TextDrawShowForPlayer(playerid, health_plus);
		//TextDrawShowForPlayer(playerid, lobbybg1);
	}
}*/


HideLobbyTextDrawsForPlayer(playerid)
{
	Player[playerid][Lobbytextdraws] = false;
	TextDrawHideForPlayer(playerid, gamemsg_lobby);
	TextDrawHideForPlayer(playerid, Link2);
	TextDrawHideForPlayer(playerid, health_plus);
	TextDrawHideForPlayer(playerid, FPS[playerid]);
}


HideLobbyTextDraws()
{
	for(new i = 0; i <= Server[HighestID]; i ++)
	{
	    if(IsPlayerConnected(i))
		{
			Player[i][Lobbytextdraws] = false;
		}
	}

	TextDrawHideForAll(gamemsg_lobby);
	TextDrawHideForAll(Link2);
	TextDrawHideForAll(lobbybg1);
}

HideRoundTextDraws()
{
	for(new i = 0; i <= Server[HighestID]; i ++)
	{
	    if(IsPlayerConnected(i))
		{
			Player[i][Roundtextdraws] = false;
		}
	}

	if(Server[MainTextdrawLayout] == 1)
	{
		TextDrawHideForAll(gamemsg_baseupdatehome);
 		TextDrawHideForAll(gamemsg_baseupdateaway);
	}
	else
	{
		TextDrawHideForAll(hud1);
		TextDrawHideForAll(hud2);
		TextDrawHideForAll(hud3);
		TextDrawHideForAll(hud4);
		TextDrawHideForAll(awayhud);
		TextDrawHideForAll(homehud);
	}
	TextDrawHideForAll(TimerClock);
	TextDrawHideForAll(gamemsg_cp);
}

ShowRoundTextDraws()
{
	if(Server[MainTextdrawLayout] == 1)
	{
 		TextDrawColor(gamemsg_baseupdatehome,GetTeamColor(1, T_HOME) | 0x000000FF);
		TextDrawColor(gamemsg_baseupdateaway,GetTeamColor(1, T_AWAY) | 0x000000FF);
	}
	else
	{
		TextDrawColor(homehud,GetTeamColor(1, T_HOME) | 0x000000FF);
		TextDrawColor(awayhud,GetTeamColor(1, T_AWAY) | 0x000000FF);
	}

	for(new i = 0; i <= Server[HighestID]; i ++)
	{
	    if(IsPlayerConnected(i) && Player[i][pSpawned])
		{
			Player[i][Roundtextdraws] =true;

			if(Server[MainTextdrawLayout] == 1)
			{
				TextDrawShowForPlayer(i, gamemsg_baseupdatehome);
   				TextDrawShowForPlayer(i, gamemsg_baseupdateaway);
			}
			else
			{
				TextDrawShowForPlayer(i, hud1);
				TextDrawShowForPlayer(i, hud2);
				TextDrawShowForPlayer(i, hud3);
				TextDrawShowForPlayer(i, hud4);
				TextDrawShowForPlayer(i, homehud);
				TextDrawShowForPlayer(i, awayhud);
				TextDrawShowForPlayer(i, health_plus);
			}
		}
	}
}

HideRoundTextDrawsForPlayer(playerid)
{
	Player[playerid][Roundtextdraws] =false;
	if(Server[MainTextdrawLayout] == 1)
	{
		TextDrawHideForPlayer(playerid, gamemsg_baseupdatehome);
		TextDrawHideForPlayer(playerid, gamemsg_baseupdateaway);
	}
	else
	{
		TextDrawHideForPlayer(playerid, hud1);
		TextDrawHideForPlayer(playerid, hud2);
		TextDrawHideForPlayer(playerid, hud3);
		TextDrawHideForPlayer(playerid, hud4);
		TextDrawHideForPlayer(playerid, homehud);
		TextDrawHideForPlayer(playerid, awayhud);
		TextDrawHideForPlayer(playerid, health_plus);
	}
	TextDrawHideForPlayer(playerid, TimerClock);
}

ShowRoundTextDrawsForPlayer(playerid)
{
	Player[playerid][Roundtextdraws] =true;
	if(Server[MainTextdrawLayout] == 1)
	{
		TextDrawShowForPlayer(playerid, gamemsg_baseupdatehome);
		TextDrawShowForPlayer(playerid, gamemsg_baseupdateaway);
	}
	else
	{
		TextDrawShowForPlayer(playerid, hud1);
		TextDrawShowForPlayer(playerid, hud2);
		TextDrawShowForPlayer(playerid, hud3);
		TextDrawShowForPlayer(playerid, hud4);
		TextDrawShowForPlayer(playerid, homehud);
		TextDrawShowForPlayer(playerid, awayhud);
		TextDrawShowForPlayer(playerid, health_plus);

	}
	TextDrawShowForPlayer(playerid, TimerClock);
}

forward ShowRegularTextDrawsForPlayer(playerid);
public ShowRegularTextDrawsForPlayer(playerid) {
    TextDrawShowForPlayer(playerid, MapNameTD);
	TextDrawShowForPlayer(playerid, ScoreboardHome);
	TextDrawShowForPlayer(playerid, ScoreboardAway);
	TextDrawShowForPlayer(playerid, fps_text[playerid]);
	TextDrawShowForPlayer(playerid, FPS[playerid]);
	TextDrawShowForPlayer(playerid, health_plus);
	
	return 1;
}


stock CheckStoredVariables(playerid)
{
	new string[256];
	for(new i = 0; i < SAVE_SLOTS; i ++)
	{
	    if(isStringSame(SaveVariables[i][pName], PlayerName(playerid), 24))
	    {
	        SetPlayerPos(playerid, SaveVariables[i][pCoords][0],SaveVariables[i][pCoords][1],SaveVariables[i][pCoords][2]+2);
 			SetPlayerFacingAngle(playerid, SaveVariables[i][pCoords][3]);
			SetPlayerInterior(playerid, SaveVariables[i][pInterior]);
			SetPlayerVirtualWorld2(playerid, SaveVariables[i][pVWorld]);
			SetPlayerSkin(playerid, SaveVariables[i][pSkin]);
			SetPlayerHealth(playerid,SaveVariables[i][pHealth]);
			SetPlayerArmour(playerid,SaveVariables[i][pArmour]);

	        Player[playerid][pTeam] = SaveVariables[i][pTeam];

       		Player[playerid][setToPlay] = true;
  		   	SetPlayerColor(playerid,GetTeamColor(1, SaveVariables[i][pTeam])  | 0x000000FF);

			Player[playerid][pPlaying] = true;
			Player[playerid][Status] = STATUS_PLAYING;
			if(Round[Gamemode] == BASE)
			{
				SetPlayerCheckpoint(playerid,Checkpoint[0],Checkpoint[1],Checkpoint[2],Config[cp_size]);
			}

	    	for(new slots = 0; slots < 13; slots++)
			{
			    if(SaveVariables[i][pWeapons][slots] > 0)
			    {
					GivePlayerWeaponEx(playerid,SaveVariables[i][pWeapons][slots],SaveVariables[i][pAmmo][slots]);
				}
			}

	        SaveVariables[i][pCoords][0] = 0.0;
			SaveVariables[i][pCoords][1] = 0.0;
			SaveVariables[i][pCoords][2] = 0.0;
			SaveVariables[i][pCoords][3] = 0.0;

			format(SaveVariables[i][pName], 24," ");

			SaveVariables[i][pHealth] = 0.0;
			SaveVariables[i][pHealth] = 0.0;
			SaveVariables[i][pInterior] = 0;
			SaveVariables[i][pVWorld] = 0;

	        SaveVariables[i][pTeam] = Player[i][pTeam];

	    	for(new slots = 0; slots < 13; slots++)
			{
				SaveVariables[i][pWeapons][slots] = 0;
				SaveVariables[i][pAmmo][slots] = 0;
			}


	        format(string,256,"** %s ���� ��⿡ �������׽��ϴ�.", PlayerName(playerid));
	    	SendClientMessageToAllEx(COLOR_ORANGE, string);
	        return 0;
	    }
	}

	return 1;
}


stock ClearPlayerVariables()
{
	for(new i = 0; i < SAVE_SLOTS; i ++)
	{
        SaveVariables[i][pCoords][0] = 0.0;
		SaveVariables[i][pCoords][1] = 0.0;
		SaveVariables[i][pCoords][2] = 0.0;
		SaveVariables[i][pCoords][3] = 0.0;

		SaveVariables[i][pInterior] = 0;
		SaveVariables[i][pVWorld] = 0;
		SaveVariables[i][pSkin] = 0;
		format(SaveVariables[i][pName], 24," ");

		SaveVariables[i][pHealth] = 0.0;
		SaveVariables[i][pHealth] = 0.0;

        SaveVariables[i][pTeam] = Player[i][pTeam];

    	for(new slots = 0; slots < 13; slots++)
		{
			SaveVariables[i][pWeapons][slots] = 0;
			SaveVariables[i][pAmmo][slots] = 0;
		}
	}
}

stock BeyondDiscon_Clear()
{
	// MAX_PLAYERS is actually MAX_SLOTS for this
	for(new i = 0; i < MAX_PLAYERS; i ++)
	{
	    if(strlen(BeyondDiscon[i][pName]) < 3)
	    {
			format(BeyondDiscon[i][pName], 30," ");
			BeyondDiscon[i][pKills] = 0;
			BeyondDiscon[i][pDeaths] = 0;
			BeyondDiscon[i][pRoundKills] = 0;
			BeyondDiscon[i][pRoundDeaths] = 0;
			BeyondDiscon[i][pTeam] = 0;
			BeyondDiscon[i][pCurrDmg] = 9999;
	        continue;
	    }
	}
    //else do something else?
	return 1;
}

stock BeyondDiscon_Load(playerid, slot)
{
	PlayerMatchInfo[playerid][TotalKills] = BeyondDiscon[slot][pKills];
	PlayerMatchInfo[playerid][TotalDeaths] = BeyondDiscon[slot][pDeaths];
	PlayerMatchInfo[playerid][RoundKills] = BeyondDiscon[slot][pRoundKills];
	PlayerMatchInfo[playerid][RoundDeaths] = BeyondDiscon[slot][pRoundDeaths];
	#if SAMP_VERSION == 2
    Player[playerid][Damage] = BeyondDiscon[slot][pCurrDmg];
	#else
	Player[playerid][RoundScore] = BeyondDiscon[playerid][pCurrDmg];
	#endif
	format(BeyondDiscon[slot][pName], 30," ");
	BeyondDiscon[slot][pKills] = 0;
	BeyondDiscon[slot][pDeaths] = 0;
	BeyondDiscon[slot][pRoundKills] = 0;
	BeyondDiscon[slot][pRoundDeaths] = 0;
	BeyondDiscon[slot][pTeam] = 0;
	BeyondDiscon[slot][pCurrDmg] = 9999;
}

stock BeyondDiscon_Save(playerid)
{
	// MAX_PLAYERS is actually MAX_SLOTS for this
	for(new i = 0; i < MAX_PLAYERS; i ++)
	{
	    if(strlen(BeyondDiscon[i][pName]) < 3)
	    {
			format(BeyondDiscon[i][pName], 30, RemoveClanTagFromName(playerid));
			BeyondDiscon[i][pKills] = PlayerMatchInfo[playerid][TotalKills];
			BeyondDiscon[i][pDeaths] = PlayerMatchInfo[playerid][TotalDeaths];
			BeyondDiscon[i][pRoundKills] = PlayerMatchInfo[playerid][RoundKills];
			BeyondDiscon[i][pRoundDeaths] = PlayerMatchInfo[playerid][RoundDeaths];
			BeyondDiscon[i][pTeam] = Player[playerid][pTeam];
			#if SAMP_VERSION == 2
			BeyondDiscon[i][pCurrDmg] = Player[playerid][Damage];
			#else
			BeyondDiscon[i][pCurrDmg] = Player[playerid][RoundScore];
			#endif
	        return 0;
	    }
	}
    //else do something else?
	return 1;
}

stock StorePlayerVariables(playerid)
{
	new string[256];
	for(new i = 0; i < SAVE_SLOTS; i ++)
	{
	    if(strlen(SaveVariables[i][pName]) < 3)
	    {
			if (Round[LoadScreen] == true) {
			    if (Player[playerid][pTeam] == T_HOME) {
					GetPlayerPos(playerid, HomeSpawn[0],HomeSpawn[1],HomeSpawn[2]);
			    } else if (Player[playerid][pTeam] == T_AWAY) {
					GetPlayerPos(playerid, AwaySpawn[0],AwaySpawn[1],AwaySpawn[2]);
			    }
			} else {
	        	GetPlayerPos(playerid, SaveVariables[i][pCoords][0],SaveVariables[i][pCoords][1],SaveVariables[i][pCoords][2]);
			}
 			GetPlayerFacingAngle(playerid, SaveVariables[i][pCoords][3]);

			format(SaveVariables[i][pName], 24, PlayerRootNames[playerid]);

			GetPlayerHealth(playerid,SaveVariables[i][pHealth]);
			GetPlayerArmour(playerid,SaveVariables[i][pArmour]);

	        SaveVariables[i][pTeam] = Player[playerid][pTeam];

	        SaveVariables[i][pClass] = Player[playerid][pClass];

	        SaveVariables[i][pInterior] = GetPlayerInterior(playerid);
			SaveVariables[i][pSkin] = GetPlayerSkin(playerid);

	        SaveVariables[i][pVWorld] = GetPlayerVirtualWorld(playerid);

			SaveVariables[i][SvScore] = Player[playerid][pScore];
			SaveVariables[i][SvTotalKills] = PlayerMatchInfo[playerid][TotalKills];
			SaveVariables[i][SvTotalDeaths] = PlayerMatchInfo[playerid][TotalDeaths];
			SaveVariables[i][RoundLoad] = Round[LoadScreen];

			for(new slots = 0; slots < 13; slots++)
			{
				GetPlayerWeaponData(playerid,slots,SaveVariables[i][pWeapons][slots],SaveVariables[i][pAmmo][slots]);
			}

	        format(string,256,"** %s ���� ������ ���������� ����Ǿ����ϴ�, ��⿡ �� ������ �� �ֽ��ϴ�.", PlayerName(playerid));
	    	SendClientMessageToAllEx(COLOR_GREY, string);
	    	
	    	FixTeamWeapons(playerid);
			//printf(string);
	        break;
	    }
	}
    //format(string,256,"** Failed to save player %s variables.", PlayerName(playerid));
	//SendClientMessageToAllEx(COLOR_GREY, string);
	//return 1;
}

stock adminspec_strtok(const string[], &index)
{
	new length = strlen(string);
	while ((index < length) && (string[index] <= ' '))
	{
		index++;
	}

	new offset = index;
	new result[20];
	while ((index < length) && (string[index] > ' ') && ((index - offset) < (sizeof(result) - 1)))
	{
		result[index - offset] = string[index];
		index++;
	}
	result[index - offset] = EOS;
	return result;
}

GetGamemodeName(gm)
{
	new tmp[256];
	if(gm == 1)
	    tmp = "Base";

	else if(gm == 2)
	{
	    if(Round[Gameplay] == WAR_ZONE)
	 	  	tmp = "TDM - War Zone";
		else if(Round[Gameplay] == RUMBLE)
		    tmp = "TDM - Rumble";
		else
			tmp = "TDM - Stealth & Survive";
	}
	return tmp;
}

GetWinnerReason(wintype)
{
	new tmp[256];
	if(wintype == ELIMINATION)
	    tmp = "Elimination";

	else if(wintype == CHECKPOINT)
	    tmp = "Attackers Captured CP";

	else if(wintype == TIME_LIMIT)
	    tmp = "Defenders Held Base";

	return tmp;
}


stock CheckDeath(id)
{
	new tmp[256];
	if(PlayerMatchInfo[id][Died] == true)
	   format(tmp,256,"YES || %s", KillerInfo[id]);

	else if(PlayerMatchInfo[id][Died] == false)
	    tmp = "NO";

	return tmp;
}

forward EndRound();
public EndRound()
{
	new hour,minute,second;
	new year, month,day;
	gettime(hour, minute, second);
	getdate(year, month, day);

	new string[256];
	//debugfname[200];

	//format(debugfname, sizeof(debugfname), "combinations/endround_debug/%d-%d-%d_%d-%d-%d.txt", day, month, year, hour, minute, second);
	//new File:debugfile = fopen(debugfname,io_write);

	//debugfile = fopen(debugfname,io_append);
	//fwrite(debugfile, "000000001\r\n");
	//fclose(debugfile);

	new Float:HomeRatio;
	if(TeamInfo[T_HOME][RoundDeaths] == 0)
	{
	    HomeRatio = float(TeamInfo[T_HOME][RoundKills]);
	}
	else if(TeamInfo[T_HOME][RoundKills] == 0)
	{
 		HomeRatio = -float(TeamInfo[T_HOME][RoundDeaths]);
 	}
	else
	{
 		HomeRatio = float(TeamInfo[T_HOME][RoundKills]) / float(TeamInfo[T_HOME][RoundDeaths]);
	}

	//debugfile = fopen(debugfname,io_append);
    //fwrite(debugfile, "000000002\r\n");
	//fclose(debugfile);

	new Float:AwayRatio;

	if(TeamInfo[T_AWAY][RoundDeaths] == 0)
	{
	    AwayRatio = float(TeamInfo[T_AWAY][RoundKills]);
	}
	else if(TeamInfo[T_AWAY][RoundKills] == 0)
	{
 		AwayRatio = -float(TeamInfo[T_AWAY][RoundDeaths]);
 	}
	else
	{
 		AwayRatio = float(TeamInfo[T_AWAY][RoundKills]) / float(TeamInfo[T_AWAY][RoundDeaths]);
	}

	//debugfile = fopen(debugfname,io_append);
    //fwrite(debugfile, "000000003\r\n");
	//fclose(debugfile);

	#if LOG_SYSTEM == 1
	format(string,256,"Round Ended - %s ID %d", GetGamemodeName(Round[Gamemode]), Round[Current]);
	WriteLog("rounds", string);
	//debugfile = fopen(debugfname,io_append);
	//fwrite(debugfile, "000000004\r\n");
	//fclose(debugfile);
	#endif

	DestroyPickups();
	//debugfile = fopen(debugfname,io_append);
	//fwrite(debugfile, "000000005\r\n");
	//fclose(debugfile);
	DestroyMenus();
	//debugfile = fopen(debugfname,io_append);
	//fwrite(debugfile, "000000006\r\n");
	//fclose(debugfile);
	Round[LoadScreen] = false;

	if(Round[Gamemode] == TDM) {
		GangZoneHideForAll(Round[TDMGangZone]);
		GangZoneDestroy(Round[TDMGangZone]);
		//debugfile = fopen(debugfname,io_append);
		//fwrite(debugfile, "000000007\r\n");
		//fclose(debugfile);
	}

	SendRconCommand("mapname Lobby");
	ClearRoundVehicles();
	//debugfile = fopen(debugfname,io_append);
	//fwrite(debugfile, "000000008\r\n");
	//fclose(debugfile);
	#if DEBUG == 0
		#if defined BETA
			format(string, sizeof(string), "%s v%d.%d.%d [BETA %d]", SMALL_GM_NAME, VER_MAJOR, VER_MINOR, VER_REVISION, BETA);
	    #else
			format(string, sizeof(string), "%s v%d.%d.%d", SMALL_GM_NAME, VER_MAJOR, VER_MINOR, VER_REVISION);
		#endif
	#else
		#if defined BETA
			format(string, sizeof(string), "~%s v%d.%d.%d [BETA %d]", SMALL_GM_NAME, VER_MAJOR, VER_MINOR, VER_REVISION, BETA);
	    #else
			format(string, sizeof(string), "~%s v%d.%d.%d", SMALL_GM_NAME, VER_MAJOR, VER_MINOR, VER_REVISION);
		#endif
	#endif

	SetGameModeText(string);

	//Make sure the gamemode text is actually set incase of lag or something
	SetTimer("GameModeTextNormal",1100,false);
	//debugfile = fopen(debugfname,io_append);
	//fwrite(debugfile, "000000009\r\n");
	//fclose(debugfile);

	//Make sure everyones color, name tag, and marker is set right
	SetTimer("CleanUpTagsMarkers",1200,false);
	//debugfile = fopen(debugfname,io_append);
	//fwrite(debugfile, "000000010\r\n");
	//fclose(debugfile);

	//Make sure all player huds are gone
	SetTimer("CleanUpPlayerHUDs",1300,false);
	//debugfile = fopen(debugfname,io_append);
	//fwrite(debugfile, "000000011\r\n");
	//fclose(debugfile);

	Server[CantSpawnVehicle] = false;

	HideRoundTextDraws();

	Round[AdminCanEnd] = false;

	Round[started_home] = 0;
	Round[started_away] = 0;

	for(new i = 0; i < 47; i ++)
	{
		if(IsValidWeaponID(i))
		{
			WeaponLimit[i][home_used] = 0;
			WeaponLimit[i][away_used] = 0;
		}
	}

	//debugfile = fopen(debugfname,io_append);
	//fwrite(debugfile, "000000012\r\n");
	//fclose(debugfile);

   	new topscore=0;
	new topshotta=INVALID_PLAYER_ID;

	new tempgm = Round[Gamemode];
	new tempatt = Round[Attackers];
	new invertstring[128];
	if(Round[Gamemode] == BASE)
	{
	    Delete3DTextLabel(Round[CPLabel]);

	    if (Config[autoinvert] == 1 && Round[AdminEnded] == false) {
			if(Round[Attackers] == T_AWAY)
			{
				format(invertstring,128,"** �ڵ����� ���� �ݴ�� ����Ǿ����ϴ�. - %s ��� | %s ����", AwayName, HomeName);
				Round[Attackers] = T_HOME;
				HomeStatus = "Attack";
				AwayStatus = "Defend";
			}
			else if(Round[Attackers] == T_HOME)
			{
				format(invertstring,128,"** �ڵ����� ���� �ݴ�� ����Ǿ����ϴ�. - %s ���� | %s ���", AwayName, HomeName);
				Round[Attackers] = T_AWAY;
		 		AwayStatus = "Attack";
				HomeStatus = "Defend";
			}
		}
		if(Round[WinnerTeam] != T_NON)
		{
	  	  	if(Round[WinnerTeam] == Round[Attackers])
		    {
				BaseVariables[Round[Current]][AttWins] ++;
			}
			else
			{
				BaseVariables[Round[Current]][DefWins] ++;
			}
			//debugfile = fopen(debugfname,io_append);
			//fwrite(debugfile, "000000013\r\n");
			//fclose(debugfile);
			#if DATA_SYSTEM == 1
				new fbase[256];
				fbase = Basefile(Round[Current]);
				dini_IntSet(fbase,"attwins",BaseVariables[Round[Current]][AttWins]);
		 		dini_IntSet(fbase,"defwins",BaseVariables[Round[Current]][DefWins]);
			#elseif DATA_SYSTEM == 2
				UpdateSqlBaseInt(Round[Current], "attwins", BaseVariables[Round[Current]][AttWins]);
				UpdateSqlBaseInt(Round[Current], "defwins", BaseVariables[Round[Current]][DefWins]);
			#endif
			//debugfile = fopen(debugfname,io_append);
			//fwrite(debugfile, "000000014\r\n");
			//fclose(debugfile);
		}
	}

	Round[Gamemode] = 0;
	ClearPlayerVariables();
	Round[Paused] = 0;
	SetWeather(Config[weather]);
	SetWorldTime(Config[thetime]);
	Round[Current] = -1;
	Round[Voting] = false;
	KillTimer(BaseTimer);
	KillTimer(TDMTimer);
	KillTimer(MarkerTimer);
	KillTimer(NametagTimer);
	KillTimer(HUDUpdateTimer);

	MinX = -9999.0;
	MinY = -9999.0;
	MaxX = 9999.0;
	MaxY = 9999.0;

	TextDrawBoxColor(ts_awaybg, GetTeamColor(1, T_AWAY) | 0x00000033);
	TextDrawBoxColor(ts_homebg, GetTeamColor(1, T_HOME) | 0x00000033);

	TextDrawColor(ts_homename, GetTeamColor(0, T_HOME) | 0x000000FF);
	TextDrawColor(ts_awayname, GetTeamColor(0, T_AWAY) | 0x000000FF);

	TextDrawSetString(ts_homename, HomeName);
	TextDrawSetString(ts_awayname, AwayName);

   	format(grey,sizeof(grey)," ");
   	format(red,sizeof(red)," ");

	Round[home_list] = 0;
	Round[away_list] = 0;

	//debugfile = fopen(debugfname,io_append);
	//fwrite(debugfile, "000000015\r\n");
	//fclose(debugfile);

	for(new i; i <= Server[HighestID]; i++)
	{
		if(IsPlayerConnected(i))
		{
			if(Player[i][Specing] == true)
			{
			    //print("test 1");
		    	StopSpectate(i);
			    ///print("test 2");
			}
			else if(Player[i][SpecingBase] == true)
			{
			    Player[i][SpecingBase] = false;
				SpawnPlayerEx(i);
			}

            //DeletePlayer3DTextLabel(i, Player[i][CPLabel]);

			Player[i][PrimaryWep] = 0;
			Player[i][PrimaryWepAmmo] = 0;
			Player[i][SecondaryWep] = 0;
			Player[i][SecondaryWepAmmo] = 0;
  			Player[i][TerciaryWep] = 0;
 			Player[i][TerciaryWepAmmo] = 0;
			Player[i][SpecialWep] = 0;
			Player[i][SpecialWepAmmo] = 0;

			TextDrawHideForPlayer(i, text_redflash);
			SetPlayerWorldBoundsEx(i,9999.9,-9999.9,9999.9,-9999.9);
			SetPlayerName(i, PlayerSavedNames[i]);
			Player[i][NamePrefix] = 4;
			SetPlayerScore(i, Player[i][pScore]);
			RemovePlayerMapIcon(i, 0);
			RemovePlayerMapIcon(i, 1);
		    AttackerVehicle[i][hasSpawned] = false;

			SetPlayerVirtualWorld2(i, LOBBY_VW);//

			//if(PlayerMatchInfo[i][StartedPlaying])
			//{
			
			#if SAMP_VERSION == 2
			if(Player[i][Damage]>0)
			{
				if(Player[i][Damage]>topscore)
				{
		    	    topscore=Player[i][Damage];
		    	    topshotta=i;
				}
			}
			//
			#else
			Player[i][Damage] = Player[i][RoundScore];
			#endif
			if(Player[i][pTeam] == T_HOME)
			{
			   	Round[home_list]++;
			   	if (Round[home_list] < 16) {
	   				format(grey,sizeof(grey),"%s~n~%s: ~r~%d~w~",grey, RemoveClanTagFromName(i), Player[i][Damage]);
	   		//		format(grey,sizeof(grey),"%s~n~%s:~n~Dmg: %d - Kills: %d",grey, PlayerName2(i), Player[i][PossibleDamage], Player[i][RoundScore]);
				}
				if(Round[WinnerTeam] == T_HOME) PlayerPlaySound(i, 37453, 0, 0, 0);
				else PlayerPlaySound(i, 31202, 0, 0, 0);
			}
			if(Player[i][pTeam] == T_AWAY)
			{
			   	Round[away_list]++;
			   	if (Round[away_list] < 16) {
	   				format(red,sizeof(red),"%s~n~%s: ~r~%d~w~",red, RemoveClanTagFromName(i), Player[i][Damage]);
	   		//		format(red,sizeof(grey),"%s~n~%s:~n~Dmg: %d - Kills: %d",red, PlayerName2(i), Player[i][PossibleDamage], Player[i][RoundScore]);

				}
				if(Round[WinnerTeam] == T_AWAY) PlayerPlaySound(i, 37453, 0, 0, 0);
				else PlayerPlaySound(i, 31202, 0, 0, 0);
			}
			//}

		    if(Player[i][pPlaying] == true)
			{
	   			Player[i][pPlaying] = false;
	   			CallRemoteFunction("DC_PlayerLeftRound", "d", i);
				ResetPlayerWeapons(i);
				SetPlayerHealth(i,100.0);
				SpawnPlayerEx(i);
			}
			Player[i][Damage] = 0;
		}
	}
	
	for(new i=0; i < MAX_PLAYERS; ++i) {
        if(strlen(BeyondDiscon[i][pName]) < 3) continue;
        if(BeyondDiscon[i][pCurrDmg] == 9999) continue;

        if(BeyondDiscon[i][pTeam] == T_HOME) {
            Round[home_list]++;
            if(Round[home_list] < 16) {
                format(grey, sizeof(grey), "%s~n~%s: ~r~%d~w~", grey, BeyondDiscon[i][pName], BeyondDiscon[i][pCurrDmg]);
            }
        }
        else if(BeyondDiscon[i][pTeam] == T_AWAY) {
            Round[away_list]++;
			if(Round[away_list] < 16) {
			    format(red, sizeof(red), "%s~n~%s: ~r~%d~w~", red, BeyondDiscon[i][pName], BeyondDiscon[i][pCurrDmg]);
			}
		}
		BeyondDiscon[i][pCurrDmg] = 9999;
	}
        
	
	//debugfile = fopen(debugfname,io_append);
	//fwrite(debugfile, "000000016\r\n");
	//fclose(debugfile);

	TextDrawSetString(ts_homescore, grey);
	TextDrawSetString(ts_awayscore, red);
	
	
	#if SAMP_VERSION == 2

	//debugfile = fopen(debugfname,io_append);
	//fwrite(debugfile, "000000017\r\n");
	//fclose(debugfile);

	if(IsPlayerConnected(topshotta)) {
		format(string,256,"~y~Top Shooter: ~n~~r~%s: %d Damage",RemoveClanTagFromName(topshotta),topscore);
		TextDrawSetString(topshooter, string);
	} else {
		TextDrawSetString(topshooter, "~y~ Top Shooter ~n~~r~No One!");
	}
	#else
	for(new i=0;i<Server[HighestID]+1;i++)
	{
		if(IsPlayerConnected(i))
		{
			if(Player[i][RoundScore]>0)
			{
				if(Player[i][RoundScore]>topscore)
				{
		    	    topscore=Player[i][RoundScore];
		    	    topshotta=i;
				}
			}
		}
	}

	//debugfile = fopen(debugfname,io_append);
	//fwrite(debugfile, "000000017\r\n");
	//fclose(debugfile);

	if(IsPlayerConnected(topshotta)) {
		format(string,256,"~y~Top Shooter: ~n~~r~%s: %d Kills",RemoveClanTagFromName(topshotta),topscore);
		TextDrawSetString(topshooter, string);
	} else {
		TextDrawSetString(topshooter, "~y~ Top Shooter ~n~~r~No One!");
	}
	#endif
			
			
 	if((Round[Gameplay] == WAR_ZONE || Round[Gameplay] == RUMBLE) && tempgm == TDM)
	{
		if(Round[WinnerTeam] == T_AWAY)
		{ //Away win
			Server[PartialRounds] ++;
			format(string, sizeof(string), "��� ����: %s �¸� | %s: %d - %s: %d", AwayName, AwayName, TeamInfo[T_AWAY][RoundKills], HomeName,TeamInfo[T_HOME][RoundKills]);
			SendClientMessageToAllEx(COLOR_ORANGE, string);
		  	format(string,256,">> %s: %s | ų: %d ����: %d | ����: '%.2f'",AwayName,AwayStatus, TeamInfo[T_AWAY][RoundKills], TeamInfo[T_AWAY][RoundDeaths], AwayRatio);
			SendClientMessageToAllEx(GetTeamColor(1, T_AWAY), string);
		   	format(string,256,">> %s: %s | ų: %d ����: %d | ����: '%.2f'",HomeName,HomeStatus, TeamInfo[T_HOME][RoundKills], TeamInfo[T_HOME][RoundDeaths], HomeRatio);
			SendClientMessageToAllEx(GetTeamColor(1, T_HOME), string);

            #if IRC == 1
			format(string, sizeof(string), "7Round Over: 3%s7 Wins | %s: %d - %s: %d", AwayName, AwayName, TeamInfo[T_AWAY][RoundKills], HomeName,TeamInfo[T_HOME][RoundKills]);
		    CallRemoteFunction("DC_IRCForceSay", "s", string);
			#endif
			MatchInfo[AwayRoundsWon] ++;
			format(string,256,"%s ~w~Wins!",AwayName);
			TextDrawSetString(gamemsg_whowon, string);

	 		for(new i; i <= Server[HighestID]; i++)
			{
				if(IsPlayerConnected(i))
				{

		   			#if SAMP_VERSION == 2
						if (ConfigAudio[sndVoiceMsgs] == true) {
							PlayAudioStreamForPlayerExEx(i, "http://translate.google.com/translate_tts?q=The round has ended");
						}
					#endif
					
					TimeTextForPlayer(i,ts_topbar,7000);
	   				TimeTextForPlayer(i,ts_bottombar,7000);
	    			TimeTextForPlayer(i,ts_centralbg,7000);
	        		TimeTextForPlayer(i,topshooter,7000);
	       			TimeTextForPlayer(i,gamemsg_whowon,7000);
    				TimeTextForPlayer(i,ts_lefttopbar,7000);
				    TimeTextForPlayer(i,ts_righttopbar,7000);
				    TimeTextForPlayer(i,ts_awaybg,7000);
				    TimeTextForPlayer(i,ts_homebg,7000);
				    TimeTextForPlayer(i,ts_homename,7000);
				    TimeTextForPlayer(i,ts_awayname,7000);
				    TimeTextForPlayer(i,ts_awayscore,7000);
				    TimeTextForPlayer(i,ts_homescore,7000);
				    ClearDeathMessages();
				    SetTimer("ShowDeathMessages",7000,false);
				}
	 		}

			//debugfile = fopen(debugfname,io_append);
			//fwrite(debugfile, "000000018\r\n");
			//fclose(debugfile);
		}
		else if(Round[WinnerTeam] == T_HOME)
		{ //home win
			Server[PartialRounds] ++;
			format(string, sizeof(string), "��� ����: %s �¸� | %s: %d - %s: %d", HomeName, AwayName, TeamInfo[T_AWAY][RoundKills], HomeName,TeamInfo[T_HOME][RoundKills]);
			SendClientMessageToAllEx(COLOR_ORANGE, string);
		   	format(string,256,">> %s: %s | ų: %d ����: %d | ���� : %.2f",AwayName,AwayStatus, TeamInfo[T_AWAY][RoundKills], TeamInfo[T_AWAY][RoundDeaths], AwayRatio);
			SendClientMessageToAllEx(GetTeamColor(1, T_AWAY), string);
		   	format(string,256,">> %s: %s | ų: %d ����: %d | ����: %.2f",HomeName,HomeStatus, TeamInfo[T_HOME][RoundKills], TeamInfo[T_HOME][RoundDeaths], HomeRatio);
			SendClientMessageToAllEx(GetTeamColor(1, T_HOME), string);

            #if IRC == 1
			format(string, sizeof(string), "7Round Over: 2%s7 Wins | %s: %d - %s: %d", HomeName, AwayName, TeamInfo[T_AWAY][RoundKills], HomeName,TeamInfo[T_HOME][RoundKills]);
		    CallRemoteFunction("DC_IRCForceSay", "s", string);
			#endif

			MatchInfo[HomeRoundsWon] ++;
			format(string,256,"%s ~w~Wins!",HomeName);
			TextDrawSetString(gamemsg_whowon, string);

			//debugfile = fopen(debugfname,io_append);
			//fwrite(debugfile, "000000019\r\n");
			//fclose(debugfile);

	 		for(new i; i <= Server[HighestID]; i++)
			{
				if(IsPlayerConnected(i))
				{
					TimeTextForPlayer(i,ts_topbar,7000);
	   				TimeTextForPlayer(i,ts_bottombar,7000);
	    			TimeTextForPlayer(i,ts_centralbg,7000);
	        		TimeTextForPlayer(i,topshooter,7000);
	       			TimeTextForPlayer(i,gamemsg_whowon,7000);
    				TimeTextForPlayer(i,ts_lefttopbar,7000);
				    TimeTextForPlayer(i,ts_righttopbar,7000);
				    TimeTextForPlayer(i,ts_awaybg,7000);
				    TimeTextForPlayer(i,ts_homebg,7000);
				    TimeTextForPlayer(i,ts_homename,7000);
				    TimeTextForPlayer(i,ts_awayname,7000);
				    TimeTextForPlayer(i,ts_awayscore,7000);
				    TimeTextForPlayer(i,ts_homescore,7000);
				    ClearDeathMessages();
				    SetTimer("ShowDeathMessages",7000,false);
				}
	 		}

			//debugfile = fopen(debugfname,io_append);
			//fwrite(debugfile, "000000021\r\n");
			//fclose(debugfile);
 		}
		else if(Round[WinnerTeam] == T_NON)
		{ //Tie
			format(string, sizeof(string), "*** ��� ���� ***");
			SendClientMessageToAllEx(COLOR_ORANGE, string);
		   	format(string,256,">> %s: %s | ų: %d ����: %d | ����: %.2f",AwayName,AwayStatus, TeamInfo[T_AWAY][RoundKills], TeamInfo[T_AWAY][RoundDeaths], AwayRatio);
			SendClientMessageToAllEx(GetTeamColor(1, T_AWAY), string);
		   	format(string,256,">> %s: %s | ų: %d ����: %d | ����: %.2f",HomeName,HomeStatus, TeamInfo[T_HOME][RoundKills], TeamInfo[T_HOME][RoundDeaths], HomeRatio);
			SendClientMessageToAllEx(GetTeamColor(1, T_HOME), string);
		}

		//debugfile = fopen(debugfname,io_append);
		//fwrite(debugfile, "000000022\r\n");
		//fclose(debugfile);

		goto WriteResults;
  	}

	//debugfile = fopen(debugfname,io_append);
	//fwrite(debugfile, "000000023\r\n");
	//fclose(debugfile);

	if(Round[CapturedCheckpoint] == true)
	{ //Attackers win (hold the checkpoint)
		Server[PartialRounds] ++;
		if(tempatt == T_AWAY)
	    {
			format(string, sizeof(string), "*** ��� ����: %s �¸� -- ���� ���� ***",AwayName);
			SendClientMessageToAllEx(COLOR_ORANGE, string);
	    	format(string,256,">> %s: %s | ų: %d ����: %d | ����: '%.2f'",AwayName,AwayStatus, TeamInfo[T_AWAY][RoundKills], TeamInfo[T_AWAY][RoundDeaths], AwayRatio);
			SendClientMessageToAllEx(GetTeamColor(1, T_AWAY), string);
	    	format(string,256,">> %s: %s | ų: %d ����: %d | ����: '%.2f'",HomeName,HomeStatus, TeamInfo[T_HOME][RoundKills], TeamInfo[T_HOME][RoundDeaths], HomeRatio);
			SendClientMessageToAllEx(GetTeamColor(1, T_HOME), string);

            #if IRC == 1
			format(string, sizeof(string), "7Round Over: 3%s7 Won -- Captured the Checkpoint",AwayName);
		    CallRemoteFunction("DC_IRCForceSay", "s", string);
			#endif

			Round[CapturedCheckpoint] = false;
			MatchInfo[AwayRoundsWon] ++;
			format(string,256,"%s Wins!~n~~n~~r~Captured the Checkpoint",AwayName);
			TextDrawColor(gamemsg_whowon, GetTeamColor(1, T_AWAY) | 0x000000FF);
			TextDrawSetString(gamemsg_whowon, string);

	 		for(new i; i <= Server[HighestID]; i++)
			{
				if(IsPlayerConnected(i))
				{
					TimeTextForPlayer(i,ts_topbar,7000);
	   				TimeTextForPlayer(i,ts_bottombar,7000);
	    			TimeTextForPlayer(i,ts_centralbg,7000);
	        		TimeTextForPlayer(i,topshooter,7000);
	       			TimeTextForPlayer(i,gamemsg_whowon,7000);
    				TimeTextForPlayer(i,ts_lefttopbar,7000);
				    TimeTextForPlayer(i,ts_righttopbar,7000);
				    TimeTextForPlayer(i,ts_awaybg,7000);
				    TimeTextForPlayer(i,ts_homebg,7000);
				    TimeTextForPlayer(i,ts_homename,7000);
				    TimeTextForPlayer(i,ts_awayname,7000);
				    TimeTextForPlayer(i,ts_awayscore,7000);
				    TimeTextForPlayer(i,ts_homescore,7000);
				    ClearDeathMessages();
				    SetTimer("ShowDeathMessages",7000,false);
				}
	 		}

			//debugfile = fopen(debugfname,io_append);
			//fwrite(debugfile, "000000025\r\n");
			//fclose(debugfile);
		}
		else
		{
			format(string, sizeof(string), "*** ��� ����: %s �¸� -- ���� ���� ***",AwayName);
			SendClientMessageToAllEx(COLOR_ORANGE, string);
	    	format(string,256,">> %s: %s | ų: %d ����: %d | ����: '%.2f'",AwayName,AwayStatus, TeamInfo[T_AWAY][RoundKills], TeamInfo[T_AWAY][RoundDeaths], AwayRatio);
			SendClientMessageToAllEx(GetTeamColor(1, T_AWAY), string);
	    	format(string,256,">> %s: %s | ų: %d ����: %d | ����: '%.2f'",HomeName,HomeStatus, TeamInfo[T_HOME][RoundKills], TeamInfo[T_HOME][RoundDeaths], HomeRatio);
			SendClientMessageToAllEx(GetTeamColor(1, T_HOME), string);

            #if IRC == 1
			format(string, sizeof(string), "7Round Over: 2%s7 Won -- Captured the Checkpoint",HomeName);
		    CallRemoteFunction("DC_IRCForceSay", "s", string);
			#endif

			Round[CapturedCheckpoint] = false;
			MatchInfo[HomeRoundsWon] ++;
			format(string,256,"%s Wins!~n~~n~~r~Captured the Checkpoint",HomeName);
			TextDrawColor(gamemsg_whowon, GetTeamColor(1, T_HOME) | 0x000000FF);
			TextDrawSetString(gamemsg_whowon, string);

	 		for(new i; i <= Server[HighestID]; i++)
			{
				if(IsPlayerConnected(i))
				{
					TimeTextForPlayer(i,ts_topbar,7000);
	   				TimeTextForPlayer(i,ts_bottombar,7000);
	    			TimeTextForPlayer(i,ts_centralbg,7000);
	        		TimeTextForPlayer(i,topshooter,7000);
	       			TimeTextForPlayer(i,gamemsg_whowon,7000);
    				TimeTextForPlayer(i,ts_lefttopbar,7000);
				    TimeTextForPlayer(i,ts_righttopbar,7000);
				    TimeTextForPlayer(i,ts_awaybg,7000);
				    TimeTextForPlayer(i,ts_homebg,7000);
				    TimeTextForPlayer(i,ts_homename,7000);
				    TimeTextForPlayer(i,ts_awayname,7000);
				    TimeTextForPlayer(i,ts_awayscore,7000);
				    TimeTextForPlayer(i,ts_homescore,7000);
				    ClearDeathMessages();
				    SetTimer("ShowDeathMessages",7000,false);
				}
    		}

			//debugfile = fopen(debugfname,io_append);
			//fwrite(debugfile, "000000026\r\n");
			//fclose(debugfile);
		}
	} else if(Round[DefTimeLost] == true) {
		Server[PartialRounds] ++;
	    if(tempatt == T_AWAY)
	    {
		    Round[DefTimeLost] = false;
			format(string, sizeof(string), "*** ��� ����: %s �¸� -- ���� ���� ***",HomeName);
			SendClientMessageToAllEx(COLOR_ORANGE, string);
	    	format(string,256,">> %s: %s | ų: %d ����: %d | ����: '%.2f'",AwayName,AwayStatus, TeamInfo[T_AWAY][RoundKills], TeamInfo[T_AWAY][RoundDeaths], AwayRatio);
			SendClientMessageToAllEx(GetTeamColor(1, T_AWAY), string);
	    	format(string,256,">> %s: %s | ų: %d ����: %d | ����: '%.2f'",HomeName,HomeStatus, TeamInfo[T_HOME][RoundKills], TeamInfo[T_HOME][RoundDeaths], HomeRatio);
			SendClientMessageToAllEx(GetTeamColor(1, T_HOME), string);

            #if IRC == 1
			format(string, sizeof(string), "7Round Over: 3%s7 Won -- Time Limit Reached",HomeName);
		    CallRemoteFunction("DC_IRCForceSay", "s", string);
			#endif

			MatchInfo[HomeRoundsWon] ++;
			format(string,256,"%s Wins!~n~~n~~r~Time Limit Reached",HomeName);
			TextDrawColor(gamemsg_whowon, GetTeamColor(1, T_HOME) | 0x000000FF);
			TextDrawSetString(gamemsg_whowon, string);

	 		for(new i; i <= Server[HighestID]; i++)
			{
				if(IsPlayerConnected(i))
				{
					TimeTextForPlayer(i,ts_topbar,7000);
	   				TimeTextForPlayer(i,ts_bottombar,7000);
	    			TimeTextForPlayer(i,ts_centralbg,7000);
	        		TimeTextForPlayer(i,topshooter,7000);
	       			TimeTextForPlayer(i,gamemsg_whowon,7000);
    				TimeTextForPlayer(i,ts_lefttopbar,7000);
				    TimeTextForPlayer(i,ts_righttopbar,7000);
				    TimeTextForPlayer(i,ts_awaybg,7000);
				    TimeTextForPlayer(i,ts_homebg,7000);
				    TimeTextForPlayer(i,ts_homename,7000);
				    TimeTextForPlayer(i,ts_awayname,7000);
				    TimeTextForPlayer(i,ts_awayscore,7000);
				    TimeTextForPlayer(i,ts_homescore,7000);
				    ClearDeathMessages();
				    SetTimer("ShowDeathMessages",7000,false);
				}
	 		}

			//debugfile = fopen(debugfname,io_append);
			//fwrite(debugfile, "000000029\r\n");
			//fclose(debugfile);
		}
		else
		{
		    Round[DefTimeLost] = false;
			format(string, sizeof(string), "*** ��� ����: %s �¸� -- �ð� �ʰ� ***",AwayName);
			SendClientMessageToAllEx(COLOR_ORANGE, string);
	    	format(string,256,">> %s: %s | ų: %d ����: %d | ����: '%.2f'",AwayName,AwayStatus, TeamInfo[T_AWAY][RoundKills], TeamInfo[T_AWAY][RoundDeaths], AwayRatio);
			SendClientMessageToAllEx(GetTeamColor(1, T_AWAY), string);
	    	format(string,256,">> %s: %s | ų: %d ����: %d | ����: '%.2f'",HomeName,HomeStatus, TeamInfo[T_HOME][RoundKills], TeamInfo[T_HOME][RoundDeaths], HomeRatio);
			SendClientMessageToAllEx(GetTeamColor(1, T_HOME), string);

            #if IRC == 1
			format(string, sizeof(string), "7Round Over: 3%s7 Won -- Time Limit Reached",AwayName);
		    CallRemoteFunction("DC_IRCForceSay", "s", string);
			#endif

			MatchInfo[AwayRoundsWon] ++;
			format(string,256,"%s Wins!~n~~n~~r~Time Limit Reached",AwayName);
			TextDrawColor(gamemsg_whowon, GetTeamColor(1, T_AWAY) | 0x000000FF);
			TextDrawSetString(gamemsg_whowon, string);

	 		for(new i; i <= Server[HighestID]; i++)
			{
				if(IsPlayerConnected(i))
				{
					TimeTextForPlayer(i,ts_topbar,7000);
	   				TimeTextForPlayer(i,ts_bottombar,7000);
	    			TimeTextForPlayer(i,ts_centralbg,7000);
	        		TimeTextForPlayer(i,topshooter,7000);
	       			TimeTextForPlayer(i,gamemsg_whowon,7000);
    				TimeTextForPlayer(i,ts_lefttopbar,7000);
				    TimeTextForPlayer(i,ts_righttopbar,7000);
				    TimeTextForPlayer(i,ts_awaybg,7000);
				    TimeTextForPlayer(i,ts_homebg,7000);
				    TimeTextForPlayer(i,ts_homename,7000);
				    TimeTextForPlayer(i,ts_awayname,7000);
				    TimeTextForPlayer(i,ts_awayscore,7000);
				    TimeTextForPlayer(i,ts_homescore,7000);
				    ClearDeathMessages();
				    SetTimer("ShowDeathMessages",7000,false);
				}
	 		}

			//debugfile = fopen(debugfname,io_append);
			//fwrite(debugfile, "000000032\r\n");
			//fclose(debugfile);
		}
	} else if(Round[WinnerTeam] == T_AWAY) { //Away win
		Server[PartialRounds] ++;
		format(string, sizeof(string), "��� ����: %s �¸� (%d HP ����)", AwayName,Round[HPLeft]);
		SendClientMessageToAllEx(COLOR_ORANGE, string);
	  	format(string,256,">> %s: %s | ų: %d ����: %d | ����: '%.2f'",AwayName,AwayStatus, TeamInfo[T_AWAY][RoundKills], TeamInfo[T_AWAY][RoundDeaths], AwayRatio);
		SendClientMessageToAllEx(GetTeamColor(1, T_AWAY), string);
	   	format(string,256,">> %s: %s | ų: %d ����: %d | ����: '%.2f'",HomeName,HomeStatus, TeamInfo[T_HOME][RoundKills], TeamInfo[T_HOME][RoundDeaths], HomeRatio);
		SendClientMessageToAllEx(GetTeamColor(1, T_HOME), string);

        #if IRC == 1
		format(string, sizeof(string), "7Round Over: 3%s7 Wins (%d HP Left)", AwayName, Round[HPLeft]);
	    CallRemoteFunction("DC_IRCForceSay", "s", string);
		#endif

		MatchInfo[AwayRoundsWon] ++;
		format(string,256,"%s ~w~Wins!",AwayName);
		TextDrawColor(gamemsg_whowon, GetTeamColor(1, T_AWAY) | 0x000000FF);
		TextDrawSetString(gamemsg_whowon, string);

 		for(new i; i <= Server[HighestID]; i++)
		{
			if(IsPlayerConnected(i))
			{
				TimeTextForPlayer(i,ts_topbar,7000);
	   			TimeTextForPlayer(i,ts_bottombar,7000);
	    		TimeTextForPlayer(i,ts_centralbg,7000);
	        	TimeTextForPlayer(i,topshooter,7000);
	       		TimeTextForPlayer(i,gamemsg_whowon,7000);
    			TimeTextForPlayer(i,ts_lefttopbar,7000);
			    TimeTextForPlayer(i,ts_righttopbar,7000);
			    TimeTextForPlayer(i,ts_awaybg,7000);
			    TimeTextForPlayer(i,ts_homebg,7000);
			    TimeTextForPlayer(i,ts_homename,7000);
			    TimeTextForPlayer(i,ts_awayname,7000);
			    TimeTextForPlayer(i,ts_awayscore,7000);
			    TimeTextForPlayer(i,ts_homescore,7000);
				ClearDeathMessages();
				SetTimer("ShowDeathMessages",7000,false);
			}
 		}

		//debugfile = fopen(debugfname,io_append);
		//fwrite(debugfile, "000000035\r\n");
		//fclose(debugfile);
	} else if(Round[WinnerTeam] == T_HOME) { //defenders win
		Server[PartialRounds] ++;
		format(string, sizeof(string), "��� ����: %s �¸� (%d HP ����)", HomeName, Round[HPLeft]);
		SendClientMessageToAllEx(COLOR_ORANGE, string);
	   	format(string,256,">> %s: %s | ų: %d ����: %d | ����: '%.2f'",AwayName,AwayStatus, TeamInfo[T_AWAY][RoundKills], TeamInfo[T_AWAY][RoundDeaths], AwayRatio);
		SendClientMessageToAllEx(GetTeamColor(1, T_AWAY), string);
	   	format(string,256,">> %s: %s | ų: %d ����: %d | ����: '%.2f'",HomeName,HomeStatus, TeamInfo[T_HOME][RoundKills], TeamInfo[T_HOME][RoundDeaths], HomeRatio);
		SendClientMessageToAllEx(GetTeamColor(1, T_HOME), string);

		#if IRC == 1
		format(string, sizeof(string), "7Round Over: 2%s7 Wins (%d HP Left)", HomeName, Round[HPLeft]);
	    CallRemoteFunction("DC_IRCForceSay", "s", string);
		#endif
		MatchInfo[HomeRoundsWon] ++;
		format(string,256,"%s ~w~Wins!",HomeName);
		TextDrawColor(gamemsg_whowon, GetTeamColor(1, T_HOME) | 0x000000FF);
		TextDrawSetString(gamemsg_whowon, string);

 		for(new i; i <= Server[HighestID]; i++)
		{
			if(IsPlayerConnected(i))
			{
				TimeTextForPlayer(i,ts_topbar,7000);
	   			TimeTextForPlayer(i,ts_bottombar,7000);
	    		TimeTextForPlayer(i,ts_centralbg,7000);
	        	TimeTextForPlayer(i,topshooter,7000);
	       		TimeTextForPlayer(i,gamemsg_whowon,7000);
    			TimeTextForPlayer(i,ts_lefttopbar,7000);
			    TimeTextForPlayer(i,ts_righttopbar,7000);
			    TimeTextForPlayer(i,ts_awaybg,7000);
			    TimeTextForPlayer(i,ts_homebg,7000);
			    TimeTextForPlayer(i,ts_homename,7000);
			    TimeTextForPlayer(i,ts_awayname,7000);
			    TimeTextForPlayer(i,ts_awayscore,7000);
			    TimeTextForPlayer(i,ts_homescore,7000);
			 	ClearDeathMessages();
				SetTimer("ShowDeathMessages",7000,false);
			}
 		}
		//debugfile = fopen(debugfname,io_append);
		//fwrite(debugfile, "000000038\r\n");
		//fclose(debugfile);
	} else if(Round[WinnerTeam] == T_NON) { //Tie
		format(string, sizeof(string), "*** ��� ���� ***");
		SendClientMessageToAllEx(COLOR_ORANGE, string);
	   	format(string,256,">> %s: %s | ų: %d ����: %d | ����: '%.2f'",AwayName,AwayStatus, TeamInfo[T_AWAY][RoundKills], TeamInfo[T_AWAY][RoundDeaths], AwayRatio);
		SendClientMessageToAllEx(GetTeamColor(1, T_AWAY), string);
	   	format(string,256,">> %s: %s | ų: %d ����: %d | ����: '%.2f'",HomeName,HomeStatus, TeamInfo[T_HOME][RoundKills], TeamInfo[T_HOME][RoundDeaths], HomeRatio);
		SendClientMessageToAllEx(GetTeamColor(1, T_HOME), string);
	}
	if(Config[autoinvert] && Round[AdminEnded] == false)
	{
		SendClientMessageToAllEx(COLOR_YELLOW, invertstring);
	}
	WriteResults:

	format(RoundEndTime,256,"%d:%02d:%02d",hour,minute,second);
	format(RoundEndTime2,256,"%d:%02d",hour,minute);

	//debugfile = fopen(debugfname,io_append);
	//fwrite(debugfile, "000000037\r\n");
	//fclose(debugfile);

	if(Server[SaveResults] == true && Round[AdminEnded] == false)
	{
	    new HomeResult[24];
	    new AwayResult[24];

	    if(Round[WinnerTeam] == T_AWAY)
	    {
   			AwayResult = "WIN";
			HomeResult = "LOSS";

  			if(Round[WinType] == ELIMINATION)
  			{
	  			format(AwayResult,24,"WIN (HP Left: %d)", Round[HPLeft]);
			}
	    }
	    else if(Round[WinnerTeam] == T_HOME)
		{
			AwayResult = "LOSS";
			HomeResult = "WIN";

  			if(Round[WinType] == ELIMINATION)
  			{
	  			format(HomeResult,24,"WIN (HP Left: %d)", Round[HPLeft]);
			}
		}

		//debugfile = fopen(debugfname,io_append);
		//fwrite(debugfile, "000000099\r\n");
		//fclose(debugfile);

		MatchRoundInfo[Server[PartialRounds]][roundtype] = Server[LastGamemodePlayed];
		MatchRoundInfo[Server[PartialRounds]][roundid] = Server[LastRoundPlayed];
		MatchRoundInfo[Server[PartialRounds]][whowon] = Round[WinnerTeam];
		MatchRoundInfo[Server[PartialRounds]][hpleft] = Round[HPLeft];

		//debugfile = fopen(debugfname,io_append);
		//fwrite(debugfile, "000000096\r\n");
		//fclose(debugfile);

		MatchRoundInfo[Server[PartialRounds]][roundkills] = TeamInfo[Round[WinnerTeam]][RoundKills];
		MatchRoundInfo[Server[PartialRounds]][rounddeaths] = TeamInfo[Round[WinnerTeam]][RoundDeaths];
		MatchRoundInfo[Server[PartialRounds]][roundwintype] = Round[WinType];

		//debugfile = fopen(debugfname,io_append);
		//fwrite(debugfile, "000000097\r\n");
		//fclose(debugfile);

		if(IsPlayerConnected(topshotta)) {
			format(MatchRoundInfo[Server[PartialRounds]][roundtopshotta], 30, "%s",  RemoveClanTagFromName(topshotta));
		} else {
			format(MatchRoundInfo[Server[PartialRounds]][roundtopshotta], 30, "No One");
		}

		//debugfile = fopen(debugfname,io_append);
		//fwrite(debugfile, "000000095\r\n");
		//fclose(debugfile);

		format(MatchRoundInfo[Server[PartialRounds]][roundend], 30, "%s", RoundEndTime2);

		//debugfile = fopen(debugfname,io_append);
		//fwrite(debugfile, "000000094\r\n");
		//fclose(debugfile);

		format(MatchRoundInfo[Server[PartialRounds]][roundstart], 30, "%s", RoundStartTime2);

		/*printf("Round Type: %d", Server[LastGamemodePlayed]);
		printf("Round ID: %d", Server[LastRoundPlayed]);
		printf("Who Won: %d", Round[WinnerTeam]);
		printf("HP Left: %d", Round[HPLeft]);
		printf("Round Kills: %d", TeamInfo[Round[WinnerTeam]][RoundKills]);
		printf("Round Deaths: %d", TeamInfo[Round[WinnerTeam]][RoundDeaths]);
		printf("Win Type: %d", Round[WinType]);
		printf("Top Shotta: %s", RemoveClanTagFromName(topshotta));
		printf("Round Start: %s", RoundStartTime2);
		printf("Round End: %s", RoundEndTime2);*/

		//debugfile = fopen(debugfname,io_append);
		//fwrite(debugfile, "000000098\r\n");
		//fclose(debugfile);

		new File:fhandle = fopen(MatchFile,io_append);
		new number = GetDateAndTime() - Round[RoundStartTimeInt];

		//debugfile = fopen(debugfname,io_append);
		//fwrite(debugfile, "000000039\r\n");
		//fclose(debugfile);

		new desc[256];
		if(Server[LastGamemodePlayed] == 1) //Played a base
		{
		 	#if DATA_SYSTEM == 1
		 	    new fbase[256];
				fbase = Basefile(Server[LastRoundPlayed]);
				desc = dini_Get(fbase,"about");
			#elseif DATA_SYSTEM == 2
				desc = GetSqlBaseDataStr(Server[LastRoundPlayed], "name");
			#endif
		}
		else
		{
		 	#if DATA_SYSTEM == 1
		 	    new fbase[256];
				fbase = TDMfile(Server[LastRoundPlayed]);
				desc = dini_Get(fbase,"about");
			#elseif DATA_SYSTEM == 2
				desc = GetSqlTDMDataStr(Server[LastRoundPlayed], "name");
			#endif
		}

		//debugfile = fopen(debugfname,io_append);
		//fwrite(debugfile, "000000040\r\n");
		//fclose(debugfile);

		new Date[24];
		format(Date,24,"%02d/%02d", month,day);
		fwrite(fhandle, "\r\n\r\n\r\n\r\n\r\n");
	   	format(string,256,"Round %d | %s id %d (%s) - %s - Started: %s @ Ended: %s (Lasted %s) | %s\r\n\r\n\r\n", Server[PartialRounds], GetGamemodeName(Server[LastGamemodePlayed]), Server[LastRoundPlayed], desc, Date, RoundStartTime,RoundEndTime, ConvertMin(number), GetWinnerReason(Round[WinType]));
		fwrite(fhandle, string);
	    format(string,256,">>>> Team %s: %s | Kills: %d Deaths: %d | Ratio: '%.2f' > %s < \r\n\r\n",HomeName,HomeStatus, TeamInfo[T_HOME][RoundKills], TeamInfo[T_HOME][RoundDeaths], HomeRatio, HomeResult);
		fwrite(fhandle, string);

		for(new i = 0; i <= Server[HighestID]; i++)
		{
	   		if(IsPlayerConnected(i) && Player[i][pTeam] == T_HOME && PlayerMatchInfo[i][StartedPlaying] == true)
			{
			    if(Server[LastGamemodePlayed] == TDM && (Round[Gameplay] == WAR_ZONE || Round[Gameplay] == RUMBLE))
					format(string,256,">> %s: Kills %d | Deaths: %d \r\n\r\n",PlayerName(i),PlayerMatchInfo[i][RoundKills], PlayerMatchInfo[i][RoundDeaths]);
			    else
					format(string,256,">> %s: Kills %d | Died: %s\r\n\r\n",PlayerName(i),PlayerMatchInfo[i][RoundKills],CheckDeath(i));

				fwrite(fhandle, string);
			}
		}

		//debugfile = fopen(debugfname,io_append);
		//fwrite(debugfile, "000000041\r\n");
		//fclose(debugfile);

	    format(string,256,"\r\n\r\n>>>> Team %s: %s | Kills: %d Deaths: %d | Ratio: '%.2f'  > %s <\r\n\r\n",AwayName,AwayStatus, TeamInfo[T_AWAY][RoundKills], TeamInfo[T_AWAY][RoundDeaths], AwayRatio, AwayResult);
		fwrite(fhandle, string);
		for(new i = 0; i <= Server[HighestID]; i++)
		{
	   		if(IsPlayerConnected(i) && Player[i][pTeam] == T_AWAY && PlayerMatchInfo[i][StartedPlaying] == true)
			{
			    if(Server[LastGamemodePlayed] == TDM && (Round[Gameplay] == WAR_ZONE || Round[Gameplay] == RUMBLE))
					format(string,256,">> %s: Kills %d | Deaths: %d \r\n\r\n",PlayerName(i),PlayerMatchInfo[i][RoundKills], PlayerMatchInfo[i][RoundDeaths]);
			    else
					format(string,256,">> %s: Kills %d | Died: %s\r\n\r\n",PlayerName(i),PlayerMatchInfo[i][RoundKills],CheckDeath(i));

				fwrite(fhandle, string);
			}
		}

		//debugfile = fopen(debugfname,io_append);
		//fwrite(debugfile, "000000042\r\n");
		//fclose(debugfile);

		fclose(fhandle);
	}

	Round[WinnerTeam] = T_NON;
	//SendClientMessageToAllEx(COLOR_RED, "DEBUG: Round[WinnerTeam] set to T_NON 0 on line 16634 in combinations.pwn!");

	#if DEBUG == 1
	    Round[AdminEnded] = false;
	#endif

	if(Round[AdminEnded] == false)
	{
	    if(Server[PartialRounds] < Server[RoundLimit])
	    {
			format(string, sizeof(string), "��� ����: %d/%d", Server[PartialRounds],Server[RoundLimit]);
			SendClientMessageToAllEx(COLOR_WHITE,string);
		}
		else if(Server[PartialRounds] == Server[RoundLimit])
		{
			format(string, sizeof(string), "��� ��Ⱑ ����Ǿ����ϴ�, ��� �� ���� ����� �����˴ϴ�.");
			SendClientMessageToAllEx(COLOR_WHITE,string);

			for(new i = 0; i <= Server[HighestID]; i ++)
			{
			    if(IsPlayerConnected(i) && Player[i][AFK] != true)
			    	Player[i][InHappyEnding] = true;
			}

			SetTimer("HappyEnding",6000,false);
			if(Server[SaveResults] == true)
			{
				WriteMatchResults();
			}
			SetTimer("PrepareForNextRotation",10000,false);
		}
	}

	//debugfile = fopen(debugfname,io_append);
	//fwrite(debugfile, "000000043\r\n");
	//fclose(debugfile);

	if(Round[AdminEnded] == true)
	{
	    Round[AdminEnded] = false;
	}

    Server[LastGamemodePlayed] = 0;
    Server[LastRoundPlayed] = 0;


	TeamInfo[T_AWAY][RoundKills] = 0;
	TeamInfo[T_AWAY][RoundDeaths] = 0;

	TeamInfo[T_HOME][RoundKills] = 0;
	TeamInfo[T_HOME][RoundDeaths] = 0;

	TeamInfo[T_AWAY][Won] = false;
	TeamInfo[T_HOME][Won] = false;
	TeamInfo[T_AWAY][CapturedCP] = false;
	TeamInfo[T_HOME][CapturedCP] = false;
	TeamInfo[T_AWAY][TimeLimitedReached] = false;
	TeamInfo[T_HOME][TimeLimitedReached] = false;

	//debugfile = fopen(debugfname,io_append);
	//fwrite(debugfile, "000000044\r\n");
	//fclose(debugfile);
}

forward PrepareForNextRotation();
public PrepareForNextRotation()
{
    Server[LastGamemodePlayed] = 0;

    Server[LastRoundPlayed] = 0;
 	TeamInfo[T_AWAY][TotalKills] = 0;
	TeamInfo[T_AWAY][TotalDeaths] = 0;
	TeamInfo[T_HOME][TotalKills] = 0;
	TeamInfo[T_HOME][TotalDeaths] = 0;

	TeamInfo[T_AWAY][RoundKills] = 0;
	TeamInfo[T_AWAY][RoundDeaths] = 0;
	TeamInfo[T_HOME][RoundKills] = 0;
	TeamInfo[T_HOME][RoundDeaths] = 0;
	TeamInfo[T_AWAY][Won] = false;
	TeamInfo[T_HOME][Won] = false;
	TeamInfo[T_AWAY][CapturedCP] = false;
	TeamInfo[T_HOME][CapturedCP] = false;
	TeamInfo[T_AWAY][TimeLimitedReached] = false;
	TeamInfo[T_HOME][TimeLimitedReached] = false;

	for(new i = 0; i <= Server[HighestID]; i++)
	{
   		if(IsPlayerConnected(i))
		{
		    Player[i][pScore] = PlayerMatchInfo[i][TotalKills];
			PlayerMatchInfo[i][TotalDeaths] = 0;
			PlayerMatchInfo[i][TotalKills] = 0;
			PlayerMatchInfo[i][RoundDeaths] = 0;
			PlayerMatchInfo[i][RoundKills] = 0;
			PlayerMatchInfo[i][Died] = false;
			PlayerMatchInfo[i][PlayingMatch] = false;
  			PlayerMatchInfo[i][StartedPlaying] = false;
		}
	}
   	Server[PartialRounds] = 0;
}


WriteMatchResults()
{
	new File:fhandle = fopen(MatchFile,io_append);
	new Float:HomeRatio;

	if(TeamInfo[T_HOME][TotalDeaths] == 0)
	{
	    HomeRatio = float(TeamInfo[T_HOME][TotalKills]);
	}
	else if(TeamInfo[T_HOME][TotalKills] == 0)
	{
 		HomeRatio = -float(TeamInfo[T_HOME][TotalDeaths]);
 	}
	else
	{
 		HomeRatio = float(TeamInfo[T_HOME][TotalKills]) / float(TeamInfo[T_HOME][TotalDeaths]);
	}

	new Float:AwayRatio;

	if(TeamInfo[T_AWAY][TotalDeaths] == 0)
	{
	    AwayRatio = float(TeamInfo[T_AWAY][TotalKills]);
	}
	else if(TeamInfo[T_AWAY][TotalKills] == 0)
	{
 		AwayRatio = -float(TeamInfo[T_AWAY][TotalDeaths]);
 	}
	else
	{
		AwayRatio = float(TeamInfo[T_AWAY][TotalKills]) / float(TeamInfo[T_AWAY][TotalDeaths]);
	}

    fwrite(fhandle, "\r\n\r\n\r\n<><><><><><> Final Results <><><><><><>\r\n\r\n");
   	fwrite(fhandle, "------------------------------------------------------------------------\r\n\r\n\r\n");
   	new string2[200];
   	format(string2, sizeof(string2), "*~ Team: %s | Rounds Won: %d | Kills: %d Deaths: %d | Ratio: %.2f *~\r\n\r\n", HomeName, MatchInfo[HomeRoundsWon], TeamInfo[T_HOME][TotalKills], TeamInfo[T_HOME][TotalDeaths], HomeRatio);
   	fwrite(fhandle, string2);
   	for(new i = 0; i <= Server[HighestID]; i++)
	{
		if(IsPlayerConnected(i) && Player[i][pTeam] == T_HOME && PlayerMatchInfo[i][DidPlayMatch]) {
			new Float:PlayerRatio;

			if(PlayerMatchInfo[i][TotalDeaths] == 0)
			{
			    PlayerRatio = float(PlayerMatchInfo[i][TotalKills]);
			}
			else if(PlayerMatchInfo[i][TotalKills] == 0)
			{
 				PlayerRatio = -float(PlayerMatchInfo[i][TotalDeaths]);
 			}
			else
			{
				PlayerRatio = float(PlayerMatchInfo[i][TotalKills]) / float(PlayerMatchInfo[i][TotalDeaths]);
			}
			format(string2, sizeof(string2), ">> %s | Kills: %d Deaths: '%d | Ratio: %.2f <<\r\n\r\n", PlayerName(i), PlayerMatchInfo[i][TotalKills], PlayerMatchInfo[i][TotalDeaths], PlayerRatio);
   			fwrite(fhandle, string2);
		}
	}

   	fwrite(fhandle, "------------------------------------------------------------------------\r\n\r\n");
   	format(string2, sizeof(string2), "*~ Team: %s | Rounds Won: %d | Kills: %d Deaths: %d | Ratio: %.2f *~\r\n\r\n", AwayName, MatchInfo[AwayRoundsWon], TeamInfo[T_AWAY][TotalKills], TeamInfo[T_AWAY][TotalDeaths], AwayRatio);
   	fwrite(fhandle, string2);
   	for(new i = 0; i <= Server[HighestID]; i++)
	{
		if(IsPlayerConnected(i) && Player[i][pTeam] == T_AWAY && PlayerMatchInfo[i][DidPlayMatch]) {
			new Float:PlayerRatio;

			if(PlayerMatchInfo[i][TotalDeaths] == 0)
			{
			    PlayerRatio = float(PlayerMatchInfo[i][TotalKills]);
			}
			else if(PlayerMatchInfo[i][TotalKills] == 0)
			{
 				PlayerRatio = -float(PlayerMatchInfo[i][TotalDeaths]);
 			}
			else
			{
				PlayerRatio = float(PlayerMatchInfo[i][TotalKills]) / float(PlayerMatchInfo[i][TotalDeaths]);
			}

			format(string2, sizeof(string2), ">> %s | Kills: %d Deaths: %d | Ratio: %.2f <<\r\n\r\n", PlayerName(i), PlayerMatchInfo[i][TotalKills], PlayerMatchInfo[i][TotalDeaths], PlayerRatio);
   			fwrite(fhandle, string2);
		}
	}
   	fwrite(fhandle, "\r\n\r\n------------------------------------------------------------------------\r\n\r\n");
	fclose(fhandle);
	SaveMatchINI();
	return 1;
}

SaveMatchINI()
{
	// Save Match to INI
	// ------------------------------------------------------------------------------

	new MatchStart[20], MatchEnd[20], MatchDate[20], roundmatch_tmp[20];
	new file[200], fileid = -1;

	for(new i = 1; i < MAX_ROUND_LIMIT; i++)
	{
	    if (MatchRoundInfo[i][roundtype] != 0) {
	        if (MatchRoundInfo[i][roundid] == 1) {
				format(MatchStart, 30, "%s", MatchRoundInfo[i][roundstart]);
	        }
	        format(MatchEnd, 30, "%s", MatchRoundInfo[i][roundend]);
		}
		if(fileid < 1) {
			format(file,200,"combinations/matches/%d.ini", i);
			if (!dini_Exists(file)) {
		   		fileid = i;
		   	}
  		}
	}

	if (fileid >= 1) {

		new year, month, day;
		getdate(year, month, day);
		format(MatchDate, 30, "%02d-%02d-%02d", day, month, year);

		format(file,200,"combinations/matches/%d.ini", fileid);
		dini_Create(file);

		dini_IntSet(file,"match_day",day);
		dini_IntSet(file,"match_month",month);
		dini_IntSet(file,"match_year",year);

		dini_Set(file,"match_start",MatchStart);
		dini_Set(file,"match_end",MatchEnd);

		dini_Set(file,"home_name",HomeName);
		dini_IntSet(file,"home_roundswon",MatchInfo[HomeRoundsWon]);
		dini_IntSet(file,"home_kills",TeamInfo[T_HOME][TotalKills]);
		dini_IntSet(file,"home_deaths",TeamInfo[T_HOME][TotalKills]);

		dini_Set(file,"away_name",AwayName);
		dini_IntSet(file,"away_roundswon",MatchInfo[AwayRoundsWon]);
		dini_IntSet(file,"away_kills",TeamInfo[T_AWAY][TotalKills]);
		dini_IntSet(file,"away_deaths",TeamInfo[T_AWAY][TotalKills]);

		for(new i = 1; i <= MAX_ROUND_LIMIT; i++)
		{
		    if (MatchRoundInfo[i][roundtype] == 0) {
		        i = 999999999;
		    } else {
		        format(roundmatch_tmp, 14, "round%d_type", MatchRoundInfo[i][roundid]);
		       	dini_IntSet(file, roundmatch_tmp, MatchRoundInfo[i][roundtype]);
		        format(roundmatch_tmp, 14, "round%d_whowon", MatchRoundInfo[i][roundid]);
		        dini_IntSet(file, roundmatch_tmp, MatchRoundInfo[i][whowon]);
		        format(roundmatch_tmp, 14, "round%d_hpleft", MatchRoundInfo[i][roundid]);
		        dini_IntSet(file, roundmatch_tmp, MatchRoundInfo[i][hpleft]);
		        format(roundmatch_tmp, 14, "round%d_kills", MatchRoundInfo[i][roundid]);
		        dini_IntSet(file, roundmatch_tmp, MatchRoundInfo[i][roundkills]);
		        format(roundmatch_tmp, 14, "round%d_deaths", MatchRoundInfo[i][roundid]);
		        dini_IntSet(file, roundmatch_tmp, MatchRoundInfo[i][rounddeaths]);
		        format(roundmatch_tmp, 14, "round%d_wintype", MatchRoundInfo[i][roundid]);
		        dini_IntSet(file, roundmatch_tmp, MatchRoundInfo[i][roundwintype]);
		        format(roundmatch_tmp, 14, "round%d_topshotta", MatchRoundInfo[i][roundid]);
		        dini_Set(file, roundmatch_tmp, MatchRoundInfo[i][roundtopshotta]);
		        format(roundmatch_tmp, 14, "round%d_start", MatchRoundInfo[i][roundid]);
		        dini_Set(file, roundmatch_tmp, MatchRoundInfo[i][roundstart]);
		        format(roundmatch_tmp, 14, "round%d_end", MatchRoundInfo[i][roundid]);
		        dini_Set(file, roundmatch_tmp, MatchRoundInfo[i][roundend]);
			}
		}
	} else {
		SendClientMessageToAllEx(COLOR_RED, "{FF0000}� Error: {FFFFFF}��� ��� INI ������ ������ �� �����ϴ�.");
		print("Error: Could not save match results to INI file!");
	}
	//ClearMatchRoundInfo();
	// ------------------------------------------------------------------------------
	return 1;
}

ReturnColorFromDistance(playerid, Float:dist)
{
	if(dist > UAV_VIEW_DISTANCE) return (GetPlayerColor(playerid) & 0xFFFFFF00) | 0x00000000;
	else if(dist < 50) return (GetPlayerColor(playerid) & 0xFFFFFF00) | 0x000000AA;
	else if(dist <= 100) return (GetPlayerColor(playerid) & 0xFFFFFF00) | 0x00000099;
	else if(dist <= 200) return (GetPlayerColor(playerid) & 0xFFFFFF00) | 0x00000088;
	else if(dist <= 250) return (GetPlayerColor(playerid) & 0xFFFFFF00) | 0x00000077;
	else if(dist <= 300) return (GetPlayerColor(playerid) & 0xFFFFFF00) | 0x00000066;

	return (GetPlayerColor(playerid) & 0xFFFFFF00) | 0x00000011;
}

stock ReturnColor(index)
{
	new color = index - 69;
	new string[24];
	format(string,24,"0x000000%d", color);
	return HexToInt(string);
}

forward HappyEnding();
public HappyEnding()
{
	SetPlayersPos();
	RotateCamera();
	MatchInfo[results_ticks] = 0;
	SetTimer("Wait",3000,false);
	FormatHappyEndingTextDraws();
	SetTimer("ShowHappyEndingTextDraws",500,false);
	return 1;
}

FormatHappyEndingTextDraws()
{
	MatchInfo[home_list] = 0;
	MatchInfo[away_list] = 0;
	format(homestr,sizeof(homestr)," ");
	format(homestr,sizeof(homestr2)," ");
	format(homestr,sizeof(homestr3)," ");
	format(homestr,sizeof(homestr4)," ");
	format(homestr,sizeof(homestr5)," ");
	format(homestr,sizeof(homestr6)," ");
	format(homestr,sizeof(homestr7)," ");
	format(awaystr,sizeof(awaystr)," ");
	format(awaystr,sizeof(awaystr2)," ");
	format(awaystr,sizeof(awaystr3)," ");
	format(awaystr,sizeof(awaystr4)," ");
	format(awaystr,sizeof(awaystr5)," ");
	format(awaystr,sizeof(awaystr6)," ");
	format(awaystr,sizeof(awaystr7)," ");

	new rinfo_id[200], rinfo_type[256], rinfo_fileid[200], rinfo_winner[256], rinfo_wintype[256], boxspaces[100];
	for(new i = 1; i <= MAX_ROUND_LIMIT; i++)
	{
	    if (MatchRoundInfo[i][roundtype] != 0) {
	        //SendClientMessageToAllEx(COLOR_GREY, "test");
	       	format(rinfo_id, 200, "%s%d~n~", rinfo_id, i);
	       	if (MatchRoundInfo[i][roundtype] == 1) {
				format(rinfo_type, 256, "%sBase~n~", rinfo_type);
			} else if (MatchRoundInfo[i][roundtype] == 2) {
				format(rinfo_type, 256, "%sTDM~n~", rinfo_type);
			} else {
				format(rinfo_type, 256, "%sN/A~n~", rinfo_type);
			}
	       	format(rinfo_fileid, 200, "%s%d~n~", rinfo_fileid, MatchRoundInfo[i][roundid]);
	       	if (MatchRoundInfo[i][whowon] == T_HOME) {
	       		format(rinfo_winner, 256, "%s%s~n~", rinfo_winner, HomeName);
	       	} else if (MatchRoundInfo[i][whowon] == T_AWAY) {
	       		format(rinfo_winner, 256, "%s%s~n~", rinfo_winner, AwayName);
			} else {
	       		format(rinfo_winner, 256, "%sNo One~n~", rinfo_winner);
			}
			if (MatchRoundInfo[i][roundwintype] == TIME_LIMIT) {
	       		format(rinfo_wintype, 256, "%sTime Limit~n~", rinfo_wintype);
	       	} else if (MatchRoundInfo[i][roundwintype] == CHECKPOINT) {
	       		format(rinfo_wintype, 256, "%sCheckpoint~n~", rinfo_wintype);
	       	} else if (MatchRoundInfo[i][roundwintype] == ELIMINATION) {
	       		format(rinfo_wintype, 256, "%sElimination~n~", rinfo_wintype);
			} else {
	       		format(rinfo_wintype, 256, "%sN/A~n~", rinfo_wintype);
			}

			format(boxspaces, 100, "%s~n~", boxspaces);
	    } else {
			i = 99999999;
		}
	}

	TextDrawSetString(fr_sidebox4, rinfo_id);
	TextDrawSetString(fr_sidebox5, rinfo_type);
	TextDrawSetString(fr_sidebox6, rinfo_fileid);
	TextDrawSetString(fr_sidebox7, rinfo_winner);
	TextDrawSetString(fr_sidebox8, rinfo_wintype);
	TextDrawSetString(fr_sidebox1, boxspaces);

   	for (new i=0;i<Server[HighestID]+1;i++)
	{
		if(IsPlayerConnected(i) && !Player[i][RequestingClass])
		{
		
		    if(MatchInfo[HomeRoundsWon]-MatchInfo[AwayRoundsWon] >= 10 || MatchInfo[AwayRoundsWon]-MatchInfo[HomeRoundsWon] >= 10) {
		        #if defined SOUND_FINALRESULTS3
				if(ConfigAudio[sndFinalResults] == true) {
				    PlayAudioStreamForPlayerExEx(i, SOUND_FINALRESULTS3);
				}
				#endif
			}
		    else if(MatchInfo[HomeRoundsWon]-MatchInfo[AwayRoundsWon] >= 5 || MatchInfo[AwayRoundsWon]-MatchInfo[HomeRoundsWon] >= 5) {
		    	#if defined SOUND_FINALRESULTS
            	if(ConfigAudio[sndFinalResults] == true) {
               		PlayAudioStreamForPlayerExEx(i, SOUND_FINALRESULTS);
            	}
            	#endif
			} else {
			    #if defined SOUND_FINALRESULTS2
				if(ConfigAudio[sndFinalResults] == true) {
				    PlayAudioStreamForPlayerExEx(i, SOUND_FINALRESULTS2);
				}
				#endif
			}
			if(PlayerMatchInfo[i][RoundKills] == 0 && PlayerMatchInfo[i][RoundDeaths] == 0) continue;
			
			if(Player[i][pTeam] == T_HOME)
			{
		        MatchInfo[home_list]++;
		        if (MatchInfo[home_list] < 16) {
		        	format(homestr,sizeof(homestr),"%s~n~%s: %d / %d",homestr, RemoveClanTagFromName(i), PlayerMatchInfo[i][RoundKills], PlayerMatchInfo[i][RoundDeaths]);
		        	MatchInfo[TotalScoreHome] += PlayerMatchInfo[i][TotalKills];
				} else if ((MatchInfo[home_list] > 15) && (MatchInfo[home_list] < 31)) {
		        	format(homestr2,sizeof(homestr2),"%s~n~%s: %d / %d",homestr2, RemoveClanTagFromName(i), PlayerMatchInfo[i][RoundKills], PlayerMatchInfo[i][RoundDeaths]);
		        	MatchInfo[TotalScoreHome] += PlayerMatchInfo[i][TotalKills];
				} else if ((MatchInfo[home_list] > 30) && (MatchInfo[home_list] < 46)) {
		        	format(homestr3,sizeof(homestr3),"%s~n~%s: %d / %d",homestr3, RemoveClanTagFromName(i), PlayerMatchInfo[i][RoundKills], PlayerMatchInfo[i][RoundDeaths]);
		        	MatchInfo[TotalScoreHome] += PlayerMatchInfo[i][TotalKills];
				} else if ((MatchInfo[home_list] > 45) && (MatchInfo[home_list] < 61)) {
		        	format(homestr4,sizeof(homestr4),"%s~n~%s: %d / %d",homestr4, RemoveClanTagFromName(i), PlayerMatchInfo[i][RoundKills], PlayerMatchInfo[i][RoundDeaths]);
		        	MatchInfo[TotalScoreHome] += PlayerMatchInfo[i][TotalKills];
				} else if ((MatchInfo[home_list] > 60) && (MatchInfo[home_list] < 76)) {
		        	format(homestr5,sizeof(homestr5),"%s~n~%s: %d / %d",homestr5, RemoveClanTagFromName(i), PlayerMatchInfo[i][RoundKills], PlayerMatchInfo[i][RoundDeaths]);
		        	MatchInfo[TotalScoreHome] += PlayerMatchInfo[i][TotalKills];
				} else if ((MatchInfo[home_list] > 75) && (MatchInfo[home_list] < 91)) {
		        	format(homestr6,sizeof(homestr6),"%s~n~%s: %d / %d",homestr6, RemoveClanTagFromName(i), PlayerMatchInfo[i][RoundKills], PlayerMatchInfo[i][RoundDeaths]);
		        	MatchInfo[TotalScoreHome] += PlayerMatchInfo[i][TotalKills];
				} else if ((MatchInfo[home_list] > 90) && (MatchInfo[home_list] < 101)) {
		        	format(homestr7,sizeof(homestr7),"%s~n~%s: %d / %d",homestr7, RemoveClanTagFromName(i), PlayerMatchInfo[i][RoundKills], PlayerMatchInfo[i][RoundDeaths]);
		        	MatchInfo[TotalScoreHome] += PlayerMatchInfo[i][TotalKills];
				}
			}
			else if(Player[i][pTeam] == T_AWAY)
			{
		        MatchInfo[away_list]++;
		        if (MatchInfo[away_list] < 16) {
		        	format(awaystr,sizeof(awaystr),"%s~n~%s: %d / %d",awaystr, RemoveClanTagFromName(i), PlayerMatchInfo[i][RoundKills], PlayerMatchInfo[i][RoundDeaths]);
	        		MatchInfo[TotalScoreAway] += PlayerMatchInfo[i][TotalKills];
				} else if ((MatchInfo[away_list] > 15) && (MatchInfo[away_list] < 31)) {
		        	format(awaystr2,sizeof(awaystr2),"%s~n~%s: %d / %d",awaystr2, RemoveClanTagFromName(i), PlayerMatchInfo[i][RoundKills], PlayerMatchInfo[i][RoundDeaths]);
		        	MatchInfo[TotalScoreAway] += PlayerMatchInfo[i][TotalKills];
				} else if ((MatchInfo[away_list] > 30) && (MatchInfo[away_list] < 46)) {
		        	format(awaystr3,sizeof(awaystr3),"%s~n~%s: %d / %d",awaystr3, RemoveClanTagFromName(i), PlayerMatchInfo[i][RoundKills], PlayerMatchInfo[i][RoundDeaths]);
		        	MatchInfo[TotalScoreAway] += PlayerMatchInfo[i][TotalKills];
				} else if ((MatchInfo[away_list] > 45) && (MatchInfo[away_list] < 61)) {
		        	format(awaystr4,sizeof(awaystr4),"%s~n~%s: %d / %d",awaystr4, RemoveClanTagFromName(i), PlayerMatchInfo[i][RoundKills], PlayerMatchInfo[i][RoundDeaths]);
		        	MatchInfo[TotalScoreAway] += PlayerMatchInfo[i][TotalKills];
				} else if ((MatchInfo[away_list] > 60) && (MatchInfo[away_list] < 76)) {
		        	format(awaystr5,sizeof(awaystr5),"%s~n~%s: %d / %d",awaystr5, RemoveClanTagFromName(i), PlayerMatchInfo[i][RoundKills], PlayerMatchInfo[i][RoundDeaths]);
		        	MatchInfo[TotalScoreAway] += PlayerMatchInfo[i][TotalKills];
				} else if ((MatchInfo[away_list] > 75) && (MatchInfo[away_list] < 91)) {
		        	format(awaystr6,sizeof(awaystr6),"%s~n~%s: %d / %d",awaystr6, RemoveClanTagFromName(i), PlayerMatchInfo[i][RoundKills], PlayerMatchInfo[i][RoundDeaths]);
		        	MatchInfo[TotalScoreAway] += PlayerMatchInfo[i][TotalKills];
				} else if ((MatchInfo[away_list] > 90) && (MatchInfo[away_list] < 101)) {
		        	format(awaystr7,sizeof(awaystr7),"%s~n~%s: %d / %d",awaystr7, RemoveClanTagFromName(i), PlayerMatchInfo[i][RoundKills], PlayerMatchInfo[i][RoundDeaths]);
		        	MatchInfo[TotalScoreAway] += PlayerMatchInfo[i][TotalKills];
				}
			}
		}
	}

	for (new i=0; i < MAX_PLAYERS; i++)
	{
	    if (strlen(BeyondDiscon[i][pName]) > 3) {
	        //printf(BeyondDiscon[i][pName]);
	        
	        if(BeyondDiscon[i][pKills] == 0 && BeyondDiscon[i][pDeaths] == 0) continue;
			if(BeyondDiscon[i][pTeam] == T_HOME)
			{
				MatchInfo[home_list]++;
				if (MatchInfo[home_list] < 16) {
					format(homestr,sizeof(homestr),"%s~n~%s: %d / %d",homestr, BeyondDiscon[i][pName], BeyondDiscon[i][pKills], BeyondDiscon[i][pDeaths]);
					MatchInfo[TotalScoreHome] += BeyondDiscon[i][pKills];
				} else if ((MatchInfo[home_list] > 15) && (MatchInfo[home_list] < 31)) {
					format(homestr2,sizeof(homestr2),"%s~n~%s: %d / %d",homestr2, BeyondDiscon[i][pName], BeyondDiscon[i][pKills], BeyondDiscon[i][pDeaths]);
					MatchInfo[TotalScoreHome] += BeyondDiscon[i][pKills];
				} else if ((MatchInfo[home_list] > 30) && (MatchInfo[home_list] < 46)) {
					format(homestr3,sizeof(homestr3),"%s~n~%s: %d / %d",homestr3, BeyondDiscon[i][pName], BeyondDiscon[i][pKills], BeyondDiscon[i][pDeaths]);
					MatchInfo[TotalScoreHome] += BeyondDiscon[i][pKills];
				} else if ((MatchInfo[home_list] > 45) && (MatchInfo[home_list] < 61)) {
					format(homestr4,sizeof(homestr4),"%s~n~%s: %d / %d",homestr4, BeyondDiscon[i][pName], BeyondDiscon[i][pKills], BeyondDiscon[i][pDeaths]);
					MatchInfo[TotalScoreHome] += BeyondDiscon[i][pKills];
				} else if ((MatchInfo[home_list] > 60) && (MatchInfo[home_list] < 76)) {
					format(homestr5,sizeof(homestr5),"%s~n~%s: %d / %d",homestr5, BeyondDiscon[i][pName], BeyondDiscon[i][pKills], BeyondDiscon[i][pDeaths]);
					MatchInfo[TotalScoreHome] += BeyondDiscon[i][pKills];
				} else if ((MatchInfo[home_list] > 75) && (MatchInfo[home_list] < 91)) {
					format(homestr6,sizeof(homestr6),"%s~n~%s: %d / %d",homestr6, BeyondDiscon[i][pName], BeyondDiscon[i][pKills], BeyondDiscon[i][pDeaths]);
					MatchInfo[TotalScoreHome] += BeyondDiscon[i][pKills];
				} else if ((MatchInfo[home_list] > 90) && (MatchInfo[home_list] < 101)) {
					format(homestr7,sizeof(homestr7),"%s~n~%s: %d / %d",homestr7, BeyondDiscon[i][pName], BeyondDiscon[i][pKills], BeyondDiscon[i][pDeaths]);
					MatchInfo[TotalScoreHome] += BeyondDiscon[i][pKills];
				}
			}
			else if(Player[i][pTeam] == T_AWAY)
			{
				MatchInfo[away_list]++;
			    if (MatchInfo[away_list] < 16) {
					format(awaystr,sizeof(awaystr),"%s~n~%s: %d / %d",awaystr, BeyondDiscon[i][pName], BeyondDiscon[i][pKills], BeyondDiscon[i][pDeaths]);
					MatchInfo[TotalScoreAway] += BeyondDiscon[i][pKills];
				} else if ((MatchInfo[away_list] > 15) && (MatchInfo[away_list] < 31)) {
					format(awaystr2,sizeof(awaystr2),"%s~n~%s: %d / %d",awaystr2, BeyondDiscon[i][pName], BeyondDiscon[i][pKills], BeyondDiscon[i][pDeaths]);
					MatchInfo[TotalScoreAway] += BeyondDiscon[i][pKills];
				} else if ((MatchInfo[away_list] > 30) && (MatchInfo[away_list] < 46)) {
					format(awaystr3,sizeof(awaystr3),"%s~n~%s: %d / %d",awaystr3, BeyondDiscon[i][pName], BeyondDiscon[i][pKills], BeyondDiscon[i][pDeaths]);
					MatchInfo[TotalScoreAway] += BeyondDiscon[i][pKills];
				} else if ((MatchInfo[away_list] > 45) && (MatchInfo[away_list] < 61)) {
					format(awaystr4,sizeof(awaystr4),"%s~n~%s: %d / %d",awaystr4, BeyondDiscon[i][pName], BeyondDiscon[i][pKills], BeyondDiscon[i][pDeaths]);
					MatchInfo[TotalScoreAway] += BeyondDiscon[i][pKills];
				} else if ((MatchInfo[away_list] > 60) && (MatchInfo[away_list] < 76)) {
					format(awaystr5,sizeof(awaystr5),"%s~n~%s: %d / %d",awaystr5, BeyondDiscon[i][pName], BeyondDiscon[i][pKills], BeyondDiscon[i][pDeaths]);
					MatchInfo[TotalScoreAway] += BeyondDiscon[i][pKills];
				} else if ((MatchInfo[away_list] > 75) && (MatchInfo[away_list] < 91)) {
					format(awaystr6,sizeof(awaystr6),"%s~n~%s: %d / %d",awaystr6, BeyondDiscon[i][pName], BeyondDiscon[i][pKills], BeyondDiscon[i][pDeaths]);
					MatchInfo[TotalScoreAway] += BeyondDiscon[i][pKills];
				} else if ((MatchInfo[away_list] > 90) && (MatchInfo[away_list] < 101)) {
					format(awaystr7,sizeof(awaystr7),"%s~n~%s: %d / %d",awaystr7, BeyondDiscon[i][pName], BeyondDiscon[i][pKills], BeyondDiscon[i][pDeaths]);
					MatchInfo[TotalScoreAway] += BeyondDiscon[i][pKills];
				}
			}
		}
	}

	TextDrawSetString(HomePlayersScore, homestr);
	TextDrawSetString(AwayPlayersScores, awaystr);

	new str[128];
 	//format(str,sizeof(str),"Score: %d ~n~Rounds Won: %d", MatchInfo[TotalScoreAway], MatchInfo[AwayRoundsWon]);
	//TextDrawSetString(AwayTotalScore, str);
	//format(str,sizeof(str),"Score: %d ~n~Rounds Won: %d", MatchInfo[TotalScoreHome], MatchInfo[HomeRoundsWon]);
	//TextDrawSetString(HomeTotalScore, str);

	format(str,256,"%02d ~y~-~w~ %02d", MatchInfo[HomeRoundsWon], MatchInfo[AwayRoundsWon]);
	TextDrawSetString(ResultsScore,str);

	TextDrawSetString(AwayNameTD, AwayName);
	TextDrawSetString(ResultsAway, AwayName);
	TextDrawSetString(HomeNameTD, HomeName);
	TextDrawSetString(ResultsHome, HomeName);

	TextDrawColor(AwayBackground, GetTeamColor(1, T_AWAY) | 0x00000033);
	TextDrawColor(HomeBackground, GetTeamColor(1, T_HOME) | 0x00000033);


}

SetPlayersPos()
{
	new index;
	for(new i = 0; i < GetMaxPlayers(); i ++)
	{
	    if(IsPlayerConnected(i) && Player[i][pSpawned])
	    {
			SetPlayerWorldBoundsEx(i,9999.9,-9999.9,9999.9,-9999.9);
	        
	        
	        TogglePlayerControllable(i,false);
	        SetPlayerInterior(i,0);
	        SetPlayerVirtualWorld2(i,0);
    		SetPlayerCameraPos(i,372.9791,-2021.1896,10.5810);
			SetPlayerCameraLookAt(i,381.6605,-2023.0000,7.8359);
			
            GivePlayerCselWep(i);

			if(Player[i][pTeam] == T_AWAY)
			{
			    SetPlayerPos(i,381.6605,-2023.0000 - index*2,7.8359);
			    SetPlayerFacingAngle(i,90.6269);
			    index ++;
			}
			if(Player[i][pTeam] == T_HOME)
			{
			    SetPlayerPos(i,381.6605,-2023.0000 - index*1.5,7.8359);
			    SetPlayerFacingAngle(i,90.6269);
			    index ++;
			}
			Player[i][InHappyEnding] = true;
	    }
	}
	/*for(new i = 0; i < GetMaxPlayers(); i ++)
	{
	    if(IsPlayerConnected(i) && Player[i][InHappyEnding])
	    {
			if(Player[i][pTeam] == T_HOME)
			{
			    SetPlayerPos(i,381.6605,-2023.0000 - index*1.5,7.8359);
			    SetPlayerFacingAngle(i,90.6269);
			    index ++;
			}
			
	    }
	}*/

	FinalResults[Index2] = 0;
	FinalResults[MovingCamera] = true;

}

forward Wait();
public Wait()
{
	MatchInfo[results_ticks]++;

	if (MatchInfo[results_ticks] == 1 && MatchInfo[home_list] > 15) {
		TextDrawSetString(HomePlayersScore, homestr2);
	} else if (MatchInfo[results_ticks] == 2 && MatchInfo[home_list] > 30) {
		TextDrawSetString(HomePlayersScore, homestr3);
	} else if (MatchInfo[results_ticks] == 3 && MatchInfo[home_list] > 45) {
		TextDrawSetString(HomePlayersScore, homestr4);
	} else if (MatchInfo[results_ticks] == 4 && MatchInfo[home_list] > 60) {
		TextDrawSetString(HomePlayersScore, homestr5);
	} else if (MatchInfo[results_ticks] == 5 && MatchInfo[home_list] > 75) {
		TextDrawSetString(HomePlayersScore, homestr6);
	} else if (MatchInfo[results_ticks] == 6 && MatchInfo[home_list] > 90) {
		TextDrawSetString(HomePlayersScore, homestr7);
	} else {
		TextDrawSetString(HomePlayersScore, homestr);
	}

	if (MatchInfo[results_ticks] == 1 && MatchInfo[away_list] > 15) {
		TextDrawSetString(AwayPlayersScores, awaystr2);
	} else if (MatchInfo[results_ticks] == 2 && MatchInfo[away_list] > 30) {
		TextDrawSetString(AwayPlayersScores, awaystr3);
	} else if (MatchInfo[results_ticks] == 3 && MatchInfo[away_list] > 45) {
		TextDrawSetString(AwayPlayersScores, awaystr4);
	} else if (MatchInfo[results_ticks] == 4 && MatchInfo[away_list] > 60) {
		TextDrawSetString(AwayPlayersScores, awaystr5);
	} else if (MatchInfo[results_ticks] == 5 && MatchInfo[away_list] > 75) {
		TextDrawSetString(AwayPlayersScores, awaystr6);
	} else if (MatchInfo[results_ticks] == 6 && MatchInfo[away_list] > 90) {
		TextDrawSetString(AwayPlayersScores, awaystr7);
	} else {
		TextDrawSetString(AwayPlayersScores, awaystr);
	}

	if (MatchInfo[results_ticks] >= 7) {
		HideHappyEndingTextDraws();
		ShowDeathMessages();
		ClearMatchRoundInfo();
		for(new i = 0; i < GetMaxPlayers(); i ++)
		{
		    if(IsPlayerConnected(i) && Player[i][InHappyEnding])
		    {
	        	//TogglePlayerSpectating(i, 0);
	    		TextDrawShowForPlayer(i, MapNameTD);
				//TextDrawShowForPlayer(i, ScoreboardScore);
				TextDrawShowForPlayer(i, fps_text[i]);
				TextDrawShowForPlayer(i, FPS[i]);
				TextDrawShowForPlayer(i, ScoreboardHome);
				TextDrawShowForPlayer(i, ScoreboardAway);
			    Player[i][InHappyEnding] = false;
			    #if defined SOUND_FINALRESULTS
				if(ConfigAudio[sndFinalResults] == true) {
	    			StopAudioStreamForPlayerEx(i);
	    		}
	    		#endif
			    SpawnPlayerEx(i);
			    PlayerPlaySound(i, 1188, 0, 0, 0);
			    SetCameraBehindPlayer(i);
			}
		}
		BeyondDiscon_Clear();
		FinalResults[MovingCamera] = false;

		MatchInfo[results_ticks] = 0;

	 	TeamInfo[T_AWAY][TotalKills] = 0;
		TeamInfo[T_AWAY][TotalDeaths] = 0;
		TeamInfo[T_HOME][TotalKills] = 0;
		TeamInfo[T_HOME][TotalDeaths] = 0;

		TeamInfo[T_AWAY][RoundKills] = 0;
		TeamInfo[T_AWAY][RoundDeaths] = 0;
  		TeamInfo[T_HOME][RoundKills] = 0;
		TeamInfo[T_HOME][RoundDeaths] = 0;
		TeamInfo[T_AWAY][Won] = false;
 		TeamInfo[T_HOME][Won] = false;
   		TeamInfo[T_AWAY][CapturedCP] = false;
		TeamInfo[T_HOME][CapturedCP] = false;
		TeamInfo[T_AWAY][TimeLimitedReached] = false;
		TeamInfo[T_HOME][TimeLimitedReached] = false;

		for(new i = 0; i <= Server[HighestID]; i++)
		{
	   		if(IsPlayerConnected(i))
			{
				Player[i][pScore] = 0;
			    SetPlayerScore(i,0);
				PlayerMatchInfo[i][TotalDeaths] = 0;
				PlayerMatchInfo[i][TotalKills] = 0;
				PlayerMatchInfo[i][RoundDeaths] = 0;
				PlayerMatchInfo[i][RoundKills] = 0;
				PlayerMatchInfo[i][Died] = false;
				PlayerMatchInfo[i][PlayingMatch] = false;
   				PlayerMatchInfo[i][StartedPlaying] = false;
			}
		}
		MatchInfo[HomeRoundsWon]  = 0, MatchInfo[AwayRoundsWon] = 0, MatchInfo[RoundsPlayed] = 0, MatchInfo[TotalScoreHome] = 0, MatchInfo[TotalScoreAway] = 0;

	}
	else
	{
		SetTimer("Wait",3000,false);
	}
}

forward RotateCamera();
public RotateCamera()
{
	if(FinalResults[MovingCamera] == false) return 0;

	for(new i = 0; i < GetMaxPlayers(); i ++)
	{
	    if(IsPlayerConnected(i) && Player[i][InHappyEnding])
	    {
    		SetPlayerCameraPos(i,372.9791,-2021.0000 - FinalResults[Index2],10.5810);
			SetPlayerCameraLookAt(i,381.6605,-2023.0000  - FinalResults[Index2],7.8359);

		}
	}

	FinalResults[Index2] += 0.01;
	return SetTimer("RotateCamera",25,false);
}



forward HideHappyEndingTextDraws();
public HideHappyEndingTextDraws()
{
	TextDrawHideForAll(AwayNameTD);
	TextDrawHideForAll(HomeNameTD);
	TextDrawHideForAll(AwayBackground);
	TextDrawHideForAll(HomeBackground);
	TextDrawHideForAll(TopOne);
	TextDrawHideForAll(DownOne);
	TextDrawHideForAll(ScoreBox);
	TextDrawHideForAll(ScoreBoxStarsTop);
	TextDrawHideForAll(ScoreBoxStarsBottom);
	TextDrawHideForAll(CinematicDown);
	TextDrawHideForAll(CinematicUp);
	TextDrawHideForAll(HomePlayersScore);
	TextDrawHideForAll(AwayPlayersScores);
	//TextDrawHideForAll(AwayTotalScore);
	//TextDrawHideForAll(HomeTotalScore);
	TextDrawHideForAll(Results);
	TextDrawHideForAll(ResultsHome);
	TextDrawHideForAll(ResultsAway);
	TextDrawHideForAll(ResultsScore);
	TextDrawHideForAll(fr_sidebox1);
	TextDrawHideForAll(fr_sidebox2);
	TextDrawHideForAll(fr_sidebox3);
	TextDrawHideForAll(fr_sidebox4);
	TextDrawHideForAll(fr_sidebox5);
	TextDrawHideForAll(fr_sidebox6);
	TextDrawHideForAll(fr_sidebox7);
	TextDrawHideForAll(fr_sidebox8);
	TextDrawHideForAll(fr_sidebox9);
	
}

forward ShowHappyEndingTextDraws();
public ShowHappyEndingTextDraws()
{
	for(new i = 0; i < GetMaxPlayers(); i ++)
	{
	    if(IsPlayerConnected(i) && Player[i][InHappyEnding] == true)
	    {
	        //TogglePlayerSpectating(i, 1);
	    	TextDrawHideForPlayer(i, MapNameTD);
			//TextDrawHideForPlayer(i, ScoreboardScore);
			TextDrawHideForPlayer(i, fps_text[i]);
			TextDrawHideForPlayer(i, FPS[i]);
			TextDrawHideForPlayer(i, ScoreboardHome);
			TextDrawHideForPlayer(i, ScoreboardAway);

			TextDrawShowForPlayer(i, fr_sidebox1);
			TextDrawShowForPlayer(i, fr_sidebox2);
			TextDrawShowForPlayer(i, fr_sidebox3);
			TextDrawShowForPlayer(i, fr_sidebox4);
			TextDrawShowForPlayer(i, fr_sidebox5);
			TextDrawShowForPlayer(i, fr_sidebox6);
			TextDrawShowForPlayer(i, fr_sidebox7);
			TextDrawShowForPlayer(i, fr_sidebox8);
			TextDrawShowForPlayer(i, fr_sidebox9);

			TextDrawShowForPlayer(i, TopOne);
			TextDrawShowForPlayer(i, DownOne);
			TextDrawShowForPlayer(i, ScoreBoxStarsTop);
			TextDrawShowForPlayer(i, ScoreBoxStarsBottom);
			TextDrawShowForPlayer(i, AwayNameTD);
			TextDrawShowForPlayer(i, HomeNameTD);
			TextDrawShowForPlayer(i, AwayBackground);
			TextDrawShowForPlayer(i, HomeBackground);
			TextDrawShowForPlayer(i, CinematicDown);
			TextDrawShowForPlayer(i, CinematicUp);
			TextDrawShowForPlayer(i, HomePlayersScore);
			TextDrawShowForPlayer(i, AwayPlayersScores);
			//TextDrawShowForPlayer(i, AwayTotalScore);
			//TextDrawShowForPlayer(i, HomeTotalScore);
			TextDrawShowForPlayer(i, Results);
			TextDrawShowForPlayer(i, ResultsHome);
			TextDrawShowForPlayer(i, ResultsAway);
			TextDrawShowForPlayer(i, ResultsScore);
			TextDrawShowForPlayer(i, ScoreBox);
			new string[256];
			format(string,256,"%s",HomeName);
			TextDrawSetString(ResultsHome, string);
			format(string,256,"%s",AwayName);
			TextDrawSetString(ResultsAway, string);
 			//PlayerPlaySound(i, 1187, 0, 0, 0);
 			
 			
            
 			ClearDeathMessages();
		}
	}
}

CreateHappyEndingTextDraws()
{
	Results = TextDrawCreateEx(300.000000,90.000000,"Final Results");
	TextDrawAlignment(Results,2);
	TextDrawBackgroundColor(Results,0x000000ff);
	TextDrawFont(Results,0);
	TextDrawLetterSize(Results,1.200000,2.200000);
	TextDrawColor(Results,0xffffffff);
	TextDrawSetOutline(Results,1);
	TextDrawSetProportional(Results,1);
	TextDrawSetShadow(Results,1);

   	ScoreBox = TextDrawCreateEx(180.000000,120.00000,"~n~~n~~n~");
    TextDrawUseBox(ScoreBox, 1);
    TextDrawTextSize(ScoreBox, 420.0,1.0);
    TextDrawBoxColor(ScoreBox, 0x00000077);
	TextDrawSetOutline(ScoreBox,1);
	TextDrawBackgroundColor(ScoreBox,0x000000A0);

	TopOne = TextDrawCreateEx(280.000000,182.50000,"~n~");
    TextDrawUseBox(TopOne, 1);
    TextDrawTextSize(TopOne, 590.0,1.0);
    TextDrawBoxColor(TopOne, 0x000000FF);
	TextDrawSetOutline(TopOne,1);

	DownOne = TextDrawCreateEx(280.000000,342.00000,"~n~");
    TextDrawUseBox(DownOne, 1);
    TextDrawTextSize(DownOne, 590.0,1.0);
    TextDrawBoxColor(DownOne, 0x000000FF);
	TextDrawSetOutline(DownOne,1);

	new string[256];
	format(string,256,"%s",HomeName);

	ResultsHome = TextDrawCreateEx(190.000000,125.000000,string);
	TextDrawAlignment(ResultsHome,1);
	TextDrawFont(ResultsHome,3);
	TextDrawLetterSize(ResultsHome,0.40000,1.000000);
	TextDrawColor(ResultsHome,GetTeamColor(1, T_HOME) | 0x000000FF);
	TextDrawSetProportional(ResultsHome,1);

	format(string,256,"%s",AwayName);

	ResultsAway = TextDrawCreateEx(405.000000,125.000000,string);
	TextDrawAlignment(ResultsAway,3);
	TextDrawFont(ResultsAway,3);
	TextDrawLetterSize(ResultsAway,0.40000,1.000000);
	TextDrawColor(ResultsAway,GetTeamColor(1, T_AWAY) | 0x000000FF);
	TextDrawSetProportional(ResultsAway,1);

	format(string,256,"%02d ~y~-~w~ %02d", MatchInfo[HomeRoundsWon], MatchInfo[AwayRoundsWon]);

	format(string,256,"%s",AwayName);
	AwayNameTD = TextDrawCreateEx(507.000000,183.000000,string);
	format(string,256,"%s",HomeName);
	HomeNameTD = TextDrawCreateEx(352.000000,183.000000,string);

	TextDrawAlignment(AwayNameTD,2);
	TextDrawAlignment(HomeNameTD,2);

	AwayBackground = TextDrawCreateEx(435.000000,197.000000,"~n~~n~~n~ ~n~ ~n~ ~n~ ~n~ ~n~ ~n~ ~n~ ~n~ ~n~ ~n~ ~n~");
    TextDrawUseBox(AwayBackground, 1);
    TextDrawBoxColor(AwayBackground, GetTeamColor(1, T_AWAY) | 0x00000033);
    TextDrawTextSize(AwayBackground, 590.0,1.0);
	TextDrawSetOutline(AwayBackground,1);

	HomeBackground = TextDrawCreateEx(280.000000,197.000000,"~n~~n~~n~ ~n~ ~n~ ~n~ ~n~ ~n~ ~n~ ~n~ ~n~ ~n~ ~n~ ~n~");
    TextDrawUseBox(HomeBackground, 1);
    TextDrawBoxColor(HomeBackground, GetTeamColor(1, T_HOME) | 0x00000033);
    TextDrawTextSize(HomeBackground, 432.0,1.0);

	TextDrawSetOutline(AwayBackground,1);

	ResultsScore = TextDrawCreateEx(300.000000,135.000000,string);
	TextDrawAlignment(ResultsScore,2);
	TextDrawFont(ResultsScore,2);
	TextDrawLetterSize(ResultsScore,0.40000,1.000000);
	TextDrawColor(ResultsScore,0xffffffff);
	TextDrawSetProportional(ResultsScore,1);

	CinematicUp = TextDrawCreateEx(0.0,0.0,"~n~~n~~n~~n~~n~~n~~n~~n~");
	TextDrawFont(CinematicUp,1);
	TextDrawLetterSize(CinematicUp,1,1);
	TextDrawColor(CinematicUp,0x000000FF);
	TextDrawSetShadow(CinematicUp,1);
	TextDrawSetOutline(CinematicUp,50);
	TextDrawBackgroundColor(CinematicUp,0x000000FF);
	TextDrawUseBox(CinematicUp,1);
	TextDrawBoxColor(CinematicUp,0x000000FF);

	CinematicDown = TextDrawCreateEx(0.0, 390.0,"~n~~n~~n~~n~~n~~n~~n~~n~");
	TextDrawFont(CinematicDown,1);
	TextDrawLetterSize(CinematicDown,1,1);
	TextDrawColor(CinematicDown,0x000000FF);
	TextDrawSetShadow(CinematicDown,1);
	TextDrawSetOutline(CinematicDown,50);
	TextDrawBackgroundColor(CinematicDown,0x000000FF);
	TextDrawUseBox(CinematicDown,1);
	TextDrawBoxColor(CinematicDown,0x000000FF);

	ScoreBoxStarsBottom = TextDrawCreateEx(300.000000,150.000000,"~w~~b~~h~]]]]]]]]]]]]]]]]]]]]]]]]]");
	TextDrawAlignment(ScoreBoxStarsBottom,2);
	TextDrawBackgroundColor(ScoreBoxStarsBottom,COLOR_LIGHTPURPLE);
	TextDrawFont(ScoreBoxStarsBottom,0);
	TextDrawLetterSize(ScoreBoxStarsBottom,0.3,1.2);
	TextDrawColor(ScoreBoxStarsBottom,0xffffffff);
	TextDrawSetOutline(ScoreBoxStarsBottom,1);
	TextDrawSetProportional(ScoreBoxStarsBottom,1);
	TextDrawSetShadow(ScoreBoxStarsBottom,1);

	ScoreBoxStarsTop = TextDrawCreateEx(300.000000,110.000000,"~w~~b~~h~]]]]]]]]]]]]]]]]]]]]]]]]]");
	TextDrawAlignment(ScoreBoxStarsTop,2);
	TextDrawBackgroundColor(ScoreBoxStarsTop,COLOR_LIGHTPURPLE);
	TextDrawFont(ScoreBoxStarsTop,0);
	TextDrawLetterSize(ScoreBoxStarsTop,0.3,1.2);
	TextDrawColor(ScoreBoxStarsTop,0xffffffff);
	TextDrawSetOutline(ScoreBoxStarsTop,1);
	TextDrawSetProportional(ScoreBoxStarsTop,1);
	TextDrawSetShadow(ScoreBoxStarsTop,1);

	TextDrawBackgroundColor(AwayNameTD,0x000000ff);
	TextDrawBackgroundColor(HomeNameTD,0x000000ff);
	TextDrawFont(AwayNameTD,2);
	TextDrawLetterSize(AwayNameTD,0.3,1.0);
	TextDrawFont(HomeNameTD,2);
	TextDrawLetterSize(HomeNameTD,0.3,1.0);
	TextDrawColor(AwayNameTD,GetTeamColor(1, T_AWAY) | 0x000000FF);
	TextDrawColor(HomeNameTD,GetTeamColor(1, T_HOME) | 0x000000FF);
	TextDrawSetOutline(AwayNameTD,1);
	TextDrawSetOutline(HomeNameTD,1);
	TextDrawSetProportional(AwayNameTD,1);
	TextDrawSetProportional(HomeNameTD,1);
	TextDrawSetShadow(AwayNameTD,1);
	TextDrawSetShadow(HomeNameTD,1);

 	format(homestr,sizeof(homestr)," ");
	format(awaystr,sizeof(awaystr)," ");

   	for (new i=0;i<Server[HighestID]+1;i++)
	{
		if(IsPlayerConnected(i))
		{
			if(Player[i][pTeam] == T_HOME)
			{
		        format(homestr,sizeof(homestr),"%s~n~%s: %d",homestr, PlayerName2(i), Player[i][pScore]);
		        MatchInfo[TotalScoreHome] += Player[i][pScore];
			}
			else if(Player[i][pTeam] == T_AWAY)
			{
   				format(awaystr,sizeof(awaystr),"%s~n~%s: %d",awaystr, PlayerName2(i), Player[i][pScore]);
   		        MatchInfo[TotalScoreAway] += Player[i][pScore];
			}
		}
	}
	AwayPlayersScores = TextDrawCreateEx(512.000000,187.000000,awaystr);
	HomePlayersScore = TextDrawCreateEx(354.000000,187.000000,homestr);

	TextDrawLetterSize(HomePlayersScore,0.3,0.9);
	TextDrawFont(HomePlayersScore,1);
	TextDrawSetOutline(HomePlayersScore,1);
	TextDrawColor(HomePlayersScore, 0xffffffff);

	TextDrawLetterSize(AwayPlayersScores,0.3,0.9);
	TextDrawFont(AwayPlayersScores,1);
	TextDrawSetOutline(AwayPlayersScores,1);
	TextDrawColor(AwayPlayersScores, 0xffffffff);

	TextDrawAlignment(HomePlayersScore,2);
	TextDrawAlignment(AwayPlayersScores,2);


 	format(homestr,sizeof(homestr),"Score: %d ~n~Rounds Won: %d", MatchInfo[TotalScoreHome], MatchInfo[HomeRoundsWon]);
	format(awaystr,sizeof(awaystr),"Score: %d ~n~Rounds Won: %d", MatchInfo[TotalScoreAway], MatchInfo[AwayRoundsWon]);

	AwayTotalScore = TextDrawCreateEx(310.000000,346.000000,awaystr);
	HomeTotalScore = TextDrawCreateEx(465.000000,346.000000,homestr);

	TextDrawBackgroundColor(AwayTotalScore,0x000000ff);
	TextDrawBackgroundColor(HomeTotalScore,0x000000ff);
	TextDrawFont(AwayTotalScore,3);
	TextDrawLetterSize(AwayTotalScore,0.5,1.0);
	TextDrawFont(HomeTotalScore,3);
	TextDrawAlignment(HomeTotalScore,2);
	TextDrawAlignment(AwayTotalScore,2);
	TextDrawLetterSize(HomeTotalScore,0.5,1.0);
	TextDrawColor(AwayTotalScore,GetTeamColor(1, T_AWAY) | 0x000000FF);
	TextDrawColor(HomeTotalScore,GetTeamColor(1, T_HOME)| 0x000000FF);
	TextDrawSetOutline(AwayTotalScore,1);
	TextDrawSetOutline(HomeTotalScore,1);
	TextDrawSetShadow(AwayTotalScore,1);
	TextDrawSetShadow(HomeTotalScore,1);
}

forward ShowServerMsg();
public ShowServerMsg()
{
    SaveServerInfoToFile();
	new creditmsg[256];
	format(creditmsg, 256, "{FFFFFF}%c%c%c \"{778899}TangE A/D{ADD8E6}\" Mode by {778899}[%s] %s", 187, 187, 187, ClanTag, CLAN_NAME);
	SendClientMessageToAllEx(COLOR_GREY,creditmsg);
	#if defined WEB_URL
	format(creditmsg, 256, "{FFFFFF}%c%c%c {778899}[{FFFFFF}%s{778899}] {ADD8E6}/help  /credits  /rules  /commands  /info", 187, 187, 187, WEB_URL);
	#else
	format(creditmsg, 256, "{FFFFFF}%c%c%c {ADD8E6}/help  /credits  /rules  /commands  /info", 187, 187, 187);
	#endif
	SendClientMessageToAllEx(COLOR_GREY,creditmsg);

	if(Server[pConnected] == 0) ResetScores();

	return 1;
}

forward PlayerStopRaging(playerid);

public PlayerStopRaging(playerid)
{
	Player[playerid][isRaging] = false;
}

forward TimeTextForPlayer(playerid, Text:text, time);
forward TimeTextForAll(Text:text, time);

forward HideTextTimerForPlayer(playerid, Text:text);
forward HideTextTimerForAll(Text:text);

public TimeTextForPlayer(playerid, Text:text, time)
{
    TextDrawShowForPlayer(playerid,text);
    SetTimerEx("HideTextTimerForPlayer",time,0,"ii", playerid, _:text); // _: from Simon
}

public HideTextTimerForPlayer(playerid, Text:text)
{
	TextDrawHideForPlayer(playerid, text);
}

public TimeTextForAll(Text:text, time)
{
	TextDrawShowForAll(text);
    SetTimerEx("HideTextTimerForAll",time,0,"i",_:text); // _: from Simon
}

public HideTextTimerForAll(Text:text)
{
	TextDrawHideForAll(text);
}

stock Basefile(baseid)
{
	new string[128];
	format(string,128,"combinations/bases/%d.ini",baseid);
	return string;
}

stock TDMfile(tdm_id)
{
	new string[128];
	format(string,128,"combinations/tdm/%d.ini",tdm_id);
	return string;
}

stock Duelfile(duel_id)
{
	new string[128];
	format(string,128,"combinations/duels/%d.ini",duel_id);
	return string;
}

stock DMfile(dm_id)
{
	new string[128];
	format(string,128,"combinations/dms/%d.ini",dm_id);
	return string;
}

stock Teleportfile(tp_id)
{
	new string[128];
	format(string,128,"combinations/teleports/%d.ini",tp_id);
	return string;
}

PlayerName(playerid)
{
	if(!IsPlayerConnected(playerid)) { new string[MAX_PLAYER_NAME] = "None."; return string; }
	return PlayerSavedNames[playerid];
}

PlayerName2(playerid)
{
	new pname[200];
	GetPlayerName(playerid,pname,200);
	return pname;
}

enum TopTurfOwners
{
	Zones,
	Exp,
	Team
}

new TopTeamList[MAX_DMS][MAX_PLAYERS][TopTurfOwners];


forward MainFunctions();
public MainFunctions()
{
	if(Server[pConnected] == 0) return 1;

	if(Round[Current] == -1)
	{
		TextDrawSetString(MapNameTD, "~w~~b~~h~~h~~h~~h~The Lobby");
		SendRconCommand("mapname Lobby");
	}

	new sb_string[256];
	format(sb_string,256,"%s %02d ~w~-",  HomeName,MatchInfo[HomeRoundsWon]);
	TextDrawSetString(ScoreboardHome, sb_string);
	format(sb_string,256,"%02d %s", MatchInfo[AwayRoundsWon], AwayName);
	TextDrawSetString(ScoreboardAway, sb_string);

	Server[ServerTicks]++;
	new badtime = Server[ServerTicks] - 2;

	for (new i = 0; i <= Server[HighestID]; i++)
	{
		if(IsPlayerConnected(i))
		{

			Player[i][secondsPlayed]++;

			if (Player[i][pMoney] == true && Player[i][pPlaying] == false) {
				GivePlayerMoney(i, 89);
			}

			if (Player[i][gSpectateID] != INVALID_PLAYER_ID && Player[i][Specing] == false) {
				SendClientMessageEx(i, COLOR_RED, "ERROR 1: SPECTATE VARIABLES MIXED UP. PLEASE REPORT THIS ERROR!");
			}
			if (Player[i][gSpectateID] == INVALID_PLAYER_ID && Player[i][Specing] == true) {
				SendClientMessageEx(i, COLOR_RED, "ERROR 2: SPECTATE VARIABLES MIXED UP. PLEASE REPORT THIS ERROR!");
			}

		    new fpsstr[100];
		    format(fpsstr,sizeof(fpsstr)," %d",Player[i][FPS2]-1);
			TextDrawSetString(FPS[i],fpsstr);

			if(Player[i][DM] != 0)
		    {
				Player[i][DMPlayTime] ++;
			}

	    	new string2[128];
			if (floatround(GetPlayerSpeed(i)) > 1) {
	    		if (Player[i][Tickrate] < 26) {
	    			format(string2, 128, "~w~~b~~h~~h~Tickrate: ~w~~r~%d~n~~w~~b~~h~~h~Ping: ~w~~y~~h~%d", Player[i][Tickrate], GetPlayerPing(i));
	    		} else {
	    			format(string2, 128, "~w~~b~~h~~h~Tickrate: ~w~~y~~h~%d~n~~w~~b~~h~~h~Ping: ~w~~y~~h~%d", Player[i][Tickrate], GetPlayerPing(i));
				}
	    		TextDrawSetString(fps_text[i], string2);
			} else {
	    		format(string2, 128, "~w~~b~~h~~h~Tickrate: ~w~~y~~h~N/A~n~~w~~b~~h~~h~Ping: ~w~~y~~h~%d", GetPlayerPing(i));
	    		TextDrawSetString(fps_text[i], string2);
			}

    		if (Config[diag] == 1) {
			    new pPing[100], tmp1[30], tmp2[30];
			    
      			if(Player[i][FPS2]-1 < 26) format(tmp1, sizeof(tmp1), "{FF0000}%d", Player[i][FPS2]-1);
			    else if(Player[i][FPS2]-1 < 45) format(tmp1, sizeof(tmp1), "{FFFF00}%d", Player[i][FPS2]-1);
			    else format(tmp1, sizeof(tmp1), "{33CC00}%d", Player[i][FPS2]-1);
			    
			    new p = GetPlayerPing(i);
			    
			    if(p < 100) format(tmp2, sizeof(tmp2), "{33CC00}%d", p);
			    else if(p < 175)  format(tmp2, sizeof(tmp2), "{FFFF00}%d", p);
			    else format(tmp2, sizeof(tmp2), "{FF0000}%d", p);
			    
				format(pPing, sizeof(pPing), "{33CC00}Ping: %s\n {33CC00}FPS: %s", tmp2, tmp1);
			    Update3DTextLabelText(PingLabels[i], GetPlayerColor(i), pPing);
			    Attach3DTextLabelToPlayer(PingLabels[i], i, 0, 0, -0.7);
			} else {
			    Update3DTextLabelText(PingLabels[i], COLOR_GREY, " ");
			}

			if(Player[i][pPlaying] && GetPlayerState(i) != PLAYER_STATE_SPECTATING  && Player[i][State] == STATE_UNPAUSED && Player[i][pTeam] != T_REF && Round[Current] != -1 && !Round[LoadScreen]) {
			    if(Player[i][LastUpdate] < badtime) {
			    	Player[i][State] = STATE_PAUSED;
			    	//OnPlayerPause(i);
				}
			}

			if(Player[i][vHud])
			{
				new speed[32];
			    if(Config[Speedmeter] == 1)
			    {
	    	        new Float:X, Float:Y, Float:Z, Float:Speed;
                	GetVehicleVelocity(GetPlayerVehicleID(VehicleInfo[Player[i][vHudID]][pDriver]), X, Y, Z);
               		Speed = floatmul(floatsqroot(floatadd(floatadd(floatpower(X, 2), floatpower(Y, 2)),  floatpower(Z, 2))), 100.0);
					if (isStringSame(GeoIP[VehicleInfo[Player[i][vHudID]][pDriver]][Country], "United States", 100)) {
						format(speed, 32,"%d mp/h", floatround(floatdiv(Speed, 1.609344), floatround_floor));
					} else {
						format(speed, 32,"%d km/h", floatround(Speed, floatround_floor));
					}
				}

			    new Float:health;
				GetVehicleHealth(Player[i][vHudID], health);
    			if(health >= 959.0 && health <= 1000.0) { TextDrawTextSize(veh6[Player[i][vHudID]], 115.0,50.0); }
				else if(health >= 918.0 && health < 959.0) { TextDrawTextSize(veh6[Player[i][vHudID]], 109.0,50.0); }
				else if(health >= 877.0 && health < 918.0) { TextDrawTextSize(veh6[Player[i][vHudID]], 103.0,50.0); }
				else if(health >= 836.0 && health < 877.0) { TextDrawTextSize(veh6[Player[i][vHudID]], 97.0,50.0); }
				else if(health >= 795.0 && health < 836.0) { TextDrawTextSize(veh6[Player[i][vHudID]], 91.0,50.0); }
				else if(health >= 754.0 && health < 795.0) { TextDrawTextSize(veh6[Player[i][vHudID]], 85.0,50.0); }
				else if(health >= 713.0 && health < 754.0) { TextDrawTextSize(veh6[Player[i][vHudID]], 79.0,50.0); }
				else if(health >= 672.0 && health < 713.0) { TextDrawTextSize(veh6[Player[i][vHudID]], 73.0,50.0); }
				else if(health >= 631.0 && health < 672.0) { TextDrawTextSize(veh6[Player[i][vHudID]], 67.0,50.0); }
				else if(health >= 590.0 && health < 631.0) { TextDrawTextSize(veh6[Player[i][vHudID]], 61.0,50.0); }
				else if(health >= 549.0 && health < 590.0) { TextDrawTextSize(veh6[Player[i][vHudID]], 55.0,50.0); }
				else if(health >= 508.0 && health < 549.0) { TextDrawTextSize(veh6[Player[i][vHudID]], 49.0,50.0); }
				else if(health >= 467.0 && health < 508.0) { TextDrawTextSize(veh6[Player[i][vHudID]], 43.0,50.0); }
				else if(health >= 426.0 && health < 467.0) { TextDrawTextSize(veh6[Player[i][vHudID]], 37.0,50.0); }
				else if(health >= 385.0 && health < 426.0) { TextDrawTextSize(veh6[Player[i][vHudID]], 31.0,50.0); }
				else if(health >= 344.0 && health < 385.0) { TextDrawTextSize(veh6[Player[i][vHudID]], 27.0,50.0); }
				else if(health >= 303.0 && health < 344.0) { TextDrawTextSize(veh6[Player[i][vHudID]], 25.0,50.0); }
				else if(health >= 262.0 && health < 303.0) { TextDrawTextSize(veh6[Player[i][vHudID]], 23.0,50.0); }

				if(health < 262.0)
				{
				    new tmp_vehleave[200];
				    format(tmp_vehleave, 200, "~r~~h~%s!!", Server[LeaveVehicleMessage]);
				    TextDrawSetString(veh4[Player[i][vHudID]], tmp_vehleave);
					if(health >= 221.0 && health < 262.0) {
						TextDrawTextSize(veh6[Player[i][vHudID]], 20.0,50.0);
					}
					else if(health >= 180.0 && health < 221.0) {
						TextDrawTextSize(veh6[Player[i][vHudID]], 20.0,50.0);
					}
					else if(health >= 139.0 && health < 180.0) {
						TextDrawTextSize(veh6[Player[i][vHudID]], 20.0,50.0);
					}
					else if(health >= 98.0 && health < 139.0) {
						TextDrawTextSize(veh6[Player[i][vHudID]], 20.0,50.0);
					}
					else if(health >= 0.0 && health < 100.0) {
						TextDrawTextSize(veh6[Player[i][vHudID]], 20.0,50.0);
					}
				}
				else
				{
					new veh4_str[100];
					format(veh4_str, 100, "~g~~h~%s", VehicleName[GetVehicleModel(Player[i][vHudID])-400]);
					TextDrawSetString(veh4[Player[i][vHudID]], veh4_str);
				}

				TextDrawHideForPlayer(i,veh6[Player[i][vHudID]]);
				TextDrawShowForPlayer(i,veh6[Player[i][vHudID]]);

				new driver_name[64];
				if(IsPlayerConnected(VehicleInfo[Player[i][vHudID]][pDriver]))
				{
				    if(Round[Current] != -1)
  						format(driver_name, 64, "%s %s", RemoveClanTagFromName(VehicleInfo[Player[i][vHudID]][pDriver]), ReturnPlayerWeaponsStringSmall(VehicleInfo[Player[i][vHudID]][pDriver]));
					else
						format(driver_name, 64, "%s", RemoveClanTagFromName(VehicleInfo[Player[i][vHudID]][pDriver]));
				}
				else
				{
				    format(driver_name, 64, "None");
				}
				new pass1_name[64];
				if(IsPlayerConnected(VehicleInfo[Player[i][vHudID]][pPass1]))
				{
				    if(Round[Current] != -1)
				  	  	format(pass1_name, 64, "%s %s", RemoveClanTagFromName(VehicleInfo[Player[i][vHudID]][pPass1]), ReturnPlayerWeaponsStringSmall(VehicleInfo[Player[i][vHudID]][pPass1]));
					else
						format(pass1_name, 64, "%s", RemoveClanTagFromName(VehicleInfo[Player[i][vHudID]][pPass1]));

				}
				else
				{
				    format(pass1_name, 64, "None");
				}
				new pass2_name[64];
				if(IsPlayerConnected(VehicleInfo[Player[i][vHudID]][pPass2]))
				{
				    if(Round[Current] != -1)
				  	  	format(pass2_name, 64, "%s %s", RemoveClanTagFromName(VehicleInfo[Player[i][vHudID]][pPass2]), ReturnPlayerWeaponsStringSmall(VehicleInfo[Player[i][vHudID]][pPass2]));
					else
						format(pass2_name, 64, "%s", RemoveClanTagFromName(VehicleInfo[Player[i][vHudID]][pPass2]));
				}
				else
				{
				    format(pass2_name, 64, "None");
				}
				new pass3_name[64];
				if(IsPlayerConnected(VehicleInfo[Player[i][vHudID]][pPass3]))
				{
				    if(Round[Current] != -1)
				  	  	format(pass3_name, 64, "%s %s", RemoveClanTagFromName(VehicleInfo[Player[i][vHudID]][pPass3]), ReturnPlayerWeaponsStringSmall(VehicleInfo[Player[i][vHudID]][pPass3]));
					else
						format(pass3_name, 64, "%s", RemoveClanTagFromName(VehicleInfo[Player[i][vHudID]][pPass3]));
				}
				else
				{
				    format(pass3_name, 64, "None");
				}

				new vehplayers[512];
				format(vehplayers, 512, "            %s ~n~~y~Driver:~n~~w~ - %s~n~~n~~y~Passengers:~n~~w~ - %s~n~~w~ - %s~n~~w~ - %s", speed, driver_name, pass1_name, pass2_name, pass3_name);
				TextDrawSetString(veh7[Player[i][vHudID]], vehplayers);
			}

			if(IsPlayerConnected(i) && Player[i][vHud] == true && GetPlayerState(i) == PLAYER_STATE_ONFOOT && GetPlayerSurfingVehicleID(i) == INVALID_VEHICLE_ID)
			{
				HideVehicleHud(i, Player[i][vHudID]);
			}

			if(Player[i][DM] > 0 && Player[i][NamePrefix] != 6) //Player is a Sub
			{
				new string[256];
				format(string,256,"DM_%s",PlayerSavedNames[i]);
				SetPlayerName(i,string);
				Player[i][NamePrefix] = 6;
			}
			else if(Player[i][Status] == STATUS_SUB && Player[i][NamePrefix] != 2) //Player is a Sub
			{
				new string[256];
				format(string,256,"SUB_%s",PlayerSavedNames[i]);
				SetPlayerName(i,string);
				Player[i][NamePrefix] = 2;
			}
			else if(Player[i][Status] == STATUS_AFK && Player[i][NamePrefix] != 3) // Player is AFK
			{
				new string[256];
				format(string,256,"AFK_%s",PlayerSavedNames[i]);
				SetPlayerName(i,string);
   				Player[i][NamePrefix] = 3;
			}
			else if(Player[i][Status] == STATUS_DEAD && Round[Current] != -1 && Player[i][NamePrefix] != 4) //Player is DEAD during a round is played
			{
			    if(!strcmp(Server[DeadTag], "off", true)) { }
			    else {
					new string[256];
					format(string,256,"%s%s",Server[DeadTag], PlayerSavedNames[i]);
					SetPlayerName(i,string);
   					Player[i][NamePrefix] = 4;
   				}
			}
			else if(Player[i][Status] == STATUS_PLAYING && Player[i][DM] == 0)//Player is playing normally
			{
			    if(Player[i][NamePrefix] != 1)
			    {
					SetPlayerName(i,PlayerSavedNames[i]);
   					Player[i][NamePrefix] = 1;
				}
			}

			if(GetPlayerState(i) == PLAYER_STATE_SPECTATING)
			{
			    SetPlayerVirtualWorld2(i,GetPlayerVirtualWorld(Player[i][gSpectateID]));
			    SetPlayerInterior(i,GetPlayerInterior(Player[i][gSpectateID]));

				if(IsPlayerInAnyVehicle(Player[i][gSpectateID])) {
					//PlayerSpectateVehicle(i, GetPlayerVehicleID(Player[i][gSpectateID]));
					Player[i][gSpectateType] = SPECTATE_TYPE_VEHICLE;
				    ShowVehicleHud(i, GetPlayerVehicleID(Player[i][gSpectateID]));
				}
				else {
					//PlayerSpectatePlayer(i, Player[i][gSpectateID]);
					Player[i][gSpectateType] = SPECTATE_TYPE_PLAYER;
				}

				new Float:Px, Float:Py, Float:Pz;
   				GetPlayerPos(i, Px, Py, Pz);

                if (Px == 50.000000 && Py == 50.000000 && Pz == 50.000000) {
					if(IsPlayerInAnyVehicle(Player[i][gSpectateID])) {
						PlayerSpectateVehicle(i, GetPlayerVehicleID(Player[i][gSpectateID]));
					}
					else {
						PlayerSpectatePlayer(i, Player[i][gSpectateID]);
					}
                }
                //new posTest[100];
                //format(posTest, 100, "%f, %f, %f", Px, Py, Pz);
                //SendClientMessage(i, COLOR_WHITE, posTest);

			    new specfps1[100];
	    		if (Player[Player[i][gSpectateID]][FPS2]-1 == 0) {
			    	format(specfps1, 100, "~w~~b~~h~Ping: ~w~%d~n~~b~~h~FPS: ~w~N/A", Player[Player[i][gSpectateID]][FPS2]-1);
	    		} else if (Player[Player[i][gSpectateID]][FPS2]-1 < 25) {
			    	format(specfps1, 100, "~w~~b~~h~Ping: ~w~%d~n~~b~~h~FPS: ~r~%d", GetPlayerPing(Player[i][gSpectateID]), Player[Player[i][gSpectateID]][FPS2]-1);
	    		} else {
	    			format(specfps1, 100, "~w~~b~~h~Ping: ~w~%d~n~~b~~h~FPS: ~w~%d", GetPlayerPing(Player[i][gSpectateID]), Player[Player[i][gSpectateID]][FPS2]-1);
				}
			    TextDrawSetString(specfps[i], specfps1);
			    //get players Player[i][gSpectateID] weapons and set them on this td
			    TextDrawSetString(specweps5[i], RetPlayerWepsStrSpecText(Player[i][gSpectateID]));

			    if (Player[Player[i][gSpectateID]][DM] != 0) {
					TextDrawShowForPlayer(i, DMScores[Player[Player[i][gSpectateID]][DM]]);
				} else{
					for(new x = 0; x < MAX_DMS; x ++)
					{
						TextDrawHideForPlayer(i, DMScores[x]);
					}
				}
			}

			Player[i][Tickrate] = 0;
		}
	}
	return 1;
}



SortExpEnumeration(dm)
{
	new i, j, tempr, temp_team, max_id;
	for(i = 0; i < MAX_PLAYERS; i = i+1)
	{
	    if(IsPlayerConnected(i))
		    if(Player[i][DM] == dm)
		    {
		    	max_id = i;
		    	for (j=i+1;j<MAX_PLAYERS;j=j+1)
		    	{
		    	    if(IsPlayerConnected(j))
			    	    if(Player[j][DM] == dm)
				    	    if(TopTeamList[dm][j][Exp] > TopTeamList[dm][max_id][Exp])
									max_id = j;
				}
				tempr = TopTeamList[dm][i][Exp];
				TopTeamList[dm][i][Exp] = TopTeamList[dm][max_id][Exp];
				TopTeamList[dm][max_id][Exp] = tempr;
				temp_team = TopTeamList[dm][i][Team];
				TopTeamList[dm][i][Team] = TopTeamList[dm][max_id][Team];
				TopTeamList[dm][max_id][Team] = temp_team;
			}
	}
	return 1;
}

TallyExpPerGang(dm)
{
	//reset everything first
	for (new j=0;j<MAX_PLAYERS;j++)
	{
		if(Player[j][DM] == dm)
		{
		    new x = Player[j][DM];
	    	TopTeamList[x][j][Team] = j;
	    	TopTeamList[x][j][Zones] = 0;
	    	TopTeamList[x][j][Exp] = Player[j][TempDMKills];
		}
	}

	SortExpEnumeration(dm);
	return 1;
}

IsInvalidSkin(skinid)
{ 
	switch(skinid) {
	    case 74: return true;
	}
	if(skinid > 299 || skinid < 0) return true;

	return false;
}

new PLAYER_current_team[MAX_PLAYERS];
stock SAMP_SetPlayerTeam(playerid, teamid)
{
	PLAYER_current_team[playerid] =teamid;
	for (new p;p<Server[HighestID]+1;p++) if(IsPlayerConnected(p))
	{
		SetPlayerTeam(p,PLAYER_current_team[p]);
	}
}

GetCurrentFile()
{
	new type[200];
    if(Round[Gamemode] == BASE) {
		type = Basefile(Round[Current]); // A/D
	}
    if(Round[Gamemode] == TDM) {
		type = TDMfile(Round[Current]); // TDM
	}
	return type;
}

isStringSame(const string1[], const string2[], len) {
	for(new i = 0; i < len; i++) {
	    if(string1[i]!=string2[i])
	        return 0;
		if(string1[i] == 0 || string1[i] == '\n')
		    return 1;
	}
	return 1;
}

stock ReturnPlayerID(PlayerName[])
{
		new found=0, id;
		for(new i=0; i <= Server[HighestID]+1; i++)
		{
			if(IsPlayerConnected(i))
			{
		  		new foundname[MAX_PLAYER_NAME];
		  		GetPlayerName(i, foundname, MAX_PLAYER_NAME);
				new namelen = strlen(foundname);
				new bool:searched=false;
		    	for(new pos=0; pos <= namelen; pos++)
				{
					if(searched != true)
					{
						if(strfind(foundname,PlayerName,true) == pos)
						{
			                found++;
							id = i;
						}
					}
				}
			}
		}

		if(found == 1)
			return id;
		else
			return INVALID_PLAYER_ID;
}

forward IsNumeric(const string[]);
public IsNumeric(const string[])
{
	for (new i = 0, j = strlen(string); i < j; i++)
	{
		if(string[i] > '9' || string[i] < '0')	return 0;
	}
	return 1;
}

forward DuelCheck(playerid,killerid);
public DuelCheck(playerid,killerid)
{
	new string[256];
	if(!IsPlayerConnected(killerid))
	{
		if(Player[playerid][pDuel] > 0)
		{
  			format(string,256,"* %s ���� ��󿡼� �ڻ��ϼ̽��ϴ�.",PlayerName(playerid));
		    SendClientMessageToAllEx(COLOR_RED,string);
			new Duel = Player[playerid][pDuel];
			InDuel[Player[playerid][pDuel]] = 0;
			Player[playerid][pDuel] =0;
			SetPlayerVirtualWorld2(playerid, LOBBY_VW);
			SetPlayerArmour(playerid,0);
			SetPlayerHealth(playerid,100);
			SpawnPlayerEx(playerid);
			Player[playerid][setToPlay] = true;
			for(new i = 0; i<Server[HighestID]+1; i++)
			{
				if(IsPlayerConnected(i))
				{
					if(Player[i][pDuel] == Duel)
					{
						SetPlayerVirtualWorld2(i,LOBBY_VW);
						SetPlayerArmour(i,0);
						SetPlayerHealth(i,100);
						SpawnPlayerEx(i);
						Player[i][pDuel] =0;
						Player[i][setToPlay] = true;
					}
				}
			}
		}
	}
	else
	{
		if(Player[killerid][pDuel]>=1)
		{
			new Float:health = 0;
			new Float:armour = 0;
			GetPlayerHealth(killerid,health);
			GetPlayerArmour(killerid,armour);
		    format(string,256,"{37DB45}[Duel] {FFFFFF}\"%s\" {37DB45}���� {FFFFFF}\"%s\" {37DB45}���� ��󿡼� �׿����ϴ� (HP ����: %d)",PlayerName(killerid),PlayerName(playerid), floatround(health+armour));
		    SendClientMessageToAllEx(COLOR_ORANGE,string);

			Player[killerid][DuelsWon] ++;
			Player[playerid][DuelsLost] ++;

		    #if IRC == 1
			format(string, sizeof(string), "12* 7[Duel]3 %s killed3 %s 7in the duel!3(%d HP Left)", PlayerName(killerid), PlayerName(playerid), floatround(health+armour));
	    	CallRemoteFunction("DC_IRCForceSay", "s", string);
			#endif

			InDuel[Player[playerid][pDuel]] = 0;
			Player[playerid][pDuel] = 0;
			SetPlayerVirtualWorld2(playerid,LOBBY_VW);
			SetPlayerArmour(playerid,0);
			SetPlayerHealth(playerid,100);

			Player[killerid][pDuel] =0;
			SetPlayerVirtualWorld2(killerid,LOBBY_VW);
			SetPlayerArmour(killerid,0);
			SetPlayerHealth(killerid,100);
			SpawnPlayerEx(killerid);

			Player[killerid][setToPlay] = true;
			Player[playerid][setToPlay] = true;
			
		}
	}
	if(GetPlayerTeam(playerid) == T_REF || GetPlayerTeam(killerid) == T_REF) return 1;
	if(Player[playerid][InDuelWhenRound] == true && (Round[Current] != -1 || Server[EPRoundStarted] == true)) { SetTimerEx("AddPlayerToRound", 2000, 0, "d", playerid); Player[playerid][InDuelWhenRound] = false; }
	if(IsPlayerConnected(killerid) && Player[killerid][InDuelWhenRound] == true && (Round[Current] != -1 || Server[EPRoundStarted] == true)) { SetTimerEx("AddPlayerToRound", 2000, 0, "d", killerid); Player[killerid][InDuelWhenRound] = false; }
	
	return 1;
}

/* Setting player into a duel, don't touch this. If you want to edit/add duels you should do it ingame */
forward OnPlayerEnterDuel(playerid,duelid);
public OnPlayerEnterDuel(playerid,duelid)
{


	if(Player[playerid][pDuel] > 0)
		return SendClientMessageEx(playerid,COLOR_RED,"{37DB45}[Duel] {FFFFFF}����� �̹� ����� ���� �� �Դϴ�!");
	else if(InDuel[duelid] > 1)
		return SendClientMessageEx(playerid,COLOR_RED,"{37DB45}[Duel] {FFFFFF}�� ����� �ο��� �ִ��Դϴ�!");
	else if(Server[AllowDuels] == false)
		return SendClientMessageEx(playerid,COLOR_GREY,"Error: ����� ��Ȱ��ȭ�Ǿ��ֽ��ϴ�.");

	SetPlayerTeam(playerid,playerid);
	new string[256];
	SetPlayerWorldBoundsEx(playerid,9999.9,-9999.9,9999.9,-9999.9);
	ResetPlayerWeapons(playerid);

	SetPlayerInterior(playerid, 0);
	SetPlayerHealth(playerid,100);
	SetPlayerArmour(playerid,100);
	Player[playerid][pDuel] = duelid;
	Counting[duelid] = 3;
	Player[playerid][pDuel] = duelid;
	SetPlayerVirtualWorld2(playerid,duelid+100);
	SetCameraBehindPlayer(playerid);
	TogglePlayerControllable(playerid,false);
	Player[playerid][setToPlay] = false;
	InDuel[duelid] ++;
    format(string,256,"{37DB45}[Duel] {FFFFFF}\"%s\" {37DB45}����  \"%s\" ��� �����ϼ̽��ϴ� - /duel %d", PlayerName(playerid),DuelName[duelid],duelid);
	SendClientMessageToAllEx(COLOR_YELLOW,string);

	#if IRC == 1
    format(string,256,"12* 7[Duel] 3%s 7entered the 3%s 7Duel - /duel %d", PlayerName(playerid),DuelName[duelid],duelid);
	CallRemoteFunction("DC_IRCForceSay", "s", string);
	#endif

	if(DuelWeapons[duelid][0] != 0.0) GivePlayerWeaponEx(playerid,DuelWeapons[duelid][0],9999);
	if(DuelWeapons[duelid][0] != 0.0) GivePlayerWeaponEx(playerid,DuelWeapons[duelid][1],9999);
	if(DuelWeapons[duelid][0] != 0.0) GivePlayerWeaponEx(playerid,DuelWeapons[duelid][2],9999);
	if(DuelWeapons[duelid][0] != 0.0) GivePlayerWeaponEx(playerid,DuelWeapons[duelid][3],9999);
	if(DuelWeapons[duelid][0] != 0.0) GivePlayerWeaponEx(playerid,DuelWeapons[duelid][4],9999);

	SetPlayerInterior(playerid, floatround(DuelCoords[duelid][8]));
	if(InDuel[duelid] == 1)
	{
    	GameTextForPlayer(playerid, "~n~~n~~n~~r~wait for another player", 5000, 5);
		SetPlayerPos(playerid,DuelCoords[duelid][0], DuelCoords[duelid][1], DuelCoords[duelid][2]+2);
		SetPlayerFacingAngle(playerid,DuelCoords[duelid][3]);
		Player[playerid][duelTimer] = SetTimerEx("DuelWaiting", 20000, 0, "%d", playerid);
		Player[playerid][CancelDuel] = true;
	}
	else if(InDuel[duelid] == 2)
	{
		SetPlayerPos(playerid,DuelCoords[duelid][4], DuelCoords[duelid][5], DuelCoords[duelid][6]+2);
		SetPlayerFacingAngle(playerid,DuelCoords[duelid][7]);
		SetTimerEx("DuelCounting",1000,false,"i",duelid);
		Player[playerid][CancelDuel] = false;
	}
	SetCameraBehindPlayer(playerid);
	return 1;
}

forward DuelCounting(duelid);
public DuelCounting(duelid)
{
	if(Counting[duelid] > 0)
	{
		new str[256];
		format(str, sizeof (str), "%d", Counting[duelid]);
		for(new i=0; i<Server[HighestID]+1; i++)
		{
			if(IsPlayerConnected(i))
			{
				if(Player[i][pDuel] ==duelid)
				{
					PlayerPlaySound(i,1056,-2982.8105,472.6976,4.9141);
					GameTextForPlayer(i,str,1000,5);
				}
			}
		}
		SetTimerEx("DuelCounting",1000,false,"i",duelid);
		Counting[duelid]--;
	}
	else
	{
		for(new i=0; i<Server[HighestID]+1; i++)
		{
			if(IsPlayerConnected(i))
			{
				if(Player[i][pDuel] == duelid)
				{
					PlayerPlaySound(i,1056,-2982.8105,472.6976,4.9141);
					GameTextForPlayer(i,"~r~ GO GO GO",1000,5);
					#if defined SOUND_DUEL
		    			if (ConfigAudio[sndDuel] == true) {
							PlayAudioStreamForPlayerExEx(i, SOUND_DUEL);
						}
					#endif
					TogglePlayerControllable(i,true);
				}
			}
		}
	}
}

forward DuelWaiting(playerid);
public DuelWaiting(playerid)
{
	if(Player[playerid][CancelDuel] && Player[playerid][pDuel] > 0 && InDuel[Player[playerid][pDuel]] == 1)
	{
		Player[playerid][setToPlay] = true;
		InDuel[Player[playerid][pDuel]] = 0;
		Player[playerid][pDuel] =0;
		SpawnPlayerEx(playerid);
		Player[playerid][CancelDuel] = false;
		SendClientMessageEx(playerid,COLOR_GREY,"{37DB45}[Duel] {FFFFFF}����� ��󿡼� ������ϼ̽��ϴ�! (���� ������)");
		#if SAMP_VERSION == 2
			StopAudioStreamForPlayerEx(playerid);
		#endif
	}
}

stock ReturnWeaponID(WeaponName[]) {
	if(strfind("molotov",WeaponName,true)!= -1) return 18;
	for(new i = 0; i <= 46; i++) {
		switch(i) {
			case 0,19,20,21,44,45: continue;
			default: { new name[24]; GetWeaponName(i,name,24); if(strfind(name,WeaponName,true)!= -1) return i; }
		}
	}
	return -1;
}

GetXYInFrontOfPlayer(playerid, &Float:x, &Float:y, Float:distance)
{	// Created by Y_Less

	new Float:a;

	GetPlayerPos(playerid, x, y, a);
	GetPlayerFacingAngle(playerid, a);

	if(GetPlayerVehicleID(playerid)) {
	    GetVehicleZAngle(GetPlayerVehicleID(playerid), a);
	}

	x += (distance * floatsin(-a, degrees));
	y += (distance * floatcos(-a, degrees));
}

EditBase(playerid,baseid)
{
	new string[256];

	#if DATA_SYSTEM == 1
		format(string,128,"[Base Buildmode]: Editing Base File: '/bases/%d.ini'",baseid);
		SendClientMessageEx(playerid, COLOR_BUILDMODE,string);
		SendClientMessageEx(playerid, COLOR_BUILDMODE, "[Base Buildmode]: Go to the Coordinates and type /savebase to select and save your position.");
	#elseif DATA_SYSTEM == 2
		format(string,128,"[Base Buildmode]: Editing Base: %d",baseid);
		SendClientMessageEx(playerid, COLOR_BUILDMODE,string);
		SendClientMessageEx(playerid, COLOR_BUILDMODE, "[Base Buildmode]: Go to the Coordinates and type /savebase to select and save your position.");
		WorkingOnFileID = baseid;
		WorkingOnFileType = 1;
	#endif

	format(string,128,"combinations/bases/%d.ini",baseid);
	format(CreateFileString,256,"%s",string);

	return 1;
}

CreateBase(playerid,baseid)
{
	#if DATA_SYSTEM == 1
		new string[256];
		format(string,128,"[Base Buildmode]: Creating Base File: /bases/%d.ini'",baseid);
		SendClientMessageEx(playerid, COLOR_BUILDMODE,string);
		SendClientMessageEx(playerid, COLOR_BUILDMODE, "[Base Buildmode]: Go to the Coordinates and type /savebase to select and save your position.");

		format(string,128,"combinations/bases/%d.ini",baseid);

		dini_Create(string);
		format(CreateFileString,256,"%s",string);

		new year,month,day;
		getdate(year, month, day);
		new date[24];
		format(date,24,"%d/%d/%d",month,day,year);
		dini_Set(string,"date", date);
		dini_Set(string,"creator", PlayerName(playerid));
	#elseif DATA_SYSTEM == 2
	    #pragma unused baseid
		new string[256];
		format(CreateFileString,256,"%s",string);

		new year,month,day;
		getdate(year, month, day);
		new date[24];
		format(date,24,"%d/%d/%d",month,day,year);
		CreateSqlBase(date, PlayerName(playerid));
		WorkingOnFileID = LatestSqlBase();
		WorkingOnFileType = 1;

		format(string,128,"[Base Buildmode]: Creating Base: %d",WorkingOnFileID);
		SendClientMessageEx(playerid, COLOR_BUILDMODE,string);
		SendClientMessageEx(playerid, COLOR_BUILDMODE, "[Base Buildmode]: Go to the Coordinates and type /savebase to select and save your position.");
	#endif
	return 1;
}


SetPlayerToViewBase(playerid,baseid)
{
	new string[256];
	new Float:Floats[3];

	Player[playerid][ViewBaseID] = baseid;

	Floats[0] = BaseVariables[baseid][BaseCheckpoint][0];
	Floats[1] = BaseVariables[baseid][BaseCheckpoint][1];
	Floats[2] = BaseVariables[baseid][BaseCheckpoint][2];

	new interior = BaseVariables[baseid][Interior];

	SetPlayerInterior(playerid,interior);
	SetPlayerPos(playerid,Floats[0],Floats[1],Floats[2]);
	SetPlayerWorldBoundsEx(playerid,9999.9,-9999.9,9999.9,-9999.9);
	SetPlayerCameraPos(playerid,Floats[0]-40,Floats[1]-30,Floats[2]+60);
	SetPlayerCameraLookAt(playerid,Floats[0],Floats[1],Floats[2]);
	TogglePlayerControllable(playerid, 0);
	format(string,256,"~n~~n~~n~~n~~n~~n~~n~~n~~r~BASE: ~w~%d ~n~~y~%s",baseid,BaseVariables[baseid][About]);
	GameTextForPlayer(playerid,string,10000,3);
	return 1;
}

EditTDM(playerid,baseid)
{
	new string[256];

	#if DATA_SYSTEM == 1
		format(string,128,"[TDM Buildmode]: Editing TDM: 'tdm/%d.ini'",baseid);
		SendClientMessageEx(playerid, COLOR_BUILDMODE,string);
		SendClientMessageEx(playerid, COLOR_BUILDMODE, "[TDM Buildmode]: Go to the Coordinates and type /savetdm to select and save your position.");
	#elseif DATA_SYSTEM == 2
		format(string,128,"[TDM Buildmode]: Editing TDM: %d'",baseid);
		SendClientMessageEx(playerid, COLOR_BUILDMODE,string);
		SendClientMessageEx(playerid, COLOR_BUILDMODE, "[TDM Buildmode]: Go to the Coordinates and type /savetdm to select and save your position.");
		WorkingOnFileID = baseid;
		WorkingOnFileType = 2;
	#endif

	format(string,128,"combinations/tdm/%d.ini",baseid);

	format(CreateFileString,256,"%s",string);
	return 1;
}

CreateTDM(playerid,baseid)
{
	#if DATA_SYSTEM == 1
		new string[256];
		format(string,128,"[TDM Buildmode]: Creating TDM File: 'tdm/%d.ini'",baseid);
		SendClientMessageEx(playerid, COLOR_BUILDMODE,string);
		SendClientMessageEx(playerid, COLOR_BUILDMODE, "[TDM Buildmode]: Go to the Coordinates and type /savetdm to select and save your position.");

		format(string,128,"combinations/tdm/%d.ini",baseid);

		dini_Create(string);
		format(CreateFileString,256,"%s",string);
	#elseif DATA_SYSTEM == 2
	    #pragma unused baseid
	 	new string[256];
		format(CreateFileString,256,"%s",string);
		new year,month,day;
		getdate(year, month, day);
		new date[24];
		format(date,24,"%d/%d/%d",month,day,year);
		CreateSqlTDM();
		WorkingOnFileID = LatestSqlTDM();
		WorkingOnFileType = 2;

		format(string,128,"[TDM Buildmode]: Creating TDM: %d",WorkingOnFileID);
		SendClientMessageEx(playerid, COLOR_BUILDMODE,string);
		SendClientMessageEx(playerid, COLOR_BUILDMODE, "[TDM Buildmode]: Go to the Coordinates and type /savetdm to select and save your position.");
	#endif

	return 1;
}


SetPlayerToViewTDM(playerid,baseid)
{
	new Float:Floats[3];
	new string[256];

	Player[playerid][ViewTDMID] = baseid;

	Floats[0] = ArenaVariables[baseid][ArenaCheckpoint][0];
	Floats[1] = ArenaVariables[baseid][ArenaCheckpoint][1];
	Floats[2] = ArenaVariables[baseid][ArenaCheckpoint][2];

	new interior = ArenaVariables[baseid][Interior];


	SetPlayerInterior(playerid,interior);
	SetPlayerPos(playerid,Floats[0],Floats[1],Floats[2]+2);
	SetPlayerWorldBoundsEx(playerid,9999.9,-9999.9,9999.9,-9999.9);
	SetPlayerCameraLookAt(playerid,Floats[0],Floats[1],Floats[2]);
	SetPlayerCameraPos(playerid,Floats[0]-40,Floats[1]-30,Floats[2]+60);
	TogglePlayerControllable(playerid, 0);
	format(string,256,"~n~~n~~n~~n~~n~~n~~n~~n~~r~TDM: ~w~%d~n~~y~%s",baseid, ArenaVariables[baseid][About]);
	GameTextForPlayer(playerid,string,10000,3);
	return 1;
}

LoadTotalTDMs()
{
    Server[TotalTDMs] = 0;

	new desc[48];
	new index = 1, idx2 = 1;
	
	#if DATA_SYSTEM == 1
		for(new i = 1; i < MAX_ARENAS; i++)
		{
		    new farena[256];
		    new string[128];
			format(string,128,"combinations/tdm/%d.ini",i);
		    if(dini_Exists(string))
		    {
				Server[TotalTDMs]++;

				LoadArenaVariablesINI(i);

				if (Server[HighestTdmID] < i) {
	                Server[HighestTdmID] = i;
		        }

	            farena = TDMfile(i);

				if(i <= 35)
				{
					ArenasTextdraws[i] = TextDrawCreateEx(30.0, 30.0+ i*10," ");
					TextDrawFont(ArenasTextdraws[i],1);
					TextDrawLetterSize(ArenasTextdraws[i],0.4,1.2);
					TextDrawColor(ArenasTextdraws[i],0xFFFFFFFF);
					TextDrawSetShadow(ArenasTextdraws[i],1);
					TextDrawSetOutline(ArenasTextdraws[i],1);
					TextDrawBackgroundColor(ArenasTextdraws[i],0x000000AA);
				}
				else if(i > 35 && i <= 70)
				{
					ArenasTextdraws[i] = TextDrawCreateEx(235.0, 30.0+ index*10," ");
					TextDrawFont(ArenasTextdraws[i],1);
					TextDrawLetterSize(ArenasTextdraws[i],0.4,1.2);
					TextDrawColor(ArenasTextdraws[i],0xFFFFFFFF);
					TextDrawSetShadow(ArenasTextdraws[i],1);
					TextDrawSetOutline(ArenasTextdraws[i],1);
					TextDrawBackgroundColor(ArenasTextdraws[i],0x000000AA);
					index ++;

				}
				else if(i > 70 && i <= 105)
				{
					ArenasTextdraws[i] = TextDrawCreateEx(440.0, 30.0+ idx2*10," ");
					TextDrawFont(ArenasTextdraws[i],1);
					TextDrawLetterSize(ArenasTextdraws[i],0.4,1.2);
					TextDrawColor(ArenasTextdraws[i],0xFFFFFFFF);
					TextDrawSetShadow(ArenasTextdraws[i],1);
					TextDrawSetOutline(ArenasTextdraws[i],1);
					TextDrawBackgroundColor(ArenasTextdraws[i],0x000000AA);
					idx2 ++;

				}
				
				new test[256];
				format(test,256,"%s",dini_Get(farena,"about"));

				if(strlen(test) > 24) //Reduce the about in case its too big
				{
					new str[256];
					format(str,256,"%s", dini_Get(farena,"about"));
				    new desc2[48];
					for(new x = 0; x < 22; x++)
					{
					    desc2[x] = str[x];
					}
					format(desc,48,"~y~%d ~p~%s...", i, desc2);
				}
				else
				{
					format(desc,48,"~y~%d ~p~%s", i, dini_Get(farena,"about"));
				}
		 		TextDrawSetString(ArenasTextdraws[i], desc);
			}
			else { continue; }
		}
	
	#elseif DATA_SYSTEM == 2
	
   		new query[200];
		format(query, sizeof(query), "SELECT * FROM dc_tdm ORDER BY id DESC");
		mysql_query(query);
		Server[SQLQueriesExecuted]++;
		mysql_store_result();
		new templine[200];
		while(mysql_fetch_row_format(templine, "|"))
		{
			new idx, idx3;
			new info[256];

			info = mysql_strtok(templine, idx, "|");
			new tdmid = strval(info);

			Server[TotalTDMs]++;

			if (Server[HighestTdmID] < tdmid) {
                Server[HighestTdmID] = tdmid;
	        }

	        if(tdmid <= 35)
			{
				ArenasTextdraws[tdmid] = TextDrawCreateEx(30.0, 30.0+ tdmid*10," ");
				TextDrawFont(ArenasTextdraws[tdmid],1);
				TextDrawLetterSize(ArenasTextdraws[tdmid],0.4,1.2);
				TextDrawColor(ArenasTextdraws[tdmid],0xFFFFFFFF);
				TextDrawSetShadow(ArenasTextdraws[tdmid],1);
				TextDrawSetOutline(ArenasTextdraws[tdmid],1);
				TextDrawBackgroundColor(ArenasTextdraws[tdmid],0x000000AA);
				index ++;
			}
			else if(tdmid > 35 && tdmid <= 70)
			{
				ArenasTextdraws[tdmid] = TextDrawCreateEx(235.0, 30.0+ index*10," ");
				TextDrawFont(ArenasTextdraws[tdmid],1);
				TextDrawLetterSize(ArenasTextdraws[tdmid],0.4,1.2);
				TextDrawColor(ArenasTextdraws[tdmid],0xFFFFFFFF);
				TextDrawSetShadow(ArenasTextdraws[tdmid],1);
				TextDrawSetOutline(ArenasTextdraws[tdmid],1);
				TextDrawBackgroundColor(ArenasTextdraws[tdmid],0x000000AA);

			}
			else if(tdmid > 70 && tdmid <= 105)
			{
				ArenasTextdraws[tdmid] = TextDrawCreateEx(440.0, 30.0+ idx2*10," ");
				TextDrawFont(ArenasTextdraws[tdmid],1);
				TextDrawLetterSize(ArenasTextdraws[tdmid],0.4,1.2);
				TextDrawColor(ArenasTextdraws[tdmid],0xFFFFFFFF);
				TextDrawSetShadow(ArenasTextdraws[tdmid],1);
				TextDrawSetOutline(ArenasTextdraws[tdmid],1);
				TextDrawBackgroundColor(ArenasTextdraws[tdmid],0x000000AA);
				idx2 ++;
			}
			
			info = mysql_strtok(templine, idx, "|");
			
			format(ArenaVariables[tdmid][About],256,"%s", info);
		    if(strlen(ArenaVariables[tdmid][About]) < 1)
		    {
				format(ArenaVariables[tdmid][About],256," ");
			}
			
			
			if(strlen(info) > 24) //Reduce the about in case its too big
			{
			    new desc2[48];
				for(new x = 0; x < 22; x++)
				{
				    desc2[x] = info[x];
				}
				format(desc,48,"~y~%d ~p~%s...", tdmid, desc2);
			}
			else
			{
				format(desc,48,"~y~%d ~p~%s", tdmid, info);
			}
		 	TextDrawSetString(ArenasTextdraws[tdmid], desc);

			info = mysql_strtok(templine, idx, "|");
			ArenaVariables[tdmid][WorldTime] = strval(info);
			
			info = mysql_strtok(templine, idx, "|");
			ArenaVariables[tdmid][Interior] = strval(info);

			info = mysql_strtok(templine, idx, "|");
			idx3 = 0;
			ArenaVariables[tdmid][Min_X] = floatstr(strtok(info,idx3,','));
			ArenaVariables[tdmid][Min_y] = floatstr(strtok(info,idx3,','));

			info = mysql_strtok(templine, idx, "|");
			idx3 = 0;
			ArenaVariables[tdmid][Max_X] = floatstr(strtok(info,idx3,','));
			ArenaVariables[tdmid][Max_Y] = floatstr(strtok(info,idx3,','));

			info = mysql_strtok(templine, idx, "|");
			idx3 = 0;
			ArenaVariables[tdmid][AttSpawn][0] = floatstr(strtok(info,idx3,','));
			ArenaVariables[tdmid][AttSpawn][1] = floatstr(strtok(info,idx3,','));
			ArenaVariables[tdmid][AttSpawn][2] = floatstr(strtok(info,idx3,','));

			info = mysql_strtok(templine, idx, "|");
			idx3 = 0;
			ArenaVariables[tdmid][DefSpawn][0] = floatstr(strtok(info,idx3,','));
			ArenaVariables[tdmid][DefSpawn][1] = floatstr(strtok(info,idx3,','));
			ArenaVariables[tdmid][DefSpawn][2] = floatstr(strtok(info,idx3,','));

			info = mysql_strtok(templine, idx, "|");
			idx3 = 0;
			ArenaVariables[tdmid][ArenaCheckpoint][0] = floatstr(strtok(info,idx3,','));
			ArenaVariables[tdmid][ArenaCheckpoint][1] = floatstr(strtok(info,idx3,','));
			ArenaVariables[tdmid][ArenaCheckpoint][2] = floatstr(strtok(info,idx3,','));
		}

   	#endif
   	
	//Delete3DTextLabel(Server[lobby1_text3d]);
	Delete3DTextLabel(Server[lobby2_text3d]);
	//Server[lobby1_text3d] = Create3DTextLabel("", COLOR_WHITE, Lobby[0], Lobby[1], Lobby[2]+0.4, 30, LOBBY_VW);
	new lobby2_text[256];
	format(lobby2_text, 256 , "Deadly Combinations�� ���� ���� ȯ���մϴ�\n{FFFFFF}�κ�\nA/D �� ������ġ\nBases: %d - TDMs: %d\n{BABABA}/help /commands /info /rules /credits", Server[TotalBases], Server[TotalTDMs]);
	Server[lobby2_text3d] = Create3DTextLabel(lobby2_text, COLOR_GREYBLUE, Lobby[0], Lobby[1], Lobby[2]+0.2, 150, LOBBY_VW);
	printf("  -> %d TDMs Loaded",Server[TotalTDMs]);
	return 1;
}

/*
		new query[200];

		format(query, sizeof(query), "SELECT * FROM dc_audio");
		mysql_query(query);
		mysql_store_result();
		new templine[200];
		while(mysql_fetch_row_format(templine, "|"))
		{
			new idx;
			new audio_var[256];
			new audio_data[256];

			audio_var = mysql_strtok(templine, idx, "|");
			audio_data = mysql_strtok(templine, idx, "|");
			new adata = strval(audio_data);

			if (isStringSame(audio_var, "voicemsgs", 256)) {
				ConfigAudio[sndVoiceMsgs] = bool:adata;
			} else if (isStringSame(audio_var, "choppers", 256)) {
			    ConfigAudio[sndChoppers] = bool:adata;
			}
		}
*/

LoadTotalBases()
{
    Server[TotalBases] = 0;

	new index = 1, idx2 = 1;
	new desc[48];
	
	#if DATA_SYSTEM == 1
	
	for(new i = 1; i < MAX_BASES; i++)
	{
		new string[128];
		format(string,128,"combinations/bases/%d.ini",i);
	    if(dini_Exists(string))
	    {
			Server[TotalBases]++;
			new fbase[256];
			fbase = Basefile(i);

			LoadBaseVariablesINI(i);

			if (Server[HighestBaseID] < i) {
                Server[HighestBaseID] = i;
	        }

			if(i <= 35)
			{
				BasesTextdraws[i] = TextDrawCreateEx(30.0, 30.0+ i*10," ");
				TextDrawFont(BasesTextdraws[i],1);
				TextDrawLetterSize(BasesTextdraws[i],0.4,1.2);
				TextDrawColor(BasesTextdraws[i],0xFFFFFFFF);
				TextDrawSetShadow(BasesTextdraws[i],1);
				TextDrawSetOutline(BasesTextdraws[i],1);
				TextDrawBackgroundColor(BasesTextdraws[i],0x000000AA);
			}
			else if(i > 35 && i <= 70)
			{
				BasesTextdraws[i] = TextDrawCreateEx(235.0, 30.0+ index*10," ");
				TextDrawFont(BasesTextdraws[i],1);
				TextDrawLetterSize(BasesTextdraws[i],0.4,1.2);
				TextDrawColor(BasesTextdraws[i],0xFFFFFFFF);
				TextDrawSetShadow(BasesTextdraws[i],1);
				TextDrawSetOutline(BasesTextdraws[i],1);
				TextDrawBackgroundColor(BasesTextdraws[i],0x000000AA);
				index ++;

			}
			else if(i > 70 && i <= 105)
			{
				BasesTextdraws[i] = TextDrawCreateEx(440.0, 30.0+ idx2*10," ");
				TextDrawFont(BasesTextdraws[i],1);
				TextDrawLetterSize(BasesTextdraws[i],0.4,1.2);
				TextDrawColor(BasesTextdraws[i],0xFFFFFFFF);
				TextDrawSetShadow(BasesTextdraws[i],1);
				TextDrawSetOutline(BasesTextdraws[i],1);
				TextDrawBackgroundColor(BasesTextdraws[i],0x000000AA);
				idx2 ++;

			}

			new test[256];
			format(test,256,"%s",dini_Get(fbase,"about"));

			if(strlen(test) > 24) //Reduce the about in case its too big
			{
				new str[256];
				format(str,256,"%s", dini_Get(fbase,"about"));

			    new desc2[48];
				for(new x = 0; x < 22; x++)
				{
				    desc2[x] = str[x];
				}
				format(desc,48,"~y~%d ~p~%s...", i, desc2);
			}
			else
			{
				format(desc,48,"~y~%d ~p~%s", i, dini_Get(fbase,"about"));
			}

	 		TextDrawSetString(BasesTextdraws[i], desc);
		}
		else
		{ continue; }
   	}
   	
   	#elseif DATA_SYSTEM == 2
   	
   		new query[200];
		format(query, sizeof(query), "SELECT * FROM dc_bases ORDER BY id DESC");
		mysql_query(query);
		Server[SQLQueriesExecuted]++;
		mysql_store_result();
		new templine[200];
		while(mysql_fetch_row_format(templine, "|"))
		{
			new idx;
			new info[256];

			info = mysql_strtok(templine, idx, "|");
			new baseid = strval(info);

			Server[TotalBases]++;
			
			if (Server[HighestBaseID] < baseid) {
                Server[HighestBaseID] = baseid;
	        }
	        
	        if(baseid <= 35)
			{
				BasesTextdraws[baseid] = TextDrawCreateEx(30.0, 30.0+ baseid*10," ");
				TextDrawFont(BasesTextdraws[baseid],1);
				TextDrawLetterSize(BasesTextdraws[baseid],0.4,1.2);
				TextDrawColor(BasesTextdraws[baseid],0xFFFFFFFF);
				TextDrawSetShadow(BasesTextdraws[baseid],1);
				TextDrawSetOutline(BasesTextdraws[baseid],1);
				TextDrawBackgroundColor(BasesTextdraws[baseid],0x000000AA);
			}
			else if(baseid > 35 && baseid <= 70)
			{
				BasesTextdraws[baseid] = TextDrawCreateEx(235.0, 30.0+ index*10," ");
				TextDrawFont(BasesTextdraws[baseid],1);
				TextDrawLetterSize(BasesTextdraws[baseid],0.4,1.2);
				TextDrawColor(BasesTextdraws[baseid],0xFFFFFFFF);
				TextDrawSetShadow(BasesTextdraws[baseid],1);
				TextDrawSetOutline(BasesTextdraws[baseid],1);
				TextDrawBackgroundColor(BasesTextdraws[baseid],0x000000AA);
				index ++;

			}
			else if(baseid > 70 && baseid <= 105)
			{
				BasesTextdraws[baseid] = TextDrawCreateEx(440.0, 30.0+ idx2*10," ");
				TextDrawFont(BasesTextdraws[baseid],1);
				TextDrawLetterSize(BasesTextdraws[baseid],0.4,1.2);
				TextDrawColor(BasesTextdraws[baseid],0xFFFFFFFF);
				TextDrawSetShadow(BasesTextdraws[baseid],1);
				TextDrawSetOutline(BasesTextdraws[baseid],1);
				TextDrawBackgroundColor(BasesTextdraws[baseid],0x000000AA);
				idx2 ++;

			}

			info = mysql_strtok(templine, idx, "|");
			
	  		if(strlen(info) > 0) // Check if Base has a valid creation date
		    {
				format(BaseVariables[baseid][CreationDate],256,info);
			}
			else // If not, make the creation date the actual day
			{
				new year,month,day;
				getdate(year, month, day);
				new date[24];
				format(date,24,"%d/%d/%d",month,day,year);
				new query2[200];
				format(query2, sizeof(query2), "UPDATE dc_bases SET date = '%s' WHERE id = '%d'", date, baseid);
				mysql_query(query2);
				Server[SQLQueriesExecuted]++;
				format(BaseVariables[baseid][CreationDate],256,date);
		    }

			info = mysql_strtok(templine, idx, "|");
			
	     	if(strlen(info) > 0) // Check if Base has a valid creator name
		    {
				format(BaseVariables[baseid][Creator],256,info);
			}
			else // If not, make the creator current clan
			{
				new query2[200];
				format(query2, sizeof(query2), "UPDATE dc_bases SET creator = '%s' WHERE id = '%d'", CLAN_NAME, baseid);
				mysql_query(query2);
				Server[SQLQueriesExecuted]++;
				format(BaseVariables[baseid][Creator],256,CLAN_NAME);
		    }
	 		
			info = mysql_strtok(templine, idx, "|");
			new played = strval(info);
			BaseVariables[baseid][TimesPlayed] = played;
			
			info = mysql_strtok(templine, idx, "|");
			BaseVariables[baseid][BaseCheckpoint][0] = floatstr(info);
			info = mysql_strtok(templine, idx, "|");
			BaseVariables[baseid][BaseCheckpoint][1] = floatstr(info);
			info = mysql_strtok(templine, idx, "|");
			BaseVariables[baseid][BaseCheckpoint][2] = floatstr(info);

			info = mysql_strtok(templine, idx, "|");
			new baseint = strval(info);
			BaseVariables[baseid][Interior] = baseint;
			
			info = mysql_strtok(templine, idx, "|");
			BaseVariables[baseid][DefSpawn][0] = floatstr(info);
			info = mysql_strtok(templine, idx, "|");
			BaseVariables[baseid][DefSpawn][1] = floatstr(info);
			info = mysql_strtok(templine, idx, "|");
			BaseVariables[baseid][DefSpawn][2] = floatstr(info);

			info = mysql_strtok(templine, idx, "|");
			BaseVariables[baseid][AttSpawn][0] = floatstr(info);
			info = mysql_strtok(templine, idx, "|");
			BaseVariables[baseid][AttSpawn][1] = floatstr(info);
			info = mysql_strtok(templine, idx, "|");
			BaseVariables[baseid][AttSpawn][2] = floatstr(info);
			
			info = mysql_strtok(templine, idx, "|");
			if(strlen(info) < 1)
		    {
				format(BaseVariables[baseid][About],256,"Custom Base");
			}
			else
			{
				format(BaseVariables[baseid][About],256,"%s", info);
			}
			
			if(strlen(BaseVariables[baseid][About]) > 24) //Reduce the about in case its too big
			{
				new str[256];
				format(str,256,"%s", BaseVariables[baseid][About]);

			    new desc2[48];
				for(new x = 0; x < 22; x++)
				{
				    desc2[x] = str[x];
				}
				format(desc,48,"~y~%d ~p~%s...", baseid, desc2);
			}
			else
			{
				format(desc,48,"~y~%d ~p~%s", baseid, BaseVariables[baseid][About]);
			}

	 		TextDrawSetString(BasesTextdraws[baseid], desc);
	 		
			info = mysql_strtok(templine, idx, "|");
			new basetime = strval(info);
			BaseVariables[baseid][AttWins] = basetime;
			
			info = mysql_strtok(templine, idx, "|");
			new baseattwins = strval(info);
			BaseVariables[baseid][AttWins] = baseattwins;
			
			info = mysql_strtok(templine, idx, "|");
			new basedefwins = strval(info);
			BaseVariables[baseid][DefWins] = basedefwins;
		}
   	
   	#endif
   	
	Delete3DTextLabel(Server[lobby2_text3d]);
	new lobby2_text[256];
	format(lobby2_text, 256 , "TangE A/D�� ���� ���� ȯ���մϴ�\n{FFFFFF}�κ�\nA/D �� ������ġ\nBases: %d - TDMs: %d\n{BABABA}/help /commands /info /rules /credits\n{00FF00}��� ���: D.C A/D              ������:TangE", Server[TotalBases], Server[TotalTDMs]);
	Server[lobby2_text3d] = Create3DTextLabel(lobby2_text, COLOR_GREYBLUE, Lobby[0], Lobby[1], Lobby[2]+0.2, 150, LOBBY_VW);
	printf("  -> %d Bases Loaded", Server[TotalBases]);
	return 1;
}

#if DATA_SYSTEM == 1

LoadBaseVariablesINI(baseid)
{
	new fbase[256], idx, string[256];
	fbase = Basefile(baseid);

	if(dini_Exists(fbase))
	{
		BaseVariables[baseid][WorldTime] = dini_Int(fbase,"time");
		BaseVariables[baseid][Interior] = dini_Int(fbase,"interior");

		BaseVariables[baseid][AttWins] = dini_Int(fbase,"attwins");
		BaseVariables[baseid][DefWins] = dini_Int(fbase,"defwins");
		BaseVariables[baseid][TimesPlayed] = dini_Int(fbase,"played");

		if(!dini_Isset(fbase,"time"))
		{
			BaseVariables[baseid][WorldTime] = -1;
		}

		idx = 0;
		string = dini_Get(fbase,"d_0");
		BaseVariables[baseid][DefSpawn][0] = floatstr(strtok(string,idx,','));
		BaseVariables[baseid][DefSpawn][1] = floatstr(strtok(string,idx,','));
		BaseVariables[baseid][DefSpawn][2] = floatstr(strtok(string,idx,','));

		idx = 0;
		string = dini_Get(fbase,"home");
		BaseVariables[baseid][BaseCheckpoint][0] = floatstr(strtok(string,idx,','));
		BaseVariables[baseid][BaseCheckpoint][1] = floatstr(strtok(string,idx,','));
		BaseVariables[baseid][BaseCheckpoint][2] = floatstr(strtok(string,idx,','));

	    idx = 0;
		string = dini_Get(fbase,"a_0");
		BaseVariables[baseid][AttSpawn][0] = floatstr(strtok(string,idx,','));
		BaseVariables[baseid][AttSpawn][1] = floatstr(strtok(string,idx,','));
		BaseVariables[baseid][AttSpawn][2] = floatstr(strtok(string,idx,','));

	    if(!dini_Isset(fbase, "about"))
		{
			format(BaseVariables[baseid][About],256,"Custom Base");
		}
		else
		{
			format(BaseVariables[baseid][About],256,"%s", dini_Get(fbase,"about"));
		}

	  	if(dini_Isset(fbase, "date")) // Check if Base has a valid creation date
		{
			format(BaseVariables[baseid][CreationDate],256,dini_Get(fbase,"date"));
		}
		else // If not, make the creation date the actual day
		{
			new year,month,day;
			getdate(year, month, day);
			new date[24];
			format(date,24,"%d/%d/%d",month,day,year);
			dini_Set(fbase,"date", date);
		}

		if(dini_Isset(fbase, "creator")) // Check if Base has a valid creator name
		{
			format(BaseVariables[baseid][Creator],256,dini_Get(fbase,"creator"));
		}
		else // If not, make the creator [KR] clan
		{
			dini_Set(fbase,"creator", "Killadel Rydaz");
   		}
	}
}

#endif

/*
	These are functions I used to export all ini bases and tdms to SQL database

base_test()
{
	new fbase[256], idx, string[256], locs[200];
	for(new i; i < MAX_BASES+1; i++)
	{
		fbase = Basefile(i);
		if(dini_Exists(fbase))
		{
			new year,month,day;
			getdate(year, month, day);
			new date[24];
			format(date,24,"%d/%d/%d",month,day,year);

	     	if(dini_Isset(fbase, "creator")) // Check if Base has a valid creator name
		    {
                CreateSqlBase(date, dini_Get(fbase,"creator"));
			} else {
			    CreateSqlBase(date, "Killadel Rydaz");
			}

			new bid = LatestSqlBase();

			if(dini_Isset(fbase,"time"))
			{
				UpdateSqlBaseInt(bid, "time", dini_Int(fbase,"time"));
			}

			if(dini_Isset(fbase,"interior"))
			{
				UpdateSqlBaseInt(bid, "interior", dini_Int(fbase,"interior"));
			}

			idx = 0;
			string = dini_Get(fbase,"d_0");
			BaseVariables[i][DefSpawn][0] = floatstr(strtok(string,idx,','));
			BaseVariables[i][DefSpawn][1] = floatstr(strtok(string,idx,','));
			BaseVariables[i][DefSpawn][2] = floatstr(strtok(string,idx,','));
			format(locs, 200, "%f", BaseVariables[i][DefSpawn][0]);
			UpdateSqlBaseStr(bid, "d_x", locs);
			format(locs, 200, "%f", BaseVariables[i][DefSpawn][1]);
			UpdateSqlBaseStr(bid, "d_y", locs);
			format(locs, 200, "%f", BaseVariables[i][DefSpawn][2]);
			UpdateSqlBaseStr(bid, "d_z", locs);

			idx = 0;
			string = dini_Get(fbase,"home");
			BaseVariables[i][BaseCheckpoint][0] = floatstr(strtok(string,idx,','));
			BaseVariables[i][BaseCheckpoint][1] = floatstr(strtok(string,idx,','));
			BaseVariables[i][BaseCheckpoint][2] = floatstr(strtok(string,idx,','));
			format(locs, 200, "%f", BaseVariables[i][BaseCheckpoint][0]);
			UpdateSqlBaseStr(bid, "home_x", locs);
			format(locs, 200, "%f", BaseVariables[i][BaseCheckpoint][1]);
			UpdateSqlBaseStr(bid, "home_y", locs);
			format(locs, 200, "%f", BaseVariables[i][BaseCheckpoint][2]);
			UpdateSqlBaseStr(bid, "home_z", locs);

		    idx = 0;
			string = dini_Get(fbase,"a_0");
			BaseVariables[i][AttSpawn][0] = floatstr(strtok(string,idx,','));
			BaseVariables[i][AttSpawn][1] = floatstr(strtok(string,idx,','));
			BaseVariables[i][AttSpawn][2] = floatstr(strtok(string,idx,','));
			format(locs, 200, "%f", BaseVariables[i][AttSpawn][0]);
			UpdateSqlBaseStr(bid, "a_x", locs);
			format(locs, 200, "%f", BaseVariables[i][AttSpawn][1]);
			UpdateSqlBaseStr(bid, "a_y", locs);
			format(locs, 200, "%f", BaseVariables[i][AttSpawn][2]);
			UpdateSqlBaseStr(bid, "a_z", locs);

		    if(!dini_Isset(fbase, "about"))
		    {
				UpdateSqlBaseStr(bid, "name", "Custom Base");
			}
			else
			{
				UpdateSqlBaseStr(bid, "name", dini_Get(fbase,"about"));
			}
		}
	}
}

tdm_test()
{
	new fbase[256], string[256];
	for(new i; i < MAX_ARENAS+1; i++)
	{
		fbase = TDMfile(i);
		if(dini_Exists(fbase))
		{
			new year,month,day;
			getdate(year, month, day);
			new date[24];
			format(date,24,"%d/%d/%d",month,day,year);
			CreateSqlTDM();
			new bid = LatestSqlTDM();

			string = dini_Get(fbase,"ata");
			UpdateSqlTDMStr(bid, "ata", string);

			string = dini_Get(fbase,"home");
			UpdateSqlTDMStr(bid, "home", string);

			string = dini_Get(fbase,"def");
			UpdateSqlTDMStr(bid, "def", string);

			string = dini_Get(fbase,"min");
			UpdateSqlTDMStr(bid, "min", string);

			string = dini_Get(fbase,"max");
			UpdateSqlTDMStr(bid, "max", string);

		    if(!dini_Isset(fbase, "about"))
		    {
		        UpdateSqlTDMStr(bid, "name", "Custom TDM");
			} else {
		        UpdateSqlTDMStr(bid, "name", dini_Get(fbase,"about"));
			}

		    if(dini_Isset(fbase, "time"))
		    {
		        UpdateSqlTDMInt(bid, "time", dini_Int(fbase,"time"));
			}

		    if(dini_Isset(fbase, "interior"))
		    {
		        UpdateSqlTDMInt(bid, "interior", dini_Int(fbase,"interior"));
			}
		}
	}
}
*/

#if DATA_SYSTEM == 1

LoadArenaVariablesINI(arenaid)
{
	#if DATA_SYSTEM == 1
		new farena[256], idx, string[256];
		farena = TDMfile(arenaid);

		if(dini_Exists(farena))
		{

			ArenaVariables[arenaid][WorldTime] = dini_Int(farena,"time");

			if(!dini_Isset(farena,"time"))
			{
					ArenaVariables[arenaid][WorldTime] = -1;
			}

			ArenaVariables[arenaid][Interior] = dini_Int(farena,"interior");

			idx = 0;
			string = dini_Get(farena,"def");
			ArenaVariables[arenaid][DefSpawn][0] = floatstr(strtok(string,idx,','));
			ArenaVariables[arenaid][DefSpawn][1] = floatstr(strtok(string,idx,','));
			ArenaVariables[arenaid][DefSpawn][2] = floatstr(strtok(string,idx,','));

			idx = 0;
			string = dini_Get(farena,"home");
			ArenaVariables[arenaid][ArenaCheckpoint][0] = floatstr(strtok(string,idx,','));
			ArenaVariables[arenaid][ArenaCheckpoint][1] = floatstr(strtok(string,idx,','));
			ArenaVariables[arenaid][ArenaCheckpoint][2] = floatstr(strtok(string,idx,','));

		    idx = 0;
			string = dini_Get(farena,"ata");
			ArenaVariables[arenaid][AttSpawn][0] = floatstr(strtok(string,idx,','));
			ArenaVariables[arenaid][AttSpawn][1] = floatstr(strtok(string,idx,','));
			ArenaVariables[arenaid][AttSpawn][2] = floatstr(strtok(string,idx,','));

			format(ArenaVariables[arenaid][About],256,"%s", dini_Get(farena,"about"));
		    if(!dini_Isset(farena, "about"))
		    {
				format(ArenaVariables[arenaid][About],256,"Custom TDM");
			}

			idx = 0;
			string = dini_Get(farena,"min");
			ArenaVariables[arenaid][Min_X] = floatstr(strtok(string,idx,','));
			ArenaVariables[arenaid][Min_y] = floatstr(strtok(string,idx,','));
			idx = 0;
			string = dini_Get(farena,"max");
			ArenaVariables[arenaid][Max_X] = floatstr(strtok(string,idx,','));
			ArenaVariables[arenaid][Max_Y] = floatstr(strtok(string,idx,','));

			if(!dini_Isset(farena,"min") || !dini_Isset(farena,"max"))
			{
				ArenaVariables[arenaid][Min_X] = -9999.0;
				ArenaVariables[arenaid][Min_y] = -9999.0;
				ArenaVariables[arenaid][Max_X] = 9999.0;
				ArenaVariables[arenaid][Max_Y] = 9999.0;
			}
		}
	/*
	#elseif DATA_SYSTEM == 2
	    new idx, string[256];
		if(SqlTDMExist(arenaid))
		{
			ArenaVariables[arenaid][WorldTime] = GetSqlTDMDataInt(arenaid, "time");
			ArenaVariables[arenaid][Interior] = GetSqlTDMDataInt(arenaid, "interior");

			idx = 0;
			string = GetSqlTDMDataStr(arenaid, "def");
			ArenaVariables[arenaid][DefSpawn][0] = floatstr(strtok(string,idx,','));
			ArenaVariables[arenaid][DefSpawn][1] = floatstr(strtok(string,idx,','));
			ArenaVariables[arenaid][DefSpawn][2] = floatstr(strtok(string,idx,','));

			idx = 0;
			string = GetSqlTDMDataStr(arenaid, "home");
			ArenaVariables[arenaid][ArenaCheckpoint][0] = floatstr(strtok(string,idx,','));
			ArenaVariables[arenaid][ArenaCheckpoint][1] = floatstr(strtok(string,idx,','));
			ArenaVariables[arenaid][ArenaCheckpoint][2] = floatstr(strtok(string,idx,','));

		    idx = 0;
			string = GetSqlTDMDataStr(arenaid, "ata");
			ArenaVariables[arenaid][AttSpawn][0] = floatstr(strtok(string,idx,','));
			ArenaVariables[arenaid][AttSpawn][1] = floatstr(strtok(string,idx,','));
			ArenaVariables[arenaid][AttSpawn][2] = floatstr(strtok(string,idx,','));

			format(ArenaVariables[arenaid][About],256,"%s", GetSqlTDMDataStr(arenaid, "name"));
		    if(strlen(GetSqlTDMDataStr(arenaid, "name")) < 1)
		    {
				format(ArenaVariables[arenaid][About],256," ");
			}

			idx = 0;
			string = GetSqlTDMDataStr(arenaid, "min");
			ArenaVariables[arenaid][Min_X] = floatstr(strtok(string,idx,','));
			ArenaVariables[arenaid][Min_y] = floatstr(strtok(string,idx,','));
			idx = 0;
			string = GetSqlTDMDataStr(arenaid, "max");
			ArenaVariables[arenaid][Max_X] = floatstr(strtok(string,idx,','));
			ArenaVariables[arenaid][Max_Y] = floatstr(strtok(string,idx,','));
		}
	*/
	#endif
}
#endif

stock ClearDeathMessages()
{
	for(new i = 0; i < 5; i ++)//Clears Death Window
  	{
 	 	SendDeathMessage(255,24,255);
	}
}

stock UnsaveDeathMessages()
{
	for(new i = 0; i < 6; i ++)
  	{
 	 	DeathList[i][killer] = 255;
 	 	DeathList[i][whodead] = 24;
 	 	DeathList[i][deadreason] = 255;
	}
}

forward ShowDeathMessages();
public ShowDeathMessages()
{
 	if(IsPlayerConnected(DeathList[5][whodead])) SendDeathMessage(DeathList[5][killer],DeathList[5][whodead],DeathList[5][deadreason]);
 	if(IsPlayerConnected(DeathList[4][whodead])) SendDeathMessage(DeathList[4][killer],DeathList[4][whodead],DeathList[4][deadreason]);
 	if(IsPlayerConnected(DeathList[3][whodead])) SendDeathMessage(DeathList[3][killer],DeathList[3][whodead],DeathList[3][deadreason]);
 	if(IsPlayerConnected(DeathList[2][whodead])) SendDeathMessage(DeathList[2][killer],DeathList[2][whodead],DeathList[2][deadreason]);
 	if(IsPlayerConnected(DeathList[1][whodead])) SendDeathMessage(DeathList[1][killer],DeathList[1][whodead],DeathList[1][deadreason]);

 	UnsaveDeathMessages();
}

stock ClearChatOnScreen(playerid)
{
	for(new i = 0; i < 10; i ++)
	{
		SendClientMessageEx(playerid, COLOR_YELLOW," ");
	}
}

stock ClearChat(playerid)
{
	for(new i = 0; i < 50; i ++)
	{
		SendClientMessageEx(playerid, COLOR_YELLOW," ");
	}
}

stock ShowBasesTextDraws(playerid)
{
	ClearChatOnScreen(playerid);
	TextDrawHideForPlayer(playerid, MapNameTD);
	//TextDrawHideForPlayer(playerid, ScoreboardScore);
	TextDrawHideForPlayer(playerid, ScoreboardHome);
	TextDrawHideForPlayer(playerid, ScoreboardAway);
	TextDrawHideForPlayer(playerid, fps_text[playerid]);
	TextDrawHideForPlayer(playerid, FPS[playerid]);
	TextDrawHideForPlayer(playerid, health_plus);
	TimeTextForPlayer(playerid, CoverScreen, 10000);
	TimeTextForPlayer(playerid, BasesTextDrawsTop, 10000);
	for(new i = 1; i <= Server[TotalBases]; i ++)
	{
		TimeTextForPlayer(playerid, BasesTextdraws[i], 10000);
	}

	SetTimerEx("ShowRegularTextDrawsForPlayer", 10000, 0, "d", playerid);
	return 1;
}

stock ShowArenasTextDraws(playerid)
{
	TextDrawHideForPlayer(playerid, MapNameTD);
	//TextDrawHideForPlayer(playerid, ScoreboardScore);
	TextDrawHideForPlayer(playerid, ScoreboardHome);
	TextDrawHideForPlayer(playerid, ScoreboardAway);
	TextDrawHideForPlayer(playerid, fps_text[playerid]);
	TextDrawHideForPlayer(playerid, FPS[playerid]);
	TextDrawHideForPlayer(playerid, health_plus);
	ClearChatOnScreen(playerid);
	TimeTextForPlayer(playerid, CoverScreen, 10000);
	TimeTextForPlayer(playerid, ArenasTextDrawsTop, 10000);
	for(new i = 1; i <= Server[TotalTDMs]; i ++)
	{
		TimeTextForPlayer(playerid, ArenasTextdraws[i], 10000);
	}
	
	SetTimerEx("ShowRegularTextDrawsForPlayer", 10000, 0, "d", playerid);
	return 1;
}

stock TryGunMenu(gmenuid, playerid) {
	TogglePlayerControllable(playerid, 1);
	if(Player[playerid][pTeam] == T_REF) return 1;
	
	if ((gmenuid == 1) && (WeaponsMenus[PrimaryCount] < 1)) {
		TryGunMenu(2, playerid);
	} else if (gmenuid == 1) {
		ShowMenuForPlayer(primarymenu, playerid);
	} else if ((gmenuid == 2) && (WeaponsMenus[SecondaryCount] < 1)) {
		TryGunMenu(3, playerid);
	} else if (gmenuid == 2) {
		ShowMenuForPlayer(secondarymenu, playerid);
	} else if ((gmenuid == 3) && (WeaponsMenus[TerciaryCount] < 1)) {
		TryGunMenu(4, playerid);
	} else if (gmenuid == 3) {
		ShowMenuForPlayer(terciarymenu, playerid);
	} else if ((gmenuid == 4) && (WeaponsMenus[SpecialCount] < 1)) {
		ShowMenuForPlayer(wepdone_menu, playerid);
	} else if (gmenuid == 4) {
		ShowMenuForPlayer(specialmenu, playerid);
	}
	return 1;
}

stock TryGunMenuBack(gmenuid, playerid) {
    ApplyAnimation(playerid,"PED","IDLE_STANCE",4.1,1,1,1,1,1,1);
	if ((gmenuid == 3) && (WeaponsMenus[TerciaryCount] < 1)) { //if terciary menu and has no weapons..
		TryGunMenuBack(2, playerid); // try to go to secondary
	} else if (gmenuid == 3) { // terciary menu is back and has weapons...
		ShowMenuForPlayer(terciarymenu, playerid);
	} else if ((gmenuid == 2) && (WeaponsMenus[SecondaryCount] < 1)) { //if secondary menu and has no weapons..
		TryGunMenuBack(1, playerid); // try to go to primary
	} else if (gmenuid == 2) { // secondary menu is back and has weapons...
		ShowMenuForPlayer(secondarymenu, playerid);
	} else if ((gmenuid == 1) && (WeaponsMenus[PrimaryCount] < 1)) { //if primary menu has no weapons...
		TryGunMenu(2, playerid); // Try to show secondary menu and start moving forward again
	} else if (gmenuid == 1) { // primary menu is back and has weapons..
		TryGunMenu(1, playerid);
	}
	return 1;
}


CreateRoundMenus()
{
	new string[256];
    WeaponsMenus[SecondaryCount] = 0;
    WeaponsMenus[PrimaryCount] = 0;
    WeaponsMenus[SpecialCount] = 0;
    WeaponsMenus[TerciaryCount] = 0;
	primarymenu = CreateMenu("~b~Primary", 1, 30.0, 150.0, 200.0, 200.0);
	secondarymenu = CreateMenu("~b~Secondary", 1, 30.0, 150.0, 200.0, 200.0);
	terciarymenu = CreateMenu("~b~Terciary", 1, 30.0, 150.0, 200.0, 200.0);
	specialmenu = CreateMenu("~b~Special", 1, 30.0, 150.0, 200.0, 200.0);

	for(new i = 0; i < MAX_WEAPONS; i ++)
	{
		if(WeaponsMenus[Option][i] == 1)
		{
			format(string,sizeof(string),"%s (x%d)",wNames[i], WeaponsMenus[wAmmo][i]);
    		AddMenuItem(primarymenu, 0, string);
    		WeaponsMenus[PrimaryMenuIDs][WeaponsMenus[PrimaryCount]] = i;
    		WeaponsMenus[PrimaryCount]++;
		}
		else if(WeaponsMenus[Option][i] == 2)
		{
			format(string,sizeof(string),"%s (x%d)",wNames[i], WeaponsMenus[wAmmo][i]);
    		AddMenuItem(secondarymenu, 0, string);
       		WeaponsMenus[SecondaryMenuIDs][WeaponsMenus[SecondaryCount]] = i;
    		WeaponsMenus[SecondaryCount]++;
		}
		else if(WeaponsMenus[Option][i] == 3)
		{
			format(string,sizeof(string),"%s (x%d)",wNames[i], WeaponsMenus[wAmmo][i]);
    		AddMenuItem(terciarymenu, 0, string);
       		WeaponsMenus[TerciaryMenuIDs][WeaponsMenus[TerciaryCount]] = i;
    		WeaponsMenus[TerciaryCount] ++;
		}
 		else if(WeaponsMenus[Option][i] == 4)
		{
			format(string,sizeof(string),"%s (x%d)",wNames[i], WeaponsMenus[wAmmo][i]);
    		AddMenuItem(specialmenu, 0, string);
       		WeaponsMenus[SpecialMenuIDs][WeaponsMenus[SpecialCount]] = i;
    		WeaponsMenus[SpecialCount]++;
		}
	}
	AddMenuItem(primarymenu, 0, ">> ~g~Next");

	AddMenuItem(secondarymenu, 0, ">> ~g~Next");
	AddMenuItem(secondarymenu, 0, "<< ~r~Back");

	AddMenuItem(terciarymenu, 0, ">> ~g~Next");
	AddMenuItem(terciarymenu, 0, "<< ~r~Back");

	AddMenuItem(specialmenu, 0, ">> ~g~Next");
	AddMenuItem(specialmenu, 0, "<< ~r~Back");
}

DestroyMenus()
{
	DestroyMenu(primarymenu);
	DestroyMenu(secondarymenu);
	DestroyMenu(terciarymenu);
	DestroyMenu(specialmenu);
}


CheckFreeWeapon(playerid,weapon_id)
{
	if(Player[playerid][PrimaryWep] > 0)
	{
	    if(GetSlot(Player[playerid][PrimaryWep]) == GetSlot(weapon_id))
	        return false;
	}
	else if(Player[playerid][SecondaryWep] > 0)
	{
	    if(GetSlot(Player[playerid][SecondaryWep]) == GetSlot(weapon_id))
	        return false;
	}
	else if(Player[playerid][TerciaryWep] > 0)
	{
	    if(GetSlot(Player[playerid][TerciaryWep]) == GetSlot(weapon_id))
	        return false;
	}
	else if(Player[playerid][SpecialWep] > 0)
	{
	    if(GetSlot(Player[playerid][SpecialWep]) == GetSlot(weapon_id))
	        return false;
	}
	return true;
}

forward RespawnPlayerInRound(playerid);
public RespawnPlayerInRound(playerid)
{
	new badsynctime = Player[playerid][LastSync] + 2;
	if(Server[ServerTicks] < badsynctime) {
	    return 0;
	}

	if (Round[Current] != -1) {
		new bool:IsPlayerSpecing[MAX_PLAYERS];
		for(new x=0; x<Server[HighestID]+1; x++) {
		    if(!IsPlayerConnected(x)) continue;
		    if(GetPlayerState(x) == PLAYER_STATE_SPECTATING && Player[x][gSpectateID] == playerid) {
				IsPlayerSpecing[x] = true;
			}
		}

		new Float:PlayerPos[3];
		GetPlayerPos(playerid,PlayerPos[0],PlayerPos[1],PlayerPos[2]);
		new TheInterior, VirtualWorld;
		new Float:Angle;
		GetPlayerFacingAngle(playerid, Angle);
		TheInterior = GetPlayerInterior(playerid);
		VirtualWorld = GetPlayerVirtualWorld(playerid);

		SetPlayerWorldBoundsEx(playerid,9999.9,-9999.9,9999.9,-9999.9);

		Player[playerid][IgnoreSpawnCallback] = true;

		SetSpawnInfo(playerid,99,GetCurrentSkin(playerid),PlayerPos[0],PlayerPos[1],PlayerPos[2],Angle,0,0,0,0,0,0);
		SpawnPlayerEx(playerid);

		SetSpawnInfo(playerid,99,GetCurrentSkin(playerid),Lobby[0]+10-random(10),Lobby[1]+10-random(10),Lobby[2]+1,0,0,0,0,0,0,0);

		if(Round[Gamemode] == TDM)
		{
		   	SetPlayerWorldBoundsEx(playerid,MaxX,MinX,MaxY,MinY);
		}

		SetPlayerArmour(playerid,Config[roundarmour]);
		SetPlayerHealth(playerid,Config[roundhealth]);
		SetPlayerInterior(playerid,TheInterior);
		SetPlayerVirtualWorld2(playerid,VirtualWorld);

		StrapUp(playerid);

		for(new x=0; x<Server[HighestID]+1; x++) {
		    if(IsPlayerSpecing[x] == true) {
				SetTimerEx("Spectate",500,false,"ii",x,playerid);
			}
		}
	}
	return 1;
}

IsVehicleHeli(vehicleid)
{
	new veh = GetVehicleModel(vehicleid);
	switch(veh)
	{
	    case 417,425,447,465,469,487,488,548,563: return true;
	}

	return false;
}
#pragma unused IsVehicleHeli

GetSlot(WeaponID)
{
	switch(WeaponID)
	{
	    case 44..46: return 11;
	    case 41..43: return 9;
	    case 22..24: return 2;
	    case 25..27: return 3;
	    case 28..29, 32: return 4;
	    case 30..31: return 5;
	    case 33..34: return 6;
	    case 36..38: return 7;
	    case 10..15: return 10;
	    case 2..9: return 1;
	    case 16..19: return 8;
	}
	return 0;

}

/*stock ApplyLatestConfigChanges(built)
{
	//Nothing here for now

	#pragma unused built
}*/


LoadConfig() {
	#if DATA_SYSTEM == 1
		if(!dini_Exists(ConfigFile))
		{
			print("Error: Main Config file not found. Server Shutting Down in 5 seconds...");
			SetTimer("Exit",5000,false);
		}
		
		if(!dini_Exists(AudioFile))
		{
			dini_Create(AudioFile);
			dini_IntSet(AudioFile, "voicemsgs", 1);
			dini_IntSet(AudioFile, "choppers", 1);
			dini_IntSet(AudioFile, "vehicleradio", 1);
			dini_IntSet(AudioFile, "firstblood", 1);
			dini_IntSet(AudioFile, "gotkill", 1);
			dini_IntSet(AudioFile, "gotkilled", 1);
			dini_IntSet(AudioFile, "roundstarting", 1);
			dini_IntSet(AudioFile, "roundstarted", 1);
			dini_IntSet(AudioFile, "duel", 1);
			dini_IntSet(AudioFile, "killspree", 1);
			dini_IntSet(AudioFile, "paused", 1);
			dini_IntSet(AudioFile, "finalresults", 1);
			dini_IntSet(AudioFile, "intro", 1);
			dini_IntSet(AudioFile, "classselection", 1);
			printf("Created new audio config.");
		}

		if(!dini_Isset(ConfigFile,"refmode")) { dini_IntSet(ConfigFile,"refmode",1); }
		if(!dini_Isset(ConfigFile,"tdmpoints")) { dini_IntSet(ConfigFile,"tdmpoints",25); }
		if(!dini_Isset(ConfigFile,"autoinvert")) { dini_IntSet(ConfigFile,"autoinvert",1); }
		if(!dini_Isset(ConfigFile,"diag")) { dini_IntSet(ConfigFile,"diag",0); }
		if(!dini_Isset(ConfigFile,"autobalance")) { dini_IntSet(ConfigFile,"autobalance",0); }
		if(!dini_Isset(ConfigFile,"regmode")) { dini_IntSet(ConfigFile,"regmode",1); }
		if(!dini_Isset(ConfigFile,"sync")) { dini_IntSet(ConfigFile,"sync",0); }
		if(!dini_Isset(ConfigFile,"blip")) { dini_IntSet(ConfigFile,"blip",1); }
		if(!dini_Isset(ConfigFile,"forcetime")) { dini_IntSet(ConfigFile,"forcetime",-1); }
		if(!dini_Isset(ConfigFile, "dm")) { dini_IntSet(ConfigFile,"dm",1); }
		if(!dini_Isset(ConfigFile, "autopause")) { dini_IntSet(ConfigFile, "autopause", 0); }
		if(!dini_Isset(ConfigFile, "spec")) { dini_IntSet(ConfigFile, "spec", 1); }
		if(!dini_Isset(ConfigFile, "cplayout")) { dini_IntSet(ConfigFile, "cplayout", 0); }
		if(!dini_Isset(ConfigFile, "maxplimit")) { dini_IntSet(ConfigFile, "maxplimit", 100); }
		if(!dini_Isset(ConfigFile, "joypad")) { dini_IntSet(ConfigFile, "joypad", 1); }

		#if SAMP_VERSION == 2
		ConfigAudio[sndVoiceMsgs] =	bool:dini_Int(AudioFile, "voicemsgs");
		ConfigAudio[sndChoppers] = bool:dini_Int(AudioFile, "choppers");
		ConfigAudio[sndVehicleRadio] = bool:dini_Int(AudioFile, "vehicleradio");
		ConfigAudio[sndFirstBlood] = bool:dini_Int(AudioFile, "firstblood");
		ConfigAudio[sndGotKill] = bool:dini_Int(AudioFile, "gotkill");
		ConfigAudio[sndGotKilled] = bool:dini_Int(AudioFile, "gotkilled");
		ConfigAudio[sndRoundStarting] = bool:dini_Int(AudioFile, "roundstarting");
		ConfigAudio[sndRoundStarted] = bool:dini_Int(AudioFile, "roundstarted");
		ConfigAudio[sndDuel] = bool:dini_Int(AudioFile, "duel");
		ConfigAudio[sndKillSpree] = bool:dini_Int(AudioFile, "killspree");
		ConfigAudio[sndPaused] = bool:dini_Int(AudioFile, "paused");
		ConfigAudio[sndFinalResults] = bool:dini_Int(AudioFile, "finalresults");
		ConfigAudio[sndIntro] = bool:dini_Int(AudioFile, "intro");
		ConfigAudio[sndClassSelect] = bool:dini_Int(AudioFile, "classselection");
		#endif

		Config[cplayout] = dini_Int(ConfigFile, "cplayout");
		Config[spec] = dini_Int(ConfigFile, "spec");
		Config[autopause] = dini_Int(ConfigFile, "autopause");
		Config[c_dm] = dini_Int(ConfigFile, "dm");
		Config[forcetime] = dini_Int(ConfigFile, "forcetime");
		Config[blip] = dini_Int(ConfigFile,"blip");
		Config[sync] = dini_Int(ConfigFile,"sync");
		Config[regmode] = dini_Int(ConfigFile,"regmode");
		Config[round_time] = dini_Int(ConfigFile,"round_time");
		Config[cp_time] = dini_Int(ConfigFile,"cp_time");
		Config[cp_size] = dini_Int(ConfigFile,"cp_size");
		Config[stop_counting] = dini_Int(ConfigFile,"stop_counting");
		Config[RefMode] = dini_Int(ConfigFile,"refmode");
		Config[autoinvert] = dini_Int(ConfigFile,"autoinvert");
		Config[diag] = dini_Int(ConfigFile,"diag");
		Config[tdmpoints] = dini_Int(ConfigFile,"tdmpoints");
		Config[classic_chat] = dini_Int(ConfigFile,"classic_chat");
		new string[1024], idx;
		string = dini_Get(ConfigFile,"lobby_coords");
		Lobby[0] = floatstr(strtok(string,idx,','));
		Lobby[1] = floatstr(strtok(string,idx,','));
		Lobby[2] = floatstr(strtok(string,idx,','));
		Config[LobbyInterior] =	dini_Int(ConfigFile,"lobby_int");
		Config[LobbyWeapons] =	dini_Int(ConfigFile,"lobby_weapons");
		Config[LobbyTD] = dini_Int(ConfigFile,"lobby_td");
		Config[UseIntro] = dini_Int(ConfigFile,"use_intro");
  	 	Config[antisktime] = dini_Int(ConfigFile,"antisktime");
		idx = 0;
		string = dini_Get(ConfigFile,"rules");
		Rules[1] = strtok(string,idx,'|');
		Rules[2] = strtok(string,idx,'|');
		Rules[3] = strtok(string,idx,'|');
		Rules[4] = strtok(string,idx,'|');
		Rules[5] = strtok(string,idx,'|');
		idx = 0;
		string = dini_Get(ConfigFile,"fullset");
		FullSet[1] = strval(strtok(string,idx,','));
		FullSet[2] = strval(strtok(string,idx,','));
		FullSet[3] = strval(strtok(string,idx,','));
		FullSet[4] = strval(strtok(string,idx,','));
		FullSet[5] = strval(strtok(string,idx,','));
		FullSet[6] = strval(strtok(string,idx,','));
		Config[NameTagDistance] = dini_Int(ConfigFile,"nametag_distance");
		Config[skin_auto] = dini_Int(ConfigFile,"skin_auto");
		Config[skin_home] = dini_Int(ConfigFile,"skin_home");
		Config[skin_subhome] = dini_Int(ConfigFile,"skin_subhome");
		Config[skin_away] = dini_Int(ConfigFile,"skin_away");
		Config[skin_subaway] = dini_Int(ConfigFile,"skin_subaway");
		Config[skin_ref] = dini_Int(ConfigFile,"skin_ref");
		Config[autologin] = dini_Int(ConfigFile,"autologin");
		Config[autobalance] = dini_Int(ConfigFile,"autobalance");
		Config[skincmd] = dini_Int(ConfigFile,"skin");
		Config[plimit] = dini_Int(ConfigFile,"plimit");
		Config[maxplimit] = dini_Int(ConfigFile, "maxplimit");
		Config[roundhealth] = dini_Int(ConfigFile,"roundhealth");
		Config[roundarmour] = dini_Int(ConfigFile,"roundarmour");
		Config[globalhealth] = dini_Int(ConfigFile,"globalhealth");
		Config[globalarmour] = dini_Int(ConfigFile,"globalarmour");
		Config[RotateCameraEx] = dini_Int(ConfigFile,"rotatecamera");
		Config[weather] = dini_Int(ConfigFile,"weather");
		Config[thetime] = dini_Int(ConfigFile,"time");
		format(ClanTag, sizeof(ClanTag), "%s", dini_Get(ConfigFile,"clan_tag"));
		format(Server[DeadTag], sizeof(Server[DeadTag]), "%s", dini_Get(ConfigFile,"deadtag"));
		format(Config[DeathMsg], sizeof(Config[DeathMsg]), "%s", dini_Get(ConfigFile,"death_msg"));
		format(Server[LeaveVehicleMessage], sizeof(Server[LeaveVehicleMessage]), "%s", dini_Get(ConfigFile,"vehiclemsg"));
		Round[VotingTime] = dini_Int(ConfigFile,"votetime");
		Server[RoundLimit] = dini_Int(ConfigFile,"roundlimit");
		Config[weaponsystem] = dini_Int(ConfigFile,"weaponsystem");
		Config[Speedmeter] = dini_Int(ConfigFile,"speedmeter");
		Round[Gameplay] = dini_Int(ConfigFile,"gameplay");
		format(Server[IntroString],128, dini_Get(ConfigFile,"intro_string"));
		format(Server[IntroSubString], 128, dini_Get(ConfigFile,"intro_substring"));
		HomeName = dini_Get(ConfigFile,"homename");
		AwayName = dini_Get(ConfigFile,"awayname");
		RefName = dini_Get(ConfigFile,"refname");

		Server[UAVEnabled] = bool:dini_Int(ConfigFile,"uavradar");

		Server[NickChanging] = bool:dini_Int(ConfigFile,"nick");

		Server[AutoSpec] = bool:dini_Int(ConfigFile,"autospec");

		Server[LobbyVehicles] = bool:dini_Int(ConfigFile,"lobbyvehicles");

		Server[AutoReadd] = bool:dini_Int(ConfigFile,"autoreadd");

		Server[AllowDuels] = bool:dini_Int(ConfigFile,"duels");

		Server[WeaponDrop] = bool:dini_Int(ConfigFile,"weapondrop");

		new textdraw;
		textdraw = dini_Int(ConfigFile,"textdrawlayout");
		if(textdraw==1) {
			Server[MainTextdrawLayout] =1;
		} else {
	     	Server[MainTextdrawLayout] =2;
		}

		Server[PauseMessages] = bool:dini_Int(ConfigFile,"pausemessages");

		Server[DisplayHintMessages] = bool:dini_Int(ConfigFile,"hintmessages");

		Server[SaveResults] = bool:dini_Int(ConfigFile,"saveresults");

		Server[AutoHUD] = bool:dini_Int(ConfigFile,"autohud");

		Server[HUD] = bool:dini_Int(ConfigFile,"hud");

		Server[AllowVehicleMod] = bool:dini_Int(ConfigFile,"vehiclemod");

		Server[TkMode] = bool:dini_Int(ConfigFile,"tk");

		Server[TimerMode] = bool:dini_Int(ConfigFile,"timer");

		new exp;
		exp = dini_Int(ConfigFile,"explosives");
		if(exp==1) {
		    Server[explosives] = true;
			WeaponsMenus[Option][35] = 4;
			WeaponsMenus[Option][16] = 4;
			WeaponsMenus[wAmmo][35] = 1;
			WeaponsMenus[wAmmo][16] = 2;
		} else {
		    Server[explosives] = false;
			WeaponsMenus[Option][35] = 0;
			WeaponsMenus[Option][16] = 0;
			WeaponsMenus[wAmmo][35] = 0;
			WeaponsMenus[wAmmo][16] = 0;
		}

	#elseif DATA_SYSTEM == 2
		
		#if SAMP_VERSION == 2
			new query[200];
			
			format(query, sizeof(query), "SELECT * FROM dc_audio");
			mysql_query(query);
			Server[SQLQueriesExecuted]++;
			mysql_store_result();
			new templine[200];
			while(mysql_fetch_row_format(templine, "|"))
			{
				new idx;
				new audio_var[256];
				new audio_data[256];

				audio_var = mysql_strtok(templine, idx, "|");
				audio_data = mysql_strtok(templine, idx, "|");
				new adata = strval(audio_data);

				if (isStringSame(audio_var, "voicemsgs", 256)) {
					ConfigAudio[sndVoiceMsgs] = bool:adata;
				} else if (isStringSame(audio_var, "choppers", 256)) {
				    ConfigAudio[sndChoppers] = bool:adata;
				} else if (isStringSame(audio_var, "vehicleradio", 256)) {
				    ConfigAudio[sndVehicleRadio] = bool:adata;
				} else if (isStringSame(audio_var, "firstblood", 256)) {
				    ConfigAudio[sndFirstBlood] = bool:adata;
				} else if (isStringSame(audio_var, "gotkill", 256)) {
				    ConfigAudio[sndGotKill] = bool:adata;
				} else if (isStringSame(audio_var, "gotkilled", 256)) {
				    ConfigAudio[sndGotKilled] = bool:adata;
				} else if (isStringSame(audio_var, "roundstarting", 256)) {
				    ConfigAudio[sndRoundStarting] = bool:adata;
				} else if (isStringSame(audio_var, "roundstarted", 256)) {
				    ConfigAudio[sndRoundStarted] = bool:adata;
				} else if (isStringSame(audio_var, "duel", 256)) {
				    ConfigAudio[sndDuel] = bool:adata;
				} else if (isStringSame(audio_var, "killspree", 256)) {
				    ConfigAudio[sndKillSpree] = bool:adata;
				} else if (isStringSame(audio_var, "paused", 256)) {
				    ConfigAudio[sndPaused] = bool:adata;
				} else if (isStringSame(audio_var, "finalresults", 256)) {
				    ConfigAudio[sndFinalResults] = bool:adata;
				} else if (isStringSame(audio_var, "intro", 256)) {
				    ConfigAudio[sndIntro] = bool:adata;
				} else if (isStringSame(audio_var, "classselection", 256)) {
				    ConfigAudio[sndClassSelect] = bool:adata;
				}
			}
			
			format(query, sizeof(query), "SELECT * FROM dc_config");
			mysql_query(query);
			Server[SQLQueriesExecuted]++;
			mysql_store_result();
			while(mysql_fetch_row_format(templine, "|"))
			{
				new idx;
				new config_id[256];
				new config_var[256];
				new config_data[256];

				config_id = mysql_strtok(templine, idx, "|");
				config_var = mysql_strtok(templine, idx, "|");
				config_data = mysql_strtok(templine, idx, "|");
				new cdata = strval(config_data);

				if (isStringSame(config_var, "refmode", 256)) {
					Config[RefMode] = cdata;
				} else if (isStringSame(config_var, "diag", 256)) {
					Config[diag] = cdata;
				} else if (isStringSame(config_var, "regmode", 256)) {
					Config[regmode] = cdata;
				} else if (isStringSame(config_var, "sync", 256)) {
					Config[sync] = cdata;
				} else if (isStringSame(config_var, "tdmpoints", 256)) {
					Config[tdmpoints] = cdata;
				} else if (isStringSame(config_var, "classic_chat", 256)) {
					Config[classic_chat] = cdata;
				} else if (isStringSame(config_var, "autobalance", 256)) {
					Config[autobalance] = cdata;
				} else if (isStringSame(config_var, "autoinvert", 256)) {
					Config[autoinvert] = cdata;
				} else if (isStringSame(config_var, "blip", 256)) {
					Config[blip] = cdata;
				} else if (isStringSame(config_var, "forcetime", 256)) {
					Config[forcetime] = cdata;
				} else if (isStringSame(config_var, "dm", 256)) {
					Config[c_dm] = cdata;
				} else if (isStringSame(config_var, "autopause", 256)) {
					Config[autopause] = cdata;
				} else if (isStringSame(config_var, "spec", 256)) {
					Config[spec] = cdata;
				} else if (isStringSame(config_var, "cplayout", 256)) {
					Config[cplayout] = cdata;
				} else if (isStringSame(config_var, "maxplimit", 256)) {
					Config[maxplimit] = cdata;
				} else if (isStringSame(config_var, "round_time", 256)) {
					Config[round_time] = cdata;
				} else if (isStringSame(config_var, "cp_time", 256)) {
					Config[cp_time] = cdata;
				} else if (isStringSame(config_var, "cp_size", 256)) {
					Config[cp_size] = cdata;
				} else if (isStringSame(config_var, "stop_counting", 256)) {
					Config[stop_counting] = cdata;
				} else if (isStringSame(config_var, "lobby_int", 256)) {
					Config[LobbyInterior] = cdata;
				} else if (isStringSame(config_var, "lobby_weapons", 256)) {
					Config[LobbyWeapons] = cdata;
				} else if (isStringSame(config_var, "lobby_td", 256)) {
					Config[LobbyTD] = cdata;
				} else if (isStringSame(config_var, "use_intro", 256)) {
					Config[UseIntro] = cdata;
				} else if (isStringSame(config_var, "nametag_distance", 256)) {
					Config[NameTagDistance] = cdata;
				} else if (isStringSame(config_var, "skin_auto", 256)) {
					Config[skin_auto] = cdata;
				} else if (isStringSame(config_var, "skin_home", 256)) {
					Config[skin_home] = cdata;
				} else if (isStringSame(config_var, "skin_subhome", 256)) {
					Config[skin_subhome] = cdata;
				} else if (isStringSame(config_var, "skin_away", 256)) {
					Config[skin_away] = cdata;
				} else if (isStringSame(config_var, "skin_subaway", 256)) {
					Config[skin_subaway] = cdata;
				} else if (isStringSame(config_var, "skin_ref", 256)) {
					Config[skin_ref] = cdata;
				} else if (isStringSame(config_var, "autologin", 256)) {
					Config[autologin] = cdata;
				} else if (isStringSame(config_var, "antisktime", 256)) {
					Config[antisktime] = cdata;
				} else if (isStringSame(config_var, "skin", 256)) {
					Config[skincmd] = cdata;
				} else if (isStringSame(config_var, "plimit", 256)) {
					Config[plimit] = cdata;
				} else if (isStringSame(config_var, "maxplimit", 256)) {
					Config[maxplimit] = cdata;
				} else if (isStringSame(config_var, "roundhealth", 256)) {
					Config[roundhealth] = cdata;
				} else if (isStringSame(config_var, "roundarmour", 256)) {
					Config[roundarmour] = cdata;
				} else if (isStringSame(config_var, "globalhealth", 256)) {
					Config[globalhealth] = cdata;
				} else if (isStringSame(config_var, "globalarmour", 256)) {
					Config[globalarmour] = cdata;
				} else if (isStringSame(config_var, "rotatecamera", 256)) {
					Config[RotateCameraEx] = cdata;
				} else if (isStringSame(config_var, "weather", 256)) {
					Config[weather] = cdata;
				} else if (isStringSame(config_var, "time", 256)) {
					Config[thetime] = cdata;
				} else if (isStringSame(config_var, "weaponsystem", 256)) {
					Config[weaponsystem] = cdata;
				} else if (isStringSame(config_var, "speedmeter", 256)) {
					Config[Speedmeter] = cdata;
				} else if (isStringSame(config_var, "joypad", 256)) {
				    Config[joypad] = bool:cdata;
				}
			}
		#endif

		Round[VotingTime] = GetSqlConfigInt("votetime");
		Server[RoundLimit] = GetSqlConfigInt("roundlimit");
		Round[Gameplay] = GetSqlConfigInt("gameplay");
					
		Server[UAVEnabled] = bool:GetSqlConfigInt("uavradar");
		Server[NickChanging] = bool:GetSqlConfigInt("nick");
		Server[AutoSpec] = bool:GetSqlConfigInt("autospec");
		Server[LobbyVehicles] = bool:GetSqlConfigInt("lobbyvehicles");
		Server[AutoReadd] = bool:GetSqlConfigInt("autoreadd");
		Server[AllowDuels] = bool:GetSqlConfigInt("duels");
		Server[WeaponDrop] = bool:GetSqlConfigInt("weapondrop");

		new textdraw;
		textdraw = GetSqlConfigInt("textdrawlayout");
		if(textdraw==1) {
			Server[MainTextdrawLayout] = 1;
		} else {
	     	Server[MainTextdrawLayout] = 2;
		}
		
		Server[PauseMessages] = bool:GetSqlConfigInt("pausemessages");
		Server[DisplayHintMessages] = bool:GetSqlConfigInt("hintmessages");
		Server[SaveResults] = bool:GetSqlConfigInt("saveresults");
		Server[AutoHUD] = bool:GetSqlConfigInt("autohud");
		Server[HUD] = bool:GetSqlConfigInt("hud");
		Server[AllowVehicleMod] = bool:GetSqlConfigInt("vehiclemod");
		Server[TkMode] = bool:GetSqlConfigInt("tk");
		Server[TimerMode] = bool:GetSqlConfigInt("timer");

		new exp;
		exp = GetSqlConfigInt("explosives");
		if(exp==1) {
		    Server[explosives] = true;
			WeaponsMenus[Option][35] = 4;
			WeaponsMenus[Option][16] = 4;
			WeaponsMenus[wAmmo][35] = 1;
			WeaponsMenus[wAmmo][16] = 2;
		} else {
		    Server[explosives] = false;
			WeaponsMenus[Option][35] = 0;
			WeaponsMenus[Option][16] = 0;
			WeaponsMenus[wAmmo][35] = 0;
			WeaponsMenus[wAmmo][16] = 0;
		}
		
		new string[256], idx;
		string = GetSqlConfigStr("lobby_coords");
		Lobby[0] = floatstr(strtok(string,idx,','));
		Lobby[1] = floatstr(strtok(string,idx,','));
		Lobby[2] = floatstr(strtok(string,idx,','));

		idx = 0;
		string = GetSqlConfigStr("fullset");
		FullSet[1] = strval(strtok(string,idx,','));
		FullSet[2] = strval(strtok(string,idx,','));
		FullSet[3] = strval(strtok(string,idx,','));
		FullSet[4] = strval(strtok(string,idx,','));
		FullSet[5] = strval(strtok(string,idx,','));
		FullSet[6] = strval(strtok(string,idx,','));

		format(ClanTag, sizeof(ClanTag), "%s", GetSqlConfigStr("clan_tag"));
		format(Config[DeathMsg], sizeof(Config[DeathMsg]), "%s", GetSqlConfigStr("death_msg"));
		format(Server[DeadTag], sizeof(Server[DeadTag]), "%s", GetSqlConfigStr("deadtag"));
		format(Server[LeaveVehicleMessage], sizeof(Server[LeaveVehicleMessage]), "%s", GetSqlConfigStr("vehiclemsg"));
		new rule[24];
		for(new i = 1; i < 6; i ++)
		{
			format(rule,24,"rule_%d",i);
			Rules[i] = GetSqlConfigStr(rule);
		}
		format(Server[IntroString],128, "%s", GetSqlConfigStr("intro_string"));
		format(Server[IntroSubString], 128, "%s", GetSqlConfigStr("intro_substring"));
		format(HomeName, sizeof(HomeName), "%s", GetSqlConfigStr("homename"));
		format(AwayName, sizeof(AwayName), "%s", GetSqlConfigStr("awayname"));
		format(RefName, sizeof(RefName), "%s", GetSqlConfigStr("refname"));
		
	#endif

	//Server[lobby1_text3d] = Create3DTextLabel("Welcome to Deadly Combinations...", COLOR_WHITE, Lobby[0], Lobby[1], Lobby[2]+0.4, 30, LOBBY_VW);
	new lobby2_text[256];
	format(lobby2_text, 256 , "TangE A/D�� ���� ���� ȯ���մϴ�\n{FFFFFF}�κ�\nA/D �� ������ġ\nBases: %d - TDMs: %d\n{BABABA}/help /commands /info /rules /credits\n{00FF00}��� ���: D.C A/D              ������:TangE", Server[TotalBases], Server[TotalTDMs]);
	Server[lobby2_text3d] = Create3DTextLabel(lobby2_text, COLOR_GREYBLUE, Lobby[0], Lobby[1], Lobby[2]+0.2, 150, LOBBY_VW);
	printf("  -> Main Server Config Loaded", 175, 174);
}

forward Exit();
public Exit()
{
	SendRconCommand("exit");
}

ApplyVehicleStuff(vehicleid)
{
	if(GetVehicleModel(vehicleid) != 417 && GetVehicleModel(vehicleid) != 425 && GetVehicleModel(vehicleid) != 430 && GetVehicleModel(vehicleid) != 435 && GetVehicleModel(vehicleid) != 441 && GetVehicleModel(vehicleid) != 446 && GetVehicleModel(vehicleid) != 447 && GetVehicleModel(vehicleid) != 448 && GetVehicleModel(vehicleid) != 449 && GetVehicleModel(vehicleid) != 450 &&
	GetVehicleModel(vehicleid) != 452 && GetVehicleModel(vehicleid) != 453 && GetVehicleModel(vehicleid) != 454 && GetVehicleModel(vehicleid) != 460 && GetVehicleModel(vehicleid) != 461 && GetVehicleModel(vehicleid) != 462 && GetVehicleModel(vehicleid) != 463 && GetVehicleModel(vehicleid) != 464 && GetVehicleModel(vehicleid) != 465 && GetVehicleModel(vehicleid) != 468 &&
	GetVehicleModel(vehicleid) != 469 && GetVehicleModel(vehicleid) != 472 && GetVehicleModel(vehicleid) != 473 && GetVehicleModel(vehicleid) != 476 && GetVehicleModel(vehicleid) != 481 && GetVehicleModel(vehicleid) != 484 && GetVehicleModel(vehicleid) != 487 && GetVehicleModel(vehicleid) != 488 && GetVehicleModel(vehicleid) != 493 && GetVehicleModel(vehicleid) != 497 &&
	GetVehicleModel(vehicleid) != 501 && GetVehicleModel(vehicleid) != 509 && GetVehicleModel(vehicleid) != 510 && GetVehicleModel(vehicleid) != 511 && GetVehicleModel(vehicleid) != 512 && GetVehicleModel(vehicleid) != 513 && GetVehicleModel(vehicleid) != 519 && GetVehicleModel(vehicleid) != 520 && GetVehicleModel(vehicleid) != 521 && GetVehicleModel(vehicleid) != 522 &&
	GetVehicleModel(vehicleid) != 523 && GetVehicleModel(vehicleid) != 537 && GetVehicleModel(vehicleid) != 538 && GetVehicleModel(vehicleid) != 539 && GetVehicleModel(vehicleid) != 548 && GetVehicleModel(vehicleid) != 553 && GetVehicleModel(vehicleid) != 563 && GetVehicleModel(vehicleid) != 564 && GetVehicleModel(vehicleid) != 569 && GetVehicleModel(vehicleid) != 570 &&
	GetVehicleModel(vehicleid) != 577 && GetVehicleModel(vehicleid) != 581 && GetVehicleModel(vehicleid) != 584 && GetVehicleModel(vehicleid) != 586 && GetVehicleModel(vehicleid) != 590 && GetVehicleModel(vehicleid) != 591 && GetVehicleModel(vehicleid) != 592 && GetVehicleModel(vehicleid) != 593 && GetVehicleModel(vehicleid) != 594 && GetVehicleModel(vehicleid) != 595 &&
	GetVehicleModel(vehicleid) != 606 && GetVehicleModel(vehicleid) != 607 && GetVehicleModel(vehicleid) != 608 && GetVehicleModel(vehicleid) != 610 && GetVehicleModel(vehicleid) != 611 && !IsInInvalidNosVehicle(vehicleid)){
	    new rando = random(sizeof(RandWheels));
	    AddVehicleComponent(vehicleid,RandWheels[rando][0]);
	    AddVehicleComponent(vehicleid,1010);
		}
 	if(GetVehicleModel(vehicleid) != 417 && GetVehicleModel(vehicleid) != 425 && GetVehicleModel(vehicleid) != 430 && GetVehicleModel(vehicleid) != 435 && GetVehicleModel(vehicleid) != 441 && GetVehicleModel(vehicleid) != 446 && GetVehicleModel(vehicleid) != 447 && GetVehicleModel(vehicleid) != 448 && GetVehicleModel(vehicleid) != 449 && GetVehicleModel(vehicleid) != 450 &&
	GetVehicleModel(vehicleid) != 452 && GetVehicleModel(vehicleid) != 453 && GetVehicleModel(vehicleid) != 454 && GetVehicleModel(vehicleid) != 460 && GetVehicleModel(vehicleid) != 461 && GetVehicleModel(vehicleid) != 462 && GetVehicleModel(vehicleid) != 463 && GetVehicleModel(vehicleid) != 464 && GetVehicleModel(vehicleid) != 465 && GetVehicleModel(vehicleid) != 468 &&
	GetVehicleModel(vehicleid) != 469 && GetVehicleModel(vehicleid) != 472 && GetVehicleModel(vehicleid) != 473 && GetVehicleModel(vehicleid) != 476 && GetVehicleModel(vehicleid) != 481 && GetVehicleModel(vehicleid) != 484 && GetVehicleModel(vehicleid) != 487 && GetVehicleModel(vehicleid) != 488 && GetVehicleModel(vehicleid) != 493 && GetVehicleModel(vehicleid) != 497 &&
	GetVehicleModel(vehicleid) != 501 && GetVehicleModel(vehicleid) != 509 && GetVehicleModel(vehicleid) != 510 && GetVehicleModel(vehicleid) != 511 && GetVehicleModel(vehicleid) != 512 && GetVehicleModel(vehicleid) != 513 && GetVehicleModel(vehicleid) != 519 && GetVehicleModel(vehicleid) != 520 && GetVehicleModel(vehicleid) != 521 && GetVehicleModel(vehicleid) != 522 &&
	GetVehicleModel(vehicleid) != 523 && GetVehicleModel(vehicleid) != 537 && GetVehicleModel(vehicleid) != 538 && GetVehicleModel(vehicleid) != 539 && GetVehicleModel(vehicleid) != 548 && GetVehicleModel(vehicleid) != 553 && GetVehicleModel(vehicleid) != 563 && GetVehicleModel(vehicleid) != 564 && GetVehicleModel(vehicleid) != 569 && GetVehicleModel(vehicleid) != 570 &&
	GetVehicleModel(vehicleid) != 577 && GetVehicleModel(vehicleid) != 581 && GetVehicleModel(vehicleid) != 584 && GetVehicleModel(vehicleid) != 586 && GetVehicleModel(vehicleid) != 590 && GetVehicleModel(vehicleid) != 591 && GetVehicleModel(vehicleid) != 592 && GetVehicleModel(vehicleid) != 593 && GetVehicleModel(vehicleid) != 594 && GetVehicleModel(vehicleid) != 595 &&
	GetVehicleModel(vehicleid) != 606 && GetVehicleModel(vehicleid) != 607 && GetVehicleModel(vehicleid) != 608 && GetVehicleModel(vehicleid) != 610 && GetVehicleModel(vehicleid) != 611 && GetVehicleModel(vehicleid) != 444 && GetVehicleModel(vehicleid) != 556 && GetVehicleModel(vehicleid) != 557 && GetVehicleModel(vehicleid) != 573){
		    AddVehicleComponent(vehicleid,1087);
 	    }
}


IsWeaponUAV(weaponid) {
	new bool:IsUAV=false;
   	switch(weaponid)
   	{
   	    case 22..36:
		{
		    IsUAV=true;
		}
	}
	return IsUAV;
}

forward AutoSpectate(playerid);
public AutoSpectate(playerid)
{
	if(Round[Current] == -1)
		return 1;
 	else if(Round[Gamemode] == TDM && (Round[Gameplay] == WAR_ZONE || Round[Gameplay] == RUMBLE))
	 	return 1;
	else if(ActiveTeamPlayers(Player[playerid][pTeam]) < 1)
		return 1;

	for(new i = 0; i <= Server[HighestID]; i++)
	{
	    if(Player[i][pPlaying] == true && Player[i][pTeam] == Player[playerid][pTeam] && playerid != i)
	    {
	        StartSpectate(playerid,i);
	     	Player[playerid][pSpawned] = true;
			HideHUDTextDraws(playerid);
			ShowRoundTextDrawsForPlayer(playerid);
	        return 1;
	    }
	}
	return 1;
}

AdvanceTeamSpectate(playerid)
{
    if(TeamPlayers(Player[playerid][pTeam]) < 1) return StopSpectate(playerid);
    if(Round[Current] != -1 && ActiveTeamPlayers(Player[playerid][pTeam]) < 1)
	{
		StopSpectate(playerid);
		return 1;
	}
	if(GetPlayerState(playerid) == PLAYER_STATE_SPECTATING && Player[playerid][gSpectateType] == SPECTATE_TYPE_PLAYER)
	{
	    for(new x = Player[playerid][gSpectateID]+1; x <= Server[HighestID]+1; x++)
		{
	    	if(x >= Server[HighestID]+1)
			{
				x = 0;
			}
			if(IsPlayerConnected(x) && x != playerid && IsTeamTheSame(Player[x][pTeam],Player[playerid][pTeam]) || Player[playerid][pPlaying] == false && Player[x][pPlaying] == false)
			{
				if((GetPlayerState(x) == PLAYER_STATE_SPECTATING && Player[x][gSpectateID] != INVALID_PLAYER_ID) || (GetPlayerState(x) != 1 && GetPlayerState(x) != 2 && GetPlayerState(x) != 3))
				{
					continue;
				}
				else
				{
					StartSpectate(playerid, x);
					return 1;
				}
			}
		}
	}
	return StopSpectate(playerid);
}

ReverseTeamSpectate(playerid)
{
    if(TeamPlayers(Player[playerid][pTeam]) < 1)return StopSpectate(playerid);
    if(Round[Current] != -1 && ActiveTeamPlayers(Player[playerid][pTeam]) < 1)
	{
		StopSpectate(playerid);
		return 1;
	}
	if(GetPlayerState(playerid) == PLAYER_STATE_SPECTATING && Player[playerid][gSpectateType] == SPECTATE_TYPE_PLAYER)
	{
	    for(new x = Player[playerid][gSpectateID]-1; x >= -1; x--)
		{
	    	if(x < 0)
			{
				x = Server[HighestID]+1;
			}

			if((IsPlayerConnected(x) && x != playerid && IsTeamTheSame(Player[x][pTeam],Player[playerid][pTeam])) || (Player[playerid][pPlaying] == false && Player[x][pPlaying] == false))
			{
				if((GetPlayerState(x) == PLAYER_STATE_SPECTATING && Player[x][gSpectateID] != INVALID_PLAYER_ID) || GetPlayerState(x) != 1 && GetPlayerState(x) != 2 && GetPlayerState(x) != 3)
				{
					continue;
				}
				else
				{
					StartSpectate(playerid, x);
					return 1;
				}
			}
		}
	}
	return StopSpectate(playerid);
}

ActiveTeamPlayers(team)
{
	new players = 0;
    for(new i = 0; i <= Server[HighestID]; i++)
	{
	    if(IsTeamTheSame(Player[i][pTeam], team) && Player[i][pPlaying] == true && Player[i][Specing] == false && Player[i][pSpawned] == true)
	    {
	        players++;
	    }
	}
	return players;
}

TeamPlayers(team)
{
	new players = 0;
    for(new i = 0; i <= Server[HighestID]; i++)
	{
	    if(IsTeamTheSame(Player[i][pTeam], team) && Player[i][pSpawned] && Player[i][Specing] == false && GetPlayerState(i) != PLAYER_STATE_SPECTATING)
	    {
	        players++;
	    }
	}
	return players;
}

PlayersAvailable()
{
	new players = 0;
    for(new i = 0; i <= Server[HighestID]; i++)
	{
	    if(Player[i][pSpawned] && Player[i][Specing] == false && GetPlayerState(i) != PLAYER_STATE_SPECTATING)
	    {
	        players++;
	    }
	}
	return players;
}

AdvanceSpectate(playerid)
{
    if(PlayersAvailable() < 1){StopSpectate(playerid);return 1;}
	if(GetPlayerState(playerid) == PLAYER_STATE_SPECTATING && Player[playerid][gSpectateType] == SPECTATE_TYPE_PLAYER)
	{
	    for(new x = Player[playerid][gSpectateID]+1; x <=Server[HighestID]+1; x++)
		{
	    	if(x == Server[HighestID]+1){x = 0;}
	        if(IsPlayerConnected(x) && x != playerid)
			{
				if((GetPlayerState(x) == PLAYER_STATE_SPECTATING && Player[x][gSpectateID] != INVALID_PLAYER_ID) || GetPlayerState(x) != 1 && GetPlayerState(x) != 2 && GetPlayerState(x) != 3)
				{
					continue;
				}
				else
				{
					StartSpectate(playerid, x);
					break;
				}
			}
		}
	}
	return 1;
}

ReverseSpectate(playerid)
{
    if(PlayersAvailable() < 1){StopSpectate(playerid);return 1;}
	if(GetPlayerState(playerid) == PLAYER_STATE_SPECTATING && Player[playerid][gSpectateType] == SPECTATE_TYPE_PLAYER)
	{
	    for(new x = Player[playerid][gSpectateID]-1; x >= -1; x--)
		{
	    	if(x < 0){x = Server[HighestID]+1;}
	        if(IsPlayerConnected(x) && x != playerid)
			{
				if((GetPlayerState(x) == PLAYER_STATE_SPECTATING && Player[x][gSpectateID] != INVALID_PLAYER_ID) || GetPlayerState(x) != 1 && GetPlayerState(x) != 2 && GetPlayerState(x) != 3)
				{
					continue;
				}
				else
				{
					StartSpectate(playerid, x);
					break;
				}
			}
		}
	}
	return 1;
}

stock GetCurrentSkin(playerid)
{
	if(Player[playerid][pTeam] == T_HOME)
	{
		if(Server[HomeTeamSkin] == -1)
		{
		    if(Player[playerid][pSkin] == -1)
		    {
		        return Config[skin_home];
		    }
		    else if(Config[skincmd] == 1)
		    {
		        return Player[playerid][pSkin];
		    }
		    else return Config[skin_home];
		}
		else
		{
		    return Server[HomeTeamSkin];
		}
	}
	else if(Player[playerid][pTeam] == T_SUBHOME)
	{
	    if(Player[playerid][pSkin] == -1)
	    {
			return Config[skin_subhome];
		}
		else if(Config[skincmd] == 1)
		{
			return Player[playerid][pSkin];
		}
		else return Config[skin_subhome];
	}

	else if(Player[playerid][pTeam] == T_AWAY)
	{
		if(Server[AwayTeamSkin] == -1)
		{
		    if(Player[playerid][pSkin] == -1)
		    {
		        return Config[skin_away];
		    }
		    else if(Config[skincmd] == 1)
		    {
		        return Player[playerid][pSkin];
		    }
		    return Config[skin_away];
		}
		else
		{
		    return Server[AwayTeamSkin];
		}
	}

	else if(Player[playerid][pTeam] == T_SUBAWAY)
	{
	    if(Player[playerid][pSkin] == -1)
	    {
			return Config[skin_subaway];
		}
		else if(Config[skincmd] == 1)
		{
			return Player[playerid][pSkin];
		}
		else return Config[skin_subaway];
	}
	else if(Player[playerid][pTeam] == T_REF)
	{
	    if(Player[playerid][pSkin] == -1)
	    {
			return Config[skin_ref];
		}
		else if(Config[skincmd] == 1)
		{
			return Player[playerid][pSkin];
		}
		else return Config[skin_ref];
	}
	return GetPlayerSkin(playerid);
}
GetDateAndTime()
{
	new hour,minute,second,year,month,day;
	gettime(hour, minute, second);
	getdate(year, month, day);
	return mktime(hour, minute, second, year, month, day);
}


Convert(number)
{
	new hours = 0, mins = 0, secs = 0, string[100];
	hours = floatround(number / 3600);
	mins = floatround((number / 60) - (hours * 60));
	secs = floatround(number - ((hours * 3600) + (mins * 60)));

	if(hours > 0)
		format(string, 100, "%dh %02dm %02ds", hours, mins, secs);
	else
		format(string, 100, "%dmins %02dsecs", mins, secs);


	return string;
}


ConvertMin(number)
{
	new mins = 0, secs = 0, hours, string[10];
	hours = floatround(number / 3600);
	mins = floatround((number / 60) - (hours * 60));
	secs = floatround(number - ((hours * 3600) + (mins * 60)));
	format(string, 10, "%d:%02d", mins, secs);
	return string;
}

stock LoadServerInfo()
{
	#if DATA_SYSTEM == 1
		if(!dini_Exists(ServerDataFile)) return 0;

		Server[TotalRounds] = dini_Int(ServerDataFile,"TotalRounds");
		Server[ServerDeaths] = dini_Int(ServerDataFile,"ServerDeaths");
		Server[ServerKills] = dini_Int(ServerDataFile,"ServerKills");
		Server[TotalConnections] = dini_Int(ServerDataFile,"TotalConnections");
		Server[TotalCrashes] = dini_Int(ServerDataFile,"TotalCrashes");
		Server[ServerRoundDeaths] = dini_Int(ServerDataFile,"ServerRoundDeaths");
		Server[ServerRoundKills] = dini_Int(ServerDataFile,"ServerRoundKills");

		for(new i = 0; i < MAX_COUNT_WEAPONS; i++)
		{
			WeaponsKills[i] = dini_Int(ServerDataFile,weaponsInfo[i][strKills]);
		}
	#elseif DATA_SYSTEM == 2
	
		new query[200];
		format(query, sizeof(query), "SELECT * FROM dc_serverdata");
		mysql_query(query);
		Server[SQLQueriesExecuted]++;
		mysql_store_result();
		new templine[200];
		while(mysql_fetch_row_format(templine, "|"))
		{
			new idx;
			new server_var[256];
			new server_data[256];

			server_var = mysql_strtok(templine, idx, "|");
			server_data = mysql_strtok(templine, idx, "|");
			new int_server_data = strval(server_data);

			if (isStringSame(server_var, "TotalRounds", 256)) {
				Server[TotalRounds] = int_server_data;
			} else if (isStringSame(server_var, "ServerDeaths", 256)) {
				Server[ServerDeaths] = int_server_data;
			} else if (isStringSame(server_var, "ServerKills", 256)) {
				Server[ServerKills] = int_server_data;
			} else if (isStringSame(server_var, "TotalConnections", 256)) {
				Server[TotalConnections] = int_server_data;
			} else if (isStringSame(server_var, "TotalCrashes", 256)) {
				Server[TotalCrashes] = int_server_data;
			} else if (isStringSame(server_var, "ServerRoundDeaths", 256)) {
				Server[ServerRoundDeaths] = int_server_data;
			} else if (isStringSame(server_var, "ServerRoundKills", 256)) {
				Server[ServerRoundKills] = int_server_data;
			}
		}

		for(new i = 0; i < MAX_COUNT_WEAPONS; i++)
		{
			WeaponsKills[i] = GetSqlWepKillDataInt(weaponsInfo[i][strKills]);
		}
	#endif

	printf("  -> Server Variables Loaded", 175, 174);
  	return 1;
}

stock SaveServerInfoToFile()
{
	#if DATA_SYSTEM == 1
		if(!dini_Exists(ServerDataFile)) dini_Create(ServerDataFile);

		new hour,minute,second;
		new year, month,day;
		gettime(hour, minute, second);
		getdate(year, month, day);

		new string[256];
		format(string,256,"%d/%d/%d | %d:%02d:%02d",day,month,year,hour,minute,second);

		dini_Set(ServerDataFile,"Last_Updated",string);
		dini_IntSet(ServerDataFile,"TotalRounds",Server[TotalRounds]);
		dini_IntSet(ServerDataFile,"ServerDeaths",Server[ServerDeaths]);
		dini_IntSet(ServerDataFile,"ServerKills",Server[ServerKills]);
		dini_IntSet(ServerDataFile,"TotalConnections",Server[TotalConnections]);
		dini_IntSet(ServerDataFile,"TotalCrashes",Server[TotalCrashes]);
		dini_IntSet(ServerDataFile,"ServerRoundDeaths",Server[ServerRoundDeaths]);
		dini_IntSet(ServerDataFile,"ServerRoundKills",Server[ServerRoundKills]);

		for(new i = 0; i < MAX_COUNT_WEAPONS; i++)
		{
  			dini_IntSet(ServerDataFile,weaponsInfo[i][strKills], WeaponsKills[i]);
		}
	#elseif DATA_SYSTEM == 2
		new hour,minute,second;
		new year, month,day;
		gettime(hour, minute, second);
		getdate(year, month, day);

		new string[256];
		format(string,256,"%d/%d/%d | %d:%02d:%02d",day,month,year,hour,minute,second);

		UpdateSqlServerDataStr("Last_Updated", string);
		UpdateSqlServerDataInt("TotalRounds",Server[TotalRounds]);
		UpdateSqlServerDataInt("ServerDeaths",Server[ServerDeaths]);
		UpdateSqlServerDataInt("ServerKills",Server[ServerKills]);
		UpdateSqlServerDataInt("TotalConnections",Server[TotalConnections]);
		UpdateSqlServerDataInt("TotalCrashes",Server[TotalCrashes]);
		UpdateSqlServerDataInt("ServerRoundDeaths",Server[ServerRoundDeaths]);
		UpdateSqlServerDataInt("ServerRoundKills",Server[ServerRoundKills]);

		for(new i = 0; i < MAX_COUNT_WEAPONS; i++)
		{
  			UpdateSqlWepKillDataInt(weaponsInfo[i][strKills], WeaponsKills[i]);
		}
	#endif
}

forward ShowWeaponStats(playerid,targetid);
public ShowWeaponStats(playerid,targetid)
{
    new string[256];
	new wep[24];
	format(string,256,"-NickServ- %s ���� ��ų:", PlayerName(targetid));
	SendClientMessageEx(playerid,COLOR_ORANGE, string);
	string = " ";
	for (new i = 0; i < 5; i++)
	{
		GetWeaponName(weaponsInfo[i][WID],wep,24);
		format(string,256,"%s || %s - ų: %d", string, wep, Player[targetid][pWeaponsKills][i]);
	}
	SendClientMessageEx(playerid,COLOR_YELLOW,string);
	string = " ";
	for (new i = 5; i < 9; i++)
	{
		GetWeaponName(weaponsInfo[i][WID],wep,24);
		format(string,256,"%s || %s - ų: %d", string, wep, Player[targetid][pWeaponsKills][i]);
	}
	SendClientMessageEx(playerid,COLOR_YELLOW,string);
	string = " ";
	for (new i = 9; i < MAX_COUNT_WEAPONS; i++)
	{
		GetWeaponName(weaponsInfo[i][WID],wep,24);
		format(string,256,"%s || %s - ų: %d", string, wep, Player[targetid][pWeaponsKills][i]);
	}
	SendClientMessageEx(playerid,COLOR_YELLOW,string);
	return 1;
}

forward ShowStats(playerid,targetid);
public ShowStats(playerid,targetid)
{
    if(IsPlayerConnected(playerid)&&IsPlayerConnected(targetid))
	{
		new actual = GetDateAndTime()-Player[targetid][TempTime];
		new time = Player[targetid][OnlineTime] + actual;
		new deaths = Player[targetid][Deaths];
		new kills = Player[targetid][Kills];
		new kspree = Player[targetid][KillSpree];
		new dspree = Player[targetid][DeathSpree];
		new cptime = Player[targetid][CaptureTimes];
		new roundsp = Player[targetid][RoundsPlayedEx];
		new roundsk = Player[targetid][RoundKillsEx];
 		new roundsd = Player[targetid][RoundDeathsEx];
		new duelsw = Player[targetid][DuelsWon];
 		new duelsl = Player[targetid][DuelsLost];

		new string[256];
		new string2[256];
		format(string2, sizeof(string2), "-NickServ- %s ����:",PlayerName(targetid));
		SendClientMessageEx(playerid, COLOR_ORANGE, string2);
		format(string, sizeof(string), "�� ų: %d | �� ����: %d | �� ����: %s | �¶��� �ð�: %s",kills,deaths,GetRatio(kills, deaths),Convert(time));
		SendClientMessageEx(playerid, 0x33AAFFFF, string);
		format(string, sizeof(string), "�ִ� ų �޺�: %d | �ִ� ���� �޺�: %d | Rounds �÷��� Ƚ��: %d | ���� Ƚ��: %d",kspree,dspree,roundsp,cptime);
		SendClientMessageEx(playerid, 0x33AAFFFF, string);
		format(string, sizeof(string), "Round ų: %d | Round ����: %d | Round ����: %s",roundsk,roundsd,GetRatio(roundsk, roundsd));
		SendClientMessageEx(playerid, 0x33AAFFFF, string);
		format(string, sizeof(string), "Duels �¸�: %d | Duels �й�: %d | Duels ����: %s",duelsw,duelsl,GetRatio(duelsw, duelsl));
		SendClientMessageEx(playerid, 0x33AAFFFF, string);
		format(string, sizeof(string), "DM ų: %d | DM ����: %d | DM ����: %s | DM �÷��� �ð�: %s",Player[targetid][DMKills],Player[targetid][DMDeaths],GetRatio(Player[targetid][DMKills], Player[targetid][DMDeaths]), Convert(Player[targetid][DMPlayTime]));
		SendClientMessageEx(playerid, 0x33AAFFFF, string);

		new wepID, wepkills;

	    for(new i = 0; i < MAX_COUNT_WEAPONS; i++) //All other weapons
	    {
   			if(Player[targetid][pWeaponsKills][i] > 0)
			{
				if(Player[targetid][pWeaponsKills][i] > wepkills)
				{
			   	    wepkills=Player[targetid][pWeaponsKills][i];
			   	    wepID= weaponsInfo[i][WID];
				}
			}
	    }
	    if(wepkills > 0)
	    {
	    	new wepname[24];
	    	GetWeaponName(wepID,wepname,24);
   			format(string,256,"���� ���� ���� ����: %s (%d ų)", wepname, wepkills);
			SendClientMessageEx(playerid,COLOR_YELLOW,string);
		}

		new ip[24];
		GetPlayerIp(targetid, ip, 24);
   		format(string,256,"FPS: %d | Tickrate: %d | Ping: %d", Player[targetid][FPS2]-1, Player[targetid][Tickrate], GetPlayerPing(targetid));
		SendClientMessageEx(playerid,COLOR_YELLOW,string);
		if (IsPlayerAdmin3(playerid)) {
   			format(string,256,"IP: %s", ip);
			SendClientMessageEx(playerid,COLOR_YELLOW,string);
		}
	}
}

forward ShowPlayerBaseInfo(playerid,baseid);
public ShowPlayerBaseInfo(playerid,baseid)
{
	new Float:Distance = GetBaseAttCPDistance(baseid);

	new string[256];
	format(string,256,"> ���̽� %s - ��ȣ %d ���:", BaseVariables[baseid][About], baseid);
	SendClientMessageEx(playerid, COLOR_ORANGE, string);

	new time[24];
	if(BaseVariables[baseid][WorldTime] != -1)
	{
		format(time,24,"%d",BaseVariables[baseid][WorldTime]);
	}
	else
	{
		time = "�̼���";
	}

	format(string,256,"������: %s ������: %s | ������ �Ÿ�: '%.1f'ft.", BaseVariables[baseid][Creator], BaseVariables[baseid][CreationDate], Distance);
	SendClientMessageEx(playerid, 0x33AAFFFF, string);

	format(string,256,"�÷��� Ƚ��: %d | ���� �¸� Ƚ��: %d | ��� �¸� Ƚ��: %d | ���׸���: %d | ���� �ð�: %s", BaseVariables[baseid][TimesPlayed], BaseVariables[baseid][AttWins], BaseVariables[baseid][DefWins], BaseVariables[baseid][Interior],time);
	SendClientMessageEx(playerid, 0x33AAFFFF, string);
}

forward Float:GetBaseAttCPDistance(baseid);
public Float:GetBaseAttCPDistance(baseid)
{
	new Float:x1,Float:y1,Float:z1,Float:x2,Float:y2,Float:z2;

	x1 = BaseVariables[baseid][AttSpawn][0];
	y1 = BaseVariables[baseid][AttSpawn][1];
	z1 = BaseVariables[baseid][AttSpawn][2];

	x2 = BaseVariables[baseid][BaseCheckpoint][0];
	y2 = BaseVariables[baseid][BaseCheckpoint][1];
	z2 = BaseVariables[baseid][BaseCheckpoint][2];

	return floatsqroot(floatpower(floatabs(floatsub(x2,x1)),2)+floatpower(floatabs(floatsub(y2,y1)),2)+floatpower(floatabs(floatsub(z2,z1)),2));
}

ResetAccount(playerid)
{
	new file[200];
	format(file, sizeof(file), "combinations/players/%s.ini", nick_encode(PlayerName(playerid)));

 	Player[playerid][RoundsPlayedEx] = 0;
 	Player[playerid][Kills] = 0;
  	Player[playerid][Deaths] = 0;

   	Player[playerid][KillSpree] = 0;
    Player[playerid][DeathSpree] = 0;
    Player[playerid][CaptureTimes] = 0;
    Player[playerid][OnlineTime] = 0;
 	Player[playerid][RoundsPlayedEx] = 0;
  	Player[playerid][RoundDeathsEx] = 0;
   	Player[playerid][RoundKillsEx] = 0;
  	Player[playerid][pLevel] = 0;

   	Player[playerid][pCarColor1] = -1;
  	Player[playerid][pCarColor2] = -1;

	#if DATA_SYSTEM == 2
	    SetKillsGameSession(playerid, 0);
		SetDeathsGameSession(playerid, 0);
    	LogoutGameSession(playerid);
	#endif

	Player[playerid][SpawnType] = 0;
	Spawn[playerid][0] = 0.0;
	Spawn[playerid][1] = 0.0;
	Spawn[playerid][2] = 0.0;
	Spawn[playerid][3] = 0.0;

	for(new i = 0; i < MAX_COUNT_WEAPONS; i++)
	{
		Player[playerid][pWeaponsKills][i] = 0;
		Player[playerid][pWeaponsDeaths][i] = 0;
	}

	for(new slots = 0; slots < 13; slots++)
	{
	    new ffs[24];
	    format(ffs,24,"getgunweap_%d", slots);
		PlayerGuns[playerid][slots] = 0;

 	    format(ffs,24,"getgunammo_%d", slots);
		PlayerAmmos[playerid][slots] = 0;
	}
}

LoadAccount(playerid)
{
	#if DATA_SYSTEM  == 1
		new file[200];
		format(file, sizeof(file), "combinations/players/%s.ini", nick_encode(PlayerName(playerid)));

		if(!dini_Exists(file)) return 0;

	 	Player[playerid][RoundsPlayedEx] = dini_Int(file,"RoundsPlayedEx");
	 	Player[playerid][Kills] = dini_Int(file,"Kills");
	  	Player[playerid][Deaths] = dini_Int(file,"Deaths");
	   	Player[playerid][KillSpree] = dini_Int(file,"KillSpree");
	    Player[playerid][DeathSpree] = dini_Int(file,"DeathSpree");
	    Player[playerid][CaptureTimes] = dini_Int(file,"CaptureTimes");
	    Player[playerid][OnlineTime] = dini_Int(file,"OnlineTime");
	 	Player[playerid][RoundsPlayedEx] = dini_Int(file,"RoundsPlayedEx");
	  	Player[playerid][RoundDeathsEx] = dini_Int(file,"RoundDeathsEx");
	   	Player[playerid][RoundKillsEx] = dini_Int(file,"RoundKillsEx");
	  	Player[playerid][pLevel] = dini_Int(file,"AdminLevel");

	   	Player[playerid][DMKills] = dini_Int(file,"DMKills");
	  	Player[playerid][DMDeaths] = dini_Int(file,"DMDeaths");
	  	Player[playerid][DMPlayTime] = dini_Int(file,"DMPlayTime");

		if(dini_Isset(file,"fightstyle"))
		    SetPlayerFightingStyle(playerid, dini_Int(file,"fightstyle"));

		if ((Player[playerid][pLevel] == 1) || (Player[playerid][pLevel] == 2)) {
  			CallRemoteFunction("DC_MakeAdmin", "i", playerid);
	  	}
	   	Player[playerid][DuelsWon] = dini_Int(file,"DuelsWon");
	  	Player[playerid][DuelsLost] = dini_Int(file,"DuelsLost");
	   	Player[playerid][pCarColor1] = dini_Int(file,"CarColor1");
	  	Player[playerid][pCarColor2] = dini_Int(file,"CarColor2");

		new idx = 0, string[256];
	  	format(string, 200, "spawn");
		string = dini_Get(file,string);

		new ip[24];
		GetPlayerIp(playerid, ip, 24);
		dini_Set(file,"lastloginip",ip);

		Player[playerid][SpawnType] = 	dini_Int(file,"spawntype");
		Spawn[playerid][0] = floatstr(strtok(string,idx,','));
		Spawn[playerid][1] = floatstr(strtok(string,idx,','));
		Spawn[playerid][2] = floatstr(strtok(string,idx,','));
		Spawn[playerid][3] = floatstr(strtok(string,idx,','));

		for(new i = 0; i < MAX_COUNT_WEAPONS; i++)
		{
			Player[playerid][pWeaponsKills][i] = dini_Int(file,weaponsInfo[i][strKills]);
			Player[playerid][pWeaponsDeaths][i] = dini_Int(file,weaponsInfo[i][strDeaths]);
		}

		for(new slots = 0; slots < 13; slots++)
		{
		    new ffs[24];
		    format(ffs,24,"getgunweap_%d", slots);
			PlayerGuns[playerid][slots] = dini_Int(file,ffs);

	 	    format(ffs,24,"getgunammo_%d", slots);
			PlayerAmmos[playerid][slots] = dini_Int(file,ffs);
		}
		return 1;
	#elseif DATA_SYSTEM == 2
		if(!SqlUserExist(PlayerName(playerid))) return 0;

		if (IsPlayerInClan(playerid)) {
			if (!SqlClanExist(GetPlayerClanTag(playerid))) {
		    	SqlCreateClanRow(GetPlayerClanTag(playerid));
			} else {
			}
		} else {
		}

		LoginGameSession(playerid);

	 	Player[playerid][RoundsPlayedEx] = GetSqlUserDataInt(PlayerName(playerid), "RoundsPlayedEx");
	 	Player[playerid][Kills] = GetSqlUserDataInt(PlayerName(playerid), "Kills");
	  	Player[playerid][Deaths] = GetSqlUserDataInt(PlayerName(playerid), "Deaths");
		SetKillsGameSession(playerid, Player[playerid][Kills]);
		SetDeathsGameSession(playerid, Player[playerid][Deaths]);
	   	Player[playerid][KillSpree] = GetSqlUserDataInt(PlayerName(playerid), "KillSpree");
	    Player[playerid][DeathSpree] = GetSqlUserDataInt(PlayerName(playerid), "DeathSpree");
	    Player[playerid][CaptureTimes] = GetSqlUserDataInt(PlayerName(playerid), "CaptureTimes");
	    Player[playerid][OnlineTime] = GetSqlUserDataInt(PlayerName(playerid), "OnlineTime");
	  	Player[playerid][RoundDeathsEx] = GetSqlUserDataInt(PlayerName(playerid), "RoundDeathsEx");
	   	Player[playerid][RoundKillsEx] = GetSqlUserDataInt(PlayerName(playerid), "RoundKillsEx");
	  	Player[playerid][pLevel] = GetSqlUserDataInt(PlayerName(playerid), "AdminLevel");
		if ((Player[playerid][pLevel] == 1) || (Player[playerid][pLevel] == 2)) {
  			CallRemoteFunction("DC_MakeAdmin", "i", playerid);
	  	}
	  	Player[playerid][DuelsWon] = GetSqlUserDataInt(PlayerName(playerid), "DuelsWon");
   	  	Player[playerid][DuelsLost] = GetSqlUserDataInt(PlayerName(playerid), "DuelsLost");
	   	Player[playerid][pCarColor1] = GetSqlUserDataInt(PlayerName(playerid), "CarColor1");
	  	Player[playerid][pCarColor2] = GetSqlUserDataInt(PlayerName(playerid), "CarColor2");

	   	Player[playerid][DMKills] = GetSqlUserDataInt(PlayerName(playerid), "DMKills");
	  	Player[playerid][DMDeaths] = GetSqlUserDataInt(PlayerName(playerid), "DMDeaths");
	  	Player[playerid][DMPlayTime] = GetSqlUserDataInt(PlayerName(playerid), "DMPlayTime");

		SetPlayerFightingStyle(playerid, GetSqlUserDataInt(PlayerName(playerid), "fightstyle"));

		Player[playerid][pLanguage] = GetSqlUserDataInt(PlayerName(playerid), "Language");

		new ip[24];
		GetPlayerIp(playerid, ip, 24);
		UpdateSqlUserDataStr(playerid, "lastloginip", ip);

		new idx = 0, string[256];
	  	format(string, 200, "spawn");
		string = GetSqlUserDataStr(PlayerName(playerid), string);

		Player[playerid][SpawnType] = GetSqlUserDataInt(PlayerName(playerid), "spawntype");
		Spawn[playerid][0] = floatstr(strtok(string,idx,','));
		Spawn[playerid][1] = floatstr(strtok(string,idx,','));
		Spawn[playerid][2] = floatstr(strtok(string,idx,','));
		Spawn[playerid][3] = floatstr(strtok(string,idx,','));

		for(new i = 0; i < MAX_COUNT_WEAPONS; i++)
		{
		    //new wepstr[200];
		    //format(webstr, 200, "", );
			Player[playerid][pWeaponsKills][i] = GetSqlUserWepStat(PlayerName(playerid), weaponsInfo[i][strKills]);
			Player[playerid][pWeaponsKills][i] = GetSqlUserWepStat(PlayerName(playerid), weaponsInfo[i][strDeaths]);
		}

		for(new slots = 0; slots < 13; slots++)
		{
		    new ffs[24];
		    format(ffs,24,"getgunweap_%d", slots);
			PlayerGuns[playerid][slots] = GetSqlPlayerGetGun(playerid, ffs);

	 	    format(ffs,24,"getgunammo_%d", slots);
			PlayerAmmos[playerid][slots] = GetSqlPlayerGetGun(playerid, ffs);
		}
		return 1;
	#endif
}

SaveAccount(playerid)
{
	#if DATA_SYSTEM  == 1
		new file[200];
		format(file, sizeof(file), "combinations/players/%s.ini", nick_encode(PlayerName(playerid)));

		if(!dini_Exists(file)) return 0;

		new Actual = GetDateAndTime();
		Player[playerid][OnlineTime] += Actual - Player[playerid][TempTime];

		new hour,minute,second,year,month,day;
		gettime(hour, minute, second);
		getdate(year, month, day);

		new string[256];
		format(string,256,"%d/%d/%d - %d:%02d:%02d",month,day,year,hour,minute,second);

		dini_Set(file,"LastUpdate",string);

	 	dini_IntSet(file,"RoundsPlayedEx",Player[playerid][RoundsPlayedEx]);
		dini_IntSet(file,"Kills",Player[playerid][Kills]);
		dini_IntSet(file,"Deaths",Player[playerid][Deaths]);
		dini_IntSet(file,"KillSpree",Player[playerid][KillSpree]);
		dini_IntSet(file,"DeathSpree",Player[playerid][DeathSpree]);
		dini_IntSet(file,"CaptureTimes",Player[playerid][CaptureTimes]);
		dini_IntSet(file,"OnlineTime",Player[playerid][OnlineTime]);
		dini_IntSet(file,"RoundDeathsEx",Player[playerid][RoundDeathsEx]);
		dini_IntSet(file,"RoundKillsEx",Player[playerid][RoundKillsEx]);
		dini_IntSet(file,"CarColor1",Player[playerid][pCarColor1]);
		dini_IntSet(file,"CarColor2",Player[playerid][pCarColor2]);
		dini_IntSet(file,"DuelsWon",Player[playerid][DuelsWon]);
		dini_IntSet(file,"DuelsLost",Player[playerid][DuelsLost]);

	 	dini_IntSet(file,"DMKills",Player[playerid][DMKills]);
		dini_IntSet(file,"DMDeaths",Player[playerid][DMDeaths]);

		dini_IntSet(file,"Language",Player[playerid][pLanguage]);

		format(string,256, "%f,%f,%f,%f\n",Spawn[playerid][0], Spawn[playerid][1], Spawn[playerid][2],Spawn[playerid][3]);
		dini_Set(file,"spawn",string);
		dini_IntSet(file,"spawntype",Player[playerid][SpawnType]);

		for(new i = 0; i < MAX_COUNT_WEAPONS; i++)
		{
			dini_IntSet(file,weaponsInfo[i][strKills],Player[playerid][pWeaponsKills][i]);
			dini_IntSet(file,weaponsInfo[i][strDeaths],Player[playerid][pWeaponsDeaths][i]);
		}

		for(new slots = 0; slots < 13; slots++)
		{
		    new ffs[24];
		    format(ffs,24,"getgunweap_%d", slots);
			dini_IntSet(file,ffs,PlayerGuns[playerid][slots]);

		    format(ffs,24,"getgunammo_%d", slots);
			dini_IntSet(file,ffs,PlayerAmmos[playerid][slots]);
		}
		return 1;
	#elseif DATA_SYSTEM == 2
		if(!SqlUserExist(PlayerName(playerid))) return 0;

		new Actual = GetDateAndTime();
		Player[playerid][OnlineTime] += Actual - Player[playerid][TempTime];

		new hour,minute,second,year,month,day;
		gettime(hour, minute, second);
		getdate(year, month, day);

		new string[256];
		format(string,256,"%d/%d/%d - %d:%02d:%02d",month,day,year,hour,minute,second);

		UpdateSqlUserDataStr(playerid, "LastUpdate", string);

		UpdateSqlUserDataInt(playerid, "RoundsPlayedEx", Player[playerid][RoundsPlayedEx]);
		UpdateSqlUserDataInt(playerid, "Kills", Player[playerid][Kills]);
		UpdateSqlUserDataInt(playerid, "Deaths", Player[playerid][Deaths]);

		SetKillsGameSession(playerid, Player[playerid][Kills]);
		SetDeathsGameSession(playerid, Player[playerid][Deaths]);

		UpdateSqlUserDataInt(playerid, "KillSpree", Player[playerid][KillSpree]);
		UpdateSqlUserDataInt(playerid, "DeathSpree", Player[playerid][DeathSpree]);
		UpdateSqlUserDataInt(playerid, "CaptureTimes", Player[playerid][CaptureTimes]);
		UpdateSqlUserDataInt(playerid, "OnlineTime", Player[playerid][OnlineTime]);
		UpdateSqlUserDataInt(playerid, "RoundDeathsEx", Player[playerid][RoundDeathsEx]);
		UpdateSqlUserDataInt(playerid, "RoundKillsEx", Player[playerid][RoundKillsEx]);
		UpdateSqlUserDataInt(playerid, "CarColor1", Player[playerid][pCarColor1]);
		UpdateSqlUserDataInt(playerid, "CarColor2", Player[playerid][pCarColor2]);
		UpdateSqlUserDataInt(playerid, "DuelsWon", Player[playerid][DuelsWon]);
		UpdateSqlUserDataInt(playerid, "DuelsLost", Player[playerid][DuelsLost]);
		UpdateSqlUserDataInt(playerid, "DMKills", Player[playerid][DMKills]);
		UpdateSqlUserDataInt(playerid, "DMDeaths", Player[playerid][DMDeaths]);

		UpdateSqlUserDataInt(playerid, "Language", Player[playerid][pLanguage]);

		format(string,256, "%f,%f,%f,%f\n",Spawn[playerid][0], Spawn[playerid][1], Spawn[playerid][2],Spawn[playerid][3]);
		UpdateSqlUserDataStr(playerid, "spawn", string);
		UpdateSqlUserDataInt(playerid, "spawntype", Player[playerid][SpawnType]);

		for(new i = 0; i < MAX_COUNT_WEAPONS; i++)
		{
			UpdateSqlUserWepStat(playerid, weaponsInfo[i][strKills], Player[playerid][pWeaponsKills][i]);
			UpdateSqlUserWepStat(playerid, weaponsInfo[i][strDeaths], Player[playerid][pWeaponsDeaths][i]);
		}

		for(new slots = 0; slots < 13; slots++)
		{
		    new ffs[24];
		    format(ffs,24,"getgunweap_%d", slots);
			UpdateSqlPlayerGetGun(playerid, ffs, PlayerGuns[playerid][slots]);

		    format(ffs,24,"getgunammo_%d", slots);
			UpdateSqlPlayerGetGun(playerid, ffs, PlayerAmmos[playerid][slots]);
		}
		return 1;
	#endif
}

stock GetPlayerLevelName(playerid)
{
	new str[24];
	switch(Player[playerid][pLevel])
	{
	    case 0: str = "�Ϲ� ȸ��";
		case 1: str = "�Ϲ� ������";
		case 2: str = "��� ������";
	}
	return str;
}
forward SetPlayerPosEx(playerid, Float:X, Float:Y, Float:Z);
public SetPlayerPosEx(playerid, Float:X, Float:Y, Float:Z) { return SetPlayerPos(playerid, X, Y, Z); }

stock wnames_encode(nickname[]) {
  new tmp[MAX_STRING];
  set(tmp,nickname);
  tmp=strreplace(" ","_",tmp);
  return tmp;
}

stock wnames_ammo_encode(nickname[]) {
  new tmp[MAX_STRING], output[MAX_STRING];
  set(tmp,nickname);
  tmp=strreplace(" ","_",tmp);
  format(output,sizeof(output),"ammo_%s", tmp);
  return output;
}

forward DestroyVehicle2(vehicleid);
public DestroyVehicle2(vehicleid)
{
	if(VehicleInfo[vehicleid][hasSpawned])
	{
		DestroyVehicle(vehicleid);
		DeleteCarNameLabel(vehicleid);
		Server[Vehicles]--;
		VehicleInfo[vehicleid][vWorld] = -1;
		VehicleInfo[vehicleid][pDriver] = -1;
		VehicleInfo[vehicleid][pPass1] = -1;
		VehicleInfo[vehicleid][pPass2] = -1;
		VehicleInfo[vehicleid][pPass3] = -1;
		for(new i = 0; i <= Server[HighestID]; i ++)
		{
		    if(IsPlayerConnected(i))
		    {
		        if(Player[i][vHud] == true && Player[i][vHudID] == vehicleid)
		        {
		            HideVehicleHud(i, vehicleid);
		        }
		    }
		}

		VehicleInfo[vehicleid][hasSpawned] = false;
	}
}

forward CheckServPass(playerid);
public CheckServPass(playerid) {
	if(!Player[playerid][lock_pass] && IsPlayerConnected(playerid)) {
		new tmp[200];
	    format(tmp, 200, "%s ���� ���� ��й�ȣ�� �Է����� �ʾ� ������ϼ̽��ϴ�.", PlayerName(playerid));
	    SendClientMessageToAllEx(COLOR_YELLOW, tmp);
	    Kick(playerid);
	}
}

stock IsTeamTheSame(team1, team2)
{
	if(team1 == team2)
	    return true;
	else if((team1 == T_HOME || team2 == T_HOME) && (team1 == T_SUBHOME || team2 == T_SUBHOME))
		return true;
	else if((team1 == T_AWAY || team2 == T_AWAY) && (team1 == T_SUBAWAY || team2 == T_SUBAWAY))
		return true;
	else
	    return false;
}

forward SpawnVehicleForPlayer(playerid, modelid);
public SpawnVehicleForPlayer(playerid, modelid)
{
	HideMenuForPlayer(vehiclemenu, playerid);

	new Float:x, Float:y, Float:z, Float:a;
	GetPlayerPos(playerid, x, y, z);
	GetXYInFrontOfPlayer(playerid, x, y, 0.1);
	GetPlayerFacingAngle(playerid, a);
	AttackerVehicle[playerid][hasSpawned] = true;
	AttackerVehicle[playerid][vID] = CreateVehicle(modelid, x, y, z + 1.0, a, -1, -1, 5000);

	SetVehicleNumberPlate(AttackerVehicle[playerid][vID], "[KR] R.I.P.");

	if ((Round[Current] != -1) && (Player[playerid][pPlaying])) {
	    VehicleInfo[AttackerVehicle[playerid][vID]][round] = true;
	} else {
	    VehicleInfo[AttackerVehicle[playerid][vID]][round] = false;
	}

	AttackerVehicle[playerid][vModel] = modelid;
	VehicleInfo[AttackerVehicle[playerid][vID]][pDriver] = -1;
	VehicleInfo[AttackerVehicle[playerid][vID]][pPass1] = -1;
	VehicleInfo[AttackerVehicle[playerid][vID]][pPass2] = -1;
	VehicleInfo[AttackerVehicle[playerid][vID]][pPass3] = -1;

	LinkVehicleToInterior(AttackerVehicle[playerid][vID], GetPlayerInterior(playerid));
	SetTimerEx("PlayerToVehicle", 250, false, "ii", playerid, AttackerVehicle[playerid][vID]);

	if(Server[AllowVehicleMod] == true)
	{
		ApplyVehicleStuff(AttackerVehicle[playerid][vID]);
	}

	TogglePlayerControllable(playerid, 1);
	new p_vworld = GetPlayerVirtualWorld(playerid);
	SetVehicleVirtualWorld2(AttackerVehicle[playerid][vID], p_vworld);
	VehicleInfo[AttackerVehicle[playerid][vID]][vWorld] =p_vworld;
	new string[100];
	format(string, sizeof(string),"{FFFFFF}%c {37DB45}���� ��ȯ: {FFFFFF}%s {37DB45}- ID: {FFFFFF}%d",187,VehicleName[modelid-400],modelid);
	SendClientMessageEx(playerid, COLOR_GREEN, string);

	new veh4_str[100];
	format(veh4_str, 100, "~g~~h~%s", VehicleName[modelid-400]);
	TextDrawSetString(veh4[AttackerVehicle[playerid][vID]], veh4_str);
	TextDrawAlignment(veh4[AttackerVehicle[playerid][vID]], 2);

	VehicleInfo[AttackerVehicle[playerid][vID]][pDriver] =playerid;
	VehicleInfo[AttackerVehicle[playerid][vID]][hasSpawned] = true;

	TextDrawTextSize(veh6[AttackerVehicle[playerid][vID]], 115.0,50.0);
	if(Player[playerid][pCarColor1] != -1)
	{
	 	ChangeVehicleColor(AttackerVehicle[playerid][vID],Player[playerid][pCarColor1], Player[playerid][pCarColor2]);
	}

	Update3DTextLabelText(VehicleInfo[AttackerVehicle[playerid][vID]][NameLabel], COLOR_RED, VehicleName[modelid-400]);

    Attach3DTextLabelToVehicle(VehicleInfo[AttackerVehicle[playerid][vID]][NameLabel], AttackerVehicle[playerid][vID], 0, 0, 0);
    SetTimerEx("DeleteCarNameLabel", 7000, false, "i", AttackerVehicle[playerid][vID]);
	Server[Vehicles]++;
}

forward PlayerToVehicle(playerid, vehicleid);
public PlayerToVehicle(playerid, vehicleid)
{
	PutPlayerInVehicle(playerid, vehicleid, 0);
	return 1;
}

forward PlayerToPoint(Float:radi, playerid, Float:x, Float:y, Float:z);
public PlayerToPoint(Float:radi, playerid, Float:x, Float:y, Float:z)
{
	if(IsPlayerConnected(playerid))
	{
		new Float:oldposx, Float:oldposy, Float:oldposz;
		new Float:tempposx, Float:tempposy, Float:tempposz;
		GetPlayerPos(playerid, oldposx, oldposy, oldposz);
		tempposx = (oldposx -x);
		tempposy = (oldposy -y);
		tempposz = (oldposz -z);
		if(((tempposx < radi) && (tempposx > -radi)) && ((tempposy < radi) && (tempposy > -radi)) && ((tempposz < radi) && (tempposz > -radi)))
		{
			return 1;
		}
	}
	return 0;
}
GetTeamName(team)
{
	new name[256];
	if(team == T_HOME)
		name = HomeName;
	else if(team == T_SUBHOME)
	    format(name,256,"%s Sub", HomeName);
	else if(team == T_AWAY)
		name = AwayName;
	else if(team == T_SUBAWAY)
	    format(name,256,"%s Sub", AwayName);
	else if(team == T_REF)
		name = RefName;
	else if(team == 5)
	    name = "Auto-Assign";

	return name;
}

GetTeamColor(active, team) {
	if(active == 1) { //active, darker color
	    if(team == T_AWAY) {
	        return AWAY_COLOR;
	    }
	    if(team == T_HOME) {
	        return HOME_COLOR;
	    }
	} else { //inactive lighter color
	    if(team == T_AWAY) {
	        return AWAY_INACTIVE_COLOR;
	    }
	    if(team == T_HOME) {
	        return HOME_INACTIVE_COLOR;
	    }
	}
	return 1;
}

ShowVehicleHud(playerid, vehicleid)
{
	if(Player[playerid][vHud] == true)
	    return 0;

	Player[playerid][vHud] = true;
	Player[playerid][vHudID] = vehicleid;
	TextDrawShowForPlayer(playerid, veh1);
	TextDrawShowForPlayer(playerid, veh2);
	TextDrawShowForPlayer(playerid, veh3);
	TextDrawShowForPlayer(playerid, veh4[vehicleid]);
	TextDrawShowForPlayer(playerid, veh5);
	TextDrawShowForPlayer(playerid, veh6[vehicleid]);
	TextDrawShowForPlayer(playerid, veh7[vehicleid]);
	return 1;
}

HideVehicleHud(playerid, vehicleid)
{
	if(Player[playerid][vHud] == false)
	    return 0;

	Player[playerid][vHud] = false;
	TextDrawHideForPlayer(playerid, veh1);
	TextDrawHideForPlayer(playerid, veh2);
	TextDrawHideForPlayer(playerid, veh3);
	TextDrawHideForPlayer(playerid, veh4[vehicleid]);
	TextDrawHideForPlayer(playerid, veh5);
	TextDrawHideForPlayer(playerid, veh6[vehicleid]);
	TextDrawHideForPlayer(playerid, veh7[vehicleid]);
	return 1;
}

forward EnableSync(playerid);
public EnableSync(playerid)
{
	Player[playerid][CanSync] = true;
}

forward EnableScrollSpec(playerid);
public EnableScrollSpec(playerid)
{
	Player[playerid][CanScrollSpec] = true;
}

forward SyncPlayer(playerid);
public SyncPlayer(playerid)
{
	if(Player[playerid][CanSync] == false)
		return SendClientMessageEx(playerid, COLOR_RED, "Error: ����ȭ�� �����ϼ̽��ϴ�.");
	else if(IsPlayerInAnyVehicle(playerid))
		return SendClientMessageEx(playerid, COLOR_RED, "Error: ����ȭ�� �����ϼ̽��ϴ�.");
	else if(Player[playerid][pDuel] > 0 && InDuel[Player[playerid][pDuel]] == 1)
		return SendClientMessageEx(playerid, COLOR_RED, "Error: ����ȭ�� �����ϼ̽��ϴ�.");
	else if(IsPlayerInCheckpoint(playerid))
		return SendClientMessageEx(playerid, COLOR_RED, "Error: ����ȭ�� �����ϼ̽��ϴ�.");
	else if(Config[sync] == 0)
		return SendClientMessageEx(playerid, COLOR_RED, "Error: �� ��ɾ�� ��Ȱ��ȭ �Ǿ��ֽ��ϴ�.");

    if (Round[Current] != -1) MarkerStealth();

	Player[playerid][CanSync] = false;
	SetTimerEx("EnableSync",10000,false,"i",playerid);

	new badsynctime = Player[playerid][LastSync] + 2;
	if(Server[ServerTicks] < badsynctime) {
	    return 0;
	}
	if(Player[playerid][Specing])
	    return 0;

    new tmp_playing=false;
    if(Player[playerid][pPlaying]) {
    	tmp_playing=true;
	}

	new bool:IsPlayerSpecing[MAX_PLAYERS];
	for(new x=0; x<Server[HighestID]+1; x++) {
	    if(!IsPlayerConnected(x)) continue;
	    if(GetPlayerState(x) == PLAYER_STATE_SPECTATING && Player[x][gSpectateID] == playerid) {
			IsPlayerSpecing[x] = true;
		}
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
	
	new team = GetPlayerTeam(playerid);

	ClearAnimations(playerid);

	new Float:PlayerPos[3];
	GetPlayerPos(playerid,PlayerPos[0],PlayerPos[1],PlayerPos[2]);
	new Float:health = 0;
	new Float:armour = 0;
	GetPlayerHealth(playerid,health);
	GetPlayerArmour(playerid,armour);
	new TheInterior, VirtualWorld;
	new Float:Angle;
	GetPlayerFacingAngle(playerid, Angle);
	TheInterior = GetPlayerInterior(playerid);
	VirtualWorld = GetPlayerVirtualWorld(playerid);

	SetPlayerWorldBoundsEx(playerid,9999.9,-9999.9,9999.9,-9999.9);

	Player[playerid][IgnoreSpawnCallback] = true;

	SetSpawnInfo(playerid,99,GetCurrentSkin(playerid),PlayerPos[0],PlayerPos[1],PlayerPos[2],Angle,0,0,0,0,0,0);
	SpawnPlayerEx(playerid);

	SetSpawnInfo(playerid,99,GetCurrentSkin(playerid),Lobby[0]+10-random(10),Lobby[1]+10-random(10),Lobby[2]+1,0,0,0,0,0,0,0);

	if(tmp_playing) {
		Player[playerid][pPlaying] = true;
	}

	if(Round[Gamemode] == TDM)
	{
	   	SetPlayerWorldBoundsEx(playerid,MaxX,MinX,MaxY,MinY);
	}
	
	SetPlayerTeam(playerid, team);

	SetPlayerArmour(playerid,armour);
	SetPlayerHealth(playerid,health);
	SetPlayerInterior(playerid,TheInterior);
	SetPlayerVirtualWorld2(playerid,VirtualWorld);
	SetPlayerVelocity(playerid, Velocity[0], Velocity[1], Velocity[2]);

	for(new i = 0; i < 13; i++)
	{
	    if(PlayerWeapons[0][i] > 0){
		    GivePlayerWeaponEx(playerid,PlayerWeapons[0][i],PlayerWeapons[1][i]);
		}
	}
	for(new x=0; x<Server[HighestID]+1; x++) {
	    if(IsPlayerSpecing[x] == true) {
			SetTimerEx("Spectate",250,false,"ii",x,playerid);
		}
	}

	Player[playerid][LastSync] = Server[ServerTicks];
	if(Round[Paused] >= 1 && Player[playerid][pPlaying] == true && (Player[playerid][pTeam] == T_AWAY || Player[playerid][pTeam] == T_HOME))
		TogglePlayerControllable(playerid, false);
	return 1;
}

GetWepName(modelid)
{
	if(!IsValidWeaponID(modelid)) { new string[32] = "Unknown"; return string; }
	return wNames[modelid];
}

forward Spectate(playerid, specid);
public Spectate(playerid, specid)
{
	return StartSpectate(playerid, specid);
}



stock ClearRoundVehicles()
{
    for(new x; x < MAX_VEHICLES; x++)
	{
	    if (VehicleInfo[x][round]) {
			RemovePlayerFromVehicle(x);
		}
	}
   	for(new i; i < MAX_VEHICLES; i++)
	{
	    if ((VehicleInfo[i][hasSpawned]) && (VehicleInfo[i][round]))
		{
	    	DestroyVehicle(i);
	    	VehicleInfo[i][vWorld] = -1;
			VehicleInfo[i][pDriver] = -1;
			VehicleInfo[i][pPass1] = -1;
			VehicleInfo[i][pPass2] = -1;
			VehicleInfo[i][pPass3] = -1;
			TextDrawHideForAll(veh4[i]);
			TextDrawHideForAll(veh6[i]);
			TextDrawHideForAll(veh7[i]);
			TextDrawHideForAll(veh1);
			TextDrawHideForAll(veh2);
			TextDrawHideForAll(veh3);
			TextDrawHideForAll(veh5);
			VehicleInfo[i][hasSpawned] = false;
		}
	}
	Server[Vehicles] = 0;
}

stock ClearVehicles()
{
    for(new x; x < MAX_VEHICLES; x++)
	{
		RemovePlayerFromVehicle(x);
	}
   	for(new i; i < MAX_VEHICLES; i++)
	{
	    if(VehicleInfo[i][hasSpawned])
		{
	    	DestroyVehicle(i);
	    	VehicleInfo[i][vWorld] = -1;
			VehicleInfo[i][pDriver] = -1;
			VehicleInfo[i][pPass1] = -1;
			VehicleInfo[i][pPass2] = -1;
			VehicleInfo[i][pPass3] = -1;
			TextDrawHideForAll(veh4[i]);
			TextDrawHideForAll(veh6[i]);
			TextDrawHideForAll(veh7[i]);
			TextDrawHideForAll(veh1);
			TextDrawHideForAll(veh2);
			TextDrawHideForAll(veh3);
			TextDrawHideForAll(veh5);
			VehicleInfo[i][hasSpawned] = false;
		}
	}
	Server[Vehicles] = 0;
}

forward AddPlayerToRound(id);
public AddPlayerToRound(id)
{
	if(GetPlayerState(id) == PLAYER_STATE_SPECTATING)
	{
		StopSpectate(id);
	}
	CallRemoteFunction("DC_PlayerEnteredRound", "d", id);
	Player[id][pPlaying] = true;
	AttackerVehicle[id][hasSpawned] = false;
    PlayerPlaySound(id,1057,0.0,0.0,0.0);
	TogglePlayerControllable(id,1);
	SetCameraBehindPlayer(id);
	SetPlayerHealth(id, Config[roundhealth]);
	SetPlayerArmour(id, Config[roundarmour]);
	Player[id][Status] = STATUS_PLAYING;
	Player[id][setToPlay] = true;
	if(Player[id][pTeam] != T_REF)
	{
		ResetPlayerWeapons(id);
		if(Config[weaponsystem] == WEAPONSYSTEM_MENU)
		{
			TryGunMenu(1, id);
  			//TogglePlayerControllable(id,0);

			for(new i = 0 ; i < MAX_WEAPONS; ++ i)
			{
			    if(WeaponsMenus[Option][i] == 5)
			    {
					TimeTextForPlayer(id, autowep,  6000);
 		    		TimeTextForPlayer(id, autowep2, 6000);
        			TimeTextForPlayer(id, autowep3, 6000);
					TimeTextForPlayer(id, autowep4, 6000);
        			TimeTextForPlayer(id, autowep5, 6000);
			        break;
			    }
			}
		}
		else
		{
		    StrapUp(id);
    		TogglePlayerControllable(id,true);
		}
	}

	if(Player[id][pTeam] == T_SUBAWAY)Player[id][pTeam] = T_AWAY;
	if(Player[id][pTeam] == T_SUBHOME)Player[id][pTeam] = T_HOME;

	SetPlayerInterior(id, Round[Interior]);

	if(Config[forcetime] == -1) SetWorldTime(Round[WorldTime]);
	else SetWorldTime(Config[forcetime]);

	if(Round[Gamemode] == BASE)
	{
		SetPlayerCheckpoint(id,Checkpoint[0],Checkpoint[1],Checkpoint[2],Config[cp_size]);
	}

	SetPlayerVirtualWorld2(id,ROUND_VW);
	if(Player[id][pTeam] == T_AWAY)
	{
	    Round[atotal]++;
	    if(Round[atotal] > Round[started_away]) Round[started_away]++;
	   	SetPlayerPos(id,AwaySpawn[0],AwaySpawn[1],AwaySpawn[2]+2);
	   	SetPlayerWorldBoundsEx(id,9999.9,-9999.9,9999.9,-9999.9);
	   	SetPlayerColor(id,GetTeamColor(1, T_AWAY) | 0x000000FF);
	   	if(Server[TkMode]) {
	   		SAMP_SetPlayerTeam(id,1);
		}
	} else if(Player[id][pTeam] == T_HOME) {
		Round[dtotal]++;
		
		if(Round[dtotal] > Round[started_home]) Round[started_home]++;
		
	   	SetPlayerPos(id,HomeSpawn[0],HomeSpawn[1],HomeSpawn[2]+2);
	   	SetPlayerWorldBoundsEx(id,9999.9,-9999.9,9999.9,-9999.9);
	   	SetPlayerColor(id,GetTeamColor(1, T_HOME) | 0x000000FF);
	   	if(Server[TkMode]) {
	   		SAMP_SetPlayerTeam(id,2);
		}
	} else if(Player[id][pTeam] == T_REF)
	{
	   	SetPlayerPos(id,Checkpoint[0],Checkpoint[1],Checkpoint[2]+2);
	    SetPlayerWorldBoundsEx(id,9999.9,-9999.9,9999.9,-9999.9);
	    SetPlayerColor(id,COLOR_REF);
	    if(Server[TkMode]) {
	    	SAMP_SetPlayerTeam(id,3);
		}
	}
	OnPlayerLeaveCheckpoint(id);
}


forward MarkerStealth();
public MarkerStealth()
{
	if(Server[pConnected] == 0)
		return 1;
  	for (new i = 0; i <= Server[HighestID]; i++)
	{
	    if(IsPlayerConnected(i))
	    {
			if(Round[Current] != - 1 && !Player[i][pPlaying])
			{
				if(Player[i][pTeam] == T_SUBAWAY || Player[i][pTeam] == T_AWAY)
				{
				    SetPlayerColor(i,GetTeamColor(0, T_AWAY));
				}
				else if(Player[i][pTeam] == T_SUBHOME || Player[i][pTeam] == T_HOME)
				{
		 	  		 SetPlayerColor(i,GetTeamColor(0, T_HOME));
				}
				if(Player[i][pTeam] == T_REF)
				{
		 			SetPlayerColor(i,COLOR_REF);
				}
			}

			new team1 = Player[i][pTeam];
			for (new x = 0; x <= Server[HighestID]; x++)
			{
			    if(IsPlayerConnected(x))
			    {
					new team2 = Player[x][pTeam];
					if(Player[i][Visible] == false)
					{
						if(team2 != team1)
						{
					    	if(team2 != T_REF && team2 != team1)
							{
								SetPlayerMarkerForPlayer(x,i,GetPlayerColor(i) & 0xFFFFFF00);
							}
							else
							{
					 			SetPlayerMarkerForPlayer(x,i,GetPlayerColor(i) | 0x000000FF);
							}
						 }
			  			if(Player[i][pPlaying] == false)
						  	SetPlayerMarkerForPlayer( x, i, GetPlayerColor(i) & 0xFFFFFF00 );
					}
				}
			}
		 }
	}
  	return 1;
}

forward NameTagStealth();
public NameTagStealth()
{
	if(Server[pConnected] == 0 || Round[Current] == -1) return 1;
	for (new i = 0; i <= Server[HighestID]; i++)
	{
		if(!IsPlayerInAnyVehicle(i)) {
			new playerTeam = Player[i][pTeam];
			for (new x = 0; x <= Server[HighestID]; x++)
			{
				new otherTeam = Player[x][pTeam];
			    if(otherTeam == T_NON || otherTeam == T_REF || otherTeam == playerTeam)
	   			{
					ShowPlayerNameTagForPlayer(x,i,1);
	   			}
	   			else if(Float:GetDistanceBetweenPlayers(x,i) >=	Config[NameTagDistance])
	   			{
	   			    ShowPlayerNameTagForPlayer(x,i,0);
	   			}
	   			else if(Float:GetDistanceBetweenPlayers(x,i) < Config[NameTagDistance])
				{
					ShowPlayerNameTagForPlayer(x,i,1);
				}
			}
		}
  	}
  	NametagTimer = SetTimer("NameTagStealth",1200,0);
	return 1;
}

forward TurnInvisible(playerid);
public TurnInvisible(playerid)
{
	Player[playerid][Visible] = false;
}

forward HUDUpdate();
public HUDUpdate()
{
	if(Round[Current] == -1 || Round[LoadScreen] == true)
	{
		HideAllPlayersHUD();
	//	return 0;
	}
	for(new i = 0; i <= Server[HighestID]; i ++)
	{
	    if(IsPlayerConnected(i) && Player[i][pSpawned] == true)
	    {
	    	new TrackID;
			if(PlayerHUD[i][Activated] == true)
			{
			    if(PlayerHUD[i][Type] == HUD_TRACK)
			    {
                    TrackID = PlayerHUD[i][TrackingID];
			    }
			    else if(PlayerHUD[i][Type] == HUD_AUTO)
			    {
				    TrackID = GetClosestPlayer(i);
			    }
			    if(TrackID != i && Player[i][pPlaying] == true && Player[i][AFK] == false && Player[TrackID][pPlaying] == true
				&& Player[i][pTeam] == Player[TrackID][pTeam] && (Player[i][pTeam] == T_AWAY || Player[i][pTeam] == T_HOME))
			    {
   				    Player[i][NowTracking] = TrackID;
				    if(Player[i][PlayerHUDTextDrawShown] == false)
				    {
						ShowHUDTextDraws(i);
				    }
					UpdatePlayerHUD(i, TrackID);
				}
				else
				{
					HideHUDTextDraws(i);
				}
			}
	    }
	}
	return 1;
}

forward UpdatePlayerHUD(playerid, targetid);
public UpdatePlayerHUD(playerid, targetid)
{
	if(IsPlayerConnected(targetid))
	{
		new string[256], Float:health, Float:armour;
		GetPlayerHealth(targetid,health);
		GetPlayerArmour(targetid,armour);

		format(string,256,"%s",PlayerName(targetid));
		TextDrawSetString(HUDPlayerName[playerid], string);

		if(Config[weaponsystem] == WEAPONSYSTEM_FULL)
		{
			TextDrawSetString(HUDWeapons[playerid], "Full Set");
		}
		else
		{
			TextDrawSetString(HUDWeapons[playerid], ReturnPlayerWeaponsString(targetid));
		}

		format(string,256,"Health: ~w~%d",floatround(health));
		TextDrawSetString(HUDHealth[playerid], string);

		format(string,256,"Armour: ~w~%d",floatround(armour));
		TextDrawSetString(HUDArmour[playerid], string);

		format(string,256,"Distance: ~w~%.1f ft.",GetDistanceBetweenPlayers(playerid,targetid));
		TextDrawSetString(HUDDistance[playerid], string);

	}
	else
	{
		SendClientMessageEx(playerid,COLOR_GREY, "[HUD] System deactivated (Player Not Connected)");
		HideHUDTextDraws(playerid);
		DestroyPlayerHUDTextDraws(playerid);
	}
}


stock CreatePlayerHUDTextDraws(playerid)
{
	if(Server[MainTextdrawLayout] == 1)
	{
		Player[playerid][PlayerHUDTextDrawCreated] = true;
		HUDPlayerName[playerid] = TextDrawCreateEx(452, 374.000000,"N/A");
		TextDrawLetterSize(HUDPlayerName[playerid],0.3,1.1);
		TextDrawFont(HUDPlayerName[playerid],3);
		TextDrawBackgroundColor(HUDPlayerName[playerid], 0x000000A0);
		TextDrawSetOutline(HUDPlayerName[playerid],1);
		TextDrawAlignment(HUDPlayerName[playerid], 2);
		TextDrawSetProportional(HUDPlayerName[playerid], true);

		HUDWeapons[playerid] = TextDrawCreateEx(407.000000, 405.000000,"N/A");
		TextDrawFont(HUDWeapons[playerid],1);
		TextDrawLetterSize(HUDWeapons[playerid],0.24,1.1);
		TextDrawAlignment(HUDWeapons[playerid], 0);
		TextDrawColor(HUDWeapons[playerid], COLOR_MARINE);
		TextDrawSetOutline(HUDWeapons[playerid],1);

		HUDHealth[playerid] = TextDrawCreateEx(407.000000, 385.000000,"Health: ~w~N/A");
		TextDrawFont(HUDHealth[playerid],1);
		TextDrawLetterSize(HUDHealth[playerid],0.3,1.2);
		TextDrawAlignment(HUDHealth[playerid], 0);
		TextDrawColor(HUDHealth[playerid], 0xF00000FF);
		TextDrawSetOutline(HUDHealth[playerid],1);

		HUDArmour[playerid] = TextDrawCreateEx(492.000000, 385.000000,"Armour: ~w~N/A");
		TextDrawFont(HUDArmour[playerid],1);
		TextDrawLetterSize(HUDArmour[playerid],0.3,1.2);
		TextDrawAlignment(HUDArmour[playerid], 0);
		TextDrawColor(HUDArmour[playerid], 0xA0A0A0FF);
		TextDrawSetOutline(HUDArmour[playerid],1);


		HUDDistance[playerid] = TextDrawCreateEx(407.000000, 395.000000,"Distance: ~w~N/A");
		TextDrawFont(HUDDistance[playerid],1);
		TextDrawLetterSize(HUDDistance[playerid],0.3,1.2);
		TextDrawAlignment(HUDDistance[playerid], 0);
		TextDrawColor(HUDDistance[playerid], COLOR_ORANGE);
		TextDrawSetOutline(HUDDistance[playerid],1);

		TextDrawBackgroundColor(HUDDistance[playerid],0x000000A0);
		TextDrawSetProportional(HUDDistance[playerid], true);
		TextDrawBackgroundColor(HUDHealth[playerid],0x000000A0);
		TextDrawBackgroundColor(HUDWeapons[playerid],0x000000A0);
		TextDrawBackgroundColor(HUDArmour[playerid],0x000000A0);
		TextDrawSetProportional(HUDArmour[playerid], true);
		TextDrawSetProportional(HUDHealth[playerid], true);
		TextDrawSetProportional(HUDWeapons[playerid], true);
	}
	else
	{
		Player[playerid][PlayerHUDTextDrawCreated] = true;
		HUDPlayerName[playerid] = TextDrawCreateEx(185, 399.000000,"N/A");
		TextDrawLetterSize(HUDPlayerName[playerid],0.3,1.1);
		TextDrawFont(HUDPlayerName[playerid],3);
		TextDrawBackgroundColor(HUDPlayerName[playerid], 0x000000A0);
		TextDrawSetOutline(HUDPlayerName[playerid],1);
		TextDrawAlignment(HUDPlayerName[playerid], 2);
		TextDrawSetProportional(HUDPlayerName[playerid], true);

		HUDWeapons[playerid] = TextDrawCreateEx(141.000000, 430.000000,"N/A");
		TextDrawFont(HUDWeapons[playerid],1);
		TextDrawLetterSize(HUDWeapons[playerid],0.24,1.1);
		TextDrawAlignment(HUDWeapons[playerid], 0);
		TextDrawColor(HUDWeapons[playerid], COLOR_MARINE);
		TextDrawSetOutline(HUDWeapons[playerid],1);

		HUDHealth[playerid] = TextDrawCreateEx(141.000000, 410.000000,"Health: ~w~N/A");
		TextDrawFont(HUDHealth[playerid],1);
		TextDrawLetterSize(HUDHealth[playerid],0.3,1.2);
		TextDrawAlignment(HUDHealth[playerid], 0);
		TextDrawColor(HUDHealth[playerid], 0xF00000FF);
		TextDrawSetOutline(HUDHealth[playerid],1);

		HUDArmour[playerid] = TextDrawCreateEx(210.000000, 410.000000,"Armour: ~w~N/A");
		TextDrawFont(HUDArmour[playerid],1);
		TextDrawLetterSize(HUDArmour[playerid],0.3,1.2);
		TextDrawAlignment(HUDArmour[playerid], 0);
		TextDrawColor(HUDArmour[playerid], 0xA0A0A0FF);
		TextDrawSetOutline(HUDArmour[playerid],1);


		HUDDistance[playerid] = TextDrawCreateEx(141.000000, 420.000000,"Distance: ~w~N/A");
		TextDrawFont(HUDDistance[playerid],1);
		TextDrawLetterSize(HUDDistance[playerid],0.3,1.2);
		TextDrawAlignment(HUDDistance[playerid], 0);
		TextDrawColor(HUDDistance[playerid], COLOR_ORANGE);
		TextDrawSetOutline(HUDDistance[playerid],1);

		TextDrawBackgroundColor(HUDDistance[playerid],0x000000A0);
		TextDrawSetProportional(HUDDistance[playerid], true);
		TextDrawBackgroundColor(HUDHealth[playerid],0x000000A0);
		TextDrawBackgroundColor(HUDWeapons[playerid],0x000000A0);
		TextDrawBackgroundColor(HUDArmour[playerid],0x000000A0);
		TextDrawSetProportional(HUDArmour[playerid], true);
		TextDrawSetProportional(HUDHealth[playerid], true);
		TextDrawSetProportional(HUDWeapons[playerid], true);
	}

}

stock ReturnPlayerWeaponsString(playerid)
{
	new string[128];
	new WeaponID, Ammo;
	for(new i = 0; i < 13; i++)
	{
	    if(i == 0 || i == 1)
		{
	   		GetPlayerWeaponData(playerid,i,WeaponID,Ammo);
	   		if(Ammo > 1)
			{
			    Ammo = 1;
			}
	    }
		else
		{
	   		GetPlayerWeaponData(playerid,i,WeaponID,Ammo);
		}
		if(WeaponID > 0 && Ammo > 0)
		{
		    if(Ammo > 60000) //melee weaps
		        Ammo = 1;

		    if(strlen(string) > 4)
				format(string,256,"%s %s(%d)", string, wNamesShortened[WeaponID], Ammo);
			else
				format(string,256,"%s(%d)", wNamesShortened[WeaponID], Ammo);//First Weapon
		}
	}
	if(strlen(string) < 3)
	{
		string = "N/A";
	}
	return string;
}

stock RetPlayerWepsStrSpecText(playerid)
{
	new string[256];
	new WeaponID, Ammo;
	for(new i = 0; i < 13; i++)
	{
	    if(i == 0 || i == 1)
		{
	   		GetPlayerWeaponData(playerid,i,WeaponID,Ammo);
	   		if(Ammo > 1)
			{
			    Ammo = 1;
			}
	    }
		else
		{
	   		GetPlayerWeaponData(playerid,i,WeaponID,Ammo);
		}
		if(WeaponID > 0 && Ammo > 0)
		{
		    if(Ammo > 60000) //melee weaps
		        Ammo = 1;

		    if(strlen(string) > 4)
				format(string,256,"%s~n~~w~- %s (x%d)", string, wNamesShortened[WeaponID], Ammo);
			else
				format(string,256,"~n~~n~~w~- %s (x%d)", wNamesShortened[WeaponID], Ammo);//First Weapon
		}
	}
	if(strlen(string) < 3)
	{
		string = "~n~N/A";
	}
	return string;
}

stock ReturnPlayerWeaponsStringSmall(playerid)
{
	new string[256];
	new WeaponID, Ammo;
	for(new i = 0; i < 13; i++)
	{
	    if(i == 0 || i == 1)
		{
	   		GetPlayerWeaponData(playerid,i,WeaponID,Ammo);
	   		if(Ammo > 1)
			{
			    Ammo = 1;
			}
	    }
		else
		{
	   		GetPlayerWeaponData(playerid,i,WeaponID,Ammo);
		}
		if(WeaponID > 0 && Ammo > 0)
		{
		    if(strlen(string) > 1)
				format(string,256,"%s %s", string, wNamesInitials[WeaponID]);
			else
				format(string,256,"%s", wNamesInitials[WeaponID]);//First Weapon
		}
	}

	if(Config[weaponsystem] == WEAPONSYSTEM_FULL)
	{
		string = "Full Set";
	}

	if(strlen(string) < 2)
	{
		string = "N/A";
	}

	return string;
}


stock ShowHUDTextDraws(playerid)
{
	Player[playerid][PlayerHUDTextDrawShown] = true;

    TextDrawShowForPlayer(playerid, HUDTop);
    TextDrawShowForPlayer(playerid, HUDBox);
    TextDrawShowForPlayer(playerid, HUDBottom);

	TextDrawShowForPlayer(playerid, HUDPlayerName[playerid]);
	TextDrawShowForPlayer(playerid, HUDWeapons[playerid]);
	TextDrawShowForPlayer(playerid, HUDHealth[playerid]);
	TextDrawShowForPlayer(playerid, HUDArmour[playerid]);
	TextDrawShowForPlayer(playerid, HUDDistance[playerid]);
}

stock HideHUDTextDraws(playerid)
{
	Player[playerid][PlayerHUDTextDrawShown] = false;
	TextDrawHideForPlayer(playerid, HUDBox);
	TextDrawHideForPlayer(playerid, HUDTop);
	TextDrawHideForPlayer(playerid, HUDBottom);

	TextDrawHideForPlayer(playerid, HUDPlayerName[playerid]);
	TextDrawHideForPlayer(playerid, HUDWeapons[playerid]);
	TextDrawHideForPlayer(playerid, HUDHealth[playerid]);
	TextDrawHideForPlayer(playerid, HUDArmour[playerid]);
	TextDrawHideForPlayer(playerid, HUDDistance[playerid]);
}

stock HideAllPlayersHUD()
{
	for(new i = 0; i <= Server[HighestID]; i ++)
	{
	    if(IsPlayerConnected(i))
	    {
			if(PlayerHUD[i][Activated] == true && Player[i][PlayerHUDTextDrawShown] == true)
			{
				Player[i][PlayerHUDTextDrawShown] = false;
				TextDrawHideForPlayer(i, HUDBox);
   				TextDrawHideForPlayer(i, HUDTop);
       			TextDrawHideForPlayer(i, HUDBottom);
				TextDrawHideForPlayer(i, HUDPlayerName[i]);
				TextDrawHideForPlayer(i, HUDWeapons[i]);
				TextDrawHideForPlayer(i, HUDHealth[i]);
				TextDrawHideForPlayer(i, HUDArmour[i]);
				TextDrawHideForPlayer(i, HUDDistance[i]);
			}
		}
	}
}

stock DestroyPlayerHUDTextDraws(playerid)
{
	Player[playerid][PlayerHUDTextDrawCreated] = false;
	TextDrawDestroy(HUDPlayerName[playerid]);
	TextDrawDestroy(HUDWeapons[playerid]);
	TextDrawDestroy(HUDHealth[playerid]);
	TextDrawDestroy(HUDArmour[playerid]);
	TextDrawDestroy(HUDDistance[playerid]);
}

stock GetClosestPlayer(playerid)
{
    new Float:distance,Float:distance2,player;
    player = -1;
    distance = 99999.99;
    for(new i = 0; i <= Server[HighestID]; i++)
	{
		if(IsPlayerConnected(i) && i != playerid && Player[i][pTeam] == Player[playerid][pTeam])
		{
		    distance2 = GetDistanceBetweenPlayers(i,playerid);
			if((distance2 < distance) && (distance2 != -1.00))
			{
				distance = distance2;
				player = i;
			}
		}
   	}
    return player;
}

LoadDuelAreas()
{
	#if DATA_SYSTEM == 1
		Server[HighestDuelID] = 0;
		Server[ValidDuels] = 0;
		for(new i = 1; i < MAX_DUELS; i++)
		{
		    if (dini_Exists(Duelfile(i))) {

				if (Server[HighestDuelID] < i) {
				    Server[HighestDuelID] = i;
				}

		    	Server[ValidDuels] ++;
		 		DuelWorking[i] = true;

		        new string[256];
		        new idx;
		    	string = dini_Get(Duelfile(i),"p1");
				DuelCoords[i][0] = floatstr(strtok(string,idx,','));
				DuelCoords[i][1] = floatstr(strtok(string,idx,','));
				DuelCoords[i][2] = floatstr(strtok(string,idx,','));
				DuelCoords[i][3] = floatstr(strtok(string,idx,','));

				idx = 0;
		    	string = dini_Get(Duelfile(i),"p2");
				DuelCoords[i][4] = floatstr(strtok(string,idx,','));
				DuelCoords[i][5] = floatstr(strtok(string,idx,','));
				DuelCoords[i][6] = floatstr(strtok(string,idx,','));
				DuelCoords[i][7] = floatstr(strtok(string,idx,','));
		 		DuelCoords[i][8] = floatstr(strtok(string,idx,','));

				idx = 0;
		    	string = dini_Get(Duelfile(i),"guns");
				DuelWeapons[i][0] = floatround(floatstr(strtok(string,idx,',')));
				DuelWeapons[i][1] = floatround(floatstr(strtok(string,idx,',')));
				DuelWeapons[i][2] = floatround(floatstr(strtok(string,idx,',')));
				DuelWeapons[i][3] = floatround(floatstr(strtok(string,idx,',')));
		 		DuelWeapons[i][4] = floatround(floatstr(strtok(string,idx,',')));

		    	DuelName[i] = dini_Get(Duelfile(i),"name");
		    }
		}
	#elseif DATA_SYSTEM == 2
		MySQLCheck();
		new d_count;
		Server[ValidDuels] = 0;
		Server[HighestDuelID] = 0;
		new query[200];
		format(query, sizeof(query), "SELECT * FROM dc_duels ORDER BY id DESC");
		mysql_query(query);
		Server[SQLQueriesExecuted]++;
		mysql_store_result();
		new templine[200];
		while(mysql_fetch_row_format(templine, "|"))
		{
			new idx, idx2;
			new id_tmp[256], id;
			new duelname[256], p1[256], p2[256], dweapons[256];

			id_tmp = mysql_strtok(templine, idx, "|");
			id = strval(id_tmp);
			duelname = mysql_strtok(templine, idx, "|");
			p1 = mysql_strtok(templine, idx, "|");
			p2 = mysql_strtok(templine, idx, "|");
			dweapons = mysql_strtok(templine, idx, "|");
			DuelName[id] = duelname;

			if (Server[HighestDuelID] < id) {
			    Server[HighestDuelID] = id;
			}

            Server[ValidDuels] ++;
		 	DuelWorking[id] = true;
            d_count ++;
		 	idx2 = 0;
			DuelCoords[id][0] = floatstr(strtok(p1,idx2,','));
			DuelCoords[id][1] = floatstr(strtok(p1,idx2,','));
			DuelCoords[id][2] = floatstr(strtok(p1,idx2,','));
			DuelCoords[id][3] = floatstr(strtok(p1,idx2,','));

		 	idx2 = 0;
			DuelCoords[id][4] = floatstr(strtok(p2,idx2,','));
			DuelCoords[id][5] = floatstr(strtok(p2,idx2,','));
			DuelCoords[id][6] = floatstr(strtok(p2,idx2,','));
			DuelCoords[id][7] = floatstr(strtok(p2,idx2,','));
		 	DuelCoords[id][8] = floatstr(strtok(p2,idx2,','));

		 	idx2 = 0;
			DuelWeapons[id][0] = floatround(floatstr(strtok(dweapons,idx2,',')));
			DuelWeapons[id][1] = floatround(floatstr(strtok(dweapons,idx2,',')));
			DuelWeapons[id][2] = floatround(floatstr(strtok(dweapons,idx2,',')));
			DuelWeapons[id][3] = floatround(floatstr(strtok(dweapons,idx2,',')));
	 		DuelWeapons[id][4] = floatround(floatstr(strtok(dweapons,idx2,',')));

			/*
	 		printf("ID: %d", id);
	 		printf("Name: %s", DuelName[id]);
	 		printf("P1: %s", p1);
	 		printf("P2: %s", p2);
	 		printf("Weapons: %s\n", dweapons);
			*/
		}
	#endif
	printf("  -> %d Duels Loaded", Server[ValidDuels]);
}

LoadTeleportAreas()
{
	#if DATA_SYSTEM == 1
		Server[HighestTeleID] =  0;
		new teleports_loaded = 0;
		for(new i = 1; i < MAX_TELEPORT_AREAS; i++)
		{
		    if (dini_Exists(Teleportfile(i))) {
                teleports_loaded++;
				if (Server[HighestTeleID] < i) {
				    Server[HighestTeleID] = i;
				}
		        new string[256];
		        new idx;
		    	string = dini_Get(Teleportfile(i),"teleport");
				TeleportAreas[i][0] = floatstr(strtok(string,idx,','));
				TeleportAreas[i][1] = floatstr(strtok(string,idx,','));
				TeleportAreas[i][2] = floatstr(strtok(string,idx,','));
				TeleportAreas[i][3] = floatstr(strtok(string,idx,','));
		    	TeleportNames[i] = dini_Get(Teleportfile(i),"name");
		    }
		}
	#elseif DATA_SYSTEM == 2
		MySQLCheck();
		new query[200];
		new teleports_loaded = 0;
		format(query, sizeof(query), "SELECT * FROM dc_teleports ORDER BY id DESC");
		mysql_query(query);
		Server[SQLQueriesExecuted]++;
		Server[HighestTeleID] =  0;
		mysql_store_result();
		new templine[200];
		while(mysql_fetch_row_format(templine, "|"))
		{
			new idx, idx2;
			new id_tmp[256], id;
			new telename[256], tcoords[256];
			TeleportNames[id] = telename;

            teleports_loaded++;
			id_tmp = mysql_strtok(templine, idx, "|");
			id = strval(id_tmp);
			telename = mysql_strtok(templine, idx, "|");
			tcoords = mysql_strtok(templine, idx, "|");

			if (Server[HighestTeleID] < id) {
			    Server[HighestTeleID] = id;
			}

			idx2 = 0;
			TeleportAreas[id][0] = floatstr(strtok(tcoords,idx2,','));
			TeleportAreas[id][1] = floatstr(strtok(tcoords,idx2,','));
			TeleportAreas[id][2] = floatstr(strtok(tcoords,idx2,','));
			TeleportAreas[id][3] = floatstr(strtok(tcoords,idx2,','));
			TeleportNames[id] = telename;
		}
	#endif
	printf("  -> %d Teleports Loaded", teleports_loaded);
}

IsValidNick(nickname[])
{
	for(new i = 0; i < strlen(nickname); i ++)
	{
	    if((nickname[i] >= '0' && nickname[i] <= '9') ||
			(nickname[i] >= 'A' && nickname[i] <= 'Z') ||
			(nickname[i] >= 'a' && nickname[i] <= 'z') ||
			nickname[i] == '_' ||
			nickname[i] == '[' ||
			nickname[i] == '(' ||
			nickname[i] == ')' ||
			nickname[i] == '.' ||
			nickname[i] == ']')
		{

		}
		else
		{
			return false;
		}
	}
	return true;
}

AnyoneWithThisNick(nickname[])
{
	for(new i = 0; i <= Server[HighestID]; i ++)
	{
	    if(IsPlayerConnected(i))
	    {
			if(isStringSame(PlayerName(i), nickname, 24))
			{
			    return true;
			}
		}
	}

	return false;
}

#if SAMP_VERSION == 2
forward PlayAudioStreamForPlayerEx(playerid);
public PlayAudioStreamForPlayerEx(playerid)
{
	PlayAudioStreamForPlayerExEx(playerid, nextStreamURL);
}
#endif

forward SetPlayerTeamEx(playerid, teamid);
public SetPlayerTeamEx(playerid, teamid)
{
    if(Player[playerid][pTeam] != teamid)
	{
	    Player[playerid][pTeam] = teamid;
	    Player[playerid][pClass] = teamid;

	    if(!Player[playerid][AFK])
    		Player[playerid][setToPlay] = true;

		new newteam;
		if(teamid == T_SUBHOME)
		{
			Player[playerid][setToPlay] = false;
			newteam = T_HOME;
		}
		else if(teamid == T_SUBAWAY)
		{
		    Player[playerid][setToPlay] = false;
			newteam = T_AWAY;
		}
		else
			newteam = teamid;

		if(teamid != T_REF)
		   	SetPlayerColor(playerid, GetTeamColor(0, newteam)  | 0x000000FF);
		else
			SetPlayerColor(playerid,COLOR_REF);

		if(teamid == T_SUBHOME || teamid == T_SUBAWAY)
			Player[playerid][Status] = STATUS_SUB;
		else
			Player[playerid][Status] = STATUS_PLAYING;

		CallLocalFunction("SetPlayerSkinEx", "d", playerid);
	   	SetPlayerWorldBoundsEx(playerid,9999.9,-9999.9,9999.9,-9999.9);
	}
}

stock GetTeamWithLessMembers()
{
	new home_, away_, team_;
	for(new i = 0; i <= Server[HighestID]; i ++)
	{
	    if(IsPlayerConnected(i))
	    {
	        if(Player[i][pTeam] == T_HOME)
	        {
	            home_ ++;
			}
			else if(Player[i][pTeam] == T_AWAY)
	        {
				away_ ++;
	        }
	    }
	}
	team_ = (home_ <= away_) ? T_HOME : T_AWAY;
	/*team_ = team with less players. In case both teams have same numbers of players, home will be the default */

	return team_;
}

forward DropWeapons(playerid);
public DropWeapons(playerid)
{
	new Float: px, Float: py, Float: pz;
	new hour,minute,second;
	new year, month,day;
	gettime(hour, minute, second);
	getdate(year, month, day);

	GetPlayerPos(playerid, px, py, pz);

	new weapon_slots[WEAPON_SLOTS + 1][2];
	new used_weapon_slots;

	for(new i = 0; i < WEAPON_SLOTS; i ++)
	{
		GetPlayerWeaponData(playerid, i, weapon_slots[i][0], weapon_slots[i][1]);
		if(i == 0 && weapon_slots[i][0] == 0) weapon_slots[i][1] = 0; // no fist...

		if(weapon_slots[i][1] > 0 && weapon_slots[i][0] < sizeof(weapons) && weapons[weapon_slots[i][0]] != -1)
		{
			used_weapon_slots ++;
		}
		else
		{
		    weapon_slots[i][0] = 0;
		    weapon_slots[i][1] = 0;
		}
	}
	// Create the Pickups
	new used_weapon_slots2 = used_weapon_slots;
	for(new i = 0; i < WEAPON_SLOTS; i ++)
	{
	    if(weapon_slots[i][1] > 0)
	    {
			new Float:angle = 360.0 - float(used_weapon_slots--) * (360.0 / float(used_weapon_slots2));
			// see... if there's a pickup we create by any chance

			new p = CreatePickup(weapons[weapon_slots[i][0]], PICKUP_TYPE, px + floatsin(angle,degrees) * (used_weapon_slots2/2 + 1.0), py + floatcos(angle,degrees) * (used_weapon_slots2/2 + 1.0), pz);
			if(p == INVALID_PICKUP)
			{
				new lowest_time;
				new _id;
				for(new j = 0; j < MAX_PICKUPS2; j ++)
				{
					if(Pickups[j][creation_time] < lowest_time)
					{
					    lowest_time = Pickups[j][creation_time];
					    _id = j;
					}
				}

				DestroyPickupEx(_id);
				KillTimer(Pickups[_id][timer]);

				p = CreatePickup(weapons[weapon_slots[i][0]], PICKUP_TYPE, px + floatsin(angle,degrees) * (used_weapon_slots2/2 + 1.0), py + floatcos(angle,degrees) * (used_weapon_slots2/2 + 1.0), pz);
			}

			Pickups[p][Pos_x] = px + floatsin(angle,degrees) * (used_weapon_slots2/2 + 1.0);
			Pickups[p][Pos_y] = py + floatcos(angle,degrees) * (used_weapon_slots2/2 + 1.0);
			Pickups[p][Pos_z] = pz;
			Pickups[p][creation_time] = mktime(hour,minute,second,day,month,year);
			Pickups[p][weapon] = weapon_slots[i][0];
			Pickups[p][ammo] = weapon_slots[i][1];

			if(Pickups[p][ammo] > 60000) //Melee weapons
		        Pickups[p][ammo] = 1;

			#if MAX_DROP_AMOUNT != -1
		    if(Pickups[p][ammo] > MAX_DROP_AMOUNT)
		    {
		        Pickups[p][ammo] = MAX_DROP_AMOUNT;
		    }
		    #endif

			Pickups[p][timer] = SetTimerEx("DestroyPickupEx", MAX_DROP_LIFETIME * 1000, 0, "i", p);
		}
	}
}

forward DestroyPickupEx(p);
public DestroyPickupEx(p)
{
	if(p != INVALID_PICKUP)
	{
		DestroyPickup(p);
		KillTimer(Pickups[p][timer]);
		Pickups[p][creation_time] = 0;
		Pickups[p][weapon] = 0;
		Pickups[p][ammo] = 0;
	}
}

forward IsPlayerRootAdmin(playerid);
public IsPlayerRootAdmin(playerid)
{
	if(IsPlayerAdmin(playerid))
	    return true;
 	else if(Player[playerid][GamemodeOwner] == true)
	    return true;
	else if(Player[playerid][pLevel] == 2)
	    return true;
	else
	    return false;
}

forward IsPlayerAdmin3(playerid);
public IsPlayerAdmin3(playerid)
{
	if(IsPlayerAdmin(playerid))
	    return true;
	else if(Player[playerid][GamemodeOwner] == true)
	    return true;
	else if(IsPlayerRootAdmin(playerid))
	    return true;
	else if(Player[playerid][pLevel] == 1)
	    return true;
	else
	    return false;
}

forward GameModeTextNormal();
public GameModeTextNormal() {
	if(Round[Current] == -1) {
		new tmptext[200];
		#if DEBUG == 0
			#if defined BETA
				format(tmptext, sizeof(tmptext), "%s v%d.%d.%d [BETA %d]", SMALL_GM_NAME, VER_MAJOR, VER_MINOR, VER_REVISION, BETA);
		    #else
				format(tmptext, sizeof(tmptext), "%s v%d.%d.%d", SMALL_GM_NAME, VER_MAJOR, VER_MINOR, VER_REVISION);
			#endif
		#else
			#if defined BETA
				format(tmptext, sizeof(tmptext), "~%s v%d.%d.%d [BETA %d]", SMALL_GM_NAME, VER_MAJOR, VER_MINOR, VER_REVISION, BETA);
		    #else
				format(tmptext, sizeof(tmptext), "~%s v%d.%d.%d", SMALL_GM_NAME, VER_MAJOR, VER_MINOR, VER_REVISION);
			#endif
	    #endif
		SetGameModeText(tmptext);
    }
}

forward CleanUpTagsMarkers();
public CleanUpTagsMarkers()
{
	for(new i=0; i<Server[HighestID]+1; i++)
	{
	    if(IsPlayerConnected(i))
		{
			switch(Player[i][pClass])
			{
			    case 0: //Home
			    {
					SetPlayerColor(i,GetTeamColor(0, T_HOME)  | 0x000000FF);
					Player[i][pTeam] = T_HOME;
					Player[i][pClass] =0;
			    }
			    case 1: //Sub home
			    {
					SetPlayerColor(i,GetTeamColor(0, T_HOME)  | 0x000000FF);
					Player[i][pTeam] = T_SUBHOME;
					Player[i][setToPlay] = false;
					Player[i][pClass] =1;
			    }
		   		case 2: //Away Team
				{
					SetPlayerColor(i,GetTeamColor(0, T_AWAY)  | 0x000000FF);
					Player[i][pTeam] = T_AWAY;
					Player[i][pClass] =2;
				}
				case 3: //Sub away
				{
					SetPlayerColor(i,GetTeamColor(0, T_AWAY)  | 0x000000FF);
					Player[i][pTeam] = T_SUBAWAY;
					Player[i][setToPlay] = false;
					Player[i][pClass] =3;
				}
				case 4:// Ref
			    {
					SetPlayerColor(i,COLOR_REF);
					Player[i][pTeam] = T_REF;
					Player[i][pClass] =4;
				}
			}
			for(new x = 0; x <= Server[HighestID]; x++)
			{
			    if(IsPlayerConnected(x))
			    {
					SetPlayerMarkerForPlayer(x,i,GetPlayerColor(i)  | 0x00000066);
					ShowPlayerNameTagForPlayer(x,i,1);
				}
			}
		}
	}
}

forward CleanUpPlayerHUDs();
public CleanUpPlayerHUDs()
{
	HideAllPlayersHUD();
}

HideRequestClassTextDraws(playerid)
{
	TextDrawHideForPlayer(playerid,ClassTeams_Home);
	TextDrawHideForPlayer(playerid,ClassTeams_Away);
	TextDrawHideForPlayer(playerid,ClassTeams_Subhome);
	TextDrawHideForPlayer(playerid,ClassTeams_Subaway);
	TextDrawHideForPlayer(playerid,ClassTeams_Ref);
	TextDrawHideForPlayer(playerid,classhud1);
	TextDrawHideForPlayer(playerid,classhud2);
	TextDrawHideForPlayer(playerid,classhud3);
	TextDrawHideForPlayer(playerid,classhud_home);
	TextDrawHideForPlayer(playerid,classhud_away);
	TextDrawHideForPlayer(playerid,ClassTeams_Auto);
}


forward AddGetGunWeapons();
public AddGetGunWeapons()
{
	AddGetGunWeapon("Knife", 4, 1);
	//AddGetGunWeapon("Camera", 43, 1);
	AddGetGunWeapon("Shovel", 6, 1);
	AddGetGunWeapon("Colt 45", 22, 1337);
	AddGetGunWeapon("Colt 45 (Silenced)", 23, 1337);
	AddGetGunWeapon("Deagle", 24, 1337);
	AddGetGunWeapon("Tec9", 32, 1337);
	AddGetGunWeapon("MAC 10 (Uzi)", 28, 1337);
	AddGetGunWeapon("Pump Shotgun", 25, 1337);
	//AddGetGunWeapon("Sawn-Off Shotgun", 26, 1337);
	AddGetGunWeapon("Spas", 27, 1337);
	AddGetGunWeapon("SMG (MP5)", 29, 1337);
	AddGetGunWeapon("Rifle", 33, 1337);
	AddGetGunWeapon("Sniper", 34, 1337);
	AddGetGunWeapon("AK47", 30, 1337);
	AddGetGunWeapon("M4", 31, 1337);
	AddGetGunWeapon("Golf Club", 2, 1);
	AddGetGunWeapon("Baseball Bat", 5, 1);
	//AddGetGunWeapon("Chainsaw", 9, 1);
	AddGetGunWeapon("Grenade", 16, 1337);
	//AddGetGunWeapon("Nightvision Goggles", 44, 1);
	AddGetGunWeapon("Parachute", 46, 1);
	AddGetGunWeapon("Katana", 8, 1);

	//AddGetGunWeapon("RPG", 35, 100);
	//AddGetGunWeapon("Molotov", 18, 20);
	AddGetGunWeapon("Cane", 15, 1);
	AddGetGunWeapon("Brass Knuckles", 1, 1);
	//AddGetGunWeapon("Flamethrower", 37, 10000);
}

forward CreateVehiclesMenus();
public CreateVehiclesMenus()
{
	/*
		AddSpawnableVehicle(Menu id, Vehicle Name, Model ID, Admin Only ?);

		Menus IDs: 	1 Aircraft
					2 SUV
					3 Cars
					4 Boats
					5 Sport Cars
					6 Lowrides
					7 Bikes
					8 Others
	*/


//Aircraft
	AddSpawnableVehicle(1, "Police Maverick", 497, false);
	AddSpawnableVehicle(1, "Sparrow", 469, false);
	AddSpawnableVehicle(1, "Stunt Plane", 513, false);
	AddSpawnableVehicle(1, "Beagle", 511, false);
	AddSpawnableVehicle(1, "SA News", 488, false);
	AddSpawnableVehicle(1, "Shamal", 519, false);
	//AddSpawnableVehicle(1, "Hydra", 520, true);
	//AddSpawnableVehicle(1, "Hunter", 425, true);

// Suv
	AddSpawnableVehicle(2, "Huntley", 579, false);
	AddSpawnableVehicle(2, "Patriot", 470, false);
	AddSpawnableVehicle(2, "FBI Rancher", 490, false);
	AddSpawnableVehicle(2, "Mesa", 500, false);
	AddSpawnableVehicle(2, "Monster", 444, false);
	AddSpawnableVehicle(2, "Monster A", 556, false);
	AddSpawnableVehicle(2, "Monster B", 557, false);
	AddSpawnableVehicle(2, "Sandking", 495, false);

// Cars
	AddSpawnableVehicle(3, "Tahoma", 566, false);
	AddSpawnableVehicle(3, "Admiral", 445, false);
	AddSpawnableVehicle(3, "Sentinel", 405, false);
	AddSpawnableVehicle(3, "Washington", 421, false);
	AddSpawnableVehicle(3, "Premier", 426, false);
	AddSpawnableVehicle(3, "Sultan", 560, false);
	AddSpawnableVehicle(3, "Stretch Limo", 409, false);

// Boats
	AddSpawnableVehicle(4, "Coast Guard", 472, false);
	AddSpawnableVehicle(4, "Predator", 430, false);
	AddSpawnableVehicle(4, "Speeder", 452, false);
	AddSpawnableVehicle(4, "Dingy", 473, false);
	AddSpawnableVehicle(4, "Jetmax", 493, false);

// Sports
	AddSpawnableVehicle(5, "Infernus", 411, false);
	AddSpawnableVehicle(5, "Cheetah", 415, false);
	AddSpawnableVehicle(5, "Super GT", 506, false);
	AddSpawnableVehicle(5, "Turismo", 451, false);
	AddSpawnableVehicle(5, "Banshee", 429, false);
	AddSpawnableVehicle(5, "Comet", 480, false);
	AddSpawnableVehicle(5, "Bullet", 541, false);
	AddSpawnableVehicle(5, "Jester", 559, false);
	AddSpawnableVehicle(5, "Elegy", 562, false);
	AddSpawnableVehicle(5, "Flash", 565, false);

// Lowrides
	AddSpawnableVehicle(6, "Savanna", 567, false);
	AddSpawnableVehicle(6, "Slamvan", 535, false);
	AddSpawnableVehicle(6, "Remington", 534, false);
	AddSpawnableVehicle(6, "Voodoo", 412, false);

// Bikes
	AddSpawnableVehicle(7, "NRG-500", 522, false);
	AddSpawnableVehicle(7, "Mountain Bike", 510, false);
	AddSpawnableVehicle(7, "Sanchez", 468, false);
	AddSpawnableVehicle(7, "PCJ-600", 461, false);
	AddSpawnableVehicle(7, "Freeway", 463, false);
	AddSpawnableVehicle(7, "Wayfarer", 586, false);
	AddSpawnableVehicle(7, "Faggio", 462, false);

// Others
	AddSpawnableVehicle(8, "Quad", 471, false);
	AddSpawnableVehicle(8, "Dumper", 406, false);
	AddSpawnableVehicle(8, "Fork Lift", 530, false);
	AddSpawnableVehicle(8, "Mower", 572, false);
	AddSpawnableVehicle(8, "Packer", 443, false);
	AddSpawnableVehicle(8, "Vortex", 539, false);
	AddSpawnableVehicle(8, "Cement Truck", 524, false);
	AddSpawnableVehicle(8, "Coach Bus", 437, false);
	AddSpawnableVehicle(8, "Tug", 583, false);
	//AddSpawnableVehicle(8, "Rhino", 432, true);
}

forward CreateMenus();
public CreateMenus()
{

// Vehicles Menus
	vehiclemenu = CreateMenu("~y~Vehicle Menu", 1, 30.0, 150.0, 200.0, 200.0);
	AddMenuItem(vehiclemenu, 0, "Aircraft");
	AddMenuItem(vehiclemenu, 0, "4-Door SUV");
	AddMenuItem(vehiclemenu, 0, "4-Door Car");
	AddMenuItem(vehiclemenu, 0, "Boats");
	AddMenuItem(vehiclemenu, 0, "Sports Cars");
	AddMenuItem(vehiclemenu, 0, "Lowriders");
	AddMenuItem(vehiclemenu, 0, "Bikes");
	AddMenuItem(vehiclemenu, 0, "Other");

	fightmenu = CreateMenu("~g~Fight Style", 1, 30.0, 150.0, 200.0, 200.0);
	AddMenuItem(fightmenu, 0, "Normal");
	AddMenuItem(fightmenu, 0, "Boxing");
	AddMenuItem(fightmenu, 0, "Kung Fu");
	AddMenuItem(fightmenu, 0, "Knee Head");
	AddMenuItem(fightmenu, 0, "Grab Kick");
	AddMenuItem(fightmenu, 0, "Elbow");

	vehiclemenu_air = CreateMenu("~y~Aircraft", 1, 30.0, 150.0, 200.0, 200.0);
	vehiclemenu_suv = CreateMenu("~y~4-Door SUV", 1, 30.0, 150.0, 200.0, 200.0);
	vehiclemenu_car = CreateMenu("~y~4-Door Car", 1, 30.0, 150.0, 200.0, 200.0);
	vehiclemenu_boats = CreateMenu("~y~Boats", 1, 30.0, 150.0, 200.0, 200.0);
	vehiclemenu_bikes = CreateMenu("~r~B~w~ikes", 1, 30.0, 150.0, 200.0, 200.0);
	vehiclemenu_sports = CreateMenu("~y~Sports Car", 1, 30.0, 150.0, 200.0, 200.0);
	vehiclemenu_low = CreateMenu("L~y~owriders", 1, 30.0, 150.0, 200.0, 200.0);
	vehiclemenu_other = CreateMenu("~y~Other", 1, 30.0, 150.0, 200.0, 200.0);

	CreateVehiclesMenus();

// Other menus
	wepdone_menu = CreateMenu("~y~Finished?", 1, 30.0, 150.0, 200.0, 200.0);
	AddMenuItem(wepdone_menu, 0, "<< ~r~No, Start Over");
	AddMenuItem(wepdone_menu, 0, ">> ~g~Yes, Finished");

	DuelSetupMenu = CreateMenu("~y~Duel Setup", 1, 30.0, 150.0, 200.0, 200.0);
	AddMenuItem(DuelSetupMenu, 0, ">> ~y~Player 1");
	AddMenuItem(DuelSetupMenu, 0, ">> ~r~Player 2");

	DMSetupMenu = CreateMenu("~y~DM Setup", 1, 30.0, 150.0, 200.0, 200.0);
	AddMenuItem(DMSetupMenu, 0, ">> ~y~Center");
	AddMenuItem(DMSetupMenu, 0, ">> ~r~Min Coord");
	AddMenuItem(DMSetupMenu, 0, ">> ~g~Max Coord");

	switch_menu = CreateMenu("Switch Team", 1, 30.0, 150.0, 200.0, 200.0);
	AddMenuItem(switch_menu, 0, ">> ~b~Home");
	AddMenuItem(switch_menu, 0, ">> ~g~Away");
	AddMenuItem(switch_menu, 0, ">> ~y~Referee");

	CreateBaseMenu = CreateMenu("Set Coords", 1, 30.0, 150.0, 200.0, 200.0);
	AddMenuItem(CreateBaseMenu, 0, ">> ~b~Defenders Spawn");
	AddMenuItem(CreateBaseMenu, 0, ">> ~g~Attackers Spawn");
	AddMenuItem(CreateBaseMenu, 0, ">> ~r~Checkpoint");
	AddMenuItem(CreateBaseMenu, 0, ">> ~p~World Time");

	CreateTDMMenu = CreateMenu("Set Coords", 1, 30.0, 150.0, 200.0, 200.0);
	AddMenuItem(CreateTDMMenu, 0, ">> ~b~Defenders Spawn");
	AddMenuItem(CreateTDMMenu, 0, ">> ~g~Attackers Spawn");
	AddMenuItem(CreateTDMMenu, 0, ">> ~r~Checkpoint");
	AddMenuItem(CreateTDMMenu, 0, ">> ~p~World Time");
	AddMenuItem(CreateTDMMenu, 0, ">> ~r~Min Zone Coords");
	AddMenuItem(CreateTDMMenu, 0, ">> ~r~Max Zone Coords");

	SetTheWorldTime = CreateMenu("Select World Time", 1, 30.0, 150.0, 200.0, 200.0);
	AddMenuItem(SetTheWorldTime, 0, "0");
	AddMenuItem(SetTheWorldTime, 0, "4");
	AddMenuItem(SetTheWorldTime, 0, "8");
	AddMenuItem(SetTheWorldTime, 0, "12");
	AddMenuItem(SetTheWorldTime, 0, "16");
	AddMenuItem(SetTheWorldTime, 0, "20");

	printf("  -> Menus Loaded", 175, 174);
}

forward CreatePingLabels();
public CreatePingLabels()
{
	for(new i = 0; i < GetMaxPlayers(); i++)
	{
		PingLabels[i] = Create3DTextLabel("-", COLOR_RED, 0.0, 0.0, 0.0, float(Config[NameTagDistance]), LOBBY_VW, true);
		Player[i][AFKLabel] = Create3DTextLabel("-", COLOR_ORANGE, 0.0, 0.0, 0.0, float(Config[NameTagDistance]), LOBBY_VW, true);
		Player[i][DmgLabel] = Create3DTextLabel("-", COLOR_ORANGE, 0.0, 0.0, 0.0, float(Config[NameTagDistance]), LOBBY_VW, true);
	}
	for(new i=0; i < MAX_VEHICLES; ++i) {
	    VehicleInfo[i][NameLabel] = Create3DTextLabel("-", COLOR_RED, 0.0, 0.0, 0.0, float(Config[NameTagDistance]), LOBBY_VW, true);
	}
	
}

forward CreateTextDraws();
public CreateTextDraws()
{
    Config[textdraws] = 0;

	fr_sidebox9 = TextDrawCreateEx(145.000000,190.000000, "Round Results");
	TextDrawAlignment(fr_sidebox9, 2);
	TextDrawBackgroundColor(fr_sidebox9,0x000000ff);
	TextDrawFont(fr_sidebox9,0);
	TextDrawLetterSize(fr_sidebox9,0.600000,1.100000);
	TextDrawColor(fr_sidebox9,0xffffffff);
	TextDrawSetOutline(fr_sidebox9,1);
	TextDrawSetProportional(fr_sidebox9,1);
	TextDrawSetShadow(fr_sidebox9,1);

	fr_sidebox1 = TextDrawCreateEx(50.000000,220.000000,"~n~"); //big yellow box
	TextDrawUseBox(fr_sidebox1, 1);
 	TextDrawBoxColor(fr_sidebox1, 0xFFFF0012);
    TextDrawTextSize(fr_sidebox1, 240.0,1.0);
	TextDrawSetOutline(fr_sidebox1,1);

	fr_sidebox2 = TextDrawCreateEx(50.000000,207.000000,"~n~"); //top black box
	TextDrawUseBox(fr_sidebox2, 1);
 	TextDrawBoxColor(fr_sidebox2, 0x00000099);
    TextDrawTextSize(fr_sidebox2, 240.0,3.0);
	TextDrawSetOutline(fr_sidebox2,1);

	fr_sidebox3 = TextDrawCreateEx(50.000000, 208.000000," ~y~#   Type   ID   Winner      Win Type");
	TextDrawLetterSize(fr_sidebox3,0.25,0.75);
	TextDrawFont(fr_sidebox3,1);
	TextDrawBackgroundColor(fr_sidebox3,0x000000A0);
	TextDrawSetOutline(fr_sidebox3,1);

	fr_sidebox4 = TextDrawCreateEx(53.000000, 221.000000," ~w~1");
	TextDrawLetterSize(fr_sidebox4,0.25,0.75);
	TextDrawFont(fr_sidebox4,1);
	TextDrawBackgroundColor(fr_sidebox4,0x000000A0);
	TextDrawSetOutline(fr_sidebox4,1);

	fr_sidebox5 = TextDrawCreateEx(73.000000, 221.000000," ~w~Base");
	TextDrawLetterSize(fr_sidebox5,0.25,0.75);
	TextDrawFont(fr_sidebox5,1);
	TextDrawBackgroundColor(fr_sidebox5,0x000000A0);
	TextDrawSetOutline(fr_sidebox5,1);

	fr_sidebox6 = TextDrawCreateEx(106.000000, 221.000000," ~w~90");
	TextDrawLetterSize(fr_sidebox6,0.25,0.75);
	TextDrawFont(fr_sidebox6,1);
	TextDrawBackgroundColor(fr_sidebox6,0x000000A0);
	TextDrawSetOutline(fr_sidebox6,1);

	fr_sidebox7 = TextDrawCreateEx(126.000000, 221.000000," ~w~Home");
	TextDrawLetterSize(fr_sidebox7,0.25,0.75);
	TextDrawFont(fr_sidebox7,1);
	TextDrawBackgroundColor(fr_sidebox7,0x000000A0);
	TextDrawSetOutline(fr_sidebox7,1);

	fr_sidebox8 = TextDrawCreateEx(179.000000, 221.000000," ~w~Elimination");
	TextDrawLetterSize(fr_sidebox8,0.25,0.75);
	TextDrawFont(fr_sidebox8,1);
	TextDrawBackgroundColor(fr_sidebox8,0x000000A0);
	TextDrawSetOutline(fr_sidebox8,1);

	GunList_1 = TextDrawCreateEx(15.0, 160.0," ");
	TextDrawSetShadow(GunList_1,1);
	TextDrawSetOutline(GunList_1,1);
	TextDrawBackgroundColor(GunList_1,0x000000FF);
	TextDrawFont(GunList_1,1);
	TextDrawLetterSize(GunList_1,0.20,0.7);
	TextDrawColor(GunList_1,0xFFFF00FF);

	GunList_2 = TextDrawCreateEx(130.0, 160.0," ");
	TextDrawSetShadow(GunList_2,1);
	TextDrawSetOutline(GunList_2,1);
	TextDrawBackgroundColor(GunList_2,0x00000065);
	TextDrawFont(GunList_2,1);
	TextDrawLetterSize(GunList_2,0.20,0.7);
	TextDrawColor(GunList_2,0xFF8000FF);

	GunList_3 = TextDrawCreateEx(245.0, 160.0," ");
	TextDrawSetShadow(GunList_3,1);
	TextDrawSetOutline(GunList_3,1);
	TextDrawBackgroundColor(GunList_3,0x000000FF);
	TextDrawFont(GunList_3,1);
	TextDrawLetterSize(GunList_3,0.20,0.7);
	TextDrawColor(GunList_3,0x0000FFFF);

	GunList_4 = TextDrawCreateEx(360.0, 160.0," ");
	TextDrawSetShadow(GunList_4,1);
	TextDrawSetOutline(GunList_4,1);
	TextDrawBackgroundColor(GunList_4,0x000000FF);
	TextDrawFont(GunList_4,1);
	TextDrawLetterSize(GunList_4,0.20,0.7);
	TextDrawColor(GunList_4,0xFF0000FF);

	GunList_5 = TextDrawCreateEx(475.0, 160.0," ");
	TextDrawSetShadow(GunList_5,1);
	TextDrawSetOutline(GunList_5,1);
	TextDrawBackgroundColor(GunList_5,0x000000FF);
	TextDrawFont(GunList_5,1);
	TextDrawLetterSize(GunList_5,0.20,0.7);
	TextDrawColor(GunList_5,0x00FF00FF);

	// ==== > Vehicle HUD < ====
 	veh1 = TextDrawCreateEx(10.000000,131.50000," "); //top black bar
    TextDrawUseBox(veh1, 1);
    TextDrawTextSize(veh1, 120.0,5.0);
    TextDrawBoxColor(veh1, 0x000000FF);
	TextDrawSetOutline(veh1,1);

	veh2 = TextDrawCreateEx(10.000000,219.50000," "); //bottom black bar
    TextDrawUseBox(veh2, 1);
    TextDrawTextSize(veh2, 120.0,5.0);
    TextDrawBoxColor(veh2, 0x000000FF);
	TextDrawSetOutline(veh2,1);

	veh3 = TextDrawCreateEx(10.000000,135.000000,"~n~~n~~n~~n~~n~~n~~n~~n~"); //content one
    TextDrawUseBox(veh3, 1);
    TextDrawBoxColor(veh3, 0x0080FF2A);
    TextDrawTextSize(veh3, 120.0,1.0);
	TextDrawSetOutline(veh3,1);

	veh5 = TextDrawCreateEx(14.000000,150.00000,"spacer"); //health black bar bg
    TextDrawUseBox(veh5, 1);
    TextDrawTextSize(veh5, 116.5,50.0);
    TextDrawBoxColor(veh5, 0x000000FF);
    TextDrawColor(veh5, COLOR_BLACK);
	TextDrawSetOutline(veh5,1);

	//new string[256];

	ScoreboardHome = TextDrawCreateEx(558.000000,122.000000,"--");
	TextDrawAlignment(ScoreboardHome,3);
	TextDrawFont(ScoreboardHome,3);
	TextDrawLetterSize(ScoreboardHome,0.340000, 1.400001);
	TextDrawColor(ScoreboardHome,GetTeamColor(1, T_HOME) | 0x000000FF);
	TextDrawSetProportional(ScoreboardHome,0);
	TextDrawSetShadow(ScoreboardHome,0);
	TextDrawSetOutline(ScoreboardHome,1);

	ScoreboardAway = TextDrawCreateEx(563.000000, 122.000000,"--");
	TextDrawAlignment(ScoreboardAway,1);
	TextDrawFont(ScoreboardAway,3);
	TextDrawLetterSize(ScoreboardAway,0.340000, 1.400001);
	TextDrawColor(ScoreboardAway,GetTeamColor(1, T_AWAY) | 0x000000FF);
	TextDrawSetProportional(ScoreboardAway,0);
	TextDrawSetShadow(ScoreboardAway,0);
	TextDrawSetOutline(ScoreboardAway,1);

	// %02d ~y~-~w~ %02d
	/*ScoreboardScore = TextDrawCreateEx(520.000000,122.000000,"Score:");
	TextDrawAlignment(ScoreboardScore,2);
	TextDrawFont(ScoreboardScore,2);
	TextDrawLetterSize(ScoreboardScore,0.40000,1.000000);
	TextDrawColor(ScoreboardScore,0xffffffff);
	TextDrawSetProportional(ScoreboardScore,1);
	TextDrawSetShadow(ScoreboardScore,0);
	TextDrawSetOutline(ScoreboardScore,1);*/


	for(new i = 0; i < Server[MaxVehicles]; i++)
   	{
   	   	veh4[i] = TextDrawCreateEx(66,136, "_");
		TextDrawLetterSize(veh4[i],0.4,1.0);
		TextDrawFont(veh4[i],3);
		TextDrawColor(veh4[i], COLOR_WHITE);
		TextDrawBackgroundColor(veh4[i],0x000000AA);
		TextDrawSetOutline(veh4[i],1);

		veh6[i] = TextDrawCreateEx(15.000000,150.00000,"~w~~h~l"); //health red bar
		TextDrawUseBox(veh6[i], 1);
		TextDrawTextSize(veh6[i], 115.0,50.0);
		TextDrawBoxColor(veh6[i], 0xB7000081);
		TextDrawColor(veh6[i], 0xB7000081);
		TextDrawSetOutline(veh6[i],1);
		TextDrawFont(veh6[i],1);

		veh7[i] = TextDrawCreateEx(13.000000,162.00000,"_"); //info
		TextDrawLetterSize(veh7[i],0.20,0.7);
		TextDrawFont(veh7[i],1);
		TextDrawColor(veh7[i], COLOR_WHITE);
		TextDrawBackgroundColor(veh7[i],0x000000AA);
		TextDrawSetOutline(veh7[i],1);
   	}

	for(new i = 0; i < MAX_DMS; i ++)
	{
   	   	DMScores[i] = TextDrawCreateEx(20,130, "~r~DM Scoreboard");
  		TextDrawUseBox(DMScores[i],1);
  		TextDrawBoxColor(DMScores[i], 0x00000077);
  		TextDrawTextSize(DMScores[i], 150.0, 100.0);

		TextDrawLetterSize(DMScores[i],0.20,0.7);
		TextDrawFont(DMScores[i],1);
		TextDrawColor(DMScores[i], 0x000000FF);
		TextDrawBackgroundColor(DMScores[i],0x000000AA);
		TextDrawSetOutline(DMScores[i],1);
	}

	flashy_site = TextDrawCreateEx(545.000000, 5.000000,"-");
	TextDrawLetterSize(flashy_site,0.5,1.25);
	TextDrawFont(flashy_site,3);
	TextDrawBackgroundColor(flashy_site,0x000000AA);
	TextDrawSetOutline(flashy_site,1);
	TextDrawAlignment(flashy_site, 2);

	flashy_site2 = TextDrawCreateEx(650.000000,-15.000000,"~n~~n~~n~");
    TextDrawUseBox(flashy_site2, 1);
    TextDrawBoxColor(flashy_site2, 0x000000A0);
    TextDrawTextSize(flashy_site2, 490.0,1.0);
	TextDrawSetOutline(flashy_site2,1);

	// ==== > Request Class HUD < ====
	classhud1 = TextDrawCreateEx(570.000000,103.00000," "); //top black bar
    TextDrawUseBox(classhud1, 1);
    TextDrawTextSize(classhud1, 430.0,5.0);
    TextDrawBoxColor(classhud1, 0x000000FF);
	TextDrawSetOutline(classhud1,1);

	classhud2 = TextDrawCreateEx(570.000000,141.00000," "); //bottom black bar
    TextDrawUseBox(classhud2, 1);
    TextDrawTextSize(classhud2, 430.0,0.2);
    TextDrawBoxColor(classhud2, 0x000000FF);
	TextDrawSetOutline(classhud2,1);

	classhud3 = TextDrawCreateEx(570.000000,107.000000,"~n~~n~~n~"); //purple one
    TextDrawUseBox(classhud3, 1);
	TextDrawBoxColor(classhud3, TD_CLASSHUD);
    TextDrawTextSize(classhud3, 430.0,1.0);
	TextDrawSetOutline(classhud3,1);

	classhud_home = TextDrawCreateEx(440.000000, 108.000000," ");
	TextDrawLetterSize(classhud_home,0.35,1.0);
	TextDrawFont(classhud_home,1);
	TextDrawBackgroundColor(classhud_home,0x000000A0);
	TextDrawSetOutline(classhud_home,1);

	classhud_away = TextDrawCreateEx(440.000000, 108.000000," ");
	TextDrawLetterSize(classhud_away,0.35,1.0);
	TextDrawFont(classhud_away,1);
	TextDrawBackgroundColor(classhud_away,0x000000A0);
	TextDrawSetOutline(classhud_away,1);

	// ==== > Voting < ====
	gamemsg_voting = TextDrawCreateEx(320.000000, 240.000000," ");
	TextDrawLetterSize(gamemsg_voting,0.8,1.6);
	TextDrawFont(gamemsg_voting,3);
	TextDrawBackgroundColor(gamemsg_voting,0x000000AA);
	TextDrawSetOutline(gamemsg_voting,1);
	TextDrawAlignment(gamemsg_voting, 2);

	skip_intro = TextDrawCreateEx(555.000000, 5.000000,"~w~~y~Skip Intro: Fire Key");
	TextDrawLetterSize(skip_intro,0.4,1.0);
	TextDrawFont(skip_intro,3);
	TextDrawBackgroundColor(skip_intro,0x000000AA);
	//TextDrawSetOutline(skip_intro,1);
	TextDrawAlignment(skip_intro, 2);

	// ==== > Rules < ====
/*	new rules[1024];
	format(rules,1024,"~n~~n~~n~~n~~n~~n~~n~~r~please follow these rules...~n~~n~~w~\
	- No hacking, cheating, etc~n~\
	- No flaming and/or crying~n~\
	- No bug abusing, crouch and 2shot allowed~n~\
	- No bug abusing, crouch and 2shot allowed~n~\
	- Vehicles are not weapons~n~~n~~y~\
	Visit %s~n~~n~~n~~n~", WEB_URL);*/


	new rules[1024];
	#if defined WEB_URL
	format(rules,1024,"~r~Please follow these rules...~n~~n~~w~\
	- %s~n~\
	- %s~n~\
	- %s~n~\
	- %s~n~\
	- %s~n~~n~~y~\
	Visit %s",Rules[1],Rules[2],Rules[3],Rules[4], Rules[5], WEB_URL);
	#else
	format(rules,1024,"~r~Please follow these rules...~n~~n~~w~\
	- %s~n~\
	- %s~n~\
	- %s~n~\
	- %s~n~\
	- %s",Rules[1],Rules[2],Rules[3],Rules[4], Rules[5]);
	#endif

	for(new i = 0; i < sizeof(HintMessages); i++)
   	{
		text_hint[i] = TextDrawCreateEx(605,5, HintMessages[i]);
		TextDrawLetterSize(text_hint[i],0.2,0.8);
		TextDrawFont(text_hint[i],2);
		TextDrawColor(text_hint[i], COLOR_WHITE);
		TextDrawBackgroundColor(text_hint[i],0x000000AA);
		TextDrawSetOutline(text_hint[i],1);
		TextDrawAlignment(text_hint[i], 3);
	}

	text_rules = TextDrawCreateEx(320.000000, 250.000000, rules);
	TextDrawLetterSize(text_rules,0.5,1.4);
	TextDrawFont(text_rules,0);
	TextDrawBackgroundColor(text_rules,0x000000A0);
	TextDrawSetOutline(text_rules,1);
	TextDrawUseBox(text_rules, 1);
	TextDrawAlignment(text_rules, 2);
	TextDrawSetProportional(text_rules, true);
	TextDrawBoxColor(text_rules, 0x00000077);
	TextDrawTextSize(text_rules, 0, 300.0);
	TextDrawSetShadow(text_rules,1);

	text_deathmsg = TextDrawCreateEx(320,150, "Wasted");
	TextDrawLetterSize(text_deathmsg,1.3,3.4);
	TextDrawFont(text_deathmsg,0);
	TextDrawColor(text_deathmsg, COLOR_GREY);
	TextDrawBackgroundColor(text_deathmsg,0x000000AA);
	TextDrawSetOutline(text_deathmsg,3);
	TextDrawAlignment(text_deathmsg, 2);

	text_firstblood = TextDrawCreateEx(320,260, "~b~~r~FIRST BLOOD");
	TextDrawLetterSize(text_firstblood,0.8,2.0);
	TextDrawFont(text_firstblood,3);
	TextDrawColor(text_firstblood, COLOR_WHITE);
	TextDrawSetOutline(text_firstblood,2);
	TextDrawAlignment(text_firstblood, 2);

	text_firstblood2 = TextDrawCreateEx(320,280, "~b~~p~[KR]Raekwon");
	TextDrawLetterSize(text_firstblood2,0.8,2.0);
	TextDrawFont(text_firstblood2,0);
	TextDrawColor(text_firstblood2, COLOR_WHITE);
	TextDrawSetOutline(text_firstblood2,2);
	TextDrawAlignment(text_firstblood2, 2);

	// ==== > Flashing Red < ====
	text_redflash = TextDrawCreateEx(0.000000, 0.000000,"~n~ ~n~ ~n~ ~n~ ~n~ ~n~ ~n~ ~n~ ~n~ ~n~ ~n~ ~n~ ~n~ ~n~ ~n~ ~n~ ~n~ ~n~ ~n~ ~n~ ~n~ ~n~ ~n~ ~n~ ~n~ ~n~ ~n~ ~n~ ~n~");
	TextDrawLetterSize(text_redflash,0.6,1.7);
	TextDrawFont(text_redflash,0);
	TextDrawBackgroundColor(text_redflash,0xFF000026);
	TextDrawSetOutline(text_redflash,1);
	TextDrawUseBox(text_redflash, 1);
	TextDrawAlignment(text_redflash, 2);
	TextDrawBoxColor(text_redflash, 0xFF000026);

	// ==== > Map Name < ====
	MapNameTD=TextDrawCreateEx(605,100, " ");
	TextDrawLetterSize(MapNameTD,0.3,1.0);
	TextDrawFont(MapNameTD,3);
	TextDrawColor(MapNameTD, COLOR_LIGHTPURPLE);
	TextDrawBackgroundColor(MapNameTD,0x000000AA);
	TextDrawSetOutline(MapNameTD,1);
	TextDrawAlignment(MapNameTD,3);

	//default + sign
	health_plus = TextDrawCreateEx(467,73, "~w~~r~~h~ +");
	TextDrawLetterSize(health_plus,1.1,3.5);
	TextDrawFont(health_plus,3);
	TextDrawColor(health_plus, COLOR_WHITE);
	TextDrawBackgroundColor(health_plus,0x000000AA);
	TextDrawSetOutline(health_plus,2);

/*
	//hp overlaying $
	health_plus = TextDrawCreateEx(493.000000,77.000000,"~r~HP");
	TextDrawAlignment(health_plus,0);
	TextDrawBackgroundColor(health_plus,0x000000ff);
	TextDrawFont(health_plus,1);
	TextDrawLetterSize(health_plus,0.699999,2.499999);
	TextDrawColor(health_plus,0xffffffff);
	TextDrawSetOutline(health_plus,1);
	TextDrawSetProportional(health_plus,1);
	TextDrawSetShadow(health_plus,1);

	//black box overlaying money
	health_plus = TextDrawCreateEx(503.000000,82.000000," ~r~HP:");
	TextDrawUseBox(health_plus,1);
	TextDrawBoxColor(health_plus,0x000000aa);
	TextDrawTextSize(health_plus,567.000000,241.000000);
	TextDrawAlignment(health_plus,0);
	TextDrawBackgroundColor(health_plus,0x000000ff);
	TextDrawFont(health_plus,3);
	TextDrawLetterSize(health_plus,0.700000,1.400000);
	TextDrawColor(health_plus,0xffffffFF);
	TextDrawSetOutline(health_plus,1);
	TextDrawSetProportional(health_plus,1);
	TextDrawSetShadow(health_plus,1);

*/
	// ==== > Wide Screen < ====
	WideScreenUp = TextDrawCreateEx(0.0,0.0,"~n~~n~~n~~n~~n~~n~~n~~n~~n~");
	TextDrawFont(WideScreenUp,1);
	TextDrawLetterSize(WideScreenUp,1,1);
	TextDrawColor(WideScreenUp,0x000000FF);
	TextDrawSetShadow(WideScreenUp,1);
	TextDrawSetOutline(WideScreenUp,50);
	TextDrawBackgroundColor(WideScreenUp,0x000000BB);
	TextDrawUseBox(WideScreenUp,1);
	TextDrawBoxColor(WideScreenUp,0x000000BB);

	WideScreenDown = TextDrawCreateEx(0.0, 380.0,"~n~~n~~n~~n~~n~~n~~n~~n~~n~");
	TextDrawFont(WideScreenDown,1);
	TextDrawLetterSize(WideScreenDown,1,1);
	TextDrawColor(WideScreenDown,0x000000FF);
	TextDrawSetShadow(WideScreenDown,1);
	TextDrawSetOutline(WideScreenDown,50);
	TextDrawBackgroundColor(WideScreenDown,0x000000BB);
	TextDrawUseBox(WideScreenDown,1);
	TextDrawBoxColor(WideScreenDown,0x000000BB);

	// ==== > Request Class Teams names < ====
	ClassTeams_Auto=TextDrawCreateEx(320,362, " ");
	TextDrawLetterSize(ClassTeams_Auto,1.25,2.7);
	TextDrawFont(ClassTeams_Auto,3);
	TextDrawColor(ClassTeams_Auto, 0xffffffff);
	TextDrawSetShadow(ClassTeams_Auto, 0);
	TextDrawSetOutline(ClassTeams_Auto,1);
	TextDrawAlignment(ClassTeams_Auto, 2);

	ClassTeams_Home=TextDrawCreateEx(320,362, " ");
	TextDrawLetterSize(ClassTeams_Home,1.25,2.7);
	TextDrawFont(ClassTeams_Home,3);
	TextDrawColor(ClassTeams_Home, 0xffffffff);
	TextDrawSetShadow(ClassTeams_Home, 0);
	TextDrawSetOutline(ClassTeams_Home,1);
	TextDrawAlignment(ClassTeams_Home, 2);

	ClassTeams_Away=TextDrawCreateEx(320,362, " ");
	TextDrawLetterSize(ClassTeams_Away,1.25,2.7);
	TextDrawFont(ClassTeams_Away,3);
	TextDrawColor(ClassTeams_Away, 0xffffffff);
	TextDrawSetShadow(ClassTeams_Away, 0);
	TextDrawSetOutline(ClassTeams_Away,1);
	TextDrawAlignment(ClassTeams_Away, 2);

	ClassTeams_Subaway=TextDrawCreateEx(320,362, " ");
	TextDrawLetterSize(ClassTeams_Subaway,1.25,2.7);
	TextDrawFont(ClassTeams_Subaway,3);
	TextDrawColor(ClassTeams_Subaway, 0xffffffff);
	TextDrawSetShadow(ClassTeams_Subaway, 0);
	TextDrawSetOutline(ClassTeams_Subaway,1);
	TextDrawAlignment(ClassTeams_Subaway, 2);

	ClassTeams_Subhome=TextDrawCreateEx(320,362, " ");
	TextDrawLetterSize(ClassTeams_Subhome,1.25,2.7);
	TextDrawFont(ClassTeams_Subhome,3);
	TextDrawColor(ClassTeams_Subhome, 0xffffffff);
	TextDrawSetShadow(ClassTeams_Subhome, 0);
	TextDrawSetOutline(ClassTeams_Subhome,1);
	TextDrawAlignment(ClassTeams_Subhome, 2);

	ClassTeams_Ref=TextDrawCreateEx(320,362, " ");
	TextDrawLetterSize(ClassTeams_Ref,1.25,2.7);
	TextDrawFont(ClassTeams_Ref,3);
	TextDrawColor(ClassTeams_Ref, 0xffffffff);
	TextDrawSetShadow(ClassTeams_Ref, 0);
	TextDrawSetOutline(ClassTeams_Ref,1);
	TextDrawAlignment(ClassTeams_Ref, 2);

	lobbybg1 = TextDrawCreateEx(330.000000,410.000000,"~n~~n~~n~~n~"); //darker black one
	TextDrawUseBox(lobbybg1, 1);
 	TextDrawBoxColor(lobbybg1, 0x000000BB);
    TextDrawTextSize(lobbybg1, 550.0,1.0);
	TextDrawSetOutline(lobbybg1,1);

	autowep = TextDrawCreateEx(567.000000,240.000000,"~n~~n~~n~~n~"); //big yellow box
	TextDrawUseBox(autowep, 1);
 	TextDrawBoxColor(autowep, 0xFFFF0012);
    TextDrawTextSize(autowep, 470.0,1.0);
	TextDrawSetOutline(autowep,1);

	autowep2 = TextDrawCreateEx(567.000000,225.000000,"~n~"); //top black box
	TextDrawUseBox(autowep2, 1);
 	TextDrawBoxColor(autowep2, 0x00000099);
    TextDrawTextSize(autowep2, 470.0,3.0);
	TextDrawSetOutline(autowep2,1);

	autowep3 = TextDrawCreateEx(567.000000,283.00000," "); //bottom black bar
	TextDrawUseBox(autowep3, 1);
    TextDrawTextSize(autowep3, 470.0,1.0);
   	TextDrawBoxColor(autowep3, 0x00000099);
	TextDrawSetOutline(autowep3,1);

	autowep4 = TextDrawCreateEx(475.000000, 224.000000,"~y~Auto Weapons");
	TextDrawLetterSize(autowep4,0.48,1.3);
	TextDrawFont(autowep4,0);
	TextDrawBackgroundColor(autowep4,0x000000A0);
	TextDrawSetOutline(autowep4,1);

	autowep5 = TextDrawCreateEx(475.000000, 233.000000,"~n~~w~- Knife (x1)~n~- Knife (x1)~n~- Knife (x1)");
	TextDrawLetterSize(autowep5,0.25,0.8);
	TextDrawFont(autowep5,1);
	TextDrawBackgroundColor(autowep5,0x000000A0);
	TextDrawSetOutline(autowep5,1);

	specweps1 = TextDrawCreateEx(20.000000,320.000000,"~n~~n~~n~~n~~n~~n~~n~~n~~n~"); //big yellow box
	TextDrawUseBox(specweps1, 1);
 	TextDrawBoxColor(specweps1, 0xFFFF0012);
    TextDrawTextSize(specweps1, 110.0,1.0);
	TextDrawSetOutline(specweps1,1);

	specweps2 = TextDrawCreateEx(20.000000,307.000000,"~n~"); //top black box
	TextDrawUseBox(specweps2, 1);
 	TextDrawBoxColor(specweps2, 0x00000099);
    TextDrawTextSize(specweps2, 110.0,3.0);
	TextDrawSetOutline(specweps2,1);

	specweps4 = TextDrawCreateEx(35.000000, 304.000000,"~y~Weapons");
	TextDrawLetterSize(specweps4,0.48,1.3);
	TextDrawFont(specweps4,0);
	TextDrawBackgroundColor(specweps4,0x000000A0);
	TextDrawSetOutline(specweps4,1);

	// ==== > Round Textdraws < ====
	if(Server[MainTextdrawLayout] == 1)
	{

		home_tdamage = TextDrawCreateEx(180.0,420.0,"-");
		TextDrawAlignment(home_tdamage,0);
		TextDrawFont(home_tdamage,3);
		TextDrawLetterSize(home_tdamage,0.45,1.40);
		TextDrawSetOutline(home_tdamage,1);
		TextDrawSetShadow(home_tdamage,1);
		TextDrawBackgroundColor(home_tdamage,0x000000FF);
		TextDrawSetProportional(home_tdamage,1);
		TextDrawColor(home_tdamage, 0xFF0000FF);

		away_tdamage = TextDrawCreateEx(460.0, 420.0,"-");
		TextDrawAlignment(away_tdamage,0);
		TextDrawFont(away_tdamage,3);
		TextDrawLetterSize(away_tdamage,0.45,1.40);
		TextDrawSetOutline(away_tdamage,1);
		TextDrawSetShadow(away_tdamage,1);
		TextDrawBackgroundColor(away_tdamage,0x000000FF);
		TextDrawSetProportional(away_tdamage,1);
		TextDrawColor(away_tdamage, 0xFF0000FF);

		gamemsg_baseupdatehome = TextDrawCreateEx(0.000000, 435.000000," ");
		TextDrawLetterSize(gamemsg_baseupdatehome,0.48,1.3);
		TextDrawFont(gamemsg_baseupdatehome,3);
		TextDrawBackgroundColor(gamemsg_baseupdatehome,0x000000AA);
		TextDrawSetOutline(gamemsg_baseupdatehome,1);
		TextDrawUseBox(gamemsg_baseupdatehome, 1);
		TextDrawBoxColor(gamemsg_baseupdatehome, 0x000000A0);

 		gamemsg_baseupdateaway = TextDrawCreateEx(390.000000, 435.000000," ");
		TextDrawLetterSize(gamemsg_baseupdateaway,0.48,1.3);
		TextDrawFont(gamemsg_baseupdateaway,3);
		TextDrawBackgroundColor(gamemsg_baseupdateaway,0x000000AA);
		TextDrawSetOutline(gamemsg_baseupdateaway,1);

		HUDBox = TextDrawCreateEx(600.000000,375.000000,"~n~~n~~n~~n~"); //HUD Background
	    TextDrawUseBox(HUDBox, 1);
	    TextDrawBoxColor(HUDBox, 0x0F0F0F99);
	    TextDrawTextSize(HUDBox, 400.0,1.0);

	 	HUDTop = TextDrawCreateEx(600.000000,372.00000," "); //top black bar
	    TextDrawUseBox(HUDTop, 1);
	    TextDrawTextSize(HUDTop, 400.0,1.0);
	    TextDrawBoxColor(HUDTop, 0x000000FF);
		TextDrawSetOutline(HUDTop,1);

	 	HUDBottom = TextDrawCreateEx(600.000000,418.00000," "); //top black bar
	    TextDrawUseBox(HUDBottom, 1);
	    TextDrawTextSize(HUDBottom, 400.0,1.0);
    	TextDrawBoxColor(HUDBottom, 0x000000FF);
		TextDrawSetOutline(HUDBottom,1);

		gamemsg_cp = TextDrawCreateEx(320.000000, 420.000000," ");
		TextDrawLetterSize(gamemsg_cp,0.4,1.15);
		TextDrawFont(gamemsg_cp,3);
		TextDrawBackgroundColor(gamemsg_cp,0x000000AA);
		TextDrawSetOutline(gamemsg_cp,1);
		TextDrawAlignment(gamemsg_cp, 2);
	}
	else
	{
		home_tdamage = TextDrawCreateEx(180.0,400.0,"-");
		TextDrawAlignment(home_tdamage,0);
		TextDrawFont(home_tdamage,3);
		TextDrawLetterSize(home_tdamage,0.45,1.40);
		TextDrawSetOutline(home_tdamage,1);
		TextDrawSetShadow(home_tdamage,1);
		TextDrawBackgroundColor(home_tdamage,0x000000FF);
		TextDrawSetProportional(home_tdamage,1);
		TextDrawColor(home_tdamage, 0xFF0000FF);

		away_tdamage = TextDrawCreateEx(180.0, 420.0,"-");
		TextDrawAlignment(away_tdamage,0);
		TextDrawFont(away_tdamage,3);
		TextDrawLetterSize(away_tdamage,0.45,1.40);
		TextDrawSetOutline(away_tdamage,1);
		TextDrawSetShadow(away_tdamage,1);
		TextDrawBackgroundColor(away_tdamage,0x000000FF);
		TextDrawSetProportional(away_tdamage,1);
		TextDrawColor(away_tdamage, 0xFF0000FF);

		gamemsg_cp = TextDrawCreateEx(520.000000, 320.000000," ");
		TextDrawLetterSize(gamemsg_cp,0.4,1.15);
		TextDrawFont(gamemsg_cp,3);
		TextDrawBackgroundColor(gamemsg_cp,0x000000AA);
		TextDrawSetOutline(gamemsg_cp,1);
		TextDrawAlignment(gamemsg_cp, 2);

		HUDBox = TextDrawCreateEx(138.000000,400.000000,"~n~~n~~n~~n~"); //HUD Background
	    TextDrawUseBox(HUDBox, 1);
	    TextDrawBoxColor(HUDBox, 0x0F0F0F99);
	    TextDrawTextSize(HUDBox, 300.0,1.0);

	 	HUDTop = TextDrawCreateEx(138.000000,397.00000," "); //top black bar
	    TextDrawUseBox(HUDTop, 1);
	    TextDrawTextSize(HUDTop, 300.0,1.0);
	    TextDrawBoxColor(HUDTop, 0x000000FF);
		TextDrawSetOutline(HUDTop,1);

	 	HUDBottom = TextDrawCreateEx(138.000000,443.00000," "); //top black bar
	    TextDrawUseBox(HUDBottom, 1);
	    TextDrawTextSize(HUDBottom, 300.0,1.0);
    	TextDrawBoxColor(HUDBottom, 0x000000FF);
		TextDrawSetOutline(HUDBottom,1);

	 	hud1 = TextDrawCreateEx(620.000000,346.50000,"~n~~n~"); //top black bar
	    TextDrawUseBox(hud1, 1);
	    TextDrawTextSize(hud1, 420.0,5.0);
	    TextDrawBoxColor(hud1, 0x000000FF);
		TextDrawSetOutline(hud1,1);

		hud2 = TextDrawCreateEx(620.000000,436.00000," "); //bottom black bar
	    TextDrawUseBox(hud2, 1);
	    TextDrawTextSize(hud2, 420.0,0.2);
	    TextDrawBoxColor(hud2, 0x000000FF);
		TextDrawSetOutline(hud2,1);

		hud3 = TextDrawCreateEx(620.000000,371.000000,"~n~~n~~n~~n~~n~~n~"); //purple one
	    TextDrawUseBox(hud3, 1);
	    TextDrawBoxColor(hud3, 0x0080FF2A);
	    TextDrawTextSize(hud3, 420.0,1.0);
		TextDrawSetOutline(hud3,1);

		hud4 = TextDrawCreateEx(520.000000, 350.000000,"~r~]~y~Round HUD~r~]");
		TextDrawLetterSize(hud4,0.8,1.7);
		TextDrawFont(hud4,0);
		TextDrawBackgroundColor(hud4,0x000000A0);
		TextDrawSetOutline(hud4,1);
		TextDrawAlignment(hud4, 2);

		homehud = TextDrawCreateEx(520.000000, 375.000000," ");
		TextDrawLetterSize(homehud,0.48,1.3);
		TextDrawFont(homehud,3);
		TextDrawBackgroundColor(homehud,0x000000AA);
		TextDrawSetOutline(homehud,1);
		TextDrawAlignment(homehud, 2);

		awayhud = TextDrawCreateEx(520.000000, 405.000000," ");
		TextDrawLetterSize(awayhud,0.48,1.3);
		TextDrawFont(awayhud,3);
		TextDrawBackgroundColor(awayhud,0x000000AA);
		TextDrawSetOutline(awayhud,1);
		TextDrawAlignment(awayhud, 2);
	}

	// ==== > Lobby Info (Bases / TMDs) < ====
	gamemsg_lobby = TextDrawCreateEx(540.000000, 435.000000,"-");
	TextDrawLetterSize(gamemsg_lobby,0.3,1.0);
	TextDrawFont(gamemsg_lobby,1);
	TextDrawBackgroundColor(gamemsg_lobby,0x000000A0);
	TextDrawSetOutline(gamemsg_lobby,1);
	TextDrawAlignment(gamemsg_lobby,2);

	// ==== > GM/CLAN bottom left < ====
	Link2=TextDrawCreateEx(540,424, "-");
	TextDrawLetterSize(Link2,0.3,1.0);
	TextDrawFont(Link2,0);
	TextDrawColor(Link2, COLOR_WHITE);
	TextDrawSetShadow(Link2, 0);
	TextDrawSetOutline(Link2,1);
	TextDrawAlignment(Link2,2);

	// ==== > Round Clock < ====
	TimerClock=TextDrawCreateEx(547,23, "00:00");
	TextDrawLetterSize(TimerClock,0.55,2);
	TextDrawFont(TimerClock,3);
	TextDrawColor(TimerClock, COLOR_WHITE);
	TextDrawSetShadow(TimerClock, 0);
	TextDrawSetOutline(TimerClock,2);

	// ==== > End Round Textdraws < ====
	ts_lefttopbar = TextDrawCreateEx(80.000000,132.50000," ~n~ ~n~ ");
    TextDrawUseBox(ts_lefttopbar, 1);
    TextDrawTextSize(ts_lefttopbar, 180.0,30.0);
    TextDrawBoxColor(ts_lefttopbar, 0x000000FF);
	TextDrawSetOutline(ts_lefttopbar,1);

	ts_righttopbar = TextDrawCreateEx(465.000000,132.50000," ~n~ ~n~ ");
    TextDrawUseBox(ts_righttopbar, 1);
    TextDrawTextSize(ts_righttopbar, 565.0,30.0);
    TextDrawBoxColor(ts_righttopbar, 0x000000FF);
	TextDrawSetOutline(ts_righttopbar,1);

	ts_awaybg = TextDrawCreateEx(465.000000,156.50000," ~n~ ~n~ ~n~ ~n~ ~n~ ~n~ ~n~ ~n~ ~n~ ~n~ ~n~ ~n~ ~n~ ");
    TextDrawUseBox(ts_awaybg, 1);
    TextDrawTextSize(ts_awaybg, 565.0,30.0);
    TextDrawBoxColor(ts_awaybg, 0x000000FF);
	TextDrawSetOutline(ts_awaybg,1);

	ts_homebg = TextDrawCreateEx(80.000000,156.50000," ~n~ ~n~ ~n~ ~n~ ~n~ ~n~ ~n~ ~n~ ~n~ ~n~ ~n~ ~n~ ~n~ ");
    TextDrawUseBox(ts_homebg, 1);
    TextDrawTextSize(ts_homebg, 180.0,30.0);
    TextDrawBoxColor(ts_homebg, 0x000000FF);
	TextDrawSetOutline(ts_homebg,1);

	ts_homename = TextDrawCreateEx(130.000000,136.50000,"Home");
	TextDrawLetterSize(ts_homename,0.5,1.3);
	TextDrawFont(ts_homename,2);
	TextDrawBackgroundColor(ts_homename,0x000000A0);
	TextDrawSetOutline(ts_homename,1);
	TextDrawAlignment(ts_homename, 2);

	ts_awayname = TextDrawCreateEx(515.000000,136.50000,"Away");
	TextDrawLetterSize(ts_awayname,0.5,1.3);
	TextDrawFont(ts_awayname,2);
	TextDrawBackgroundColor(ts_awayname,0x000000A0);
	TextDrawSetOutline(ts_awayname,1);
	TextDrawAlignment(ts_awayname, 2);

	ts_homescore = TextDrawCreateEx(130.000000,150.5000,"Player Name");
	TextDrawLetterSize(ts_homescore,0.3,0.9);
	TextDrawFont(ts_homescore,1);
	TextDrawSetOutline(ts_homescore,1);
	TextDrawColor(ts_homescore, 0xffffffff);
	TextDrawAlignment(ts_homescore,2);

	ts_awayscore = TextDrawCreateEx(515.000000,150.50000,"Player Name");
	TextDrawLetterSize(ts_awayscore,0.3,0.9);
	TextDrawFont(ts_awayscore,1);
	TextDrawSetOutline(ts_awayscore,1);
	TextDrawColor(ts_awayscore, 0xffffffff);
	TextDrawAlignment(ts_awayscore,2);

 	ts_topbar = TextDrawCreateEx(205.000000,122.50000,"~n~");
    TextDrawUseBox(ts_topbar, 1);
    TextDrawTextSize(ts_topbar, 440.0,1.0);
    TextDrawBoxColor(ts_topbar, 0x000000FF);
	TextDrawSetOutline(ts_topbar,1);

	ts_bottombar = TextDrawCreateEx(205.000000,222.00000,"~n~~n~~n~");
    TextDrawUseBox(ts_bottombar, 1);
    TextDrawTextSize(ts_bottombar, 440.0,1.0);
    TextDrawBoxColor(ts_bottombar, 0x000000FF);
	TextDrawSetOutline(ts_bottombar,1);

	ts_centralbg = TextDrawCreateEx(205.000000,137.000000,"~n~~n~~n~~n~~n~~n~~n~~n~");
    TextDrawUseBox(ts_centralbg, 1);
    TextDrawBoxColor(ts_centralbg, TD_BACKGROUND);
    TextDrawTextSize(ts_centralbg, 440.0,1.0);
	TextDrawSetOutline(ts_centralbg,1);

	topshooter = TextDrawCreateEx(320.000000, 224.000000," ");
	TextDrawLetterSize(topshooter,0.4,1.4);
	TextDrawFont(topshooter,3);
	TextDrawBackgroundColor(topshooter,0x000000A0);
	TextDrawSetOutline(topshooter,1);
	TextDrawAlignment(topshooter, 2);
	TextDrawSetProportional(topshooter, true);

	gamemsg_whowon = TextDrawCreateEx(320.000000, 150.000000," ");
	TextDrawLetterSize(gamemsg_whowon,0.8,1.3);
	TextDrawFont(gamemsg_whowon,0);
	TextDrawBackgroundColor(gamemsg_whowon,0x000000A0);
	TextDrawSetOutline(gamemsg_whowon,1);
	TextDrawAlignment(gamemsg_whowon, 2);

	// ==== > Score Label (ESL) < ====
	text_gtau = TextDrawCreateEx(85.000000, 330.000000,"~r~Home: 0 - Away: 0");
	TextDrawLetterSize(text_gtau,0.3,1.0);
	TextDrawFont(text_gtau,1);
	TextDrawBackgroundColor(text_gtau,0x000000A0);
	TextDrawSetOutline(text_gtau,1);
	TextDrawAlignment(text_gtau, 2);

	CreateHappyEndingTextDraws();
	// ==== > Spectate Info < ====
	for(new i = 0; i < GetMaxPlayers(); i++)
	{

		specingYou[i] = TextDrawCreateEx(140.000000,360.00000,"-");
		TextDrawLetterSize(specingYou[i],0.20,0.7);
		TextDrawFont(specingYou[i],1);
		TextDrawColor(specingYou[i], COLOR_WHITE);
		TextDrawBackgroundColor(specingYou[i],0x000000AA);
		TextDrawSetOutline(specingYou[i],1);

		specweps5[i] = TextDrawCreateEx(25.000000, 313.000000,"N/A");
		TextDrawLetterSize(specweps5[i],0.20,0.7);
		TextDrawFont(specweps5[i],1);
		TextDrawBackgroundColor(specweps5[i],0x000000A0);
		TextDrawSetOutline(specweps5[i],1);

		specfps[i] = TextDrawCreateEx(20.000000, 280.000000,"~w~~b~~h~Ping: ~w~100~n~~b~~h~Tickrate: ~w~100");
		TextDrawLetterSize(specfps[i],0.20,0.7);
		TextDrawFont(specfps[i],2);
		TextDrawBackgroundColor(specfps[i],0x000000A0);
		TextDrawSetOutline(specfps[i],1);

		FPS[i] = TextDrawCreateEx(50.000000, 410.000000, "--");
		TextDrawBackgroundColor(FPS[i], 255);
		TextDrawFont(FPS[i], 2);
		TextDrawLetterSize(FPS[i], 0.35,1.0);
		TextDrawColor(FPS[i], -65281);
		TextDrawSetOutline(FPS[i], 1);
		TextDrawSetProportional(FPS[i], 1);

		if(Server[MainTextdrawLayout] == 1)
		{
	   		DamageTexts[i] = TextDrawCreateEx(525.0, 330.0,"-");
			TextDrawAlignment(DamageTexts[i],0);
			TextDrawFont(DamageTexts[i],3);
			TextDrawLetterSize(DamageTexts[i],0.45,1.40);
			TextDrawSetOutline(DamageTexts[i],1);
			TextDrawSetShadow(DamageTexts[i],1);
			TextDrawBackgroundColor(DamageTexts[i],0x000000FF);
			TextDrawSetProportional(DamageTexts[i],1);
			TextDrawColor(DamageTexts[i], 0xFF0000FF);
		}
		else
		{
		  	DamageTexts[i] = TextDrawCreateEx(345.0, 410.0,"-");
			TextDrawAlignment(DamageTexts[i],0);
			TextDrawFont(DamageTexts[i],3);
			TextDrawLetterSize(DamageTexts[i],0.45,1.40);
			TextDrawSetOutline(DamageTexts[i],1);
			TextDrawSetShadow(DamageTexts[i],1);
			TextDrawBackgroundColor(DamageTexts[i],0x000000FF);
			TextDrawSetProportional(DamageTexts[i],1);
			TextDrawColor(DamageTexts[i], 0xFF0000FF);
		}

		fps_text[i] = TextDrawCreateEx(548.000000, 53.500000,"FPS");
		TextDrawLetterSize(fps_text[i],0.25,0.75);
		TextDrawFont(fps_text[i],1);
		TextDrawSetOutline(fps_text[i],1);
		TextDrawSetShadow(fps_text[i], 0);
		TextDrawColor(fps_text[i],COLOR_WHITE);

		Player[i][SpecText] = TextDrawCreateEx(320,5, " ");
		TextDrawAlignment(Player[i][SpecText], 2);
		TextDrawBackgroundColor(Player[i][SpecText],0x000000FF);
		TextDrawSetOutline(Player[i][SpecText],1);
		TextDrawFont(Player[i][SpecText], 1);
		TextDrawLetterSize(Player[i][SpecText], 0.40, 1.50);
		TextDrawSetProportional(Player[i][SpecText], 1);
		TextDrawSetShadow(Player[i][SpecText], 1);
		TextDrawTextSize(Player[i][SpecText], 40.0, 640.0);

		// ==== > Intro Fade Black < ====
		text_fadeblack[i] = TextDrawCreateEx(0.000000, 0.000000,"~n~ ~n~ ~n~ ~n~ ~n~ ~n~ ~n~ ~n~ ~n~ ~n~ ~n~ ~n~ ~n~ ~n~ ~n~ ~n~ ~n~ ~n~ ~n~ ~n~ ~n~ ~n~ ~n~ ~n~ ~n~ ~n~ ~n~ ~n~ ~n~ ~n~");
		TextDrawLetterSize(text_fadeblack[i],0.6,1.7);
		TextDrawFont(text_fadeblack[i],0);
		TextDrawBackgroundColor(text_fadeblack[i],0xFF000026);
		TextDrawSetOutline(text_fadeblack[i],1);
		TextDrawUseBox(text_fadeblack[i], 1);
		TextDrawAlignment(text_fadeblack[i], 2);
		TextDrawBoxColor(text_fadeblack[i], 0x00000000);

		intro_gmname[i] = TextDrawCreateEx(320.000000, 170.000000," ");
		TextDrawLetterSize(intro_gmname[i],1.0,2.1);
		TextDrawFont(intro_gmname[i],3);
		TextDrawBackgroundColor(intro_gmname[i],0x000000AA);
		TextDrawSetOutline(intro_gmname[i],1);
		TextDrawAlignment(intro_gmname[i], 2);

		CreatePlayerHUDTextDraws(i);
	}

	CoverScreen = TextDrawCreateEx(0.0,0.0,"~n~~n~~n~~n~~n~~n~~n~~n~~n~~n~~n~~n~~n~~n~~n~~n~~n~~n~~n~~n~~n~~n~~n~~n~~n~~n~~n~~n~~n~");
	TextDrawFont(CoverScreen,1);
	TextDrawLetterSize(CoverScreen,50,50);
	TextDrawColor(CoverScreen,0x000000FF);
	TextDrawSetShadow(CoverScreen,1);
	TextDrawSetOutline(CoverScreen,50);
	TextDrawBackgroundColor(CoverScreen,0x000000FF);
	TextDrawUseBox(CoverScreen,1);
	TextDrawBoxColor(CoverScreen,0x000000FF);

	BasesTextDrawsTop = TextDrawCreateEx(320.000000,10.000000,"List of Available Bases");
	TextDrawAlignment(BasesTextDrawsTop,2);
	TextDrawBackgroundColor(BasesTextDrawsTop,0x000000ff);
	TextDrawFont(BasesTextDrawsTop,0);
	TextDrawLetterSize(BasesTextDrawsTop,1.200000,2.200000);
	TextDrawColor(BasesTextDrawsTop,0xffffffff);
	TextDrawSetOutline(BasesTextDrawsTop,1);
	TextDrawSetProportional(BasesTextDrawsTop,1);
	TextDrawSetShadow(BasesTextDrawsTop,1);

	ArenasTextDrawsTop = TextDrawCreateEx(320.000000,10.000000,"List of Available TDMs");
	TextDrawAlignment(ArenasTextDrawsTop,2);
	TextDrawBackgroundColor(ArenasTextDrawsTop,0x000000ff);
	TextDrawFont(ArenasTextDrawsTop,0);
	TextDrawLetterSize(ArenasTextDrawsTop,1.200000,2.200000);
	TextDrawColor(ArenasTextDrawsTop,0xffffffff);
	TextDrawSetOutline(ArenasTextDrawsTop,1);
	TextDrawSetProportional(ArenasTextDrawsTop,1);
	TextDrawSetShadow(ArenasTextDrawsTop,1);

	printf("  -> %d TextDraws Loaded", Config[textdraws]);
}

SetVehicleVirtualWorld2(vehicleid, worldid)
{
	SetVehicleVirtualWorld(vehicleid, worldid);
	VehicleInfo[vehicleid][vWorld] =  worldid;
	for(new i = 0; i <= Server[HighestID]; i ++)
	{
	    if(IsPlayerConnected(i))
	    {
	        SetPlayerVirtualWorld(i, Player[i][vWorld]);
	    }
	}
	for(new i = 0; i < Server[MaxVehicles]; i ++)
	{
		SetVehicleVirtualWorld(i, VehicleInfo[i][vWorld]);
	}
}

SetPlayerVirtualWorld2(playerid, worldid)
{
	SetPlayerVirtualWorld(playerid, worldid);
	Player[playerid][vWorld] = worldid;
	for(new i = 0; i <= Server[HighestID]; i ++)
	{
	    if(IsPlayerConnected(i) && i != playerid)
	    {
	        SetPlayerVirtualWorld(i, Player[i][vWorld]);
	    }
	}
	for(new i = 0; i < Server[MaxVehicles]; i ++)
	{
		SetVehicleVirtualWorld(i, VehicleInfo[i][vWorld]);
	}
}

/*
#define FILE_NAME "map.txt"
forward UpdateSend();
public UpdateSend()
{
	new File:file;
 	new bool:doneone = false;
	new string[256];

	if(fexist(FILE_NAME)) fremove(FILE_NAME);
	if((file = fopen(FILE_NAME,io_write)))
	{
		for(new i = 1; i < MAX_BASES; i++)
		{
			#if GAMEMODE_TYPE == 1
			format(string,128,"combinations/bases/%d.ini",i);
			#elseif GAMEMODE_TYPE == 2
			format(string,128,"combinations/gtau/bases/%d.ini",i);
			#endif

		    if(dini_Exists(string))
		    {
				new fbase[256];
				fbase = Basefile(i);

				new idx;
				new BaseID = i;
				new BaseDescription[256];
				new BaseWorldTime, BaseInterior, Float:BaseAttacker[2], Float:BaseDefender[2], Float:BaseCP[2];

				format(BaseDescription,256,"%s", dini_Get(fbase,"about"));
			    if(!dini_Isset(fbase, "about"))
			    {
					format(BaseDescription,256,"Custom Base");
				}

				BaseInterior = dini_Int(fbase,"interior");
				BaseWorldTime = dini_Int(fbase,"time");

				idx = 0;
				string = dini_Get(fbase,"d_0");
				BaseDefender[0] = floatstr(strtok(string,idx,','));
				BaseDefender[1] = floatstr(strtok(string,idx,','));

				idx = 0;
				string = dini_Get(fbase,"home");
				BaseCP[0] = floatstr(strtok(string,idx,','));
				BaseCP[1] = floatstr(strtok(string,idx,','));

			    idx = 0;
				string = dini_Get(fbase,"a_0");
				BaseAttacker[0] = floatstr(strtok(string,idx,','));
				BaseAttacker[1] = floatstr(strtok(string,idx,','));


				if(doneone)
					fwrite(file,"|");
				else
					doneone = true;

				format(string,sizeof(string),"%d,%s,%f,%f,%f,%f,%f,%f,%d,%d,%s,%s,%d,%d,%d",
				BaseID,BaseDescription,BaseCP[0], BaseCP[1], BaseDefender[0], BaseDefender[1],
				BaseAttacker[0], BaseAttacker[1], BaseWorldTime, BaseInterior,dini_Get(fbase,"creator"),
				dini_Get(fbase,"date"), BaseVariables[i][TimesPlayed], BaseVariables[i][AttWins], BaseVariables[i][DefWins]);


				fwrite(file,string);
			}
		}
		fclose(file);
	}
}
*/

forward DestroyEmptyVehicles();
public DestroyEmptyVehicles() {
	if(Server[pConnected] == 0) return 1;
	if(Round[Current] != -1) return 1;
	new PlayersInVehicle;
   	for(new i = 0; i < MAX_VEHICLES; i++)
	{
	    PlayersInVehicle=0;
	   	for(new x; x <= Server[HighestID]; x++)
		{
		    if(IsPlayerInVehicle(x, i)) {
		    	PlayersInVehicle++;
		    }
		}
		if(PlayersInVehicle == 0 && VehicleInfo[i][hasSpawned] == true) {
			VehicleInfo[i][vWorld] = -1;
			VehicleInfo[i][pDriver] = -1;
			VehicleInfo[i][pPass1] = -1;
			VehicleInfo[i][pPass2] = -1;
			VehicleInfo[i][pPass3] = -1;
			TextDrawHideForAll(veh4[i]);
			TextDrawHideForAll(veh6[i]);
			TextDrawHideForAll(veh7[i]);
			VehicleInfo[i][hasSpawned] = false;
			if(Round[Current] == -1) {
			    VehicleInfo[i][EmptyCount]++;
			    if (VehicleInfo[i][EmptyCount] > 1) {
			    	Server[Vehicles]--;
					DestroyVehicle(i);
					DeleteCarNameLabel(i);
				}
			}
		} else {
			VehicleInfo[i][EmptyCount]= 0;
		}
	}
	return 1;
}

stock AddGetGunWeapon(weapon_name[], weapon_id, weapon_ammo)
{
	if(Weapon_idx >= MAX_GETGUN_WEAPONS)
	  return printf("Error -- Getgun weapons limit exceded. Please increase 'MAX_GETGUN_WEAPONS' define.");

	format(AvailableWeapons[Weapon_idx], 24,"%s", weapon_name);
	AvailableWeaponsIDs[Weapon_idx] = weapon_id;
	AvailableWeaponsAmmo[Weapon_idx] = weapon_ammo;
	Weapon_idx++;
	return 1;
}

AddSpawnableVehicle(menuid, name[], model, bool:AdminOnly)
{
	if(S_Index >= MAX_SPAWNABLE_VEHICLES)
	    return printf("Error -- Spawnable Vehicles limit exceed. Please increase 'MAX_SPAWNABLE_VEHICLES' define.");

	format(SpawnableVehicles[S_Index][VehName],24,"%s",name);
	SpawnableVehicles[S_Index][VehID] = model;
	SpawnableVehicles[S_Index][A_Only] = AdminOnly;
	S_Index ++;

	if(menuid == 1)
	{
		AddMenuItem(vehiclemenu_air, 0, name);
		VehicleMenuID[1][Air_idx] = model;
		VehicleForAdmins[1][Air_idx] = AdminOnly;
		Air_idx++;
	}
	else if(menuid == 2)
	{
		AddMenuItem(vehiclemenu_suv, 0, name);
		VehicleMenuID[2][SUV_idx] = model;
		VehicleForAdmins[2][SUV_idx] = AdminOnly;
		SUV_idx++;
	}
	else if(menuid == 3)
	{
		AddMenuItem(vehiclemenu_car, 0, name);
		VehicleMenuID[3][Car_idx] = model;
 		VehicleForAdmins[3][Car_idx] = AdminOnly;
		Car_idx++;
	}
	else if(menuid == 4)
	{
		AddMenuItem(vehiclemenu_boats, 0, name);
		VehicleMenuID[4][Boat_idx] = model;
 		VehicleForAdmins[4][Boat_idx] = AdminOnly;
		Boat_idx++;
	}
	else if(menuid == 5)
	{
		AddMenuItem(vehiclemenu_sports, 0, name);
		VehicleMenuID[5][Sports_idx] = model;
 		VehicleForAdmins[5][Sports_idx] = AdminOnly;
		Sports_idx++;
	}
	else if(menuid == 6)
	{
		AddMenuItem(vehiclemenu_low, 0, name);
		VehicleMenuID[6][Low_idx] = model;
 		VehicleForAdmins[6][Low_idx] = AdminOnly;
		Low_idx++;
	}
	else if(menuid == 7)
	{
		AddMenuItem(vehiclemenu_bikes, 0, name);
		VehicleMenuID[7][Bikes_idx] = model;
 		VehicleForAdmins[7][Bikes_idx] = AdminOnly;
		Bikes_idx++;
	}
	else if(menuid == 8)
	{
		AddMenuItem(vehiclemenu_other, 0, name);
		VehicleMenuID[8][Others_idx] = model;
 		VehicleForAdmins[8][Others_idx] = AdminOnly;
		Others_idx++;
	}
	return 1;
}

forward Intro(playerid);
public Intro(playerid)
{
	if(Player[playerid][inIntro] == false)
	    return 0;
	    
	if(Player[playerid][introIndex] == 10) {
		#if !defined SOUND_INTRO
		// only play this sound if the intro music isn't defined, NOT if the intro music is disabled, if its disabled they obviously don't want anything.
		PlayerPlaySound(playerid, 1142, 0, 0, 0);
		#else
		if(ConfigAudio[sndIntro] == true) {
	  			PlayAudioStreamForPlayerExEx(playerid, SOUND_INTRO);
		}
		#endif
	}

	Player[playerid][introOffset]++;
	Player[playerid][introIndex]++;

	HideRoundTextDrawsForPlayer(playerid);
	TextDrawHideForPlayer(playerid, MapNameTD);
	//TextDrawHideForPlayer(playerid, ScoreboardScore);
	TextDrawHideForPlayer(playerid, ScoreboardHome);
	TextDrawHideForPlayer(playerid, ScoreboardAway);
    HideLobbyTextDrawsForPlayer(playerid);
	TextDrawHideForPlayer(playerid, gamemsg_voting);
	TextDrawHideForPlayer(playerid, gamemsg_whowon);
	TextDrawHideForPlayer(playerid, TimerClock);
	TextDrawHideForPlayer(playerid, gamemsg_baseupdatehome);
	TextDrawHideForPlayer(playerid, gamemsg_baseupdateaway);
	TextDrawHideForPlayer(playerid, text_redflash);
	TextDrawHideForPlayer(playerid, gamemsg_cp);
	HideRequestClassTextDraws(playerid);

	if(GetPlayerInterior(playerid) != 0) SetPlayerInterior(playerid, 0);

	SetPlayerCameraPos(playerid, IntroPositions[Player[playerid][IntroPos]][0]+(Player[playerid][introIndex]-Player[playerid][introOffset]), IntroPositions[Player[playerid][IntroPos]][1]+(Player[playerid][introIndex]-1.0), IntroPositions[Player[playerid][IntroPos]][2]);
	SetPlayerCameraLookAt(playerid, IntroPositions[Player[playerid][IntroPos]][3], IntroPositions[Player[playerid][IntroPos]][4], IntroPositions[Player[playerid][IntroPos]][5]);

	new bool:fadeChange = false;
	if(Player[playerid][introIndex] > 449) // Finished intro
	{
	    if(Player[playerid][inCmdIntro]) {
	        TogglePlayerSpectating(playerid, false);
			KillTimer(Player[playerid][introTimer]);
			Player[playerid][inIntro] = false;
			Player[playerid][inCmdIntro] = false;
			Player[playerid][introIndex] = 0;
			Player[playerid][justConn] = false;
			Player[playerid][introOffset] = 0;
			TextDrawHideForPlayer(playerid, text_fadeblack[playerid]);
			TextDrawHideForPlayer(playerid, intro_gmname[playerid]);
			TextDrawHideForPlayer(playerid, skip_intro);
			#if SAMP_VERSION == 2
				StopAudioStreamForPlayerEx(playerid);
			#endif
			if(Player[playerid][SpawnType] != LOBBY_SPAWN)
			{
				SetPlayerInterior(playerid,floatround(Spawn[playerid][3]));
				SetPlayerPos(playerid,Spawn[playerid][0]+3-random(3),Spawn[playerid][1]+3-random(3),Spawn[playerid][2]+2);
				SetCameraBehindPlayer(playerid);
				SetTimerEx("FixCam", 300, false, "i", playerid);
				PlayerPlaySound(playerid, 1188, 0, 0, 0);
			}
			else
			{
				SetPlayerInterior(playerid,Config[LobbyInterior]);
				SetPlayerPos(playerid,Lobby[0]+10-random(10),Lobby[1]+10-random(10),Lobby[2]+2);
				SetCameraBehindPlayer(playerid);
				SetTimerEx("FixCam", 300, false, "i", playerid);
				PlayerPlaySound(playerid, 1188, 0, 0, 0);
			}
			TogglePlayerControllable(playerid,1);
			TextDrawShowForPlayer(playerid, MapNameTD);

			//TextDrawShowForPlayer(playerid, ScoreboardScore);
			TextDrawShowForPlayer(playerid, ScoreboardHome);
			TextDrawShowForPlayer(playerid, ScoreboardAway);
	    } else {
			Player[playerid][inIntro] = false;
			Player[playerid][introIndex] = 0;
			Player[playerid][justConn] = false;
			Player[playerid][justClass] = true;
			Player[playerid][introOffset] = 0;
			TextDrawHideForPlayer(playerid, text_fadeblack[playerid]);
			TextDrawHideForPlayer(playerid, intro_gmname[playerid]);
			TextDrawHideForPlayer(playerid, skip_intro);
			KillTimer(Player[playerid][introTimer]);
			//ForceClassSelection(playerid);
			//SendClientMessage(playerid, COLOR_RED, "SPEC OFF");
			TogglePlayerSpectating(playerid, 0);
			//OnPlayerRequestClass(playerid, Player[playerid][class_id]);
		}
		return 0;
	}

	if(Player[playerid][introIndex] > 70 && Player[playerid][introIndex] < 160) // Wait 70 loops (around 2 secs) before start fading
	{
		TextDrawBoxColor(text_fadeblack[playerid], ReturnColor(Player[playerid][introIndex]));
		fadeChange = true;
	}

	/*if(Player[playerid][introIndex] == 200)
		TimeTextForPlayer(playerid, text_rules, 7000);*/

	else if(Player[playerid][introIndex] >= 160)
	{
		new Number = Player[playerid][introIndex] % 5; // Get the rest of the division of this number by 5
		if(Number == 0) // if rest is 0, means the number is a 5 multiple, so 5 loops have passed since the last playwithstring, then lets do it again
			PlayWithString(playerid);
	}

	if(fadeChange) {
		TextDrawHideForPlayer(playerid, text_fadeblack[playerid]);
		TextDrawShowForPlayer(playerid, text_fadeblack[playerid]);
	}
	return 0;
}

forward classsel_cam(playerid);
public classsel_cam(playerid)
{
	new Float:Xc, Float:Yc, Float:Zc;
	if(Player[playerid][RequestingClass] == true && Player[playerid][pSpawned] == false && Player[playerid][inIntro] == false) // Request Class Codes
	{
 		SetPlayerPos(playerid, CamPositions[Player[playerid][Camera]][0],CamPositions[Player[playerid][Camera]][1],CamPositions[Player[playerid][Camera]][2]);
		SetPlayerInterior(playerid,floatround(CamPositions[Player[playerid][Camera]][7]));

   		SetPlayerFacingAngle(playerid, Player[playerid][RequestClassAngle]);
		Player[playerid][RequestClassAngle] -= 1.3;
		if(Player[playerid][RequestClassAngle] <= 0.0) Player[playerid][RequestClassAngle] = 360.0;

		Xc = floatadd(CamPositions[Player[playerid][Camera]][0], floatmul(4.0, floatsin(-Player[playerid][CamRotationAngle], degrees)));
		Yc = floatadd(CamPositions[Player[playerid][Camera]][1], floatmul(4.0, floatcos(-Player[playerid][CamRotationAngle], degrees)));
		Zc = floatadd(CamPositions[Player[playerid][Camera]][2], 1.0 + Player[playerid][CamZPosition]);

		SetPlayerCameraPos(playerid, Xc, Yc, Zc);
		SetPlayerCameraLookAt(playerid, CamPositions[Player[playerid][Camera]][0], CamPositions[Player[playerid][Camera]][1], floatadd(CamPositions[Player[playerid][Camera]][2], 1.0));

		Player[playerid][CamZPosition] += (Player[playerid][CamZPositionFall] ? -0.01 : 0.01);

		if(Player[playerid][CamRotationDirection] == true)
			Player[playerid][CamRotationAngle] -= 0.1;
		else
			Player[playerid][CamRotationAngle] += 0.1;

		if(Player[playerid][CamZPosition] > 1.0 || Player[playerid][CamZPosition] < -1.0)
		    Player[playerid][CamZPositionFall] = !Player[playerid][CamZPositionFall];

		if(Player[playerid][CamRotationAngle] <= 0.0 || Player[playerid][CamRotationAngle] >= 360.0)
			Player[playerid][CamRotationAngle] = 0.0;
	}
	else
	{
	    KillTimer(Player[playerid][csel_timer]);
	}
}



forward CamUpdate();
public CamUpdate()
{
	if(Round[LoadScreen] == false)
		return 0;

	new Float:Xc, Float:Yc, Float:X, Float:Y, Float:Z;
	for(new i = 0; i < MAX_PLAYERS; i++)
	{
	    if(IsPlayerConnected(i) && Player[i][setToPlay] && Player[i][pSpawned] == true)
	    {
	        if(Player[i][ControlledCamera] == false) //player didn't pressed any keys yet, so lets just keep rotating the camera.
	        {
				X = Checkpoint[0];
				Y = Checkpoint[1];
				Z = Checkpoint[2];

				Xc = floatadd(X, floatmul(Player[i][AltitudeIndex]+10, floatsin(-Player[i][LoadingScreenRotationAngle], degrees)));
				Yc = floatadd(Y, floatmul(Player[i][AltitudeIndex]+10, floatcos(-Player[i][LoadingScreenRotationAngle], degrees)));

				SetPlayerCameraPos(i, Xc, Yc, Player[i][Altitude]);
				SetPlayerCameraLookAt(i, X, Y, floatadd(Z, 1.0));

    	        Player[i][LoadingScreenRotationAngle] += ROTATE_DEGREES;
				if(Player[i][LoadingScreenRotationAngle] >= 360.0)
					Player[i][LoadingScreenRotationAngle] = 0.0;
	        }
			if(Player[i][ChosenWeapons] == true || Player[i][pTeam] == T_REF)
			{
			    TogglePlayerControllable(i, false); // make sure he doesn't move
				new keys, updown, leftright;
				GetPlayerKeys(i, keys, updown, leftright);
			    if(keys & KEY_SPRINT)
			    {
			        Player[i][ControlledCamera] = true;
			        Player[i][Altitude] = Checkpoint[2]+Player[i][AltitudeIndex];
					Xc = floatadd(Checkpoint[0], floatmul(Player[i][AltitudeIndex]+10, floatsin(-Player[i][LoadingScreenRotationAngle], degrees)));
					Yc = floatadd(Checkpoint[1], floatmul(Player[i][AltitudeIndex]+10, floatcos(-Player[i][LoadingScreenRotationAngle], degrees)));

					SetPlayerCameraPos(i, Xc, Yc, Player[i][Altitude]);
					SetPlayerCameraLookAt(i, Checkpoint[0], Checkpoint[1], Checkpoint[2]+1);

					Player[i][LoadingScreenRotationAngle] += 1.0;
				   	if(Player[i][LoadingScreenRotationAngle] <= 0.0 || Player[i][LoadingScreenRotationAngle] >= 360.0)
			   			Player[i][LoadingScreenRotationAngle] = 0.0;

		       	}
			    else if(keys & KEY_JUMP)
				{
				    Player[i][ControlledCamera] = true;
				    Player[i][Altitude] = Checkpoint[2]+Player[i][AltitudeIndex];

					Xc = floatadd(Checkpoint[0], floatmul(Player[i][AltitudeIndex]+10, floatsin(-Player[i][LoadingScreenRotationAngle], degrees)));
					Yc = floatadd(Checkpoint[1], floatmul(Player[i][AltitudeIndex]+10, floatcos(-Player[i][LoadingScreenRotationAngle], degrees)));

					SetPlayerCameraPos(i, Xc, Yc, Player[i][Altitude]);
					SetPlayerCameraLookAt(i, Checkpoint[0], Checkpoint[1], Checkpoint[2]+1);

					Player[i][LoadingScreenRotationAngle] -= 1.0;
				   	if(Player[i][LoadingScreenRotationAngle] <= 0.0 || Player[i][LoadingScreenRotationAngle] >= 360.0)
			   			Player[i][LoadingScreenRotationAngle] = 360.0;
				}
				else if(keys & 16)
			    {
			        Player[i][ControlledCamera] = true;
				    if(Player[i][Altitude] > Checkpoint[2])
					    Player[i][AltitudeIndex] -= 0.8;

			    	Player[i][Altitude] = Checkpoint[2]+Player[i][AltitudeIndex];

					Xc = floatadd(Checkpoint[0], floatmul(Player[i][AltitudeIndex]+10, floatsin(-Player[i][LoadingScreenRotationAngle], degrees)));
					Yc = floatadd(Checkpoint[1], floatmul(Player[i][AltitudeIndex]+10, floatcos(-Player[i][LoadingScreenRotationAngle], degrees)));

					SetPlayerCameraPos(i, Xc, Yc, Player[i][Altitude]);
					SetPlayerCameraLookAt(i, Checkpoint[0], Checkpoint[1], Checkpoint[2]+1);
				}
				else if(keys & KEY_CROUCH)
			    {
			        Player[i][ControlledCamera] = true;
				    if(Player[i][Altitude] < 200)
					    Player[i][AltitudeIndex] += 0.8;

			    	Player[i][Altitude] = Checkpoint[2]+Player[i][AltitudeIndex];

					Xc = floatadd(Checkpoint[0], floatmul(Player[i][AltitudeIndex]+10, floatsin(-Player[i][LoadingScreenRotationAngle], degrees)));
					Yc = floatadd(Checkpoint[1], floatmul(Player[i][AltitudeIndex]+10, floatcos(-Player[i][LoadingScreenRotationAngle], degrees)));

					SetPlayerCameraPos(i, Xc, Yc, Player[i][Altitude]);
					SetPlayerCameraLookAt(i, Checkpoint[0], Checkpoint[1], Checkpoint[2]+1);
				}
			}
		}
	}
	return SetTimer("CamUpdate",25,0);
}

forward PlayWithString(playerid);
public PlayWithString(playerid)
{
	if(Player[playerid][EndedIntro] == true) return 1;
	if(Player[playerid][introStopFlashing] == Player[playerid][introIndex])
 	    goto StopFlash;
	else if(Player[playerid][introStringIndex] >= strlen(Server[IntroString]))
	    goto Flash;

	Player[playerid][introFlashing] = !Player[playerid][introFlashing];

	if(Server[IntroString][Player[playerid][introStringIndex]] == ' ')
	{
	    PlayerPlaySound(playerid, 1190, 0, 0, 0);
		Player[playerid][introStringIndex] ++;
		format(Player[playerid][TempIntroString],512,"%s %c", Player[playerid][TempIntroString], Server[IntroString][Player[playerid][introStringIndex]]);
	}
	else
	{
	    PlayerPlaySound(playerid, 1190, 0, 0, 0);
	    format(Player[playerid][TempIntroString],512,"%s%c", Player[playerid][TempIntroString], Server[IntroString][Player[playerid][introStringIndex]]);
	}

	new dont = 0;
	if(dont == 2)
	{
	    Flash:
		if(Player[playerid][FirstIntroFlash] == false)
		{
		    Player[playerid][FirstIntroFlash] = true;
		    Player[playerid][introStopFlashing] = Player[playerid][introIndex];
			Player[playerid][introStopFlashing] += 100; // wait 2,5 seconds before stop flashing and showing sub string;
		}

	    format(Player[playerid][TempIntroString], 256, " ");
	    new idx = 0;
	    if(Player[playerid][introFlashing] == true)
    	{
			idx = 1;
			Player[playerid][introFlashing] = false;
		}
		else
		{
			Player[playerid][introFlashing] = true;
		}

	    for(new i = 0; i < strlen(Server[IntroString]); i ++)
	    {
	        if(Server[IntroString][i] == ' ')
	        {
		        format(Player[playerid][TempIntroString],512,"%s%c", Player[playerid][TempIntroString], Server[IntroString][i]);
	        }
	        else
	        {
			    if(idx == 1)
				{
			    	format(Player[playerid][TempIntroString],512,"%s~p~%c", Player[playerid][TempIntroString], Server[IntroString][i]);
				    idx = 0;
				}
				else if(idx == 0)
				{
				    format(Player[playerid][TempIntroString],512,"%s~w~%c", Player[playerid][TempIntroString], Server[IntroString][i]);
				    idx = 1;
				}
			}
		}
	}
	if(dont == 3)
	{
		StopFlash:
		format(Player[playerid][TempIntroString],512," %s ~n~~b~~h~%s", Server[IntroString], Server[IntroSubString]);
		#if !defined SOUND_INTRO
		PlayerPlaySound(playerid, 1097, 0, 0, 0);
		#endif
		Player[playerid][EndedIntro] = true;
	}


	TextDrawSetString(intro_gmname[playerid], Player[playerid][TempIntroString]);
	Player[playerid][introStringIndex] ++;
	return 0;
}


forward SpecingBaseUpdate(playerid);
public SpecingBaseUpdate(playerid) // SHITS PRO <
{

	if(Player[playerid][SpecingBase] == false)
	    return 0;

	new Float:Xc, Float:Yc;

	if(Player[playerid][SpecingBase] == true)
	{
	    TogglePlayerControllable(playerid, false); // make sure he doesn't move
		new keys, updown, leftright;
		GetPlayerKeys(playerid, keys, updown, leftright);
	    if(keys & KEY_SPRINT)
	    {
	        Player[playerid][Altitude] = BaseVariables[Round[Current]][BaseCheckpoint][2]+Player[playerid][AltitudeIndex];
			Xc = floatadd(BaseVariables[Round[Current]][BaseCheckpoint][0], floatmul(Player[playerid][AltitudeIndex]+10, floatsin(-Player[playerid][LoadingScreenRotationAngle], degrees)));
			Yc = floatadd(BaseVariables[Round[Current]][BaseCheckpoint][1], floatmul(Player[playerid][AltitudeIndex]+10, floatcos(-Player[playerid][LoadingScreenRotationAngle], degrees)));

			SetPlayerCameraPos(playerid, Xc, Yc, Player[playerid][Altitude]);
			SetPlayerCameraLookAt(playerid, BaseVariables[Round[Current]][BaseCheckpoint][0], BaseVariables[Round[Current]][BaseCheckpoint][1], BaseVariables[Round[Current]][BaseCheckpoint][2]);

			Player[playerid][LoadingScreenRotationAngle] += 0.8;
		   	if(Player[playerid][LoadingScreenRotationAngle] <= 0.0 || Player[playerid][LoadingScreenRotationAngle] >= 360.0)
	   			Player[playerid][LoadingScreenRotationAngle] = 0.0;

       	}
	    else if(keys & KEY_JUMP)
		{
		    Player[playerid][Altitude] = BaseVariables[Round[Current]][BaseCheckpoint][2]+Player[playerid][AltitudeIndex];

			Xc = floatadd(BaseVariables[Round[Current]][BaseCheckpoint][0], floatmul(Player[playerid][AltitudeIndex]+10, floatsin(-Player[playerid][LoadingScreenRotationAngle], degrees)));
			Yc = floatadd(BaseVariables[Round[Current]][BaseCheckpoint][1], floatmul(Player[playerid][AltitudeIndex]+10, floatcos(-Player[playerid][LoadingScreenRotationAngle], degrees)));

			SetPlayerCameraPos(playerid, Xc, Yc, Player[playerid][Altitude]);
			SetPlayerCameraLookAt(playerid, BaseVariables[Round[Current]][BaseCheckpoint][0], BaseVariables[Round[Current]][BaseCheckpoint][1], BaseVariables[Round[Current]][BaseCheckpoint][2]);

			Player[playerid][LoadingScreenRotationAngle] -= 0.8;
		   	if(Player[playerid][LoadingScreenRotationAngle] <= 0.0 || Player[playerid][LoadingScreenRotationAngle] >= 360.0)
	   			Player[playerid][LoadingScreenRotationAngle] = 360.0;
		}
		else if(keys & 16)
	    {
		    if(Player[playerid][Altitude] > BaseVariables[Round[Current]][BaseCheckpoint][2])
			    Player[playerid][AltitudeIndex] -= 0.5;

	    	Player[playerid][Altitude] = BaseVariables[Round[Current]][BaseCheckpoint][2]+Player[playerid][AltitudeIndex];

			Xc = floatadd(BaseVariables[Round[Current]][BaseCheckpoint][0], floatmul(Player[playerid][AltitudeIndex]+10, floatsin(-Player[playerid][LoadingScreenRotationAngle], degrees)));
			Yc = floatadd(BaseVariables[Round[Current]][BaseCheckpoint][1], floatmul(Player[playerid][AltitudeIndex]+10, floatcos(-Player[playerid][LoadingScreenRotationAngle], degrees)));

			SetPlayerCameraPos(playerid, Xc, Yc, Player[playerid][Altitude]);
			SetPlayerCameraLookAt(playerid, BaseVariables[Round[Current]][BaseCheckpoint][0], BaseVariables[Round[Current]][BaseCheckpoint][1], BaseVariables[Round[Current]][BaseCheckpoint][2]);
		}
		else if(keys & KEY_CROUCH)
	    {
		    if(Player[playerid][Altitude] < 200)
			    Player[playerid][AltitudeIndex] += 0.5;

	    	Player[playerid][Altitude] = BaseVariables[Round[Current]][BaseCheckpoint][2]+Player[playerid][AltitudeIndex];

			Xc = floatadd(BaseVariables[Round[Current]][BaseCheckpoint][0], floatmul(Player[playerid][AltitudeIndex]+10, floatsin(-Player[playerid][LoadingScreenRotationAngle], degrees)));
			Yc = floatadd(BaseVariables[Round[Current]][BaseCheckpoint][1], floatmul(Player[playerid][AltitudeIndex]+10, floatcos(-Player[playerid][LoadingScreenRotationAngle], degrees)));

			SetPlayerCameraPos(playerid, Xc, Yc, Player[playerid][Altitude]);
			SetPlayerCameraLookAt(playerid, BaseVariables[Round[Current]][BaseCheckpoint][0], BaseVariables[Round[Current]][BaseCheckpoint][1], BaseVariables[Round[Current]][BaseCheckpoint][2]);
		}
	}
	return SetTimerEx("SpecingBaseUpdate",25,false,"i", playerid);
}

/*>-=-=-=-=-=-=-=-=-=-=-=-=-=-<//
	  	   Log System
//>-=-=-=-=-=-=-=-=-=-=-=-=-=-<*/
stock WriteLog(log[], string[]) // WriteLog function by ILuSioN with minor edits
{
	new File:handler;
	new buffer[512];
	new tmp[128];
	new bool:found;
	static wlday, wlmonth, wlyear;
	new day, month, year, hour, minute, second, weekday;
	new fname[128];

	getdate(year, month, day);
	gettime(hour, minute, second);
	weekday = getweekday(year, month, day) - 1;

	format(fname, 128, "combinations/logs/%s.log", log);

	if(!fexist(fname))
	{
		handler = fopen(fname, io_write);
		printf("Deadly Combinations Log %s created! (%s)", log, fname);

		format(buffer, 512, "@ Deadly Combinations - %s log @\r\n\r\n [%s, %s %d%s, %d] \r\n\r\n[%02d:%02d:%02d] %s\r\n", log, WeekdayName[weekday], MonthName[month-1], day, GetOrdinalNumber(day), year, hour, minute, second, string);
		fwrite(handler, buffer);

		fclose(handler);

		wlyear = year, wlmonth = month, wlday = day;
		return true;
	}
	else
	{
	    if(wlyear == year && wlmonth == month && wlday == day)
	    {
	        handler = fopen(fname, io_append);

	        format(buffer, 512, "[%02d:%02d:%02d] %s\r\n", hour, minute, second, string);
			fwrite(handler, buffer);

			fclose(handler);

			return true;
		}
		else
		{
		    handler = fopen(fname, io_read);

		    format(tmp, 128, "%s, %s %d%s, %d", WeekdayName[weekday], MonthName[month-1], day, GetOrdinalNumber(day), year);

		    while(fread(handler, buffer))
		    {
		        if(strfind(buffer, tmp) >= 0)
		        {
		            found = true;
		            break;
				}
			}

			fclose(handler);
			handler = fopen(fname, io_append);

			if(found)
			{
			    format(buffer, 512, "[%02d:%02d:%02d] %s\r\n", hour, minute, second, string);
				fwrite(handler, buffer);

				fclose(handler);

				wlyear = year, wlmonth = month, wlday = day;

				return true;
			}
			else
			{
			    format(buffer, 512, "\r\n [%s, %s %d%s, %d] \r\n[%02d:%02d:%02d] %s\r\n", WeekdayName[weekday], MonthName[month-1], day, GetOrdinalNumber(day), year, hour, minute, second, string);
				fwrite(handler, buffer);

				fclose(handler);

				wlyear = year, wlmonth = month, wlday = day;
				return true;
			}
		}
	}
}

stock GetOrdinalNumber(number)
{
	new ordinal[4];
	if(number == 1)
	    ordinal = "st";
	else if(number == 2)
		ordinal = "nd";
	else if(number == 3)
		ordinal = "rd";
	else
	    ordinal = "th";

	return ordinal;
}

stock getweekday(year, month, day)
{
	new dom[12] = {31,28,31,30,31,30,31,31,30,31,30,31};
	new days;
	new week;

	if((!(year % 4) && (year % 100)) || !(year % 400)) dom[1] = 29;

	for(new i = 1; i < month; i++)
	    days += dom[i-1];

	days += day;
	week = (days + year + ((year - 1) / 400) + ((year - 1) / 4)-((year - 1) / 100)) % 7;
	if(!week) week = 7;

	return week;
}


stock SpawnTeamInCircle(teamid, Float:X_Center, Float: Y_Center, Float:Z_Center)
{
	new Float:Xc, Float:Yc, Interval, Members;
    for(new i = 0; i <= Server[HighestID]; i++)
	{
		if(IsPlayerConnected(i) && Player[i][pTeam] == teamid && Player[i][setToPlay] == true && Player[i][pSpawned] == true)
		{
		    Members ++;
		}
	}
	if(Members > 0)
	{
		Interval = floatround(360/Members); // get interval in degrees btw 1 member and another
		new Index;
		for(new i = 0; i <= Server[HighestID]; i ++)
		{
		    if(IsPlayerConnected(i))
		    {
		        if(Player[i][pTeam] == teamid && Player[i][setToPlay] == true && Player[i][pSpawned] == true)
		        {
			    	Xc = floatadd(X_Center, floatmul(3, floatsin(-Index, degrees)));
					Yc = floatadd(Y_Center, floatmul(3, floatcos(-Index, degrees)));
					SetPlayerPos(i, Xc, Yc, Z_Center+2);
					SetTimerEx("SetPlayerLookAt",1000,false,"iff", i, X_Center, Y_Center);
					Index += Interval;
				}
			}
		}
	}
	return 1;
}

stock SpawnAllPlayersInCircle(Float:X_Center, Float:Y_Center, Float:Z_Center)
{
	new Float:Xc, Float:Yc, Interval, Members;
    for(new i = 0; i <= Server[HighestID]; i++)
	{
		if(IsPlayerConnected(i) && Player[i][setToPlay] == true && Player[i][pSpawned] == true)
		{
		    Members ++;
		}
	}
	if(Members > 0)
	{
		Interval = floatround(360/Members); // get interval in degrees btw 1 member and another
		new Index;
		for(new i = 0; i <= Server[HighestID]; i ++)
		{
		    if(IsPlayerConnected(i))
		    {
		        if(Player[i][setToPlay] == true && Player[i][pSpawned] == true)
		        {
			    	Xc = floatadd(X_Center, floatmul(4, floatsin(-Index, degrees)));
					Yc = floatadd(Y_Center, floatmul(4, floatcos(-Index, degrees)));
					SetPlayerPos(i, Xc, Yc, Z_Center);
					SetTimerEx("SetPlayerLookAt",1000,false,"iff", i, X_Center, Y_Center);
					Index += Interval;
				}
			}
		}
	}
}

forward SetPlayerLookAt(playerid, Float:x, Float:y);
public SetPlayerLookAt(playerid, Float:x, Float:y)
{
	new Float:Px, Float:Py, Float: Pa;
	GetPlayerPos(playerid, Px, Py, Pa);
	Pa = floatabs(atan((y-Py)/(x-Px)));
	if(x <= Px && y >= Py) Pa = floatsub(180, Pa);
	else if(x < Px && y < Py) Pa = floatadd(Pa, 180);
	else if(x >= Px && y <= Py) Pa = floatsub(360.0, Pa);
	Pa = floatsub(Pa, 90.0);
	if(Pa >= 360.0) Pa = floatsub(Pa, 360.0);
	SetPlayerFacingAngle(playerid, Pa);
}



forward ClearPlayerPickup(playerid, pickupid);
public ClearPlayerPickup(playerid, pickupid)
{
	if(Player[playerid][InPickup] == pickupid)
        Player[playerid][InPickup] = -1;
}

DestroyPickups()
{
    for(new i = 0; i < MAX_PICKUPS2; i++)
	{
	    DestroyPickupEx(i);
	}
}

// weapon system.
LoadWeapons()
{
	#if DATA_SYSTEM == 1
	
		if(!dini_Exists(Weapon_Config))
		{
		    printf("Weapon config file not found. A new one has been created, be sure to setup it before playing");
			dini_Create(Weapon_Config);
		 	for(new i = 0; i < MAX_WEAPONS; i ++)
			{
				if(IsValidWeaponID(i))
				{
					new wname[24];
					GetWeaponName(i,wname,24);
					if(i == 18) wname = "Molotov"; else if(i == 44) wname = "Nightvision G."; else if(i == 45) wname = "Infrared Vision";
					dini_IntSet(Weapon_Config, wnames_encode(wname), 0);
	    			WeaponsMenus[wAmmo][i] = dini_IntSet(Weapon_Config,wnames_ammo_encode(wname), 1337);
				}
			}
			return 1;
		}
		for(new i = 0; i < MAX_WEAPONS; i ++)
		{
			if(IsValidWeaponID(i))
			{
				new wname[24];
				GetWeaponName(i,wname,24);
				if(i == 18) wname = "Molotov"; else if(i == 44) wname = "Nightvision G."; else if(i == 45) wname = "Infrared Vision";
				WeaponsMenus[Option][i] = dini_Int(Weapon_Config, wnames_encode(wname));
				WeaponsMenus[wAmmo][i] = dini_Int(Weapon_Config,wnames_ammo_encode(wname));


			}
		}

		for(new i = 0; i < 47; i ++)
		{
			if(IsValidWeaponID(i))
			{
			    new wepid_str[40];
			    format(wepid_str, 40, "%d", i);
				WeaponLimit[i][limit] = dini_Int(WeaponLimits_Config, wepid_str);
				WeaponLimit[i][home_used] = 0;
				WeaponLimit[i][away_used] = 0;

				if (IsValidWepSkillID(i)) {
					WeaponSkill[i] = dini_Int(WeaponSkill_Config, wepid_str);
				}
			}
		}

	#elseif DATA_SYSTEM == 2

   		new query[200];
		format(query, sizeof(query), "SELECT * FROM dc_weapon_classes ORDER BY weap_id DESC");
		mysql_query(query);
		Server[SQLQueriesExecuted]++;
		mysql_store_result();
		new templine[200];
		while(mysql_fetch_row_format(templine, "|"))
		{
			new idx;
			new info[256];

			info = mysql_strtok(templine, idx, "|");
			new wepid = strval(info);
			info = mysql_strtok(templine, idx, "|");
			new wepammo = strval(info);
			info = mysql_strtok(templine, idx, "|");
			new wepclass = strval(info);
			WeaponsMenus[Option][wepid] = wepclass;
			WeaponsMenus[wAmmo][wepid] = wepammo;
		}
		format(query, sizeof(query), "SELECT * FROM dc_weapon_skill ORDER BY weaponid DESC");
		mysql_query(query);
		Server[SQLQueriesExecuted]++;
		mysql_store_result();
		while(mysql_fetch_row_format(templine, "|"))
		{
			new idx;
			new info[256];

			info = mysql_strtok(templine, idx, "|");
			new wepid = strval(info);
			info = mysql_strtok(templine, idx, "|");
			new wepskill = strval(info);
			WeaponSkill[wepid] = wepskill;
		}
		format(query, sizeof(query), "SELECT * FROM dc_weapon_limits ORDER BY weaponid DESC");
		mysql_query(query);
		Server[SQLQueriesExecuted]++;
		mysql_store_result();
		while(mysql_fetch_row_format(templine, "|"))
		{
			new idx;
			new info[256];

			info = mysql_strtok(templine, idx, "|");
			new wepid = strval(info);
			info = mysql_strtok(templine, idx, "|");
			new weplimit = strval(info);
			WeaponSkill[wepid] = weplimit;
		}

	#endif

	UpdateTextDraws();
	return printf("  -> Weapons Config Loaded", 175, 174);
}

UpdateTextDraws()
{
	new txt_1[256], txt_2[256], txt_3[256], txt_4[256], txt_5[256], wep_msg[256];
	txt_1 = "Primary Menu";
	txt_2 = "Secondary Menu";
	txt_3 = "Terciary Menu";
	txt_4 = "Special Menu";
	txt_5 = "Given Auto";

	for(new i = 1; i < MAX_WEAPONS; i ++)
	{
		if(IsValidWeaponID(i))
		{
			new wname[24];
			GetWeaponName(i,wname,24);
			if(i == 18) wname = "Molotov"; else if(i == 44) wname = "Nightvision G."; else if(i == 45) wname = "Infrared Vision";

			if(WeaponsMenus[Option][i] == 1)
			{
			    format(txt_1, 256,"%s~n~~w~%s (x%d) (%d)", txt_1, wname, WeaponsMenus[wAmmo][i], WeaponLimit[i][limit]);
			}
			else if(WeaponsMenus[Option][i] == 2)
			{
			    format(txt_2, 256,"%s~n~~w~%s (x%d) (%d)", txt_2, wname, WeaponsMenus[wAmmo][i], WeaponLimit[i][limit]);
			}
			else if(WeaponsMenus[Option][i] == 3)
			{
			    format(txt_3, 256,"%s~n~~w~%s (x%d) (%d)", txt_3, wname, WeaponsMenus[wAmmo][i], WeaponLimit[i][limit]);
			}
			else if(WeaponsMenus[Option][i] == 4)
			{
			    format(txt_4, 256,"%s~n~~w~%s (x%d) (%d)", txt_4, wname, WeaponsMenus[wAmmo][i], WeaponLimit[i][limit]);
			}
			else if(WeaponsMenus[Option][i] == 5)
			{
			    format(txt_5, 256,"%s~n~~w~%s (x%d) (%d)", txt_5, wname, WeaponsMenus[wAmmo][i], WeaponLimit[i][limit]);
			    format(wep_msg, 256, "%s~n~~w~- %s (x%d)", wep_msg, wname, WeaponsMenus[wAmmo][i]);
			}
		}
	}

	if(strlen(txt_1) < strlen("Primary Menu")+3)
	{
		txt_1 = "Primary Menu~n~~r~~h~None";
	}
	if(strlen(txt_2) < strlen("Secondary Menu")+3)
	{
		txt_2 = "Secondary Menu~n~~r~~h~None";
	}
	if(strlen(txt_3) < strlen("Terciary Menu")+3)
	{
		txt_3 = "Terciary Menu~n~~r~~h~None";
	}
	if(strlen(txt_4) < strlen("Special Menu")+3)
	{
		txt_4 = "Special Menu~n~~r~~h~None";
	}
	if(strlen(txt_5) < strlen("Given Auto")+3)
	{
		txt_5 = "Given Auto~n~~r~~h~None";
		wep_msg =  "Given Auto~n~~r~~h~None";
	}

	TextDrawSetString(GunList_1, txt_1);
	TextDrawSetString(GunList_2, txt_2);
	TextDrawSetString(GunList_3, txt_3);
	TextDrawSetString(GunList_4, txt_4);
	TextDrawSetString(GunList_5, txt_5);
	TextDrawSetString(autowep5, wep_msg);
}

stock IsValidWeaponID(id)
{
    if(id==19||id==20||id==21||id<=0||id>46)
             return false;
    else
             return true;
}

stock IsValidWepSkillID(id)
{
    if(id > 21 && id < 32)
             return true;
	else if(id == 34)
             return true;
    else
             return false;
}

// ==== > Codes related to expansion packs < ====
forward DeadlyCombinationsAuth();
public DeadlyCombinationsAuth()
{
	return true;
}

forward AnyRoundStarted();
public AnyRoundStarted()
{
	if(Round[Current] != -1)
		return true;
	else
	    return false;
}

forward AnotherRoundStarted();
public AnotherRoundStarted()
{
	Server[EPRoundStarted] = true;
}


forward AnotherRoundEnded();
public AnotherRoundEnded()
{
	Server[EPRoundStarted] = false;
}

stock PlayerIp(playerid)
{
   	new ip[16];
	GetPlayerIp(playerid, ip, sizeof(ip));
	return ip;
}

forward DestroyObjectEx(objectid);
public DestroyObjectEx(objectid)
{
    DestroyObject(objectid);
    return 1;
}

forward FixPlayersTeams();
public FixPlayersTeams()
{
	if (Round[Current] != -1) {
		for(new x=0; x<Server[HighestID]+1; x++)
		{
		    if (IsPlayerConnected(x)) {
		    	if (Server[TkMode]) {
					SetPlayerTeamEx(x, Player[x][pTeam]);
				}
			}
		}
	}
    return 1;
}

forward GivePlayerCselWep(playerid);
public GivePlayerCselWep(playerid)
{
	new rando = random(sizeof(ValidCselWeapons));
	if(ValidCselWeapons[rando][0] != 0) GivePlayerWeaponEx(playerid, ValidCselWeapons[rando][0], 100);
}

forward DeleteCarNameLabel(vehicleid);
public DeleteCarNameLabel(vehicleid)
{
	Update3DTextLabelText(VehicleInfo[vehicleid][NameLabel], COLOR_RED, " ");
}

forward FixCam(playerid);
public FixCam(playerid)
{
	SetCameraBehindPlayer(playerid);
}

forward HideDamage(playerid, hits);
public HideDamage(playerid, hits)
{
	if (Player[playerid][pHits] == hits) {
		TextDrawHideForPlayer(playerid,DamageTexts[playerid]);
		//Update3DTextLabelText(Player[playerid][DmgLabel], COLOR_WHITE, "\n");
	}
}

forward ResetPlayerHits(playerid, hits);
public ResetPlayerHits(playerid, hits)
{
	if(Player[playerid][pHits] == hits)
    Player[playerid][pHits] = 0;
}

stock OnPlayerArmourChange(playerid, Float:newarmour)
{
	new string[256];
	format(string,256,"%s ~n~~n~~y~Armor: %d ~n~~r~Health: %d", PlayerName(playerid), floatround(newarmour),floatround(Player[playerid][pHealth]));
	TextDrawSetString(Player[playerid][SpecText], string);
	TextDrawAlignment(Player[playerid][SpecText], 2);
	if (Player[playerid][pArmour] > newarmour)
	{
		new object;
		object = CreateObject(1242, 0, 0, 0, 0, 0, 0);
		AttachObjectToPlayer(object, playerid, 0, 0, 1.50, 0, 0, 0);
		SetTimerEx("DestroyObjectEx", 200, false, "i", object);

 		if(Server[UAVEnabled])
 		{
			Player[playerid][Visible] = true;
	 		SetTimerEx("TurnInvisible",500,false,"i", playerid);
			for (new x = 0; x <= Server[HighestID]; x++)
			{
				if(IsPlayerConnected(x))
				{
				    if(Player[x][pPlaying] == true)
				    {
					    SetPlayerMarkerForPlayer(x,playerid, ReturnColorFromDistance(playerid, GetDistanceBetweenPlayers(x, playerid)));
					}
				}
			}
		}
	}
	return 1;
}


stock OnPlayerHealthChange(playerid, Float:newhealth)
{
	new string[256];
	format(string,256,"%s ~n~~n~~y~Armor: %d ~n~~r~Health: %d", PlayerName(playerid), floatround(Player[playerid][pArmour]), floatround(newhealth));
	TextDrawSetString(Player[playerid][SpecText], string);
	TextDrawAlignment(Player[playerid][SpecText], 2);

	if (Player[playerid][pHealth] > newhealth)
	{
		new object;
		object = CreateObject(1240, 0, 0, 0, 0, 0, 0);
		AttachObjectToPlayer(object, playerid, 0, 0, 1.35, 0, 0, 0);
		SetTimerEx("DestroyObjectEx", 200, false, "i", object);

 		if(Server[UAVEnabled])
 		{
			Player[playerid][Visible] = true;
 			SetTimerEx("TurnInvisible",500,false,"i", playerid);

			for (new x = 0; x <= Server[HighestID]; x++)
			{
				if(IsPlayerConnected(x))
				{
				    if(Player[x][pPlaying] == true)
				    {
					    SetPlayerMarkerForPlayer(x,playerid, ReturnColorFromDistance(playerid, GetDistanceBetweenPlayers(x, playerid)));
					}
				}
			}
		}
	}
	return 1;
}

stock OnPlayerSurfingVehChange(playerid, oldvehid, newvehid)
{
	Player[playerid][SurfingVehicleID] = newvehid;
	if (newvehid != INVALID_VEHICLE_ID) {
		HideVehicleHud(playerid, oldvehid);
		ShowVehicleHud(playerid, newvehid);
		#if SAMP_VERSION == 2
			PlayAudioStreamForPlayerExEx(playerid, SOUND_VEHICLERADIO);
  		#endif
	} else {
	    HideVehicleHud(playerid, oldvehid);
		#if SAMP_VERSION == 2
	    	StopAudioStreamForPlayerEx(playerid);
  		#endif
	}
	return 1;
}

AuthByIP(playerip[], dbpass[])
{
	if (isStringSame(playerip, dbpass, 30)) {
		return true;
	} else {
		return false;
	}
}


stock SendClientMessageEx(playerid, COLOR, string[])
{
	SendClientMessage(playerid, COLOR, string);
    return 1;
}

stock SendClientMessageToAllEx(COLOR, string[])
{
	SendClientMessageToAll(COLOR, string);
	return 1;
}

#pragma unused AuthByIP

#if DATA_SYSTEM == 2
/*
stock strtok(const string[], &index,seperator=' ')
{
	new length = strlen(string);
	new offset = index;
	new result[256];
	while ((index < length) && (string[index] != seperator) && ((index - offset) < (sizeof(result) - 1)))
	{
		result[index - offset] = string[index];
		index++;
	}

	result[index - offset] = EOS;
	if ((index < length) && (string[index] == seperator))
	{
		index++;
	}
	return result;
}

stock HexToInt(string[]) {
  if (string[0]==0) return 0;
  new i;
  new cur=1;
  new res=0;
  for (i=strlen(string);i>0;i--) {
    if (string[i-1]<58) res=res+cur*(string[i-1]-48); else res=res+cur*(string[i-1]-65+10);
    cur=cur*16;
  }
  return res;
}

 * Originally created by mabako, tuned by DracoBlue

stock mktime(hour,minute,second,day,month,year) {
	new timestamp2;

	timestamp2 = second + (minute * 60) + (hour * 3600);

	new days_of_month[12];

	if ( ((year % 4 == 0) && (year % 100 != 0)) || (year % 400 == 0) ) {
			days_of_month = {31,29,31,30,31,30,31,31,30,31,30,31}; // Schaltjahr
		} else {
			days_of_month = {31,28,31,30,31,30,31,31,30,31,30,31}; // keins
		}
	new days_this_year = 0;
	days_this_year = day;
	if(month > 1) { // No January Calculation, because its always the 0 past months
		for(new i=0; i<month-1;i++) {
			days_this_year += days_of_month[i];
		}
	}
	timestamp2 += days_this_year * 86400;

	for(new j=1970;j<year;j++) {
		timestamp2 += 31536000;
		if ( ((year % 4 == 0) && (year % 100 != 0)) || (year % 400 == 0) )  timestamp2 += 86400; // Schaltjahr + 1 Tag
	}

	return timestamp2;
}

stock set(dest[],source[]) {
	new count = strlen(source);
	new i=0;
	for (i=0;i<count;i++) {
		dest[i]=source[i];
	}
	dest[count]=0;
}

stock strreplace(trg[],newstr[],src[]) {
    new f=0;
    new s1[256];
    new tmp[256];
    format(s1,sizeof(s1),"%s",src);
    f = strfind(s1,trg);
    tmp[0]=0;
    while (f>=0) {
        strcat(tmp,ret_memcpy(s1, 0, f));
        strcat(tmp,newstr);
        format(s1,sizeof(s1),"%s",ret_memcpy(s1, f+strlen(trg), strlen(s1)-f));
        f = strfind(s1,trg);
    }
    strcat(tmp,s1);
    return tmp;
}

ret_memcpy(source[],index=0,numbytes) {
	new tmp[256];
	new i=0;
	tmp[0]=0;
	if (index>=strlen(source)) return tmp;
	if (numbytes+index>=strlen(source)) numbytes=strlen(source)-index;
	if (numbytes<=0) return tmp;
	for (i=index;i<numbytes+index;i++) {
		tmp[i-index]=source[i];
		if (source[i]==0) return tmp;
	}
	tmp[numbytes]=0;
	return tmp;
}

new PRIVATE_Last_Money[MAX_PLAYERS];

stock SetPlayerMoney(playerid,howmuch) {
  PRIVATE_Last_Money[playerid]=howmuch;
  GivePlayerMoney(playerid,howmuch-GetPlayerMoney(playerid));
}

*/
#endif

// Nickname/Pass encode/decode functions by DracoBlue
// Used from DUDB
stock nick_encode(nickname[]) {
  new tmp[256];
  set(tmp,nickname);
  tmp=strreplace("_","_00",tmp);
  tmp=strreplace(";","_01",tmp);
  tmp=strreplace("!","_02",tmp);
  tmp=strreplace("/","_03",tmp);
  tmp=strreplace("\\","_04",tmp);
  tmp=strreplace("[","_05",tmp);
  tmp=strreplace("]","_06",tmp);
  tmp=strreplace("?","_07",tmp);
  tmp=strreplace(".","_08",tmp);
  tmp=strreplace("*","_09",tmp);
  tmp=strreplace("<","_10",tmp);
  tmp=strreplace(">","_11",tmp);
  tmp=strreplace("{","_12",tmp);
  tmp=strreplace("}","_13",tmp);
  tmp=strreplace(" ","_14",tmp);
  tmp=strreplace("\"","_15",tmp);
  tmp=strreplace(":","_16",tmp);
  tmp=strreplace("|","_17",tmp);
  tmp=strreplace("=","_18",tmp);
  return tmp;
}

stock nick_decode(nickname[]) {
  new tmp[256];
  set(tmp,nickname);
  tmp=strreplace("_01",";",tmp);
  tmp=strreplace("_02","!",tmp);
  tmp=strreplace("_03","/",tmp);
  tmp=strreplace("_04","\\",tmp);
  tmp=strreplace("_05","[",tmp);
  tmp=strreplace("_06","]",tmp);
  tmp=strreplace("_07","?",tmp);
  tmp=strreplace("_08",".",tmp);
  tmp=strreplace("_09","*",tmp);
  tmp=strreplace("_10","<",tmp);
  tmp=strreplace("_11",">",tmp);
  tmp=strreplace("_12","{",tmp);
  tmp=strreplace("_13","}",tmp);
  tmp=strreplace("_14"," ",tmp);
  tmp=strreplace("_15","\"",tmp);
  tmp=strreplace("_16",":",tmp);
  tmp=strreplace("_17","|",tmp);
  tmp=strreplace("_18","=",tmp);
  tmp=strreplace("_00","_",tmp);
  return tmp;
}

stock pass_encode(buf[]) {
	new length=strlen(buf);
    new s1 = 1;
    new s2 = 0;
    new n;
    for (n=0; n<length; n++)
    {
       s1 = (s1 + buf[n]) % 65521;
       s2 = (s2 + s1)     % 65521;
    }
    return (s2 << 16) + s1;
}

forward Text:TextDrawCreateEx(Float:x, Float:y, text[]);
public Text:TextDrawCreateEx(Float:x, Float:y, text[]) {
    Config[textdraws]++;
    new Text:text_draw = TextDrawCreate(x, y, text);
	return text_draw;
}

forward SetPlayerWorldBoundsEx(playerid, Float:xmax, Float:xmin, Float:ymax, Float:ymin);
public SetPlayerWorldBoundsEx(playerid, Float:xmax, Float:xmin, Float:ymax, Float:ymin) {
	Player[playerid][bounds_xmax] = xmax;
	Player[playerid][bounds_xmin] = xmin;
	Player[playerid][bounds_ymax] = ymax;
	Player[playerid][bounds_ymin] = ymin;
	if (xmax != 9999.9) {
	    Player[playerid][boundsSet] = true;
	} else {
	    Player[playerid][boundsSet] = false;
	}
	return SetPlayerWorldBounds(playerid, xmax, xmin, ymax, ymin);
}

forward Float:GetPlayerSpeed(playerid);
Float:GetPlayerSpeed(playerid)
{
	new Float:Vx,Float:Vy,Float:Vz,Float:rtn;
	if(IsPlayerInAnyVehicle(playerid))
	{
		GetVehicleVelocity(GetPlayerVehicleID(playerid),Vx,Vy,Vz);
		rtn = floatsqroot(floatpower(floatabs(Vx),2)+floatpower(floatabs(Vy),2)+floatpower(floatabs(Vz),2));
	}
	else
	{
		GetPlayerVelocity(playerid,Vx,Vy,Vz);
		rtn = floatsqroot(floatpower(floatabs(Vx),2)+floatpower(floatabs(Vy),2)+floatpower(floatabs(Vz),2));
	}
	return floatmul(floatmul(rtn, 100), 1.61);
}

#if DATA_SYSTEM == 2

#pragma unused GetSqlUserDataInt
#pragma unused GetSqlUserDataStr
#pragma unused mysql_strtok
#pragma unused SqlAuth
#pragma unused SqlAuthByIP
#pragma unused AddNewSqlUser
#pragma unused SqlUserExist
#pragma unused GetSqlUserID
#pragma unused GetSqlUserWepStat
#pragma unused GetSqlPlayerGetGun
#pragma unused UpdateSqlPlayerGetGun
#pragma unused UpdateSqlUserDataStr
#pragma unused UpdateSqlUserDataInt
#pragma unused UpdateSqlUserWepStat
#pragma unused UpdateSqlDuel
#pragma unused UpdateSqlDM
#pragma unused SqlDuelExist
#pragma unused UpdateSqlServerDataStr
#pragma unused UpdateSqlServerDataInt
#pragma unused UpdateSqlConfigStr
#pragma unused UpdateSqlConfigInt
#pragma unused DeleteSqlAccount
#pragma unused DeleteSqlBase
#pragma unused SqlBaseExist
#pragma unused SqlDMExist
#pragma unused SqlTDMExist
#pragma unused UpdateSqlBaseInt
#pragma unused UpdateSqlBaseStr
#pragma unused UpdateSqlTDMInt
#pragma unused UpdateSqlTDMStr
#pragma unused UpdateSqlUserPass
#pragma unused UpdateSqlDuelInt
#pragma unused UpdateSqlDuelStr
#pragma unused UpdateSqlTeleStr
#pragma unused GetSqlBaseDataStr
#pragma unused GetSqlBaseDataInt
#pragma unused GetSqlTDMDataInt
#pragma unused GetSqlTDMDataStr
#pragma unused GetSqlConfigStr
#pragma unused GetSqlConfigInt
#pragma unused GetSqlAudioConfigInt
#pragma unused GetSqlServDataStr
#pragma unused GetSqlServDataInt
#pragma unused CreateSqlBase
#pragma unused CreateSqlDM
#pragma unused CreateSqlTDM
#pragma unused LatestSqlBase
#pragma unused LatestSqlDM
#pragma unused LatestSqlTDM
#pragma unused LatestSqlUserID
#pragma unused UpdateSqlRuntime
#pragma unused GetSqlWepOption
#pragma unused GetSqlWepAmmo
#pragma unused UpdateSqlWepAmmo
#pragma unused UpdateSqlWepOption
#pragma unused MySQLCheck
#pragma unused CreateSqlDuel
#pragma unused CreateSqlTele
#pragma unused AddNewGameSession
#pragma unused DeleteGameSession
#pragma unused LoginGameSession
#pragma unused LogoutGameSession
#pragma unused DeleteAllSessions
#pragma unused SetTeamGameSession
#pragma unused SetKillsGameSession
#pragma unused SetDeathsGameSession
#pragma unused SetKillsGameSession
#pragma unused SetDeathsGameSession
#pragma unused UpdateSqlWepKillDataInt
#pragma unused GetSqlWepKillDataInt
#pragma unused GetSqlWepLimitData
#pragma unused GetSqlWepSkillData
#pragma unused UpdateSqlWepLimitData
#pragma unused UpdateSqlWepSkillData
#pragma unused ChangeBaseID
#pragma unused ChangeTdmID
#pragma unused SqlCountryExist
#pragma unused SqlCreateCountryRow
#pragma unused SqlCountryUpdate
#pragma unused SqlClanExist
#pragma unused SqlCreateClanRow
#pragma unused SqlClanUpdate

AddNewGameSession(playerid, pname[], ip[], country[])
{
    MySQLCheck();
	new query[200];
	format(query, sizeof(query), "INSERT INTO dc_game_sessions (`playerid`, `nickname`, `ip`, `country`, `is_loggedin`, `kills`, `deaths`) VALUES ('%d', '%s', '%s', '%s', '0', '0', '0')", playerid, pname, ip, country);
	mysql_query(query);
	format(query, sizeof( query ), "UPDATE dc_players SET country = '%s' WHERE name = '%s'", country, pname);
	mysql_query( query );
	Server[SQLQueriesExecuted]++;
}

DeleteGameSession(playerid)
{
    MySQLCheck();
	new query[200];
	format(query, sizeof( query ), "DELETE FROM dc_game_sessions WHERE playerid = '%d' LIMIT 1", playerid);
	mysql_query(query);
	Server[SQLQueriesExecuted]++;
}

LoginGameSession(playerid)
{
    MySQLCheck();
	new query[ 200 ];
	format(query, sizeof( query ), "UPDATE dc_game_sessions SET is_loggedin = '1' WHERE playerid = '%d'", playerid);
	mysql_query( query );
	Server[SQLQueriesExecuted]++;
}

SetTeamGameSession(playerid, team[])
{
    MySQLCheck();
	new query[ 200 ];
	format(query, sizeof( query ), "UPDATE dc_game_sessions SET team = '%s' WHERE playerid = '%d'", team, playerid);
	mysql_query( query );
	Server[SQLQueriesExecuted]++;
}

SetKillsGameSession(playerid, kills)
{
    MySQLCheck();
	new query[ 200 ];
	format(query, sizeof( query ), "UPDATE dc_game_sessions SET kills = '%d' WHERE playerid = '%d'", kills, playerid);
	mysql_query( query );
	Server[SQLQueriesExecuted]++;
}

SetDeathsGameSession(playerid, deaths)
{
    MySQLCheck();
	new query[ 200 ];
	format(query, sizeof( query ), "UPDATE dc_game_sessions SET deaths = '%d' WHERE playerid = '%d'", deaths, playerid);
	mysql_query( query );
	Server[SQLQueriesExecuted]++;
}

LogoutGameSession(playerid)
{
    MySQLCheck();
	new query[ 200 ];
	format(query, sizeof( query ), "UPDATE dc_game_sessions SET is_loggedin = '0' WHERE playerid = '%d'", playerid);
	mysql_query( query );
	Server[SQLQueriesExecuted]++;
}

DeleteAllSessions()
{
    MySQLCheck();
	mysql_query("DELETE FROM dc_game_sessions");
	Server[SQLQueriesExecuted]++;
}

SqlUserExist(playername[]) {
    MySQLCheck();
	new escapedname[ MAX_PLAYER_NAME ], query[ 200 ];
	mysql_real_escape_string( playername, escapedname );
	format( query, sizeof( query ), "SELECT * FROM dc_players WHERE name = '%s'", escapedname );
 	mysql_query(query);
 	Server[SQLQueriesExecuted]++;
 	mysql_store_result();

	if(mysql_num_rows() == 1)
	{
	    mysql_free_result();
	    return true;
	} else {
	    mysql_free_result();
	    return false;
	}
}

SqlCountryExist(countryname[]) {
    MySQLCheck();
	new query[ 200 ];
	format( query, sizeof( query ), "SELECT name FROM dc_country_stats WHERE name = '%s'", countryname );
 	mysql_query(query);
 	Server[SQLQueriesExecuted]++;
 	mysql_store_result();

	if(mysql_num_rows() == 1)
	{
	    mysql_free_result();
	    return true;
	} else {
	    mysql_free_result();
	    return false;
	}
}

SqlCreateCountryRow(countryname[])
{
    MySQLCheck();
	new query[200];
	Server[SQLQueriesExecuted]++;
	format(query, sizeof(query), "INSERT INTO dc_country_stats (`id`, `name`, `kills`, `deaths`, `connections`) VALUES (NULL, '%s', '0', '0', '0')", countryname);
	mysql_query(query);
	mysql_free_result();
}

SqlCountryUpdate(countryname[], var[])
{
    MySQLCheck();
	new query[ 200 ];
	format(query, sizeof( query ), "UPDATE dc_country_stats SET %s = (%s + 1) WHERE name = '%s'", var, var, countryname);
	mysql_query( query );
	Server[SQLQueriesExecuted]++;
}

SqlClanExist(clanname[]) {
    MySQLCheck();
	new query[ 200 ];
	format( query, sizeof( query ), "SELECT name FROM dc_clan_stats WHERE name = '%s'", clanname );
 	mysql_query(query);
 	Server[SQLQueriesExecuted]++;
 	mysql_store_result();

	if(mysql_num_rows() == 1)
	{
	    mysql_free_result();
	    return true;
	} else {
	    mysql_free_result();
	    return false;
	}
}

SqlCreateClanRow(clanname[])
{
    MySQLCheck();
	new query[200];
	Server[SQLQueriesExecuted]++;
	format(query, sizeof(query), "INSERT INTO dc_clan_stats (`id`, `name`, `kills`, `deaths`, `connections`) VALUES (NULL, '%s', '0', '0', '0')", clanname);
	mysql_query(query);
	mysql_free_result();
}

SqlClanUpdate(clanname[], var[])
{
    MySQLCheck();
	new query[ 200 ];
	format(query, sizeof( query ), "UPDATE dc_clan_stats SET %s = (%s + 1) WHERE name = '%s'", var, var, clanname);
	mysql_query( query );
	Server[SQLQueriesExecuted]++;
}

SqlBaseExist(baseid) {
    MySQLCheck();
	new query[ 200 ];
	format( query, sizeof( query ), "SELECT * FROM dc_bases WHERE id = '%d'", baseid);
 	mysql_query(query);
 	Server[SQLQueriesExecuted]++;
 	mysql_store_result();
	if(mysql_num_rows() == 1)
	{
	    mysql_free_result();
	    return true;
	} else {
	    mysql_free_result();
	    return false;
	}
}

SqlDMExist(dmid) {
    MySQLCheck();
	new query[ 200 ];
	format( query, sizeof( query ), "SELECT * FROM dc_deathmatch WHERE id = '%d'", dmid);
 	mysql_query(query);
 	Server[SQLQueriesExecuted]++;
 	mysql_store_result();
	if(mysql_num_rows() == 1)
	{
	    mysql_free_result();
	    return true;
	} else {
	    mysql_free_result();
	    return false;
	}
}

SqlTeleExist(tpid) {
    MySQLCheck();
	new query[ 200 ];
	format( query, sizeof( query ), "SELECT * FROM dc_teleports WHERE id = '%d'", tpid);
 	mysql_query(query);
 	Server[SQLQueriesExecuted]++;
 	mysql_store_result();
	if(mysql_num_rows() == 1)
	{
	    mysql_free_result();
	    return true;
	} else {
	    mysql_free_result();
	    return false;
	}
}
SqlTDMExist(tdmid) {
    MySQLCheck();
	new query[ 200 ];
	format( query, sizeof( query ), "SELECT * FROM dc_tdm WHERE id = '%d'", tdmid );
 	mysql_query(query);
 	Server[SQLQueriesExecuted]++;
 	mysql_store_result();
	if(mysql_num_rows() == 1)
	{
	    mysql_free_result();
	    return true;
	} else {
	    mysql_free_result();
	    return false;
	}
}

SqlDuelExist(duelid) {
    MySQLCheck();
	new query[ 200 ];
	format( query, sizeof( query ), "SELECT * FROM dc_duels WHERE id = '%d'", duelid );
 	mysql_query(query);
 	Server[SQLQueriesExecuted]++;
 	mysql_store_result();
	if(mysql_num_rows() == 1)
	{
	    mysql_free_result();
	    return true;
	} else {
	    mysql_free_result();
	    return false;
	}
}

AddNewSqlUser(pname[], password[])
{
    MySQLCheck();
	new string[256];
	new year,month,day;
	getdate(year, month, day);
	format(string,256,"%d/%d/%d",month,day,year);
	new escapedname[ MAX_PLAYER_NAME ], escapedpass[ MAX_PLAYER_NAME ], query[ 200 ];
	mysql_real_escape_string( pname, escapedname );
	mysql_real_escape_string( password, escapedpass );
	mysql_query("INSERT INTO dc_players_getgun (`id`) VALUES (NULL)");
	Server[SQLQueriesExecuted]++;
	mysql_query("INSERT INTO dc_players_wepstats (`id`) VALUES (NULL)");
	Server[SQLQueriesExecuted]++;
	format(query, sizeof(query), "INSERT INTO dc_players (`id`, `name`, `password`, `AdminLevel`, `RegisterDate`, `LastUpdate`) VALUES (NULL, '%s', MD5('%s'), '0', '%s', '%s')", pname, password, string, string);
	mysql_query(query);
	mysql_free_result();
}

CreateSqlBase(date[], creator[])
{
    MySQLCheck();
	new query[ 200 ];
    new baseid;
    baseid = LatestSqlBase();
    baseid++;
	format( query, sizeof( query ), "INSERT INTO dc_bases (`id`, `date`, `creator`, `played`, `time`) VALUES ('%d', '%s', '%s', '0', '-1')", baseid, date, creator);
	mysql_query( query );
	Server[SQLQueriesExecuted]++;
}

CreateSqlDM()
{
    MySQLCheck();
	new query[ 200 ];
    new dmid;
    dmid = LatestSqlDM();
    dmid++;
	format( query, sizeof( query ), "INSERT INTO dc_deathmatch (`id`, `name`, `min`, `max`, `center`, `guns`) VALUES ('%d', 'Custom DM', '0', '0', '0', '0')", dmid);
	mysql_query( query );
	Server[SQLQueriesExecuted]++;
}

CreateSqlTDM()
{
    MySQLCheck();
    new tdmid;
    tdmid = LatestSqlTDM();
    tdmid++;
    new query[200];
    format(query, 200, "INSERT INTO dc_tdm (`id`, `time`) VALUES ('%d', '0')", tdmid);
	mysql_query(query);
	Server[SQLQueriesExecuted]++;
}

CreateSqlDuel(id)
{
    MySQLCheck();
	new query[ 200 ];
	format( query, sizeof( query ), "INSERT INTO dc_duels (`id`) VALUES ('%d')", id);
	mysql_query( query );
	Server[SQLQueriesExecuted]++;
}

CreateSqlTele(id, name[], coords[])
{
    MySQLCheck();
	new query[ 200 ];
	format( query, sizeof( query ), "INSERT INTO dc_teleports (`id`, `name`, `coords`) VALUES ('%d', '%s', '%s')", id, name, coords);
	mysql_query( query );
	Server[SQLQueriesExecuted]++;
}

LatestSqlDM()
{
    MySQLCheck();
 	mysql_query("SELECT * FROM dc_deathmatch ORDER BY id DESC LIMIT 1");
 	Server[SQLQueriesExecuted]++;
	mysql_store_result();
	new row[500], templine[500];
	mysql_fetch_row(row);
	mysql_fetch_field_row(templine,"id");
	mysql_free_result();
	return strval(templine);
}

LatestSqlBase()
{
    MySQLCheck();
 	mysql_query("SELECT * FROM dc_bases ORDER BY id DESC LIMIT 1");
 	Server[SQLQueriesExecuted]++;
	mysql_store_result();
	new row[500], templine[500];
	mysql_fetch_row(row);
	mysql_fetch_field_row(templine,"id");
	mysql_free_result();
	return strval(templine);
}

LatestSqlTDM()
{
    MySQLCheck();
 	mysql_query("SELECT * FROM dc_tdm ORDER BY id DESC LIMIT 1");
 	Server[SQLQueriesExecuted]++;
	mysql_store_result();
	new row[500], templine[500];
	mysql_fetch_row(row);
	mysql_fetch_field_row(templine,"id");
	mysql_free_result();
	return strval(templine);
}

LatestSqlUserID()
{
    MySQLCheck();
 	mysql_query("SELECT * FROM dc_players ORDER BY id DESC LIMIT 1");
 	Server[SQLQueriesExecuted]++;
	mysql_store_result();
	new row[100], templine[200];
	mysql_fetch_row(row);
	mysql_fetch_field_row(templine,"id");
	mysql_free_result();
	return strval(templine);
}

SqlAuth(pname[], password[])
{
    MySQLCheck();
	new query[ 200 ];
	new pos = strfind(password, "'");
	while(pos != -1) {
	    strdel(password, pos, pos+1);
	    pos = strfind(password, "'");
	}
	format( query, sizeof(query), "SELECT * FROM dc_players WHERE name = '%s' AND password = MD5('%s')", pname, password);
 	mysql_query(query);
 	Server[SQLQueriesExecuted]++;
	mysql_store_result();
	if(mysql_num_rows() == 1)
	{
	    mysql_free_result();
	    return true;
	} else {
	    mysql_free_result();
	    return false;
	}
}

SqlAuthByIP(playerip[], dbpass[])
{
	if (isStringSame(playerip, dbpass, 30)) {
		return true;
	} else {
		return false;
	}
}

GetSqlUserDataInt(pname[], info[])
{
    MySQLCheck();
	new query[200];
	format( query, sizeof( query ), "SELECT %s FROM dc_players WHERE name = '%s'", info, pname);
 	mysql_query(query);
 	Server[SQLQueriesExecuted]++;
	mysql_store_result();
	new row[100], templine[200];
	mysql_fetch_row(row);
	mysql_fetch_field_row(templine,info);
	mysql_free_result();
	return strval(templine);
}

GetSqlUserWepStat(pname[], info[])
{
    MySQLCheck();
	new query[200];
	format( query, sizeof( query ), "SELECT %s FROM dc_players_wepstats WHERE id = '%d'", info, GetSqlUserID(pname));
 	mysql_query(query);
 	Server[SQLQueriesExecuted]++;
	mysql_store_result();
	new row[100], templine[200];
	mysql_fetch_row(row);
	mysql_fetch_field_row(templine,info);
	mysql_free_result();
	return strval(templine);
}


GetSqlPlayerGetGun(playerid, info[])
{
    MySQLCheck();
	new query[200];
	format( query, sizeof( query ), "SELECT %s FROM dc_players_getgun WHERE id = '%d'", info, GetSqlUserID(PlayerName(playerid)));
 	mysql_query(query);
 	Server[SQLQueriesExecuted]++;
	mysql_store_result();
	new row[100], templine[200];
	mysql_fetch_row(row);
	mysql_fetch_field_row(templine,info);
	mysql_free_result();
	return strval(templine);
}

GetSqlUserID(playername[])
{
    MySQLCheck();
	new query[200];
	format( query, sizeof( query ), "SELECT `id` FROM dc_players WHERE name = '%s'", playername);
 	mysql_query(query);
 	Server[SQLQueriesExecuted]++;
	mysql_store_result();
	new row[100], templine[200];
	mysql_fetch_row(row);
	mysql_fetch_field_row(templine,"id");
	mysql_free_result();
	return strval(templine);
}

GetSqlConfigStr(var[])
{
    MySQLCheck();
	new query[200];
	format( query, sizeof( query ), "SELECT `data` FROM dc_config WHERE var = '%s'", var);
 	mysql_query(query);
 	Server[SQLQueriesExecuted]++;
	mysql_store_result();
	new row[100], templine[200];
	mysql_fetch_row(row);
	mysql_fetch_field_row(templine,"data");
	mysql_free_result();
	return templine;
}

GetSqlConfigInt(var[])
{
    MySQLCheck();
	new query[200];
	format( query, sizeof( query ), "SELECT `data` FROM dc_config WHERE var = '%s'", var);
 	mysql_query(query);
 	Server[SQLQueriesExecuted]++;
	mysql_store_result();
	new row[100], templine[200];
	mysql_fetch_row(row);
	mysql_fetch_field_row(templine,"data");
	mysql_free_result();
	return strval(templine);
}

GetSqlAudioConfigInt(var[])
{
    MySQLCheck();
	new query[200];
	format( query, sizeof( query ), "SELECT `data` FROM dc_audio WHERE var = '%s'", var);
 	mysql_query(query);
 	Server[SQLQueriesExecuted]++;
	mysql_store_result();
	new row[100], templine[200];
	mysql_fetch_row(row);
	mysql_fetch_field_row(templine,"data");
	mysql_free_result();
	return strval(templine);
}

GetSqlWepKillDataInt(var[])
{
    MySQLCheck();
	new query[200];
	format( query, sizeof( query ), "SELECT `data` FROM dc_wepkill_data WHERE var = '%s'", var);
 	mysql_query(query);
 	Server[SQLQueriesExecuted]++;
	mysql_store_result();
	new row[100], templine[200];
	mysql_fetch_row(row);
	mysql_fetch_field_row(templine,"data");
	mysql_free_result();
	return strval(templine);
}

GetSqlWepLimitData(var)
{
    MySQLCheck();
	new query[200];
	format( query, sizeof( query ), "SELECT `limit` FROM dc_weapon_limits WHERE weaponid = '%d'", var);
 	mysql_query(query);
 	Server[SQLQueriesExecuted]++;
	mysql_store_result();
	new row[100], templine[200];
	mysql_fetch_row(row);
	mysql_fetch_field_row(templine,"limit");
	mysql_free_result();
	return strval(templine);
}

UpdateSqlWepLimitData(weaponid, newlimit)
{
    MySQLCheck();
	new query[200];
	format(query, sizeof( query ), "UPDATE dc_weapon_limits SET `limit` = '%d' WHERE weaponid = '%d'", newlimit, weaponid);
	mysql_query( query );
	Server[SQLQueriesExecuted]++;
}

GetSqlWepSkillData(var)
{
    MySQLCheck();
	new query[200];
	format( query, sizeof( query ), "SELECT skill FROM dc_weapon_skill WHERE weaponid = '%d'", var);
 	mysql_query(query);
 	Server[SQLQueriesExecuted]++;
	mysql_store_result();
	new row[100], templine[200];
	mysql_fetch_row(row);
	mysql_fetch_field_row(templine,"skill");
	mysql_free_result();
	return strval(templine);
}

UpdateSqlWepSkillData(weaponid, newskill)
{
    MySQLCheck();
	new query[200];
	format(query, sizeof( query ), "UPDATE dc_weapon_skill SET skill = '%d' WHERE weaponid = '%d'", newskill, weaponid);
	mysql_query( query );
	Server[SQLQueriesExecuted]++;
}

GetSqlServDataStr(var[])
{
    MySQLCheck();
	new query[200];
	format( query, sizeof( query ), "SELECT data FROM dc_serverdata WHERE var = '%s'", var);
 	mysql_query(query);
 	Server[SQLQueriesExecuted]++;
	mysql_store_result();
	new row[100], templine[200];
	mysql_fetch_row(row);
	mysql_fetch_field_row(templine,"data");
	mysql_free_result();
	return templine;
}

GetSqlServDataInt(var[])
{
    MySQLCheck();
	new query[200];
	format( query, sizeof( query ), "SELECT data FROM dc_serverdata WHERE var = '%s'", var);
 	mysql_query(query);
 	Server[SQLQueriesExecuted]++;
	mysql_store_result();
	new row[100], templine[200];
	mysql_fetch_row(row);
	mysql_fetch_field_row(templine,"data");
	mysql_free_result();
	return strval(templine);
}

GetSqlUserDataStr(pname[], info[])
{
    MySQLCheck();
	new query[200];
	format( query, sizeof( query ), "SELECT %s FROM dc_players WHERE name = '%s'", info, pname);
 	mysql_query(query);
 	Server[SQLQueriesExecuted]++;
	mysql_store_result();
	new row[100], templine[200];
	mysql_fetch_row(row);
	mysql_fetch_field_row(templine,info);
	mysql_free_result();
	return templine;
}

GetSqlBaseDataStr(baseid, info[])
{
    MySQLCheck();
	new query[200];
	format( query, sizeof( query ), "SELECT %s FROM dc_bases WHERE id = '%d'", info, baseid);
 	mysql_query(query);
 	Server[SQLQueriesExecuted]++;
	mysql_store_result();
	new row[100], templine[200];
	mysql_fetch_row(row);
	mysql_fetch_field_row(templine,info);
	mysql_free_result();
	return templine;
}

GetSqlWepOption(wepid)
{
    MySQLCheck();
	new query[200];
	format( query, sizeof( query ), "SELECT class FROM dc_weapon_classes WHERE weap_id = '%d'", wepid);
 	mysql_query(query);
 	Server[SQLQueriesExecuted]++;
	mysql_store_result();
	new row[100], templine[200];
	mysql_fetch_row(row);
	mysql_fetch_field_row(templine,"class");
	mysql_free_result();
	return strval(templine);
}

GetSqlWepAmmo(wepid)
{
    MySQLCheck();
	new query[200];
	format( query, sizeof( query ), "SELECT weap_ammo FROM dc_weapon_classes WHERE weap_id = '%d'", wepid);
 	mysql_query(query);
 	Server[SQLQueriesExecuted]++;
	mysql_store_result();
	new row[100], templine[200];
	mysql_fetch_row(row);
	mysql_fetch_field_row(templine,"weap_ammo");
	mysql_free_result();
	return strval(templine);
}


GetSqlBaseDataInt(baseid, info[])
{
    MySQLCheck();
	new query[200];
	format( query, sizeof( query ), "SELECT %s FROM dc_bases WHERE id = '%d'", info, baseid);
 	mysql_query(query);
 	Server[SQLQueriesExecuted]++;
	mysql_store_result();
	new templine[200], index2;
	mysql_fetch_row(templine);
	new thedata = strval( strtok( templine, index2 ) );
	mysql_free_result();
	return thedata;
}

GetSqlTDMDataInt(tdmid, info[])
{
    MySQLCheck();
	new query[200];
	format( query, sizeof( query ), "SELECT %s FROM dc_tdm WHERE id = '%d'", info, tdmid);
 	mysql_query(query);
 	Server[SQLQueriesExecuted]++;
	mysql_store_result();
	new templine[200], index2;
	mysql_fetch_row(templine);
	new thedata = strval( strtok( templine, index2 ) );
	mysql_free_result();
	return thedata;
}

GetSqlTDMDataStr(tdmid, info[])
{
    MySQLCheck();
	new query[200];
	format( query, sizeof( query ), "SELECT %s FROM dc_tdm WHERE id = '%d'", info, tdmid);
 	mysql_query(query);
 	Server[SQLQueriesExecuted]++;
	mysql_store_result();
	new row[100], templine[200];
	mysql_fetch_row(row);
	mysql_fetch_field_row(templine,info);
	mysql_free_result();
	return templine;
}

UpdateSqlUserDataStr(playerid, column[], info[])
{
    MySQLCheck();
	new escapedname[ MAX_PLAYER_NAME ], query[ 200 ];
	mysql_real_escape_string( PlayerName(playerid), escapedname );
	format(query, sizeof( query ), "UPDATE dc_players SET %s = '%s' WHERE name = '%s'", column, info, escapedname);
	mysql_query( query );
}

UpdateSqlUserPass(playerid, newpass[])
{
    MySQLCheck();
	new escapedname[ MAX_PLAYER_NAME ], query[ 200 ];
	mysql_real_escape_string( PlayerName(playerid), escapedname );
	format(query, sizeof( query ), "UPDATE dc_players SET password = MD5('%s') WHERE name = '%s'", newpass, escapedname);
	mysql_query( query );
	Server[SQLQueriesExecuted]++;
}

UpdateSqlUserDataInt(playerid, column[], info)
{
    MySQLCheck();
	new escapedname[ MAX_PLAYER_NAME ], query[ 200 ];
	mysql_real_escape_string( PlayerName(playerid), escapedname );
	format(query, sizeof( query ), "UPDATE dc_players SET %s = %d WHERE name = '%s'", column, info, escapedname);
	mysql_query( query );
	Server[SQLQueriesExecuted]++;
}

UpdateSqlBaseInt(baseid, column[], info)
{
    MySQLCheck();
	new query[ 200 ];
	format(query, sizeof( query ), "UPDATE dc_bases SET %s = '%d' WHERE id = '%d'", column, info, baseid);
	mysql_query( query );
	Server[SQLQueriesExecuted]++;
}

ChangeBaseID(oldbaseid, newbaseid)
{
    MySQLCheck();
	new query[ 200 ];
	format(query, sizeof( query ), "UPDATE dc_bases SET id = '%d' WHERE id = '%d'", newbaseid, oldbaseid);
	mysql_query( query );
	Server[SQLQueriesExecuted]++;
}

ChangeTdmID(oldbaseid, newbaseid)
{
    MySQLCheck();
	new query[ 200 ];
	format(query, sizeof( query ), "UPDATE dc_tdm SET id = '%d' WHERE id = '%d'", newbaseid, oldbaseid);
	mysql_query( query );
	Server[SQLQueriesExecuted]++;
}

ChangeDuelID(oldduelid, newduelid)
{
    MySQLCheck();
	new query[ 200 ];
	format(query, sizeof( query ), "UPDATE dc_duels SET id = '%d' WHERE id = '%d'", newduelid, oldduelid);
	mysql_query( query );
	Server[SQLQueriesExecuted]++;
}

ChangeDmID(olddmid, newdmid)
{
    MySQLCheck();
	new query[ 200 ];
	format(query, sizeof( query ), "UPDATE dc_deathmatch SET id = '%d' WHERE id = '%d'", newdmid, olddmid);
	mysql_query( query );
	Server[SQLQueriesExecuted]++;
}

ChangeTeleID(oldtpid, newtpid)
{
    MySQLCheck();
	new query[ 200 ];
	format(query, sizeof( query ), "UPDATE dc_teleports SET id = '%d' WHERE id = '%d'", newtpid, oldtpid);
	mysql_query( query );
	Server[SQLQueriesExecuted]++;
}

UpdateSqlBaseStr(baseid, column[], info[])
{
    MySQLCheck();
	new query[ 200 ];
	format(query, sizeof( query ), "UPDATE dc_bases SET %s = '%s' WHERE id = '%d'", column, info, baseid);
	mysql_query( query );
	Server[SQLQueriesExecuted]++;
}

UpdateSqlTDMInt(tdmid, column[], info)
{
    MySQLCheck();
	new query[ 200 ];
	format(query, sizeof( query ), "UPDATE dc_tdm SET %s = '%d' WHERE id = '%d'", column, info, tdmid);
	mysql_query( query );
	Server[SQLQueriesExecuted]++;
}

UpdateSqlTDMStr(tdmid, column[], info[])
{
    MySQLCheck();
	new query[ 200 ];
	format(query, sizeof( query ), "UPDATE dc_tdm SET %s = '%s' WHERE id = '%d'", column, info, tdmid);
	mysql_query( query );
	Server[SQLQueriesExecuted]++;
}

UpdateSqlWepOption(wepid, option)
{
    MySQLCheck();
	new query[ 200 ];
	format(query, sizeof( query ), "UPDATE dc_weapon_classes SET class = '%d' WHERE weap_id = '%d'", option, wepid);
	mysql_query( query );
	Server[SQLQueriesExecuted]++;
}

UpdateSqlWepAmmo(wepid, theammo)
{
    MySQLCheck();
	new query[ 200 ];
	format(query, sizeof( query ), "UPDATE dc_weapon_classes SET weap_ammo = '%d' WHERE weap_id = '%d'", theammo, wepid);
	mysql_query( query );
	Server[SQLQueriesExecuted]++;
}

UpdateSqlDuelInt(duelid, column[], info)
{
    MySQLCheck();
	new query[ 200 ];
	format(query, sizeof( query ), "UPDATE dc_duels SET %s = '%d' WHERE id = '%d'", column, info, duelid);
	mysql_query( query );
	Server[SQLQueriesExecuted]++;
}


UpdateSqlDuelStr(duelid, column[], info[])
{
    MySQLCheck();
	new query[ 200 ];
	format(query, sizeof( query ), "UPDATE dc_duels SET %s = '%s' WHERE id = '%d'", column, info, duelid);
	mysql_query( query );
	Server[SQLQueriesExecuted]++;
}

UpdateSqlTeleStr(tpid, column[], info[])
{
    MySQLCheck();
	new query[ 200 ];
	format(query, sizeof( query ), "UPDATE dc_teleports SET %s = '%s' WHERE id = '%d'", column, info, tpid);
	mysql_query( query );
	Server[SQLQueriesExecuted]++;
}

UpdateSqlUserWepStat(playerid, column[], info)
{
    MySQLCheck();
	new query[200];
	format(query, sizeof( query ), "UPDATE dc_players_wepstats SET %s = %d WHERE id = '%d'", column, info, GetSqlUserID(PlayerName(playerid)));
	mysql_query( query );
	Server[SQLQueriesExecuted]++;
}

UpdateSqlDuel(duelid, column[], info[])
{
    MySQLCheck();
	new query[200];
	format(query, sizeof( query ), "UPDATE dc_duels SET %s = '%d' WHERE id = '%d'", column, info, duelid);
	mysql_query( query );
	Server[SQLQueriesExecuted]++;
}

UpdateSqlDM(dmid, column[], info[])
{
    MySQLCheck();
	new query[200];
	format(query, sizeof( query ), "UPDATE dc_deathmatch SET %s = '%d' WHERE id = '%d'", column, info, dmid);
	mysql_query( query );
	Server[SQLQueriesExecuted]++;
}

UpdateSqlPlayerGetGun(playerid, column[], info)
{
    MySQLCheck();
	new query[200];
	format(query, sizeof( query ), "UPDATE dc_players_getgun SET %s = '%d' WHERE id = '%d'", column, info, GetSqlUserID(PlayerName(playerid)));
	mysql_query( query );
	Server[SQLQueriesExecuted]++;
}

UpdateSqlServerDataInt(var[], data)
{
    MySQLCheck();
	new query[200];
	format(query, sizeof( query ), "UPDATE dc_serverdata SET data = '%d' WHERE var = '%s'", data, var);
	mysql_query( query );
	Server[SQLQueriesExecuted]++;
}

UpdateSqlWepKillDataInt(var[], data)
{
    MySQLCheck();
	new query[200];
	format(query, sizeof( query ), "UPDATE dc_wepkill_data SET data = '%d' WHERE var = '%s'", data, var);
	mysql_query( query );
	Server[SQLQueriesExecuted]++;
}

UpdateSqlServerDataStr(var[], data[])
{
    MySQLCheck();
	new query[200];
	format(query, sizeof( query ), "UPDATE dc_serverdata SET data = '%s' WHERE var = '%s'", data, var);
	mysql_query( query );
	Server[SQLQueriesExecuted]++;
}

UpdateSqlConfigStr(var[], data[])
{
    MySQLCheck();
	new query[1024];
	format(query, sizeof( query ), "UPDATE dc_config SET data = '%s' WHERE var = '%s'", data, var);
	mysql_query( query );
	Server[SQLQueriesExecuted]++;
}

UpdateSqlConfigInt(var[], data)
{
    MySQLCheck();
	new query[200];
	format(query, sizeof( query ), "UPDATE dc_config SET data = '%d' WHERE var = '%s'", data, var);
	mysql_query( query );
	Server[SQLQueriesExecuted]++;
}

UpdateSqlRuntime(var[], data[])
{
    MySQLCheck();
	new query[200];
	new pos = strfind(data, "'");
	while(pos != -1) {
	    strdel(data, pos, pos+1);
	    pos = strfind(data, "'");
	}
	format(query, sizeof( query ), "UPDATE dc_runtime SET data = '%s' WHERE var = '%s'", data, var);
	mysql_query( query );
	Server[SQLQueriesExecuted]++;
}


DeleteSqlAccount(name[])
{
    MySQLCheck();
	new query[200];
	format(query, sizeof( query ), "DELETE FROM  dc_players_getgun WHERE id = '%d' LIMIT 1", GetSqlUserID(name));
	mysql_query(query);
	Server[SQLQueriesExecuted]++;
	format(query, sizeof( query ), "DELETE FROM  dc_players_wepstats WHERE id = '%d' LIMIT 1", GetSqlUserID(name));
	mysql_query(query);
	Server[SQLQueriesExecuted]++;
	format(query, sizeof( query ), "DELETE FROM  dc_players WHERE name = '%s' LIMIT 1", name);
	mysql_query(query);
	Server[SQLQueriesExecuted]++;
}

DeleteSqlDuel(duelid)
{
    MySQLCheck();
	new query[200];
	format(query, sizeof( query ), "DELETE FROM dc_duels WHERE id = '%d' LIMIT 1", duelid);
	mysql_query(query);
	Server[SQLQueriesExecuted]++;
}

DeleteSqlDM(dmid)
{
    MySQLCheck();
	new query[200];
	format(query, sizeof( query ), "DELETE FROM dc_deathmatch WHERE id = '%d' LIMIT 1", dmid);
	mysql_query(query);
	Server[SQLQueriesExecuted]++;
}

DeleteSqlTele(tpid)
{
    MySQLCheck();
	new query[200];
	format(query, sizeof( query ), "DELETE FROM dc_teleports WHERE id = '%d' LIMIT 1", tpid);
	mysql_query(query);
	Server[SQLQueriesExecuted]++;
}

DeleteSqlBase(baseid)
{
    MySQLCheck();
	new query[200];
	format(query, sizeof( query ), "DELETE FROM dc_bases WHERE id = '%d' LIMIT 1", baseid);
	mysql_query(query);
	Server[SQLQueriesExecuted]++;
}

DeleteSqlTDM(tdmid)
{
    MySQLCheck();
	new query[200];
	format(query, sizeof( query ), "DELETE FROM dc_tdm WHERE id = '%d' LIMIT 1", tdmid);
	mysql_query(query);
	Server[SQLQueriesExecuted]++;
}

/*
ApplyLatestConfigChangesSql(built)
{
	if(built < 5)
	{
	    // Add new
	}
}
*/

/*
new query[200];
format(query, sizeof(query), "SELECT * FROM players");
mysql_query(query);
mysql_store_result();
new templine[200];
while(mysql_fetch_row_format(templine, "|"))
{
	new idx;
	new uid_tmp[256], uid;
	new nickname[256];

	uid_tmp = mysql_strtok(templine, idx, "|");
	uid = strval(uid_tmp);
	nickname = mysql_strtok(templine, idx, "|");

    printf("%d", uid);
    printf("%s", nickname);
    printf("%s", templine);
    print("-------------------------------------");
}
*/

mysql_strtok(const string[], &index, seperator[])
{
	new index2, result[200];
	index2 =  strfind(string, seperator, false, index);

	if(index2 == -1)
	{
		if(strlen(string) > index)
		{
			strmid(result, string, index, strlen(string), 200);
			index = strlen(string);
		}
		return result;
	}
	if(index2 > (index + 199))
	{
		index2 = index + 199;
		strmid(result, string, index, index2, 200);
		index = index2;
		return result;
	}
	strmid(result, string, index, index2, 200);
	index = index2 + 1;
	return result;
}

MySQLCheck()
{
	if(mysql_ping() == -1)
	{
		mysql_connect(MYSQL_SERVER, MYSQL_USER, MYSQL_DB, MYSQL_PASS);
	}
	return 1;
}
#endif

FixGaps() {
	#if DATA_SYSTEM == 1
		new basesFixed = 0;
		for(new i = 1; i < MAX_BASES+1; i++)
		{
			new string[128], string2[128], string3[128];
			format(string,128,"combinations/bases/%d.ini",i);
			format(string2,128,"combinations/bases/%d.ini",i+1);
			format(string3,128,"combinations/bases/%d.ini",Server[HighestBaseID]);
			if(!dini_Exists(string) && Server[HighestBaseID] != i && i < Server[HighestBaseID]) { // if a file still doesn't exist after we've done our loop, lets check some more info about it.
                frename(string3,string);
				if(dini_Exists(string)) basesFixed++;
			}
		}
		new duelsFixed = 0;
		for(new i = 1; i < MAX_DUELS+1; i++)
		{
			new string[128], string2[128], string3[128];
			format(string,128,"combinations/duels/%d.ini",i);
			format(string2,128,"combinations/duels/%d.ini",i+1);
			format(string3,128,"combinations/duels/%d.ini",Server[HighestDuelID]);

		    if(!dini_Exists(string) && Server[HighestDuelID] != i && i < Server[HighestDuelID]) // if this duel exists and a higher number also does....
		    {
		        frename(string3,string);
		        if(dini_Exists(string)) duelsFixed++;
			}
		}
		new teleFixed = 0;
		for(new i = 1; i < MAX_TELEPORT_AREAS+1; i++)
		{
			new string[128], string2[128], string3[128];
			format(string,128,"combinations/teleports/%d.ini",i);
			format(string2,128,"combinations/teleports/%d.ini",i+1);
			format(string3,128,"combinations/teleports/%d.ini",Server[HighestTeleID]);

		    if(!dini_Exists(string) && Server[HighestTeleID] != i && i < Server[HighestTeleID]) // if this duel exists and a higher number also does....
		    {
		        frename(string3,string);
		        if(dini_Exists(string)) teleFixed++;
			}
		}
		new dmFixed = 0;
		for(new i = 1; i < MAX_DMS+1; i++)
		{
			new string[128], string2[128], string3[128];
			format(string,128,"combinations/dms/%d.ini",i);
			format(string2,128,"combinations/dms/%d.ini",i+1);
			format(string3,128,"combinations/dms/%d.ini",Server[HighestDmID]);

		    if(!dini_Exists(string) && Server[HighestDmID] != i && i < Server[HighestDmID]) // if this duel exists and a higher number also does....
		    {
		        frename(string3,string);
		        if(dini_Exists(string)) dmFixed++;
			}
		}
		new tdmFixed = 0;
		for(new i = 1; i < MAX_ARENAS+1; i++)
		{
			new string[128], string2[128], string3[128];
			format(string,128,"combinations/tdm/%d.ini",i);
			format(string2,128,"combinations/tdm/%d.ini",i+1);
			format(string3,128,"combinations/tdm/%d.ini",Server[HighestTdmID]);

		    if(!dini_Exists(string) && Server[HighestTdmID] != i && i < Server[HighestTdmID]) // if this tdm exists and a higher number also does....
		    {
		        frename(string3,string);
		        if(dini_Exists(string)) tdmFixed++;
			}
		}
	#elseif DATA_SYSTEM == 2
		new basesFixed = -1;
		for(new i = 1; i < MAX_BASES; i++)
		{
		    if(strlen(BaseVariables[i][CreationDate]) < 1 && Server[HighestBaseID] != i && i < Server[HighestBaseID] )
		    {
		        ChangeBaseID(Server[HighestBaseID], i);
		        basesFixed++;
			}
		}
		new dmFixed = -1;
		for(new i = 1; i < MAX_DMS; i++)
		{
		    if(!DMWorking[i] && Server[HighestDmID] != i && i < Server[HighestDmID])
		    {
		        ChangeDmID(Server[HighestDmID], i);
		        dmFixed++;
			}
		}
		new duelsFixed = -1;
		for(new i = 1; i < MAX_DUELS; i++)
		{
		    if(!DuelWorking[i] && Server[HighestDuelID] != i && i < Server[HighestDuelID])
		    {
		        ChangeDuelID(Server[HighestDuelID], i);
		        duelsFixed++;
			}
		}
		new teleFixed = -1;
		for(new i = 1; i < MAX_TELEPORT_AREAS; i++)
		{
		    if(strlen(TeleportNames[i]) < 1 && Server[HighestTeleID] != i && i < Server[HighestTeleID])
		    {
		        ChangeTeleID(Server[HighestTeleID], i);
		        teleFixed++;
			}
		}
		new tdmFixed = -1;
		for(new i = 1; i < MAX_ARENAS; i++)
		{
		    if(strlen(ArenaVariables[i][About]) < 1 && Server[HighestTdmID] != i && i < Server[HighestTdmID])
		    {
		        ChangeTdmID(Server[HighestTdmID], i);
		        tdmFixed++;
			}
		}
	#endif
	if (basesFixed > 0) printf("  -> %d Base IDs Corrected...", basesFixed);
	if (tdmFixed > 0) printf("  -> %d TDM IDs Corrected...", tdmFixed);
	if (duelsFixed > 0) printf("  -> %d Duel IDs Corrected...", duelsFixed);
	if (dmFixed > 0) printf("  -> %d DM IDs Corrected...", dmFixed);
	if (teleFixed > 0) printf("  -> %d Teleport IDs Corrected...", teleFixed);
	return 1;
}



CMD:leave(playerid, params[])
{
	if(Player[playerid][DM] == 0)
		return SendClientMessageEx(playerid, COLOR_RED, "Error: You are not in a DM.");
	else
	{
	    if (Player[playerid][DM] != 0) {
			OnPlayerLeaveDM(playerid, Player[playerid][DM]);
        }
		TextDrawHideForPlayer(playerid,DMScores[Player[playerid][DM]]);
		GangZoneHideForPlayer(playerid, Player[playerid][DM]);
	    Player[playerid][DM] = 0;
  		Player[playerid][TempDMKills] = 0;
		Player[playerid][TempDMDeaths] = 0;
		Player[playerid][DMKillSpree] = 0;
		Player[playerid][setToPlay] = true;
	   	SendClientMessageEx(playerid, COLOR_WHITE, "{700000}[DM] You left the DM.");
	    SpawnPlayerEx(playerid);
	}
	#pragma unused params
	return 1;
}

/*
	DM Command
	Usage: /dm [id]
	Description: Used to enter a DM.
	Access: All Players
*/

CMD:dm(playerid, params[])
{
	new idx;
	new tmp[256];
	new string[256];
	tmp = strtok(params, idx);

	Server[ValidDMs] = 0;
	for(new i = 1; i < sizeof(DMName); i ++)
	{
	    if (DMWorking[i]) {
			Server[ValidDMs] ++;
		}
	}

	new command_id = 1;
	if(!IsPlayerRootAdmin(playerid) || IsNumeric(tmp) || isnull(tmp))
	    command_id = 1;
	else if(strcmp(tmp, "setup", true)==0)
	    command_id = 2;
	else if(strcmp(tmp, "name", true)==0)
	    command_id = 3;
	else if(strcmp(tmp, "guns", true)==0)
	    command_id = 4;

	new dm = strval(tmp);
	if(command_id == 1)
	{
	    if(Config[c_dm] == 0)
		{
			if (IsPlayerAdmin3(playerid))
			{
	 			return SendClientMessageEx(playerid, COLOR_GREY, "Admin Usage: {FFFFFF}/dm [setup|name|guns] (note: you can only use this for the fact that /config dm is off)");
			}
			return SendClientMessageEx(playerid, COLOR_RED, "{FF0000}� Error: {FFFFFF}This command is disabled.");
		}
		if(Round[Current] != -1 || Server[EPRoundStarted] == true) SendClientMessageEx(playerid, COLOR_RED, "{FF0000}� Error: {FFFFFF}You cannot use this command while a round is being played.");
		else if(dm < 1 || dm > Server[ValidDMs] || isnull(tmp) || DMWorking[dm] == false)
		{
	 		format(string,256,"Usage: {FFFFFF}/dm [1-%d]",Server[ValidDMs]);


			new msg1[256], msg2[256], msg3[256], msg4[256], msg5[256];
			for(new i = 1; i < Server[HighestDmID]+1; i ++)
			{
			    if (strlen(msg1) < 100) {
			    	format(msg1,256,"%s || %d: %s", msg1, i, DMName[i]);
				} else if (strlen(msg2) < 100) {
			    	format(msg2,256,"%s || %d: %s", msg2, i, DMName[i]);
				} else if (strlen(msg3) < 100) {
			    	format(msg3,256,"%s || %d: %s", msg3, i, DMName[i]);
				} else if (strlen(msg4) < 100) {
			    	format(msg4,256,"%s || %d: %s", msg4, i, DMName[i]);
				} else if (strlen(msg5) < 100) {
			    	format(msg5,256,"%s || %d: %s", msg5, i, DMName[i]);
				}
			}

			SendClientMessageEx(playerid, COLOR_GREY, string);
			if (strlen(msg1) > 3) SendClientMessageEx(playerid, COLOR_WHITE, msg1);
			if (strlen(msg2) > 3) SendClientMessageEx(playerid, COLOR_WHITE, msg2);
			if (strlen(msg3) > 3) SendClientMessageEx(playerid, COLOR_WHITE, msg3);
			if (strlen(msg4) > 3) SendClientMessageEx(playerid, COLOR_WHITE, msg4);
			if (strlen(msg5) > 3) SendClientMessageEx(playerid, COLOR_WHITE, msg5);


			if (IsPlayerAdmin3(playerid)) {
	 			SendClientMessageEx(playerid, COLOR_GREY, "Admin Usage: {FFFFFF}/dm [setup|name|guns]");
			}
		}
		else
		{
		    OnPlayerLeaveDM(playerid, Player[playerid][DM]);
		    OnPlayerEnterDM(playerid,dm, true);
		}
	}
	else if(command_id == 2)
	{
    	tmp = strtok(params, idx);
		format(string,256,"Usage: {FFFFFF}/dm setup [1-%d]", MAX_DMS);
		if(isnull(tmp) || 1 > strval(tmp) > MAX_DMS)
		    return SendClientMessageEx(playerid, COLOR_GREY, string);

		DMSetupID = strval(tmp);

		#if DATA_SYSTEM == 1
			if(!dini_Exists(DMfile(DMSetupID)))
			{
				dini_Create(DMfile(DMSetupID));
			}
		#elseif DATA_SYSTEM == 2
		if(!SqlDMExist(DMSetupID))
		{
		    CreateSqlDM();
			DMSetupID = LatestSqlDM();
			DMWorking[DMSetupID] = true;
		}
		#endif
		SendClientMessageEx(playerid, COLOR_BUILDMODE, "[DM Buildmode]: You may now use /savedm command to setup the chosen DM.");
	}
	else if(command_id == 3)
	{
		new tmp2[256];
		tmp = strtok(params, idx);
		tmp2 = strtok(params, idx);

		format(string,256,"Usage: {FFFFFF}/dm name [1-%d]", MAX_DMS);
		if(isnull(tmp) || 1 > strval(tmp) > 15 || isnull(tmp2))
		    return SendClientMessageEx(playerid, COLOR_GREY, string);


		format(DMName[strval(tmp)],256,"%s",params[6+strlen(tmp)]);

		format(string,256,"[DM Buildmode]: DM %d name set to %s.", strval(tmp), params[6+strlen(tmp)]);
		SendClientMessageEx(playerid, COLOR_YELLOW,string);

		#if DATA_SYSTEM == 1
			format(string,256,"%s",params[6+strlen(tmp)]);
			dini_Set(DMfile(strval(tmp)),"name", string);
		#elseif DATA_SYSTEM == 2
			UpdateSqlDM(strval(tmp), "name", params[6+strlen(tmp)]);
		#endif
	}
	else if(command_id == 4)
	{
		new tmp2[256];
		tmp = strtok(params, idx);
		tmp2 = strtok(params, idx);
		format(string,256,"Usage: {FFFFFF}/dm guns [1-%d] [guns id]", MAX_DMS);
		if(isnull(tmp) || 1 > strval(tmp) > MAX_DMS || isnull(tmp2))
		    return SendClientMessageEx(playerid, COLOR_GREY, string);


		new weapz[256], weaponsname[256], tmp3[256];
		weapz = " ";
		new WeaponsIDs[256];
        new index;

        format(WeaponsIDs,256,"%s",params[5+strlen(tmp2)]);
		if(strval(tmp2) == -1)
		{
			format(string,256,"[DM Buildmode]: DM %d weapons set to random.", strval(tmp));
			SendClientMessageEx(playerid, COLOR_YELLOW, string);
			DMWeapons[strval(tmp)][0] = -1;
            weapz = "-1";
		}
		else
		{
			for(new i = 0; i < 5; i ++)
			{
		        tmp3 = strtok(WeaponsIDs, index);
				if(!IsNumeric(tmp3) || 1 > strval(tmp3) > 45)
				    return SendClientMessageEx(playerid, COLOR_RED, "{FF0000}� Error: {FFFFFF}Invalid Weapon ID.");
			    else
			    {
					format(weapz,256,"%s%f,", weapz, float(strval(tmp3)));
				    DMWeapons[strval(tmp)][i] = strval(tmp3);

					if(strval(tmp3) > 0)
					{
					    new wep[24];
						GetWeaponName(strval(tmp3), wep, 24);
				    	format(weaponsname,256,"%s %s",weaponsname, wep);
					}
				 }
			}
			format(string,256,"[DM Buildmode]: DM %d weapons set to %s.", strval(tmp), weaponsname);
			SendClientMessageEx(playerid, COLOR_YELLOW, string);
		}

		#if DATA_SYSTEM == 1
			dini_Set(DMfile(strval(tmp)),"guns", weapz);
		#elseif DATA_SYSTEM == 2
			UpdateSqlDM(strval(tmp), "weapons", weapz);
		#endif
	}
	return 1;
}

public OnVehicleMod(playerid, vehicleid, componentid)
{
	switch(componentid)
	{
		case 1008..1010: if(IsPlayerInInvalidNosVehicle(playerid)) RemoveVehicleComponent(vehicleid, componentid);
        case 1026..1033, 1138..1142, 1169..1170: if(GetVehicleModel(vehicleid) != 560) RemoveVehicleComponent(vehicleid, componentid);
        case 1034..1041, 1171..1172: if(GetVehicleModel(vehicleid) != 562) RemoveVehicleComponent(vehicleid, componentid);
        case 1042..1044, 1099, 1174..1177: if(GetVehicleModel(vehicleid) != 575) RemoveVehicleComponent(vehicleid, componentid);
        case 1045..1054, 1150..1153: if(GetVehicleModel(vehicleid) != 565) RemoveVehicleComponent(vehicleid, componentid);
        case 1055..1064, 1154..1157: if(GetVehicleModel(vehicleid) != 561) RemoveVehicleComponent(vehicleid, componentid);
        case 1065..1072, 1158..1162, 1173: if(GetVehicleModel(vehicleid) != 559) RemoveVehicleComponent(vehicleid, componentid);
        case 1088..1095, 1163..1168: if(GetVehicleModel(vehicleid) != 558) RemoveVehicleComponent(vehicleid, componentid);
        case 1100..1101, 1106, 1123..1127, 1178..1180, 1185: if(GetVehicleModel(vehicleid) != 534) RemoveVehicleComponent(vehicleid, componentid);
        case 1102, 1129..1133, 1186..1189: if(GetVehicleModel(vehicleid) != 567) RemoveVehicleComponent(vehicleid, componentid);
        case 1103..1105, 1107..1108, 1128, 1181..1184: if(GetVehicleModel(vehicleid) != 536) RemoveVehicleComponent(vehicleid, componentid);
        case 1134..1137, 1190..1193: if(GetVehicleModel(vehicleid) != 576) RemoveVehicleComponent(vehicleid, componentid);
	}
	return 1;
}

forward OnPlayerEnterDM(playerid, dmid,  bool:firsttime);
public OnPlayerEnterDM(playerid, dmid, bool:firsttime)
{
	UpdateDMScoreboards();
    SetTimer("UpdateDMScoreboards", 1000, false);

	if(firsttime)
	{
//		SendClientMessageEx(playerid, COLOR_DMS2, "[DEATHMATCH] You are now in DM mode, you will not play in any rounds. To leave type /leave.");
		new str[200];
		format(str,200,"{700000}[DM] {FFFFFF}\"%s\" {700000}has entered the \"{980000}%s{700000}\" DM {980000}[{FFFFFF}/dm %d{980000}]", PlayerName(playerid), DMName[dmid], dmid);
		SendClientMessageToAllEx(COLOR_WHITE, str);
		Player[playerid][TempDMKills] = 0;
		Player[playerid][TempDMDeaths] = 0;
		Player[playerid][DMKillSpree] = 0;
		TextDrawShowForPlayer(playerid,DMScores[dmid]);
	}

//	Player[playerid][setToPlay] = false;
	Player[playerid][DM] = dmid;

	SetPlayerPos(playerid,  DMCoords[dmid][0]+10-random(10), DMCoords[dmid][1]+10-random(10), DMCoords[dmid][2]+2);
	SetPlayerInterior(playerid, floatround(DMCoords[dmid][7]));

	if(DMCoords[dmid][5] != 0)
		SetPlayerWorldBoundsEx(playerid,DMCoords[dmid][5],DMCoords[dmid][3],DMCoords[dmid][6],DMCoords[dmid][4]);

	SetPlayerVirtualWorld2(playerid, dmid+5);
	ResetPlayerWeapons(playerid);

	if(DMWeapons[dmid][0] == -1)
	{
		GiveRandomWeapons(playerid);
	}
	else
	{
		for(new x = 0; x < 5; x ++)
			if(DMWeapons[dmid][x] != 0) GivePlayerWeaponEx(playerid,DMWeapons[dmid][x],9999);
	}

	SetPlayerColor(playerid, COLOR_DM_PLAYER);
	GangZoneShowForPlayer(playerid, DMZones[dmid], COLOR_DM_ZONE);
	//Player[playerid][setToPlay] = false;
 	return 1;
}

forward OnPlayerLeaveDM(playerid, dmid);
public OnPlayerLeaveDM(playerid, dmid)
{
    UpdateDMScoreboards();
    SetTimer("UpdateDMScoreboards", 1000, false);
	Player[playerid][DM] = 0;
	SetPlayerWorldBoundsEx(playerid,9999.9,-9999.9,9999.9,-9999.9);
	TextDrawHideForPlayer(playerid,DMScores[dmid]);
	GangZoneHideForPlayer(playerid, DMZones[dmid]);

	#if SAMP_VERSION == 2
		StopAudioStreamForPlayerEx(playerid);
	#endif
	
 	return 1;
}

stock SendClientMessageToDMPlayer(dmid, color, str[])
{
	for(new x = 0; x <= Server[HighestID]; x ++)
	{
	    if(IsPlayerConnected(x) && Player[x][DM] == dmid)
	        SendClientMessageEx(x, color, str);
	}
}

LoadDMAreas()
{
	#if DATA_SYSTEM == 1
		Server[ValidDMs] = 0;
		Server[HighestDmID] = 0;
		for(new i = 1; i < MAX_DMS; i++)
		{
		    if (dini_Exists(DMfile(i))) {

		    	Server[ValidDMs] ++;
		 		DMWorking[i] = true;

				if (Server[HighestDmID] < i) {
				    Server[HighestDmID] = i;
				}

		        new string[256];
		        new idx;
		    	string = dini_Get(DMfile(i),"center");
				DMCoords[i][0] = floatstr(strtok(string,idx,','));
				DMCoords[i][1] = floatstr(strtok(string,idx,','));
				DMCoords[i][2] = floatstr(strtok(string,idx,','));
				DMCoords[i][7] = floatstr(strtok(string,idx,','));

				idx = 0;
		    	string = dini_Get(DMfile(i),"min");
				DMCoords[i][3] = floatstr(strtok(string,idx,','));
				DMCoords[i][4] = floatstr(strtok(string,idx,','));

				idx = 0;
		    	string = dini_Get(DMfile(i),"max");
				DMCoords[i][5] = floatstr(strtok(string,idx,','));
				DMCoords[i][6] = floatstr(strtok(string,idx,','));

				idx = 0;
			    string = dini_Get(DMfile(i),"guns");
				DMWeapons[i][0] = floatround(floatstr(strtok(string,idx,',')));
				DMWeapons[i][1] = floatround(floatstr(strtok(string,idx,',')));
				DMWeapons[i][2] = floatround(floatstr(strtok(string,idx,',')));
				DMWeapons[i][3] = floatround(floatstr(strtok(string,idx,',')));
		 		DMWeapons[i][4] = floatround(floatstr(strtok(string,idx,',')));

				DMZones[i] = GangZoneCreate(DMCoords[i][3],DMCoords[i][4],DMCoords[i][5],DMCoords[i][6]);

		    	DMName[i] = dini_Get(DMfile(i),"name");
		    }
		}
	#elseif DATA_SYSTEM == 2
		MySQLCheck();
		new d_count;
		Server[ValidDMs] = 0;
		new query[200];
		format(query, sizeof(query), "SELECT * FROM dc_deathmatch ORDER BY id DESC");
		mysql_query(query);
		Server[HighestDmID] = 0;
		Server[SQLQueriesExecuted]++;
		mysql_store_result();
		new templine[200];
		while(mysql_fetch_row_format(templine, "|"))
		{
			new idx, idx2;
			new id_tmp[256], id;
			new dmname[256], center[256], dmmin[256], dmmax[256], dweapons[256];

			id_tmp = mysql_strtok(templine, idx, "|");
			id = strval(id_tmp);
			dmname = mysql_strtok(templine, idx, "|");
			dmmin = mysql_strtok(templine, idx, "|");
			dmmax = mysql_strtok(templine, idx, "|");
			center = mysql_strtok(templine, idx, "|");
			dweapons = mysql_strtok(templine, idx, "|");

			if (Server[HighestDmID] < id) {
			    Server[HighestDmID] = id;
			}

			DMName[id] = dmname;
            Server[ValidDMs] ++;
		 	DMWorking[id] = true;
            d_count ++;

		 	idx2 = 0;
			DMCoords[id][0] = floatstr(strtok(center,idx2,','));
			DMCoords[id][1] = floatstr(strtok(center,idx2,','));
			DMCoords[id][2] = floatstr(strtok(center,idx2,','));
			DMCoords[id][7] = floatstr(strtok(center,idx2,','));

		 	idx2 = 0;
			DMCoords[id][3] = floatstr(strtok(dmmin,idx2,','));
			DMCoords[id][4] = floatstr(strtok(dmmin,idx2,','));

		 	idx2 = 0;
			DMCoords[id][5] = floatstr(strtok(dmmax,idx2,','));
			DMCoords[id][6] = floatstr(strtok(dmmax,idx2,','));

		 	idx2 = 0;
			DMWeapons[id][0] = floatround(floatstr(strtok(dweapons,idx2,',')));
			DMWeapons[id][1] = floatround(floatstr(strtok(dweapons,idx2,',')));
			DMWeapons[id][2] = floatround(floatstr(strtok(dweapons,idx2,',')));
			DMWeapons[id][3] = floatround(floatstr(strtok(dweapons,idx2,',')));
	 		DMWeapons[id][4] = floatround(floatstr(strtok(dweapons,idx2,',')));
            DMZones[id] = GangZoneCreate(DMCoords[id][3],DMCoords[id][4],DMCoords[id][5],DMCoords[id][6]);
			/*
	 		printf("ID: %d", id);
	 		printf("Name: %s", DuelName[id]);
	 		printf("P1: %s", p1);
	 		printf("P2: %s", p2);
	 		printf("Weapons: %s\n", dweapons);
			*/
		}
	#endif

	printf("  -> %d DMs Loaded", Server[ValidDMs]);
}

GetRatio(a, b) {
	new ratio[10];
	if ((a == 0) && (b > 0)) {
	    format(ratio, 10, "-%d.00", b);
	} else if ((a > 0) && (b == 0)) {
	    format(ratio, 10, "%d.00", a);
	} else if ((a == 0) && (b == 0)) {
	    format(ratio, 10, "0.00");
	} else {
	    format(ratio, 10, "%0.2f", (Float:a/Float:b));
	}
	return ratio;
}

// RemoveClanTagFromName by Weirdosport
stock RemoveClanTagFromName(playerid)
{
    new start, end, string[MAX_PLAYER_NAME];
    format(string, MAX_PLAYER_NAME, "%s", PlayerName(playerid));
    start = strfind(string, "[", true);
    end = strfind(string, "]", true);
    if (start >= end) {
		return string;
    } else {
        strdel(string, start, end + 1);
        return string;
    }
}

stock RemoveClanTagFromNameStr(string[])
{
    new start, end;
    start = strfind(string, "[", true);
    end = strfind(string, "]", true);
    if (start >= end) {
		return string;
    } else {
        strdel(string, start, end + 1);
        return string;
    }
}

// TagDetect by Weirdosport
stock TagDetect(playerid)
{
    new string[MAX_PLAYER_NAME];
    GetPlayerName(playerid, string, sizeof(string));
    if(strfind(string, "]", true) > strfind(string, "[", true)) return 1;
    else return 0;
}

stock StopAllSpectating() {
	for(new i = 0; i <= MAX_PLAYERS; i++)
	{
		StopSpectate(i);
		TogglePlayerSpectating(i, 0);
	}
}

stock GivePlayerWeaponEx(playerid, wep, ammo_) {
	if(!IsValidWeaponID(wep)) return 0;
	GivePlayerWeapon(playerid, wep, ammo_);

	return 1;
}

stock IsPlayerInWater(playerid) {
	new anim = GetPlayerAnimationIndex(playerid);
	if (((anim >=  1538) && (anim <= 1542)) || (anim == 1544) || (anim == 1250) || (anim == 1062)) return 1;
	return 0;
}

stock IsPlayerAimingL(playerid) {
	new anim = GetPlayerAnimationIndex(playerid);
	if (((anim >= 1160) && (anim <= 1163)) || (anim == 1167) || (anim == 1365) || (anim == 1643) || (anim == 1453) || (anim == 220)) return 1;
	return 0;
}


forward HideTeamDamageHome();
public HideTeamDamageHome() {
	TeamInfo[T_HOME][TempDamage] = 0;
	TextDrawHideForAll(home_tdamage);
	return 1;
}

forward HideTeamDamageAway();
public HideTeamDamageAway() {
	TeamInfo[T_AWAY][TempDamage] = 0;
	TextDrawHideForAll(away_tdamage);
	return 1;
}

forward AllowCameraControl(playerid);
public AllowCameraControl(playerid)
{
	Player[playerid][ChosenWeapons] = true;
}

stock IsPlayerInClan(playerid)
{
   if (strfind(PlayerName(playerid), "[", false) == 0 && 5 >= strfind(PlayerName(playerid), "]", false) > 1) {
      return true;
   }
   return false;
}

stock GetPlayerClanTag(playerid)
{
	new clantag[6] = "NA";

	if (strfind(PlayerName(playerid), "[", false) == 0 && 5 >= strfind(PlayerName(playerid), "]", false) > 1)
	  strmid(clantag, PlayerName(playerid), 0, strfind(PlayerName(playerid), "]", false) + 1);

	return clantag;
}

stock ClearMatchRoundInfo()
{
	//SendClientMessageToAllEx(COLOR_RED, "DEBUG: ClearMatchRoundInfo() Called");
	for(new i = 0; i < MAX_ROUND_LIMIT; i++)
	{
		MatchRoundInfo[i][roundtype] = 0;
		MatchRoundInfo[i][roundid] = 0;
		MatchRoundInfo[i][whowon] = 0;
		MatchRoundInfo[i][hpleft] = 0;
		MatchRoundInfo[i][roundkills] = 0;
		MatchRoundInfo[i][rounddeaths] = 0;
		MatchRoundInfo[i][roundwintype] = Round[WinType];

		format(MatchRoundInfo[i][roundtopshotta], 30, "--");
		format(MatchRoundInfo[i][roundend], 30, "--");
		format(MatchRoundInfo[i][roundstart], 30, "--");

		Server[RecentB][i] = 0;
	    Server[RecentT][i] = 0;
	}
	return 1;
}

stock DisplayMatchInfo(playerid, matchid) {
	new dialog_title[256], file[35];
	format(file,35,"combinations/matches/%d.ini", matchid);

	if (!dini_Exists(file)) {
	    return 1;
	}

	format(dialog_title, 256, "{FF0000}%c {7340DB}D.C. Match - %s vs %s [%d-%d-%d] Start: %s | End: %s", 187, dini_Get(file,"home_name"), dini_Get(file,"away_name"), dini_Int(file,"match_day"), dini_Int(file,"match_month"), dini_Int(file,"match_year"), dini_Get(file,"match_start"), dini_Get(file,"match_end"));
	SendClientMessageEx(playerid, COLOR_GREY, dialog_title);
	format(dialog_title, 256, "{FF0000}%c {15D4ED}%s | Score: %d | Kills: %d | Deaths: %d", 187, dini_Get(file,"home_name"), dini_Int(file,"home_roundswon"), dini_Int(file,"home_kills"), dini_Int(file,"home_deaths"));
	SendClientMessageEx(playerid, COLOR_GREYBLUE, dialog_title);
	format(dialog_title, 256, "{FF0000}%c {15D4ED}%s | Score: %d | Kills: %d | Deaths: %d", 187, dini_Get(file,"away_name"), dini_Int(file,"away_roundswon"), dini_Int(file,"away_kills"), dini_Int(file,"away_deaths"));
	SendClientMessageEx(playerid, COLOR_GREYBLUE, dialog_title);

	new r_minfo[40], r_type[40], r_winteam[40], r_wintype[40], r_hpleft, r_top[40], r_start[40], r_end[40];

	for(new i = 1; i <= MAX_ROUND_LIMIT; i++)
	{
	    format(r_minfo, 40, "round%d_type", i);
	    if (dini_Int(file,r_minfo) == 0) {
	        SendClientMessageToAllEx(COLOR_RED, "TEST 1");
	        i = 999999999;
	    } else {
	        SendClientMessageToAllEx(COLOR_RED, "TEST 2");
	        if (dini_Int(file,r_minfo) == 1) {
	            format(r_type, 40, "Base");
	        } else if (dini_Int(file,r_minfo) == 2) {
	            format(r_type, 40, "TDM");
	        }
	        format(r_minfo, 40, "round%d_whowon", i);
	        if (dini_Int(file,r_minfo) == T_HOME) {
	            format(r_winteam, 40, "%s", dini_Get(file,"home_name"));
			} else if (dini_Int(file,r_minfo) == T_AWAY) {
	            format(r_winteam, 40, "%s", dini_Get(file,"away_name"));
			} else {
	            format(r_winteam, 40, "No One!");
			}
			format(r_minfo, 40, "round%d_wintype", i);
	        if (dini_Int(file,r_minfo) == TIME_LIMIT) {
	            format(r_wintype, 40, "Time Limit");
			} else if (dini_Int(file,r_minfo) == CHECKPOINT) {
	            format(r_wintype, 40, "Capture CP");
			} else {
	            format(r_wintype, 40, "Elimination");
			}
			format(r_minfo, 40, "round%d_hpleft", i);
			r_hpleft = dini_Int(file,r_minfo);
			format(r_minfo, 40, "round%d_topshotta", i);
			format(r_top, 40, "%s", dini_Get(file,r_minfo));
			format(r_minfo, 40, "round%d_start", i);
			format(r_start, 40, "%s", dini_Get(file,r_minfo));
			format(r_minfo, 40, "round%d_end", i);
			format(r_end, 40, "%s", dini_Get(file,r_minfo));

			format(dialog_title, 256, "{FF0000}%c {FFFFFF}Round %d | %s | Winner: %s (%s) | HP Left: %d", 187, i, r_type, r_winteam, r_wintype, r_hpleft);
			SendClientMessageEx(playerid, COLOR_GREYBLUE, dialog_title);
			format(dialog_title, 256, "{FF0000}%c {FFFFFF}Round %d | Top Shotta: %s | Start: %s | End: %s", 187, i, r_top, r_start, r_end);
			SendClientMessageEx(playerid, COLOR_GREYBLUE, dialog_title);
		}
	}

	return 1;
}

forward SpawnPlayerEx(playerid);
public SpawnPlayerEx(playerid) {
	RemovePlayerFromVehicle(playerid);
	if(GetPlayerState(playerid) == PLAYER_STATE_SPECTATING) { StopSpectate(playerid); TogglePlayerSpectating(playerid, false); }
	
	SpawnPlayer(playerid);
	return 1;
}

//	<extra>
//		blip-System
#define ALTERNATIVE_BLIP_SYSTEM 1 // 0 - off | 1 - on

#if ALTERNATIVE_BLIP_SYSTEM == 0
#define blipSys:>%0(%1) %0(%1);public%0(%1)
blipSys:> \
	my_lib(id, r, g, b, a)
{
	new
		color = ((((r) & 0xFF) << 24) | (((g) & 0xFF) << 16) | (((b) & 0xFF) << 8) | (((a) & 0xFF) << 0));
	SetPlayerColor(id, color);

  	new blipmsg[200];
	format(blipmsg, 200, "{FFFFFF}%c Changed Blip!", 187);
	SendClientMessageEx(playerid, COLOR_GREY, blipmsg);
}
#elseif ALTERNATIVE_BLIP_SYSTEM == 1
new
	blipColors[3][2] =
	    {
	 // team:  away      , home.
			  {0xC16100FF, 0x39E41BFF}	// gold, neon green
			, {0xFF661CFF, 0x48A4FFFF}	// orange, baby blue
			, {0xFF0080FF, 0x000088FF}	// pink, navy blue
		}
	;
#endif

CMD:blip(playerid, params[])
{
	if (Config[blip] == 0) return SendClientMessageEx(playerid, COLOR_RED, "{FF0000}� Error: {FFFFFF}This command is disabled.");

	#if ALTERNATIVE_BLIP_SYSTEM == 0
	     // #define @<%0> 255<_color[%0]<0
		if(PlayerMatchInfo[playerid][PlayingMatch])
		{
			new
	  			_color[4]
			;
			if (sscanf(params, "dddd", _color[0], _color[1], _color[2], _color[3]))
			{
				SendClientMessageEx(playerid, COLOR_GREY, "Usage: {FFFFFF}/blip [R] [G] [B] [A] (note: RGBA values from 0 to 255)");
			}
			else
			{
				my_lib(playerid, _color[0], _color[1], _color[2], _color[3]);
			}
		}
		else
		{
		    SendClientMessageEx(playerid, COLOR_RED, "{FF0000}� Error: {FFFFFF}You can only use this command while playing a round.");
		}
	#elseif ALTERNATIVE_BLIP_SYSTEM == 1
		if(PlayerMatchInfo[playerid][PlayingMatch])
		{
			new
				var
			;
			if (sscanf(params, "d", var))
			{
				SendClientMessageEx(playerid, COLOR_GREY, "Usage: {FFFFFF}/blip [color number]");
				SendClientMessageEx(playerid, HOME_COLOR, "Home:{FFFFFF} 1: Neon Green - 2: Baby Blue - 3: Navy Blue");
				SendClientMessageEx(playerid, AWAY_COLOR, "Away:{FFFFFF} 1: Gold - 2: Orange - 3: Pink");
			}
			else
			{
				switch(var)
				{
				    case 1:
				    {
				        if(Player[playerid][pTeam] == T_AWAY)
				        {
				        	SetPlayerColor(playerid, blipColors[0][0]);
				        	new blipmsg[200];
				        	format(blipmsg, 200, "{FFFFFF}%c {37DB45}Changed Blip: {D4A017}Gold", 187);
				        	SendClientMessageEx(playerid, COLOR_GREY, blipmsg);

						}
				        if(Player[playerid][pTeam] == T_HOME)
				        {
				        	SetPlayerColor(playerid, blipColors[0][1]);
				        	new blipmsg[200];
				        	format(blipmsg, 200, "{FFFFFF}%c {37DB45}Changed Blip: {41A317}Neon Green", 187);
				        	SendClientMessageEx(playerid, COLOR_GREY, blipmsg);
						}
				    }
				    case 2:
				    {
				        if(Player[playerid][pTeam] == T_AWAY)
				        {
				        	SetPlayerColor(playerid, blipColors[1][0]);
				        	new blipmsg[200];
				        	format(blipmsg, 200, "{FFFFFF}%c {37DB45}Changed Blip: {F88017}Orange", 187);
				        	SendClientMessageEx(playerid, COLOR_GREY, blipmsg);
						}
				        if(Player[playerid][pTeam] == T_HOME)
				        {
				        	SetPlayerColor(playerid, blipColors[1][1]);
				        	new blipmsg[200];
				        	format(blipmsg, 200, "{FFFFFF}%c {37DB45}Changed Blip: {BDEDFF}Baby Blue", 187);
				        	SendClientMessageEx(playerid, COLOR_GREY, blipmsg);
						}
				    }
				    case 3:
				    {
				        if(Player[playerid][pTeam] == T_AWAY)
				        {
				        	SetPlayerColor(playerid, blipColors[2][0]);
				        	new blipmsg[200];
				        	format(blipmsg, 200, "{FFFFFF}%c {37DB45}Changed Blip: {F52887}Pink", 187);
				        	SendClientMessageEx(playerid, COLOR_GREY, blipmsg);
						}
				        if(Player[playerid][pTeam] == T_HOME)
				        {
				        	SetPlayerColor(playerid, blipColors[2][1]);
				        	new blipmsg[200];
				        	format(blipmsg, 200, "{FFFFFF}%c {37DB45}Changed Blip: {153E7E}Navy Blue", 187);
				        	SendClientMessageEx(playerid, COLOR_GREY, blipmsg);
						}
				    }
				    default:
				    {
				        SendClientMessageEx(playerid, COLOR_RED, "{FF0000}� Error: {FFFFFF}You can only select color numbers between 1-3.");
				    }
				}
			}
		}
		else
		{
		    SendClientMessageEx(playerid, COLOR_RED, "{FF0000}� Error: {FFFFFF}You can only use this command while playing a round.");
		}
	#endif
	return 1;
}

/*----------------------------------------------------------------------------*-
Function:
	sscanf
Params:
	string[] - String to extract parameters from.
	format[] - Parameter types to get.
	{Float,_}:... - Data return variables.
Return:
	0 - Successful, not 0 - fail.
Notes:
	A fail is either insufficient variables to store the data or insufficient
	data for the format string - excess data is disgarded.

	A string in the middle of the input data is extracted as a single word, a
	string at the end of the data collects all remaining text.

	The format codes are:

	c - A character.
	d, i - An integer.
	h, x - A hex number (e.g. a colour).
	f - A float.
	s - A string.
	z - An optional string.
	pX - An additional delimiter where X is another character.
	'' - Encloses a litteral string to locate.
	u - User, takes a name, part of a name or an id and returns the id if they're connected.

	Now has IsNumeric integrated into the code.

	Added additional delimiters in the form of all whitespace and an
	optioanlly specified one in the format string.
-*----------------------------------------------------------------------------*/

stock sscanf(string[], format[], {Float,_}:...)
{
	#if defined isnull
		if (isnull(string))
	#else
		if (string[0] == 0 || (string[0] == 1 && string[1] == 0))
	#endif
		{
			return format[0];
		}
	#pragma tabsize 4
	new
		formatPos = 0,
		stringPos = 0,
		paramPos = 2,
		paramCount = numargs(),
		delim = ' ';
	while (string[stringPos] && string[stringPos] <= ' ')
	{
		stringPos++;
	}
	while (paramPos < paramCount && string[stringPos])
	{
		switch (format[formatPos++])
		{
			case '\0':
			{
				return 0;
			}
			case 'i', 'd':
			{
				new
					neg = 1,
					num = 0,
					ch = string[stringPos];
				if (ch == '-')
				{
					neg = -1;
					ch = string[++stringPos];
				}
				do
				{
					stringPos++;
					if ('0' <= ch <= '9')
					{
						num = (num * 10) + (ch - '0');
					}
					else
					{
						return -1;
					}
				}
				while ((ch = string[stringPos]) > ' ' && ch != delim);
				setarg(paramPos, 0, num * neg);
			}
			case 'h', 'x':
			{
				new
					num = 0,
					ch = string[stringPos];
				do
				{
					stringPos++;
					switch (ch)
					{
						case 'x', 'X':
						{
							num = 0;
							continue;
						}
						case '0' .. '9':
						{
							num = (num << 4) | (ch - '0');
						}
						case 'a' .. 'f':
						{
							num = (num << 4) | (ch - ('a' - 10));
						}
						case 'A' .. 'F':
						{
							num = (num << 4) | (ch - ('A' - 10));
						}
						default:
						{
							return -1;
						}
					}
				}
				while ((ch = string[stringPos]) > ' ' && ch != delim);
				setarg(paramPos, 0, num);
			}
			case 'c':
			{
				setarg(paramPos, 0, string[stringPos++]);
			}
			case 'f':
			{

				new changestr[16], changepos = 0, strpos = stringPos;
				while(changepos < 16 && string[strpos] && string[strpos] != delim)
				{
					changestr[changepos++] = string[strpos++];
    				}
				changestr[changepos] = '\0';
				setarg(paramPos,0,_:floatstr(changestr));
			}
			case 'p':
			{
				delim = format[formatPos++];
				continue;
			}
			case '\'':
			{
				new
					end = formatPos - 1,
					ch;
				while ((ch = format[++end]) && ch != '\'') {}
				if (!ch)
				{
					return -1;
				}
				format[end] = '\0';
				if ((ch = strfind(string, format[formatPos], false, stringPos)) == -1)
				{
					if (format[end + 1])
					{
						return -1;
					}
					return 0;
				}
				format[end] = '\'';
				stringPos = ch + (end - formatPos);
				formatPos = end + 1;
			}
			case 'u':
			{
				new
					end = stringPos - 1,
					id = 0,
					bool:num = true,
					ch;
				while ((ch = string[++end]) && ch != delim)
				{
					if (num)
					{
						if ('0' <= ch <= '9')
						{
							id = (id * 10) + (ch - '0');
						}
						else
						{
							num = false;
						}
					}
				}
				if (num && IsPlayerConnected(id))
				{
					setarg(paramPos, 0, id);
				}
				else
				{
					#if !defined foreach
						#define foreach(%1,%2) for (new %2 = 0; %2 < MAX_PLAYERS; %2++) if (IsPlayerConnected(%2))
						#define __SSCANF_FOREACH__
					#endif
					string[end] = '\0';
					num = false;
					new
						name[MAX_PLAYER_NAME];
					id = end - stringPos;
					foreach (Player, playerid)
					{
						GetPlayerName(playerid, name, sizeof (name));
						if (!strcmp(name, string[stringPos], true, id))
						{
							setarg(paramPos, 0, playerid);
							num = true;
							break;
						}
					}
					if (!num)
					{
						setarg(paramPos, 0, INVALID_PLAYER_ID);
					}
					string[end] = ch;
					#if defined __SSCANF_FOREACH__
						#undef foreach
						#undef __SSCANF_FOREACH__
					#endif
				}
				stringPos = end;
			}
			case 's', 'z':
			{
				new
					i = 0,
					ch;
				if (format[formatPos])
				{
					while ((ch = string[stringPos++]) && ch != delim)
					{
						setarg(paramPos, i++, ch);
					}
					if (!i)
					{
						return -1;
					}
				}
				else
				{
					while ((ch = string[stringPos++]))
					{
						setarg(paramPos, i++, ch);
					}
				}
				stringPos--;
				setarg(paramPos, i, '\0');
			}
			default:
			{
				continue;
			}
		}
		while (string[stringPos] && string[stringPos] != delim && string[stringPos] > ' ')
		{
			stringPos++;
		}
		while (string[stringPos] && (string[stringPos] == delim || string[stringPos] <= ' '))
		{
			stringPos++;
		}
		paramPos++;
	}
	do
	{
		if ((delim = format[formatPos++]) > ' ')
		{
			if (delim == '\'')
			{
				while ((delim = format[formatPos++]) && delim != '\'') {}
			}
			else if (delim != 'z')
			{
				return delim;
			}
		}
	}
	while (delim > ' ');
	return 0;
}
//	</extra>

stock IsPlayerInInvalidNosVehicle(playerid)
{
	new vehicleid = GetPlayerVehicleID(playerid);
	#define MAX_INVALID_NOS_VEHICLES 52
	new InvalidNosVehicles[MAX_INVALID_NOS_VEHICLES] =
	{
		581,523,462,521,463,522,461,448,468,586,417,425,469,487,512,520,563,593,
		509,481,510,472,473,493,520,595,484,430,453,432,476,497,513,533,577,
		452,446,447,454,590,569,537,538,570,449,519,460,488,511,519,548,592
	};
	if(IsPlayerInAnyVehicle(playerid))
 	{
		for(new i = 0; i < MAX_INVALID_NOS_VEHICLES; i++)
		{
			if(GetVehicleModel(vehicleid) == InvalidNosVehicles[i]) return true;
		}
	}
	return false;
}

stock IsInInvalidNosVehicle(vehicleid)
{
	#define MAX_INVALID_NOS_VEHICLES 52
	new InvalidNosVehicles[MAX_INVALID_NOS_VEHICLES] =
	{
		581,523,462,521,463,522,461,448,468,586,417,425,469,487,512,520,563,593,
		509,481,510,472,473,493,520,595,484,430,453,432,476,497,513,533,577,
		452,446,447,454,590,569,537,538,570,449,519,460,488,511,519,548,592
	};
	for(new i = 0; i < MAX_INVALID_NOS_VEHICLES; i++)
	{
		if(GetVehicleModel(vehicleid) == InvalidNosVehicles[i]) return true;
	}
 	return false;
}

forward UpdateDMScoreboards();
public UpdateDMScoreboards() {
	new bool:DidTheMath[MAX_DMS] = false;
	new bool:counted[MAX_PLAYERS] = false;
	for (new i = 0; i <= Server[HighestID]; i++)
	{
		if(IsPlayerConnected(i))
		{
			if(Player[i][DM] != 0)
		    {
				//Player[i][DMPlayTime] ++;
				new dm = Player[i][DM];
				new dmscore[1024];
		        if(DidTheMath[dm] == false)
		        {
		            format(dmscore,1024," ~b~~h~%s Scoreboard: ~n~", DMName[dm]);
		    		new divisor = 8;
					TallyExpPerGang(dm);
					DidTheMath[dm] = true;

					for(new x=0;x < divisor;x++)
					{
    					if(IsPlayerConnected(TopTeamList[dm][x][Team]) && counted[TopTeamList[dm][x][Team]] == false)// && TopTeamList[i][Exp] > 0)
						{
					        new pid = TopTeamList[dm][x][Team];
						    if (Player[pid][DM] == dm) {
					        	counted[pid] = true;
								format(dmscore, 1024, " %s~n~~w~%s ~g~- ~y~Kills: ~w~%d",dmscore, RemoveClanTagFromName(pid), Player[pid][TempDMKills]);
							}
						}
					}
					TextDrawSetString(DMScores[dm], dmscore);
				}
			}
		}
	}
	#pragma unused DidTheMath
	#pragma unused counted
	return 1;
}

HideSpecTD(playerid) {

	if(IsPlayerConnected(Player[playerid][gSpectateID])) TextDrawHideForPlayer(playerid,Player[Player[playerid][gSpectateID]][SpecText]);
	TextDrawHideForPlayer(playerid,WideScreenUp);
	TextDrawHideForPlayer(playerid,WideScreenDown);
	TextDrawHideForPlayer(playerid,specweps1);
	TextDrawHideForPlayer(playerid,specweps2);
	TextDrawHideForPlayer(playerid,specweps4);
	TextDrawHideForPlayer(playerid,specweps5[playerid]);
	TextDrawHideForPlayer(playerid,specfps[playerid]);
	return 1;
}

new unpausetimer = -1;

stock PauseRound(autopause_) {
    Round[Paused] = autopause_;
 	for(new i = 0; i <= Server[HighestID]; i ++)
	{
	    if(IsPlayerConnected(i) && Player[i][pPlaying] == true && (Player[i][pTeam] == T_AWAY || Player[i][pTeam] == T_HOME))
	    {
	        GameTextForPlayer(i, "~r~ [] ROUND PAUSED[]", 3000, 3);
	        
	        //if(GetPlayerState(i) == PLAYER_STATE_ONFOOT) { cmd_d(i, "3"); cmd_d(i, "9999"); }
	        TogglePlayerControllable(i,false);
	        
	        #if defined SOUND_PAUSED
	    	if (IsPlayerConnected(i) && ConfigAudio[sndPaused] == true) {
				PlayAudioStreamForPlayerExEx(i, SOUND_PAUSED);
			}
			#endif
		}
	}
	if(autopause_ == 2) unpausetimer = SetTimerEx("StartUnpause", 1000, 0, "d", 120);
	return 1;
}
forward StartUnpause(idx);
public StartUnpause(idx) {

	if(idx < 4 && idx > -1) {
	    new string[30];
	    if(idx != 0) format(string, sizeof(string), "~r~ Resuming in ~g~%d", idx);
	    else format(string, sizeof(string), "~g~[] ROUND UNPAUSED []");
		for(new i; i <= Server[HighestID]; ++i) if(IsPlayerConnected(i) && Player[i][pPlaying] == true) {
		    GameTextForPlayer(i, string, 1200, 3);
		    #if defined SOUND_PAUSED
	    	if (IsPlayerConnected(i)) {
				StopAudioStreamForPlayerEx(i);
			}
			#endif
		    if(idx == 0) {
				SetPlayerSpecialAction(i, 0);
				TogglePlayerControllable(i,true);
				PlayerPlaySound(i,1057,0.0,0.0,0.0);
				Round[Paused] = 0;
				continue;
			}
		    PlayerPlaySound(i,1056,0.0,0.0,0.0);
		}
	}
	if(idx == 0) { unpausetimer = -1; Round[Paused] = 0; return 1; } // have a check just incase
	KillTimer(unpausetimer);
	unpausetimer = SetTimerEx("StartUnpause", 1000, 0, "d", idx-1);
	return 1;
}

stock ResetScores() {

    Server[PartialRounds] = 0;
    ClearMatchRoundInfo();
	BeyondDiscon_Clear();

 	TeamInfo[T_AWAY][TotalKills] = 0;
	TeamInfo[T_AWAY][TotalDeaths] = 0;
	TeamInfo[T_HOME][TotalKills] = 0;
	TeamInfo[T_HOME][TotalDeaths] = 0;

	TeamInfo[T_AWAY][RoundKills] = 0;
	TeamInfo[T_AWAY][RoundDeaths] = 0;
	TeamInfo[T_HOME][RoundKills] = 0;
	TeamInfo[T_HOME][RoundDeaths] = 0;
	TeamInfo[T_AWAY][Won] = false;
	TeamInfo[T_HOME][Won] = false;
	TeamInfo[T_AWAY][CapturedCP] = false;
	TeamInfo[T_HOME][CapturedCP] = false;
	TeamInfo[T_AWAY][TimeLimitedReached] = false;
	TeamInfo[T_HOME][TimeLimitedReached] = false;

	for(new i = 0; i <= Server[HighestID]; i++)
	{
   		if(IsPlayerConnected(i))
		{
			Player[i][pScore] = 0;
		    SetPlayerScore(i,0);
			PlayerMatchInfo[i][TotalDeaths] = 0;
			PlayerMatchInfo[i][TotalKills] = 0;
			PlayerMatchInfo[i][RoundDeaths] = 0;
			PlayerMatchInfo[i][RoundKills] = 0;
			PlayerMatchInfo[i][Died] = false;
			PlayerMatchInfo[i][PlayingMatch] = false;
			PlayerMatchInfo[i][StartedPlaying] = false;
		}
	}
	MatchInfo[HomeRoundsWon]  = 0, MatchInfo[AwayRoundsWon] = 0, MatchInfo[RoundsPlayed] = 0, MatchInfo[TotalScoreHome] = 0, MatchInfo[TotalScoreAway] = 0;
}

stock DetermineRandomBase(mode=0, ignore=0) {
 	new baseid, totaltimes=0;
   	Redo:
   	totaltimes++;
   	if(totaltimes > MAX_BASES * MAX_ARENAS) return -1;
 	if(mode == 1) { // start ONLY an interior base.
 	    baseid = random(Server[TotalBases]);
 	    if(BaseVariables[baseid][Interior] == 0) goto Redo;
 	}
 	else if(mode == 2) { // start ONLY an exterior base
 	    baseid = random(Server[TotalBases]);
 	    if(BaseVariables[baseid][Interior] != 0) goto Redo;
 	}

 	if(mode == 0) baseid = random(Server[TotalBases]);
 	for(new i=0; i < Server[RoundLimit]; ++i) {

 	    if(baseid == Server[RecentB][i] && ignore != 1) goto Redo;
 	}
	return baseid;
}

stock SetRecentBase(baseid) {
    new number, settttt=0;
	for(new j=0; j < Server[RoundLimit]; ++j) {
		if(Server[RecentB][j] == 0 && settttt != 1) {
	        Server[RecentB][j] = baseid;
	        settttt = 1;
	    }

	    if(Server[RecentB][j] != 0) number++;
	    if(number > Server[RoundLimit] && j == Server[RoundLimit]-1) {
			for(new i=0; i <= Server[RoundLimit]; ++i) {
	            Server[RecentB][i] = Server[RecentB][i+1];
	        }
		}
	}
}

stock DetermineRandomTDM(mode=0, ignore=0) {
 	new baseid, totaltimes=0;
   	Redo:
   	totaltimes++;
   	if(totaltimes > MAX_BASES * MAX_ARENAS) return -1;
 	if(mode == 1) { // start ONLY an interior tdm.
 	    baseid = random(Server[TotalTDMs]);
 	    if(ArenaVariables[baseid][Interior] == 0) goto Redo;
 	}
 	else if(mode == 2) { // start ONLY an exterior tdm
 	    baseid = random(Server[TotalTDMs]);
 	    if(ArenaVariables[baseid][Interior] != 0) goto Redo;
 	}

 	if(mode == 0) baseid = random(Server[TotalTDMs]);
 	for(new i=0; i < Server[RoundLimit]; ++i) {

 	    if(baseid == Server[RecentT][i] && ignore != 1) goto Redo;
 	}
	return baseid;
}

stock SetRecentTDM(baseid) {
	new number, settttt=0;
	for(new j=0; j < Server[RoundLimit]; ++j) {
		if(Server[RecentT][j] == 0 && settttt != 1) {
	        Server[RecentT][j] = baseid;
	        settttt = 1;
	    }

	    if(Server[RecentT][j] != 0) number++;
	    if(number > Server[RoundLimit] && j == Server[RoundLimit]-1) {
			for(new i=0; i <= Server[RoundLimit]; ++i) {
	            Server[RecentT][i] = Server[RecentT][i+1];
	        }
		}
	}
}

#if SAMP_VERSION == 2
stock ShowAudioConfig(playerid) {
	new aconfig[1256];
	new aconfig1[100];

	if (ConfigAudio[sndVoiceMsgs] == true) {
		format(aconfig1, 100, "���� �޽���                                              {33FF33}Ȱ��ȭ\r\n");
	} else {
		format(aconfig1, 100, "���� �޽���                                              {800000}��Ȱ��ȭ\r\n");
	}

	format(aconfig, 1256, "%s", aconfig1);

	if (ConfigAudio[sndChoppers] == true) {
		format(aconfig1, 100, "�︮���� ����                                           {33FF33}Ȱ��ȭ\r\n---------- \r\n");
	} else {
		format(aconfig1, 100, "�︮���� ����                                           {800000}��Ȱ��ȭ\r\n---------- \r\n");
	}

	format(aconfig, 1256, "%s%s", aconfig, aconfig1);

	if (ConfigAudio[sndVehicleRadio] == true) {
		format(aconfig1, 100, "���� ����                                    {33FF33}Ȱ��ȭ\r\n---------- \r\n");
	} else {
		format(aconfig1, 100, "���� ����                                    {800000}��Ȱ��ȭ\r\n---------- \r\n");
	}

	format(aconfig, 1256, "%s%s", aconfig, aconfig1);

	if (ConfigAudio[sndFirstBlood] == true) {
		format(aconfig1, 100, "����: First Blood                                          {33FF33}Ȱ��ȭ\r\n");
	} else {
		format(aconfig1, 100, "����: First Blood                                          {800000}��Ȱ��ȭ\r\n");
	}

	format(aconfig, 1256, "%s%s", aconfig, aconfig1);

	if (ConfigAudio[sndGotKill] == true) {
		format(aconfig1, 100, "����: Got Kill                                                {33FF33}Ȱ��ȭ\r\n");
	} else {
		format(aconfig1, 100, "����: Got Kill                                                {800000}��Ȱ��ȭ\r\n");
	}

	format(aconfig, 1256, "%s%s", aconfig, aconfig1);

	if (ConfigAudio[sndGotKilled] == true) {
		format(aconfig1, 100, "����: Got Killed                                            {33FF33}Ȱ��ȭ\r\n");
	} else {
		format(aconfig1, 100, "����: Got Killed                                            {800000}��Ȱ��ȭ\r\n");
	}

	format(aconfig, 1256, "%s%s", aconfig, aconfig1);

	if (ConfigAudio[sndRoundStarting] == true) {
		format(aconfig1, 100, "����: Round Starting                                   {33FF33}Ȱ��ȭ\r\n");
	} else {
		format(aconfig1, 100, "����: Round Starting                                   {800000}��Ȱ��ȭ\r\n");
	}

	format(aconfig, 1256, "%s%s", aconfig, aconfig1);

	if (ConfigAudio[sndRoundStarted] == true) {
		format(aconfig1, 100, "����: Round Started                                    {33FF33}Ȱ��ȭ\r\n");
	} else {
		format(aconfig1, 100, "����: Round Started                                    {800000}��Ȱ��ȭ\r\n");
	}

	format(aconfig, 1256, "%s%s", aconfig, aconfig1);

	if (ConfigAudio[sndKillSpree] == true) {
		format(aconfig1, 100, "����: Kill Spree                                            {33FF33}Ȱ��ȭ\r\n");
	} else {
		format(aconfig1, 100, "����: Kill Spree                                            {800000}��Ȱ��ȭ\r\n");
	}

	format(aconfig, 1256, "%s%s", aconfig, aconfig1);

	if (ConfigAudio[sndDuel] == true) {
		format(aconfig1, 100, "����: Duel                                                     {33FF33}Ȱ��ȭ\r\n");
	} else {
		format(aconfig1, 100, "����: Duel                                                     {800000}��Ȱ��ȭ\r\n");
	}

	format(aconfig, 1256, "%s%s", aconfig, aconfig1);

	if (ConfigAudio[sndPaused] == true) {
		format(aconfig1, 100, "����: Paused                                                {33FF33}Ȱ��ȭ\r\n");
	} else {
		format(aconfig1, 100, "����: Paused                                                {800000}��Ȱ��ȭ\r\n");
	}

	format(aconfig, 1256, "%s%s", aconfig, aconfig1);

	if (ConfigAudio[sndFinalResults] == true) {
		format(aconfig1, 100, "����: Final Results                                      {33FF33}Ȱ��ȭ\r\n");
	} else {
		format(aconfig1, 100, "����: Final Results                                      {800000}��Ȱ��ȭ\r\n");
	}

	format(aconfig, 1256, "%s%s", aconfig, aconfig1);

	if (ConfigAudio[sndIntro] == true) {
		format(aconfig1, 100, "����: Intro                                                     {33FF33}Ȱ��ȭ\r\n");
	} else {
		format(aconfig1, 100, "����: Intro                                                     {800000}��Ȱ��ȭ\r\n");
	}

	format(aconfig, 1256, "%s%s", aconfig, aconfig1);

	if (ConfigAudio[sndClassSelect] == true) {
		format(aconfig1, 100, "����: Class Selection                                   {33FF33}Ȱ��ȭ\r\n");
	} else {
		format(aconfig1, 100, "����: Class Selection                                   {800000}��Ȱ��ȭ\r\n");
	}

	format(aconfig, 1256, "%s%s", aconfig, aconfig1);



	ShowPlayerDialog(playerid, 7, DIALOG_STYLE_LIST, "D.C. ����� ����", aconfig, "Ȯ��","���");
}
#endif

stock GetWeaponNameEx(weaponid) {
	new wep[MAX_PLAYER_NAME];
	GetWeaponName(weaponid, wep, sizeof(wep));
	return wep;
}

forward ResetAFKLabel(playerid);
public ResetAFKLabel(playerid) {
    Update3DTextLabelText(Player[playerid][AFKLabel], COLOR_ORANGE, " ");
}

forward ResetDmgLabel(playerid);
public ResetDmgLabel(playerid) {
    Update3DTextLabelText(Player[playerid][DmgLabel], COLOR_WHITE, " ");
}

forward SetPlayerSkinEx(playerid);
public SetPlayerSkinEx(playerid) {
    return SetPlayerSkin(playerid, GetCurrentSkin(playerid));
}


/*
SendSpecDebug(playerid) {
	new specdebug[128];
	if (Player[playerid][Specing] == true) {
	    format(specdebug, 128, "Player[playerid][Specing] = true");
	} else {
	    format(specdebug, 128, "Player[playerid][Specing] = false");
	}
	SendClientMessageEx(playerid, COLOR_GREY, specdebug);
	format(specdebug, 128, "Player[playerid][gSpectateID] = %d", Player[playerid][gSpectateID]);
	SendClientMessageEx(playerid, COLOR_GREY, specdebug);
}
*/

#if SAMP_VERSION == 2

public OnPlayerTakeDamage(playerid, issuerid, Float: amount, weaponid)
{
	if(GetPlayerTeam(playerid) == GetPlayerTeam(issuerid)) return 1;
	
	if (Player[issuerid][pTeam] == T_REF && Round[Current] != -1 && Player[playerid][pPlaying]) {
	    // they are ref and damaged a playing player in round
		SetPlayerHealth(issuerid, 0);
	}

	amount = Player[playerid][IJustLost];
    new Float:armour, Float:health;
    GetPlayerHealth(playerid, health);
    GetPlayerArmour(playerid, armour);
    if(Round[Current] != -1 && Player[playerid][pPlaying] == true && Player[issuerid][pPlaying] == true) {
        Player[issuerid][Damage] = Player[issuerid][Damage] + floatround(amount);
    }
    if(IsPlayerConnected(issuerid)) PlayerPlaySound(issuerid, 17802, 0.0, 0.0, 0.0);

    return 1;
}

forward PlayAudioStreamForPlayerExEx(playerid, url[]);
public PlayAudioStreamForPlayerExEx(playerid, url[]) {
	Player[playerid][IsAudioStreaming] = true;
	PlayAudioStreamForPlayer(playerid, url);
}

forward StopAudioStreamForPlayerEx(playerid);
public StopAudioStreamForPlayerEx(playerid) {
	Player[playerid][IsAudioStreaming] = false;
	StopAudioStreamForPlayer(playerid);
}


#endif

new VehicleSeats[] = {
4,2,2,2,4,4,1,2,2,4,2,2,2,4,2,2,4,2,4,2,4,4,2,2,2,1,4,4,4,2,1,500,1,2,2,0,2,500,4,2,4,1,2,2,2,4,1,2,
1,0,0,2,1,1,1,2,2,2,4,4,2,2,2,2,1,1,4,4,2,2,4,2,1,1,2,2,1,2,2,4,2,1,4,3,1,1,1,4,2,2,4,2,4,1,2,2,2,4,
4,2,2,1,2,2,2,2,2,4,2,1,1,2,1,1,2,2,4,2,2,1,1,2,2,2,2,2,2,2,2,4,1,1,1,2,2,2,2,500,500,1,4,2,2,2,2,2,
4,4,2,2,4,4,2,1,2,2,2,2,2,2,4,4,2,2,1,2,4,4,1,0,0,1,1,2,1,2,2,1,2,4,4,2,4,1,0,4,2,2,2,2,0,0,500,2,2,
1,4,4,4,2,2,2,2,2,4,2,0,0,0,4,0,0};

GetVehicleMaxSeats(vehicleid) return VehicleSeats[(GetVehicleModel(vehicleid) - 400)];
/*
stock GetPlayerCountry(playerid, string[], const len = sizeof(string)) {
	new str[170];
	if (dini_Exists(GeoIP_MainFile) && dini_Exists(GeoIP_CityFile)) {
		geoip_db = db_open(GeoIP_MainFile);
		geoip_city = db_open(GeoIP_CityFile);
	    new ip[24];
		GetPlayerIp(playerid, ip, sizeof(ip));
		new tmp[90];
		tmp = ip2long(ip);
		GeoIP[playerid][Country] = GetPlayerCountry_Real(tmp);-
		strcat(str, GeoIP[playerid][Country]);
		db_close(geoip_db);
		db_close(geoip_city);
	} else {
		format(str, sizeof(str), "Unknown");
	}
	return str;
}

stock GetPlayerISP(playerid, string[], const len = sizeof(string)) {
	new str[170];
	if (dini_Exists(GeoIP_MainFile) && dini_Exists(GeoIP_CityFile)) {
		geoip_db = db_open(GeoIP_MainFile);
		geoip_city = db_open(GeoIP_CityFile);
		new ip[24];
		GetPlayerIp(playerid, ip, sizeof(ip));
		new tmp[90];
		tmp = ip2long(ip);
		GeoIP[playerid][ISP] = GetPlayerISP_Real(tmp);
		new placeholder[1];
	    sscanf(GeoIP[playerid][ISP], "ss", placeholder, str);
	    GeoIP[playerid][ISP] = str;
		format(str, sizeof(str), "%s", GeoIP[playerid][ISP]);
		db_close(geoip_db);
		db_close(geoip_city);
	} else {
		format(str, sizeof(str), "Unknown");
	}
    return str;
}

stock GetPlayerCity(playerid, string[], const len = sizeof(string)) {
	new str[170];
	if (dini_Exists(GeoIP_MainFile) && dini_Exists(GeoIP_CityFile)) {
		geoip_db = db_open(GeoIP_MainFile);
		geoip_city = db_open(GeoIP_CityFile);
		new ip[24];
		GetPlayerIp(playerid, ip, sizeof(ip));
		new tmp[90];
		tmp = ip2long(ip);
		GeoIP[playerid][City] = GetPlayerCity_Real(tmp);
		format(str, sizeof(str), "%s", GeoIP[playerid][City]);
		db_close(geoip_db);
		db_close(geoip_city);
	} else {
		format(str, sizeof(str), "Unknown");
	}
	return str;
}

stock GetPlayerCountry_Real(ip[]) {
	new string[170], string2[170];
	format(string, sizeof(string), "SELECT cn FROM ip_country WHERE ip_to >= %s LIMIT 1", ip);
	//format(string, sizeof(string), "SELECT cn FROM ip_country WHERE %s >= ip_from AND %s <= ip_to LIMIT 1", ip, ip);
	new DBResult:result;
    result = db_query(geoip_db, string);
    if(db_num_rows(result) >= 1)
    {
  		db_get_field_assoc(result,"cn",string2,sizeof(string2));
    }
    db_free_result(result);
	return string2;
}

stock GetPlayerISP_Real(ip[]) {
	new string[256], string2[170];

	format(string, sizeof(string), "SELECT internet_service_provider FROM geo_isp WHERE ip_to >= %s LIMIT 1", ip);

	new DBResult:result;
    result = db_query(geoip_db, string);
    if(db_num_rows(result) >= 1)
    {
        db_get_field_assoc(result,"internet_service_provider",string2,sizeof(string2));
    }
    db_free_result(result);
	return string2;
}

stock GetPlayerCity_Real(ip[]) {
	new string[500], string2[170];
	new DBResult:result;

	format(string, sizeof(string), "SELECT loc.*\n FROM geolocation loc,\n geoblocks blk\n WHERE blk.idx = (%s-(%s %c 65536))\n AND blk.startIpNum < %s\n AND blk.endIpNum > %s\n AND loc.locId = blk.locId;", ip, ip, 293, ip, ip);

    //printf(string);
    result = db_query(geoip_city, string);
    if(db_num_rows(result) >= 1)
    {
        db_get_field_assoc(result,"city",string2,sizeof(string2));
    }
    db_free_result(result);

	return string2;
}*/

new DBResult:dbresult;

stock GetPlayerCountry(playerid, string[], const len = sizeof(string)) {
    new ip[24];
    GetPlayerIp(playerid, ip, sizeof(ip));

    GetIPCountry(ip, string, len);

    return true;
}

stock GetPlayerISP(playerid, string[], const len = sizeof(string)) {
    new ip[24];
    GetPlayerIp(playerid, ip, sizeof(ip));

    GetIPISP(ip, string, len);
    new placeholder[1];
    sscanf(string, "ss", placeholder, string);

    return true;
}

stock GetPlayerCity(playerid, string[], const len = sizeof(string)) {
    new ip[24];
    GetPlayerIp(playerid, ip, sizeof(ip));

    GetIPCity(ip, string, len);

    return true;
}

stock GetIPCountry(ip[], dest[], const len = sizeof(dest)) {
    new tmp[90];
    tmp = ip2long(ip);
    

    new string[500];
    format(string, sizeof(string), "SELECT cn FROM ip_country WHERE idx >= (%s-(%s %% 65536)) AND ip_to >= %s AND  ip_from < %s LIMIT 1", tmp, tmp, tmp, tmp);

    geoip_db = db_open(GeoIP_MainFile);
    dbresult = db_query(geoip_db, string);
    if(db_num_rows(dbresult) >= 1)
    {
        db_get_field_assoc(dbresult,"cn",dest,len);
    }
    db_free_result(dbresult);
    db_close(geoip_db);

    if(!strlen(dest)) format(dest, len, "Unknown");

    return true;
}

stock GetIPISP(ip[], dest[], const len = sizeof(dest)) {
    new tmp[90];
    tmp = ip2long(ip);

    new string[500];
    format(string, sizeof(string), "SELECT internet_service_provider FROM geo_isp WHERE idx >= (%s-(%s %% 65536)) AND ip_to >= %s AND  ip_from < %s LIMIT 1", tmp, tmp, tmp, tmp);

    geoip_db = db_open(GeoIP_MainFile);
    dbresult = db_query(geoip_db, string);
    if(db_num_rows(dbresult) >= 1)
    {
        db_get_field_assoc(dbresult,"internet_service_provider",dest,len);
    }
    db_free_result(dbresult);
    db_close(geoip_db);

    if(!strlen(dest)) format(dest, len, "Unknown");

    return true;
}

stock GetIPCity(ip[], dest[], const len = sizeof(dest)) {
    new tmp[90];
    tmp = ip2long(ip);

    new string[500];
    format(string, sizeof(string), "SELECT loc.*\n FROM geolocation loc,\n geoblocks blk\n WHERE blk.idx = (%s-(%s %% 65536))\n AND blk.startIpNum < %s\n AND blk.endIpNum > %s\n AND loc.locId = blk.locId LIMIT 1;", tmp, tmp, tmp, tmp);

    geoip_city = db_open(GeoIP_CityFile);
    dbresult = db_query(geoip_city, string);
    if(db_num_rows(dbresult) >= 1)
    {
        db_get_field_assoc(dbresult,"city",dest,len);
    }
    db_free_result(dbresult);
    db_close(geoip_city);

    if(!strlen(dest)) format(dest, len, "Unknown");
    
    return true;
}

stock ip2long(ip[]) {
    new ips[4];
    sscanf(ip, "p.dddd", ips[0], ips[1], ips[2], ips[3]);
    new tmp[90];
    format(tmp, sizeof(tmp), "((16777216 * %d) + (65536 * %d) + (256 * %d) + %d)", ips[0], ips[1], ips[2], ips[3]);
    // we use a string here so it will not pass the 32-bit integer limits, the math is done later in the sql query
    return tmp;
}


#if MAX_PLAYERS > 100
	#error "MAX_PLAYERS define must be less than 100."
#endif

/*
	EOF
*/
