#include "defines.sqf";
#include "func\init.sqf";
#include "sys_basedefence\init.sqf";
#include "sys_mechanised\init.sqf";

CIVILIAN setFriend [EAST, 1];

basemode = 0;
publicvariable "basemode";

execvm "domination_core\client\sys_ragdoll\fn_initRagdoll.sqf";

if(isNil "townLocationArray") then{
	townLocationArray = [];
};

if(isNil "twc_basepos") then{
	twc_basepos = getmarkerpos "base";
	publicVariable "twc_basepos";
};


_trg = createTrigger ["EmptyDetector", twc_basepos];
_trg setTriggerArea [1000, 1000, 0, false];
_trg setTriggerActivation ["ANYPLAYER", "PRESENT", true];
_trg setTriggerTimeout [0,0,0, true];

_trg setTriggerStatements ["this","[twc_basepos, true] call twc_fnc_civfluff;",""];

if(isNil "twc_activearty") then{
	twc_activearty = 0;
};

if(isNil "customlocations") then{
	customlocations = [];
};

if(isNil "twc_attachmentgap") then{
	twc_attachmentgap = 12;
	publicVariable "twc_attachmentgap";
};

if(isNil "twc_is90") then{
	twc_is90 = 0;
	publicVariable "twc_is90";
};

//list of leaders that can do attachments without the slot system
twc_goodeggs = [
"76561198018609662", //sarge
"76561198050512686", //patty
"76561198034730503", //cuck
"76561198053960783", //crow
"76561198042520910", //aleyboy
"76561198035067970", //martingw
"76561198005456546", //bosenator
"76561198157816526", //nubben
"76561198030665694" //hobbs

];
publicVariable "twc_goodeggs";

if(isNil "twc_wdveh") then{
twc_wdveh = 0;
publicVariable "twc_wdveh";
};

if(isNil "twc_mortar_targetlist") then{
	twc_mortar_targetlist = [];
	publicVariable "twc_mortar_targetlist";
};

if(isNil "twc_nonpersistent") then{
twc_nonpersistent = 0;
publicVariable "twc_nonpersistent";
};

if(isNil "twc_idflist") then{
twc_idflist = [];
publicVariable "twc_idflist";
};


twc_missionname = missionname;
publicVariable "twc_missionname";

if (twc_nonpersistent == 1) then {
	addMissionEventHandler ["HandleDisconnect", {
		params ["_unit", "_id", "_uid", "_name"];
		if ((count allplayers) ==0) then {
			"Won" call BIS_fnc_endMissionServer;
		};
	}];
};


{_location = createLocation [ "NameVillage" , getpos _x, 100, 100];
_location setText "Objective " + (twc_objnames call bis_fnc_selectrandom);
townLocationArray = townLocationArray + (nearestLocations [getpos _x, ["NameVillage","NameCity","NameCityCapital","nameLocal"], 2]);} foreach customlocations;

townLocationArray = townLocationArray + (nearestLocations [getMarkerPos "base", ["NameVillage","NameCity","NameCityCapital"], twc_maxObjDistance]) + (nearestLocations [getMarkerPos "base", ["NameVillage","NameCity","NameCityCapital"], (twc_maxObjDistance / 1.5)]) + (nearestLocations [getMarkerPos "base", ["NameVillage","NameCity","NameCityCapital"], (twc_maxObjDistance / 2)]) + (nearestLocations [getMarkerPos "base", ["NameVillage","NameCity","NameCityCapital"], (twc_maxObjDistance / 2)]);

[] call twc_fnc_getAO;

 _eventHandlerID = ["twc_event_artyattack", { 
params ["_enemy"]; 
[_enemy] call twc_fnc_artyattack;}] call CBA_fnc_addEventHandler; 


_pilotConnectedList = [];

// apparently onPlayerConnected is unreliable...
// so we call this when we know it's a pilot and connected via client
// _caller = player id
["TWC_PilotConnected", {
	params ["_caller"];

	_pilotConnectedList pushBack _caller;
	
	if (count _pilotConnectedList > 0) then {
		[] call twc_fnc_spawnJet;
	};
}] call CBA_fnc_addEventHandler;

["TWC_PilotDisconnected", "onPlayerDisconnected", {
	_pilotConnectedList - [_uid];
	
	if (count _pilotConnectedList < 1) then {
		[] call twc_fnc_noMorePilots;
	};
}] call BIS_fnc_addStackedEventHandler;

sirenlist = (getmarkerpos "base") nearobjects ["Land_Loudspeakers_F", 500];


mainbase = createTrigger ["EmptyDetector", getmarkerpos "base"];
mainbase setTriggerArea [500, 500, 0, false];
mainbase setTriggerActivation ["EAST", "PRESENT", true];
mainbase setTriggerTimeout [60,60,60,True];
mainbase setTriggerStatements ["count thislist > 4","call twc_fnc_changebase_bluetored", "[]spawn {sleep 2;call twc_fnc_changebase_redtoblue; {deleteVehicle _x}forEach allDeadMen;{ deleteVehicle _x }forEach allDead;}"];

_trg2 = createTrigger ["EmptyDetector", getmarkerpos "base"];
_trg2 setTriggerArea [700, 700, 0, false];
_trg2 setTriggerActivation ["EAST", "PRESENT", true];
_trg2 setTriggerTimeout [0,0,0,True];
_trg2 setTriggerStatements ["count thislist > 6","execVM 'domination_core\server\sys_basedefence\INF_Alarm.sqf';", ""];



_trg3 = createTrigger ["EmptyDetector", getmarkerpos "base"];
_trg3 setTriggerArea [1000, 1000, 0, false];
_trg3 setTriggerActivation ["EAST", "PRESENT", true];
_trg3 setTriggerTimeout [0,0,0,True];
_trg3 setTriggerStatements ["this","basemode = 1; publicVariable 'basemode';", "basemode = 0; publicVariable 'basemode';"];


