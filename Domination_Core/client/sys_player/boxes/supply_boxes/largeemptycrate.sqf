/*
*    TWC public sevrer
*   Sling loadable ammo crates
*
*  Paddock Change all ammo boxes to have the correct ammo and weapons
*
*
*/




_boxClass = "B_supplyCrate_F";

_box = _boxClass createVehicle (if (count (player nearobjects ["Land_InfoStand_V1_F", 200]) > 0) then {
(getPos AmmoBoxSpawner)} else 
{(getPos player)});

clearWeaponCargoGlobal _box;
clearBackpackCargoGlobal _box;
clearMagazineCargoGlobal _box;
clearitemCargoGlobal _box;


	_boxaction = ["deleteCreate","Destroy Crate","",{deleteVehicle this;},{true}] call ace_interact_menu_fnc_createAction;
	[_box,0,["ACE_MainActions"],_boxaction] call ace_interact_menu_fnc_addActionToobject;

