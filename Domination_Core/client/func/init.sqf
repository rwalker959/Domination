
twc_fnc_seenbyblufor = compile preprocessfilelinenumbers "Domination_Core\client\func\fnc_seenbyblufor.sqf";
twc_fnc_posNearPlayers = compile preprocessfilelinenumbers "Domination_Core\server\func\fnc_posNearPlayers.sqf";


twc_fnc_seenbyplayers = compile preprocessfilelinenumbers "Domination_Core\server\func\fnc_seenbyplayers.sqf";
twc_fnc_lookedatbyplayers = compile preprocessfilelinenumbers "Domination_Core\server\func\fnc_lookedatbyplayers.sqf";
twc_fnc_findsneakypos = compile preprocessfilelinenumbers "Domination_Core\server\func\fnc_findsneakypos.sqf";

twc_fnc_pubstartingloadout = compile preprocessfilelinenumbers "Domination_Core\client\sys_player\fnc_startingloadout.sqf";

twc_fnc_cantp1 = {

	_return = false;
	
	if (((getmarkertype "twc_tp1") == "") || ((getmarkertype "twc_tp2") == "") || (!((vehicle player) == player))) exitwith {_return};
	
	if ((player distance (getmarkerpos "twc_tp1")) < (player distance (getmarkerpos "twc_tp2"))) then {
		_return = true;
	};
	_return;
};

twc_fnc_cantp2 = {

	_return = false;
	
	if (((getmarkertype "twc_tp1") == "") || ((getmarkertype "twc_tp2") == "") || (!((vehicle player) == player))) exitwith {_return};
	
	if ((player distance (getmarkerpos "twc_tp1")) > (player distance (getmarkerpos "twc_tp2"))) then {
		_return = true;
	};
	_return;
};

twc_fnc_isplayeratbase = {

	_return = false;
	
	if ((player distance (twc_basepos)) < (500)) then {
		_return = true;
	};
	_return;
};


twc_hintfullsection = {
	params ["_group"];
	
	_arr = [];
	{
		_arr pushback [name _x, typeof _x, getPlayerUID _x];
	} foreach (units _group);
	
	if (!hasinterface) exitwith {
		diag_log ("twcgoodeggs "+(str _arr));
	};
};

twc_fnc_basetp = {

	if ((player distance (getmarkerpos "twc_tp2")) < (player distance (getmarkerpos "twc_tp1"))) exitwith {
		player setpos (getmarkerpos "twc_tp1");
		player setdir (markerdir "twc_tp1");
	};

	if ((player distance (getmarkerpos "twc_tp2")) > (player distance (getmarkerpos "twc_tp1"))) exitwith {
		player setpos (getmarkerpos "twc_tp2");
		player setdir (markerdir "twc_tp2");
	};
	
	hint "huh, you broke it. Well done I guess";
};