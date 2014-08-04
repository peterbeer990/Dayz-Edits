disableSerialization;

AsReMixhud_Control = true;

while {true} do
{
    1000 cutRsc ["AsReMixhud","PLAIN"];
    _wpui = uiNameSpace getVariable "AsReMixhud";
    _vitals = _wpui displayCtrl 4900;
	
	_thePlayer = player;
	
	AsReMixhud_zombieKills 	= _thePlayer getVariable["zombieKills",0];
	AsReMixhud_headshots 		= _thePlayer getVariable["headShots",0];
	AsReMixhud_killsH 		= _thePlayer getVariable["humanKills",0];
    Zupa_bank 		=  _thePlayer getVariable["bank",0];
	AsReMixhud_killsB 		= _thePlayer getVariable["banditKills",0];
	AsReMixhud_humanity 		= _thePlayer getVariable["humanity",0];
	AsReMixhud_zombies 		= "";
	AsReMixhud_zombiesAlive   = "";
	AsReMixhud_blood			= _thePlayer getVariable["USEC_BloodQty",0];
	AsReMixhud_pid			= "";
	AsReMixhud_puid			= "";
    AsReMixhud_hmnicon 		= "";
	AsReMixhud_fps 			= (round diag_fps);
	AsReMixhud_svrname		= "Amnesia";
	
	_stime = 0;
	if(serverTime > 36000)then{_stime = time;}else{_stime = serverTime;};
	_hours = (_stime/60/60);
	_hours = toArray (str _hours);
	_hours resize 1;
	_hours = toString _hours;
	_hours = compile _hours;
	_hours = call  _hours;
	_minutes = floor(_stime/60);
	_minutes2 = ((_minutes - (_hours*60)) min 60) max 0;if (_minutes2 < 10) then {_minutes2 = format ['0%1',_minutes2];};
	
	if(AsReMixhud_humanity >= 5000) then { AsReMixhud_hmnicon = "<img size='0.9' image='addons\playerhud\icons\HeroHumanity.paa'/>"; };
	if((AsReMixhud_humanity >= 200) && (AsReMixhud_humanity <= 4999)) then { AsReMixhud_hmnicon = "<img size='0.9' image='addons\playerhud\icons\CivHumanity.paa'/>"; };
	if(AsReMixhud_humanity <= 199) then { AsReMixhud_hmnicon = "<img size='0.9' image='addons\playerhud\icons\BanditHumanity.paa'/>"; };

	_vitals ctrlSetStructuredText parseText format ["
	<t size='0.8' align='right'>~~~~~ Stats ~~~~~</t><br/>
	<t size='0.9'> %1 </t><img size='0.9' align='right' image='addons\playerhud\icons\Health.paa'/>  <br/> 
	<t size='0.9'> %2 %5 </t><img size='0.9' align='right' image='addons\playerhud\icons\Humanity.paa'/>  <br/> 
	<t size='0.9'> £%3 </t><img size='0.9' align='right' image='addons\playerhud\icons\Money.paa'/>   <br/>
	<t size='0.9'> £%14 </t><img size='0.9' align='right' image='addons\playerhud\icons\Bank.paa'/>   <br/>
	<t size='0.9'> %10 </t><img size='0.9' align='right' image='addons\playerhud\icons\HeroKills.paa'/>  <br/> 
	<t size='0.9'> %9 </t><img size='0.9' align='right' image='addons\playerhud\icons\BanditKills.paa'/>  <br/>
	<t size='0.9'> %4 </t><img size='0.9' align='right' image='addons\playerhud\icons\ZombieKills.paa'/>  <br/>
	<t size='0.9'> %11h %12min </t><img size='0.9' align='right' image='addons\playerhud\icons\Uptime.paa'/>  <br/>
	<t size='0.9'> %13 </t><img size='0.9' align='right' image='addons\playerhud\icons\Fps.paa'/>  <br/>
	<t size='0.8' align='right'>~~~~~~~~~~~~~~~~~</t><br/>",
	AsReMixhud_blood,
	[AsReMixhud_humanity] call BIS_fnc_numberText,
	[AsReMixhud_headshots] call BIS_fnc_numberText,
	AsReMixhud_zombiekills,
	AsReMixhud_hmnicon,
	name player,
	AsReMixhud_zombiesAlive,
	AsReMixhud_zombies,
	AsReMixhud_killsB,
	AsReMixhud_killsH,
	_hours,
	_minutes2,
	AsReMixhud_fps,
	[Zupa_bank] call BIS_fnc_numberText,
	AsReMixhud_svrname
	];
	_vitals ctrlCommit 0;
    sleep 2;
};
