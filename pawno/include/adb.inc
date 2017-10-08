/*
 *
 *		[For a better future, Enthusiasm of Acu]
 *
 *			Acu's EASY Database
 *			v1.0.0
 *
 *
 *		First Release:	2014/10/17
 *		Last Update:	2014/10/17
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
native adb_OpenDB(filename[]);
native adb_CloseDB();

native adb_GetFields();
native adb_IsFieldExist(fieldname[]);
native adb_AddNewField(fieldname[],type);

native adb_GetUserName(playerid);

native adb_Caching(playerid);
native adb_FlushCache(playerid);
native adb_IsCached(playerid);

native adb_FlushStack(playerid);

native adbTimer();

native adb_SetInt(playerid,field[],value);
native adb_SetFloat(playerid,field[],Float:value);
native adb_SetString(playerid,field[],value[]);

native adb_GetInt(playerid,field[]);
native adb_GetFloat(playerid,field[]);
native adb_GetString(playerid,field[]);
 */

//-----/ Defines /
#define ADB_MAX_FIELDS			128
#define ADB_MAX_FIELD_LENGTH	32

#define ADB_MAX_UPDATE_STACK	50



//-----/ News /
	//--/ Database core /
new
	bool:adb_opened,
	DB:adb_database,
	DBResult:adb_dresult,
	adb_timer
;
	//--/ Fields list /
new
	adb_fields[ADB_MAX_FIELDS][ADB_MAX_FIELD_LENGTH],
	adb_fields_count
;
	//--/ Data cache /
new
	DBResult:adb_cache[MAX_PLAYERS],
	bool:adb_cached[MAX_PLAYERS]
;
	//--/ Update stack /
new
	adb_update_stack[MAX_PLAYERS][ADB_MAX_UPDATE_STACK][128],
	adb_update_stack_count[MAX_PLAYERS]
;



//-----/ Forwards /
forward adbTimer();





//------------------------------------------------------------------------------
stock adb_OpenDB(filename[])
{
	if(adb_opened)
		adb_CloseDB();
	adb_database = db_open(filename);
	adb_opened = true;
	adb_timer = SetTimer("adbTimer",500,1);
	//-----
	adb_dresult = db_query(adb_database,"SELECT COUNT(*) FROM data");
	if(db_num_rows(adb_dresult) == 0)
	{
		db_query(adb_database,"CREATE TABLE data (adbID INTEGER PRIMARY KEY AUTOINCREMENT,adbName TEXT)");
		db_query(adb_database,"INSERT INTO data (adbName) VALUES('Acu')");
	}
	adb_GetFields();
}
stock adb_CloseDB()
{
	if(adb_opened)
	{
		db_close(adb_database);
		KillTimer(adb_timer);
	}
	adb_opened = false;
}
//------------------------------------------------------------------------------
stock adb_GetFields()
{
	for(new i; i<ADB_MAX_FIELDS ;i++)
		adb_fields[i][0] = EOS;
	adb_dresult = db_query(adb_database,"SELECT * FROM data LIMIT 1");
	adb_fields_count = db_num_fields(adb_dresult);
	for(new i; i<adb_fields_count; i++)
		db_field_name(adb_dresult,i,adb_fields[i],ADB_MAX_FIELD_LENGTH);
}
stock adb_IsFieldExist(fieldname[])
{
	for(new i; i<adb_fields_count; i++)
		if(!strcmp(fieldname,adb_fields[i]))
			return 1;
	return 0;
}
stock adb_AddNewField(fieldname[],type)
{
	new string[64];
	switch(type)
	{
		case 0:
			format(string,64,"ALTER TABLE data ADD %s INTEGER",fieldname);
		case 1:
			format(string,64,"ALTER TABLE data ADD %s REAL",fieldname);
		case 2:
			format(string,64,"ALTER TABLE data ADD %s TEXT",fieldname);
	}
	db_query(adb_database,string);
	strcpy(adb_fields[adb_fields_count++],fieldname);
}
//------------------------------------------------------------------------------
stock adb_GetUserName(playerid)
{
	new name[32];
	GetPlayerName(playerid,name,32);
	return name;
}
//------------------------------------------------------------------------------
stock adb_Caching(playerid)
{
	new string[128];
	format(string,128,"SELECT * FROM data WHERE adbName = '%s'",adb_GetUserName(playerid));
	adb_cache[playerid] = db_query(adb_database,string);
	adb_cached[playerid] = true;
}
stock adb_FlushCache(playerid)
{
	db_free_result(adb_cache[playerid]);
	adb_cached[playerid] = false;
}
stock adb_IsCached(playerid)
	return adb_cached[playerid];
//------------------------------------------------------------------------------
stock adb_FlushStack(playerid)
{
	new string[1024];
	if(adb_update_stack_count[playerid])
	{
		format(string,128,"SELECT * FROM data WHERE adbName = '%s'",adb_GetUserName(playerid));
		adb_dresult = db_query(adb_database,string);
		if(db_num_rows(adb_dresult) == 0)
		{
			format(string,128,"INSERT INTO data (adbName) VALUES('%s')",adb_GetUserName(playerid));
			db_query(adb_database,string);
		}
		//-----
		format(string,sizeof(string),"UPDATE data SET ");
		for(new i; i<adb_update_stack_count[playerid]; i++)
		{
			strcat(string,adb_update_stack[playerid][i]);
			strcat(string,",");
		}
		string[strlen(string)-1] = EOS;
		format(string,sizeof(string),"%s WHERE adbName = '%s'",string,adb_GetUserName(playerid));
		db_query(adb_database,string);
		//-----
		adb_FlushCache(playerid);
	}
	adb_update_stack_count[playerid] = 0;
}
//------------------------------------------------------------------------------
public adbTimer()
{
	for(new i,t=GetMaxPlayers(); i<t; i++)
		adb_FlushStack(i);
}
//------------------------------------------------------------------------------
stock adb_SetInt(playerid,field[],value)
{
	if(!adb_IsFieldExist(field))
		adb_AddNewField(field,0);
	adb_FlushCache(playerid);
	//-----
	new idx = adb_update_stack_count[playerid]++;
	format(adb_update_stack[playerid][idx],128,"`%s`=%d",field,value);
}
stock adb_SetFloat(playerid,field[],Float:value)
{
	if(!adb_IsFieldExist(field))
		adb_AddNewField(field,0);
	adb_FlushCache(playerid);
	//-----
	new idx = adb_update_stack_count[playerid]++;
	format(adb_update_stack[playerid][idx],128,"`%s`=%f",field,value);
}
stock adb_SetString(playerid,field[],value[])
{
	if(!adb_IsFieldExist(field))
		adb_AddNewField(field,0);
	adb_FlushCache(playerid);
	//-----
	new idx = adb_update_stack_count[playerid]++;
	format(adb_update_stack[playerid][idx],128,"`%s`='%s'",field,value);
}
//------------------------------------------------------------------------------
stock adb_GetInt(playerid,field[])
{
	new string[128];
	adb_FlushStack(playerid);
	if(!adb_IsCached(playerid))
		adb_Caching(playerid);
	db_get_field_assoc(adb_cache[playerid],field,string,128);
	return strval(string);
}
stock Float:adb_GetFloat(playerid,field[])
{
	new string[128];
	adb_FlushStack(playerid);
	if(!adb_IsCached(playerid))
		adb_Caching(playerid);
	db_get_field_assoc(adb_cache[playerid],field,string,128);
	return floatstr(string);
}
stock adb_GetString(playerid,field[])
{
	new string[128];
	adb_FlushStack(playerid);
	if(!adb_IsCached(playerid))
		adb_Caching(playerid);
	db_get_field_assoc(adb_cache[playerid],field,string,128);
	return string;
}
