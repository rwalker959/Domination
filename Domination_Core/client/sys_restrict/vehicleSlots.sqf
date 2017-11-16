TWC_fnc_notAllowedInSeat = {
	params ["_playerUnit"];
	
	_freePassengerSpace = (vehicle _playerUnit) emptyPositions "cargo";
	_title  = "<t color='#ff0000' size='1.2' shadow='1' shadowColor='#000000' align='center'>RESTRICTED</t>";

	// move them to the passenger seats first, prevents annoyance/unnecessary death in the air
	if (_freePassengerSpace > 0) exitWith {
		_veh = vehicle _playerUnit;
		moveOut _playerUnit;
		_playerUnit moveInCargo _veh;
		_text = "<br />You are not qualified for that slot. Take a seat in back.";
		hint parseText (_title + _text);
	};
	
	moveOut _playerUnit;
	_text = "<br />You are not qualified for that slot. Get out of here.";
	hint parseText (_title + _text);
};

TWC_fnc_checkVehicleSlot = {
	// check the class of the player, this will make it easier
	// typeOf vehicle player == "Modern_British_heliPilot"
	params ["_playerUnit"];
	
	if (vehicle _playerUnit == _playerUnit) exitWith { false; }; // double check
	
	_currentSeat = [_playerUnit] call CBA_fnc_vehicleRole;
	
	{
		_vehicle = (_x select 0);
		 _slotsAndRoles = (_x select 1);
		
		if (typeof (vehicle _playerUnit) == _vehicle) then {
			{
				_slot = (_slotsAndRoles select 0);
				_roles = (_slotsAndRoles select 1);
				
				if (_currentSeat == _slot) then {
					if (!(typeOf _playerUnit in _roles)) then {
						[_playerUnit] call TWC_fnc_notAllowedInSeat;
					};
				};
			} forEach _slotsAndRoles;
		};
	} forEach twc_restrictedVehicleSlots;
};

[player, "GetInMan", {
	params ["_playerUnit"];
	[_playerUnit] call TWC_fnc_checkVehicleSlot;
}, player] call CBA_fnc_addBISEventHandler;

[player, "SeatSwitchedMan", {
	params ["_playerUnit"];
	[_playerUnit] call TWC_fnc_checkVehicleSlot;
}, player] call CBA_fnc_addBISEventHandler;