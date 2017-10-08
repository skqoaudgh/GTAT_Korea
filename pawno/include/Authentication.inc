/*
 *
 *
 *		PureunBa
 *
 *			Authentication Include
 *
 *
 */

#include <a_samp>
#include <a_http>

new
	Domain[96],
	Crash
;

forward OnHttpResponse(index,response,data[]);

public OnHttpResponse(index,response,data[])
{
	if(response != 200)
	{
		printf("\n(%d:%d) ������ �����Ͽ� ������ �ݽ��ϴ�.\n",index,response);
		if(Crash) ServerClose();
	} 
	else 
	{
		if(index == 0)
		{
			new str[128];
			format(str,sizeof(str),"%s/%s.txt",Domain,data);
			HTTP(1,HTTP_GET,str,"","OnHttpResponse");			
		}
		else if(index == 1)
			print("\n������ �����Ͽ����ϴ�.\n");
	}
}

stock Authentication(domain[],crash=0)
{
	new str[128];
	format(str,sizeof(str),"%s/getip.php",domain);
	strmid(Domain,domain,0,strlen(domain),sizeof(Domain));
	Crash = crash;
	HTTP(0, HTTP_GET, str,"","OnHttpResponse");
	return 1;
}
stock ServerClose()
{
	new File:hFile;
	hFile = fopen("crash/crash.txt",io_append);
	fwrite(hFile,"%s");
	fclose(hFile);
	return 1;
}