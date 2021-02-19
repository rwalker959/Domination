/*
*    TWC public sevrer
*   Sling loadable ammo crates
*
*  spawns some mines that can only be spawned once
*
*
*/

if (isnil "twc_tm62_spawned") then {twc_tm62_spawned = 0};

if (twc_tm62_spawned == 1)  exitwith {
 
 _title  = "<t color='#ffbf00' size='1.2' shadow='1' shadowColor='#000000' align='center'>Specialist Equipment</t>"; 

 _text1 =  "<br />A box of mines has already been spawned, there are no more available.";
_spawntext = parsetext (_title + _text1);
hint _spawntext;
 };

twc_tm62_spawned = 1;
publicVariable "twc_tm62_spawned";

_boxClass = "ACE_Box_Ammo";

_box = _boxClass createVehicle (call twc_fnc_getammospawnloc);

clearWeaponCargoGlobal _box;
clearBackpackCargoGlobal _box;
clearMagazineCargoGlobal _box;
clearitemCargoGlobal _box;

//Weapons


//supplies
_box AddMagazineCargoGlobal ["CUP_MineE_M",10];
_box AddItemCargoGlobal ["ACE_DefusalKit",2];

[player, _box] call ace_cargo_fnc_startLoadIn;