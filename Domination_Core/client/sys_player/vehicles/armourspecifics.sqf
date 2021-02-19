/* post-spawn instructions for spawned vehicles

*/



//rosomak, polish APC
if (typeof _veh == "B_APC_Wheeled_01_cannon_F") then {

if (twc_wdveh == 1) then {
	[
		_veh,
		["Olive",1], 
		["showBags",1,"showCamonetHull",1,"showCamonetTurret",1,"showSLATHull",0,"showSLATTurret",0]
	] call BIS_fnc_initVehicle;
	} else {
	[
		_veh,
		["Sand",1], 
		["showBags",0,"showCamonetHull",0,"showCamonetTurret",0,"showSLATHull",1,"showSLATTurret",1]
	] call BIS_fnc_initVehicle;
	};
};



if (typeof _veh == "CUP_B_M2A3Bradley_USA_W") then {

if (twc_wdveh == 1) then {
	[
		_veh,
		["standard",1], 
		["DUKE_Hide",1,"IFF_Panels_Hide",0]
	] call BIS_fnc_initVehicle;
	} else {
	[
		_veh,
		["Desert",1], 
		["DUKE_Hide",1,"IFF_Panels_Hide",0]
	] call BIS_fnc_initVehicle;
	};
};



if (typeof _veh == "CUP_B_M2Bradley_USA_W") then {

if (twc_wdveh == 1) then {
	[
		_veh,
		["standard",1], 
		["DUKE_Hide",1,"IFF_Panels_Hide",0]
	] call BIS_fnc_initVehicle;
	} else {
	[
		_veh,
		["Desert",1], 
		["DUKE_Hide",1,"IFF_Panels_Hide",0]
	] call BIS_fnc_initVehicle;
	};
};



if (typeof _veh == "CUP_B_Challenger2_2CW_BAF") then {

if (twc_wdveh == 1) then {
	[
	_veh,
	["woodlandTwoColor",1], 
	true
] call BIS_fnc_initVehicle;
	} else {
[
	_veh,
	["desertTan",1], 
	true
] call BIS_fnc_initVehicle;
	};
};


if (typeof _veh == "CUP_B_MCV80_GB_D_SLAT") then {

	if ((["90", twc_missionname] call BIS_fnc_inString) || (["00", twc_missionname] call BIS_fnc_inString)) then {
		if (twc_wdveh == 1) then {
			[
				_veh,
				["Woodland",1], 
				["HideSlat",0,"HideProxy_Desert",0,"HideProxy_Woodland",1]
			] call BIS_fnc_initVehicle;
		} else {
			[
				_veh,
				["Desert",1], 
				["HideSlat",0,"HideProxy_Desert",1,"HideProxy_Woodland",0]
			] call BIS_fnc_initVehicle;
		};
	};

		_box = _veh;
		if (["90", twc_missionname] call BIS_fnc_inString) then {
			// 1990
			[_veh] execvm "domination_core\client\sys_player\boxes\supply_boxes\smallcrateuk90.sqf";
		};

		if (["00", twc_missionname] call BIS_fnc_inString) then	{
			// 2000
			[_veh] execvm "domination_core\client\sys_player\boxes\supply_boxes\smallcrateuk2000.sqf";
		};




		if ((!(["90", twc_missionname] call BIS_fnc_inString)) && (!(["00", twc_missionname] call BIS_fnc_inString))) then {
		
		if (twc_wdveh == 1) then {
			[
				_veh,
				["Woodland",1], 
				["HideSlat",1,"HideProxy_Desert",0,"HideProxy_Woodland",1]
			] call BIS_fnc_initVehicle;
		} else {
			[
				_veh,
				["Desert",1], 
				["HideSlat",1,"HideProxy_Desert",1,"HideProxy_Woodland",0]
			] call BIS_fnc_initVehicle;
		};

// Modern

	//supplies
	[_veh] execvm "domination_core\client\sys_player\boxes\supply_boxes\smallcrateuk.sqf";

	};

//};
};


if (typeof _veh == "CUP_B_M1A2_TUSK_MG_US_Army") then {

if (twc_wdveh == 1) then {
	[
	_veh,
	["woodland",1], 
	["IFF_Panels_Hide",0,"Miles_Hide",1,"showCamonetTurret",0,"showCamonetHull",0,"DUKE_Hide",1]
	] call BIS_fnc_initVehicle;
	} else {

[
	_veh,
	["desert",1], 
	["IFF_Panels_Hide",0,"Miles_Hide",1,"showCamonetTurret",0,"showCamonetHull",0,"DUKE_Hide",1]
	] call BIS_fnc_initVehicle;
	};
};

if (typeof _veh == "CUP_B_M1A1_Woodland_US_Army") then {

if (twc_wdveh == 1) then {
	[
	_veh,
	["woodland",1], 
	["IFF_Panels_Hide",1,"Miles_Hide",1,"showCamonetTurret",0,"showCamonetHull",0]
	] call BIS_fnc_initVehicle;
	} else {

[
	_veh,
	["desert",1], 
	["IFF_Panels_Hide",1,"Miles_Hide",1,"showCamonetTurret",0,"showCamonetHull",0]
	] call BIS_fnc_initVehicle;
	};
};





if (typeof _veh == "CUP_B_M1128_MGS_Woodland") then {

if (twc_wdveh == 1) then {
[
	_veh,
	["Woodland",1], 
	true
	] call BIS_fnc_initVehicle;
	} else {
	[
	_veh,
	["Desert",1], 
	true
	] call BIS_fnc_initVehicle;
	};
};

if ((typeof _veh == "UK3CB_BAF_FV432_Mk3_GPMG_Green")||(typeof _veh == "UK3CB_BAF_FV432_Mk3_GPMG_Sand")) then {
_veh AddMagazineCargoGlobal ["UK3CB_BAF_762_200Rnd_T",9];

	//if ((group player getvariable ["twc_ismechanised", 0]) == 1) then {
_box = _veh;




		if (["90", twc_missionname] call BIS_fnc_inString) then {
			// 1990
			[_veh] execvm "domination_core\client\sys_player\boxes\supply_boxes\smallcrateuk90.sqf";
			};
			
			
		if (["00", twc_missionname] call BIS_fnc_inString) then {
			// 2000
			[_veh] execvm "domination_core\client\sys_player\boxes\supply_boxes\smallcrateuk2000.sqf";
			};

		if ((!(["90", twc_missionname] call BIS_fnc_inString)) && (!(["00", twc_missionname] call BIS_fnc_inString))) then {

// Modern

			[_veh] execvm "domination_core\client\sys_player\boxes\supply_boxes\smallcrateuk.sqf";
	
		};
/*} else {

_veh AddMagazineCargoGlobal ["UK3CB_BAF_762_200Rnd_T",6];
};
*/
};


if ((typeof _veh == "UK3CB_BAF_FV432_Mk3_RWS_Green")||(typeof _veh == "UK3CB_BAF_FV432_Mk3_RWS_Sand")) then {
_veh AddMagazineCargoGlobal ["UK3CB_BAF_127_100Rnd",5];

//	if ((group player getvariable ["twc_ismechanised", 0]) == 1) then {
_box = _veh;


		if (["90", twc_missionname] call BIS_fnc_inString) then {
			// 1990
			[_veh] execvm "domination_core\client\sys_player\boxes\supply_boxes\smallcrateuk90.sqf";
			};
			
			
		if (["00", twc_missionname] call BIS_fnc_inString) then {
			// 2000
			[_veh] execvm "domination_core\client\sys_player\boxes\supply_boxes\smallcrateuk2000.sqf";
			};

		if ((!(["90", twc_missionname] call BIS_fnc_inString)) && (!(["00", twc_missionname] call BIS_fnc_inString))) then {

// Modern

			[_veh] execvm "domination_core\client\sys_player\boxes\supply_boxes\smallcrateuk.sqf";
	
		};
};





