

InsP_MissionStatus = ["MissionStatus","Mission Status","",{call twc_missionstatusplayerhint},{true}] call ace_interact_menu_fnc_createAction;
[player, 1, ["ACE_SelfActions"], InsP_MissionStatus] call ace_interact_menu_fnc_addActionToObject;

twc_missionstatusplayerhint = {
	_base = missionnamespace getvariable ["twc_basepos", [0,0,0]];

	_pilotactive = 0;

	_playersinbase = 0;

	_opforamount = 0;


	{
		if ((side _x) == east) then {
			if ((["heli", typeof _x] call BIS_fnc_inString) || (["crewchief", typeof _x] call BIS_fnc_inString)) then {
				_pilotactive = _pilotactive + 1;
			};
			if (((_x distance _base) < 300) && (_x != player)) then {
				_playersinbase = _playersinbase + 1;
			};
			
		} else {
			_opforamount = _opforamount +1;
		};
	} foreach allplayers;


	_title  = "<t color='#ffbf00' size='1.2' shadow='1' shadowColor='#000000' align='center'>MISSION STATUS</t><br /><br />"; 

	_text1 = format["%1 AOs remaining<br /><br />",twc_aostocomplete + 1];


	_text2 = "";
	_text3 = "";

	if ((count allplayers) == 1) then {
		_text2 = "You are currently the only player on the server<br />";
	} else {
		_text2 = format ["There are %1 other players on the server<br />", (count allplayers) - 1];
		
		if (_playersinbase > 1) then {
			_text3 = format ["%1 of them are in base<br />", _playersinbase];
		};
		if (_playersinbase == 1) then {
			_text3 = "One of them is in base<br />";
		};
		if (_playersinbase == 0) then {
			_text3 = "None of them are in base<br />";
		};
	};

	_text4 = "";
	/*
	if ((_opforamount) == 0) then {
		_text4 = "There are no player aggressors active<br /><br />";
	} else {
		_text4 = format ["There are %1 player aggressors active<br /><br />", _opforamount];
	};
	*/

	_text5 = "";

	if ((_pilotactive) == 0) then {
		_text5 = "There are no heli pilots active";
	};

	if ((_pilotactive) == 1) then {
		_text5 = "A heli pilot is active";
	};

	if ((_pilotactive) > 1) then {
		_text5 = "A heli crew is active";
	};

	_text6 = "<br /><br />The enemy command vehicle is active";

	_radio = missionnamespace getvariable ["twc_enemyhasradio", 1];
	if (_radio == 0) then {
		_text6 = "<br /><br />The enemy command vehicle is not active";
	};


	_finaltext = parsetext (_title + _text1 + _text2 + _text3 + _text4 + _text5 + _text6);
	hint _finaltext;

};