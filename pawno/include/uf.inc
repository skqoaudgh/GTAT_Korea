#if defined _uf_included
	#endinput
#endif
#define _uf_included
#pragma library uf

#define INF_INT 0x7F800000
const Float:INF_FLOAT=Float:0x7F800000;


stock Float:GetDistanceBetweenPoints(Float:x1,Float:y1,Float:z1,Float:x2,Float:y2,Float:z2) //By milous22 (https://github.com/milous22)
{
	return floatsqroot(floatadd(floatadd(floatpower(floatsub(x1,x2),2),floatpower(floatsub(y1,y2),2)),floatpower(floatsub(z1,z2),2)));
}

stock Float:GetDistanceToPoint(playerid,Float:x1,Float:y1,Float:z1) //By Gabriel "Larcius" Cordes
{
	if (IsPlayerConnected(playerid))
	{
		new Float:x2,Float:y2,Float:z2;
		GetPlayerPos(playerid,x2,y2,z2);
		return GetDistanceBetweenPoints(x1,y1,z1,x2,y2,z2);
	}
	return INF_FLOAT;
}


stock Float:GetDistanceToPointXY(playerid,Float:xs,Float:ys) //By Gabriel "Larcius" Cordes
{
	new Float:x1,Float:y1,Float:z1;
	GetPlayerPos(playerid,x1,y1,z1);
	return GetDistanceToPoint(playerid,xs,ys,z1);
}

stock Float:GetDistanceBetweenPointsXY(Float:x1,Float:y1,Float:x2,Float:y2) //By Gabriel "Larcius" Cordes
{
	return GetDistanceBetweenPoints(x1,y1,0.0,x2,y2,0.0);
}

stock Float:GetPlayerDistanceToPointXY(playerid,Float:xs,Float:ys)
{
	return GetDistanceToPointXY(playerid,xs,ys);
}

stock Float:GetPlayerDistanceToPoint(playerid,Float:xs,Float:ys) //By Sacky
{
	return GetDistanceToPointXY(playerid,xs,ys);
}

stock Float:GetPlayerDistanceToPointEx(playerid,Float:xs,Float:ys,Float:zs) //By Sacky
{
	return GetDistanceToPoint(playerid,xs,ys,zs);
}

stock Float:GetPointDistanceToPoint(Float:x1,Float:y1,Float:x2,Float:y2) //By Sacky
{
	return GetDistanceBetweenPoints(x1,y1,0.0,x2,y2,0.0);
}

stock Float:GetPointDistanceToPointEx(Float:x1,Float:y1,Float:z1,Float:x2,Float:y2,Float:z2) //By Sacky
{
	return GetDistanceBetweenPoints(x1,y1,z1,x2,y2,z2);
}

stock IsPlayerInRectangle(playerid, Float:x1, Float:y1, Float:x2, Float:y2)
{
	if(IsPlayerConnected(playerid))
	{
		new Float:xs,Float:ys,Float:zs;
		GetPlayerPos(playerid,xs,ys,zs);
		return IsPointInRectangle(xs,ys,x1,y1,x2,y2);
	}
	return 0;
}

stock IsPointInRectangle(Float:xs, Float:ys, Float:x1, Float:y1, Float:x2, Float:y2) //By Alex "Y_Less" Cole (edited by Gabriel "Larcius" Cordes)
{
	if(IsBetweenFloats(xs,x1,x2) && IsBetweenFloats(ys,y1,y2))
	{
		return 1;
	}
	return 0;
}

stock IsPointInCircle(Float:xs,Float:ys,Float:x1,Float:y1,Float:radius1) //By Sacky
{
	if(GetDistanceBetweenPointsXY(xs,ys,x1,y1)<=radius1)
	{
		return 1;
	}
	return 0;
}

stock IsPlayerInCircle(playerid,Float:x1,Float:y1,Float:radius1)
{
	if(IsPlayerConnected(playerid))
	{
		new Float:xs,Float:ys,Float:zs;
		GetPlayerPos(playerid,xs,ys,zs);
		return IsPointInCircle(xs,ys,x1,y1,radius1);
	}
	return 0;
}

stock IsPlayerInAshlar(playerid,Float:x1,Float:y1,Float:z1,Float:x2,Float:y2,Float:z2)
{
	if(IsPlayerConnected(playerid))
	{
		new Float:xs,Float:ys,Float:zs;
		GetPlayerPos(playerid,xs,ys,zs);
		return IsPointInAshlar(xs,ys,zs,x1,y1,z1,x2,y2,z2);
	}
	return 0;
}

stock IsPointInAshlar(Float:xs,Float:ys,Float:zs,Float:x1,Float:y1,Float:z1,Float:x2,Float:y2,Float:z2) //By 50p (edited by Gabriel "Larcius" Cordes)
{
	if(IsBetweenFloats(xs,x1,x2) && IsBetweenFloats(ys,y1,y2) && IsBetweenFloats(zs,z1,z2))
	{
		return 1;
	}
	return 0;
}

stock IsPlayerInCube(Float:xs,Float:ys,Float:zs,Float:x1,Float:y1,Float:z1,Float:x2,Float:y2,Float:z2)
{
	return IsPlayerInAshlar(xs,ys,zs,x1,y1,z1,x2,y2,z2);
}

stock IsPointInCube(playerid,Float:x1,Float:y1,Float:z1,Float:x2,Float:y2,Float:z2)
{
	return IsPointInAshlar(playerid,x1,y1,z1,x2,y2,z2);
}

stock IsPlayerInSphere(playerid,Float:x1,Float:y1,Float:z1,Float:radius)
{
	if(IsPlayerConnected(playerid))
	{
		new Float:xs,Float:ys,Float:zs;
		GetPlayerPos(playerid,xs,ys,zs);
		return IsPointInSphere(xs,ys,zs,x1,y1,z1,radius);
	}
	return 0;
}

stock IsPointInSphere(Float:xs,Float:ys,Float:zs,Float:x1,Float:y1,Float:z1,Float:radius) //By Sacky
{
	if(GetDistanceBetweenPoints(xs,ys,zs,x1,y1,z1)<=radius)
	{
		return 1;
	}
	return 0;
}

stock IsPlayerInCylinder(playerid,Float:x1,Float:y1,Float:z1,Float:h1,Float:radius1)
{
	if(IsPlayerConnected(playerid))
	{
		new Float:xs,Float:ys,Float:zs;
		GetPlayerPos(playerid,xs,ys,zs);
		return IsPointInCylinder(xs,ys,zs,x1,y1,z1,h1,radius1);
	}
	return 0;
}

stock IsPointInCylinder(Float:xs,Float:ys,Float:zs,Float:x1,Float:y1,Float:z1,Float:h1,Float:radius1) //By Sacky
{
	if(GetDistanceBetweenPointsXY(xs,ys,x1,y1)<=radius1 && zs>=z1 && zs<=(z1+h1))
	{
		return 1;
	}
	return 0;
}