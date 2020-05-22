/*
file: VEH_autoflip.sqf
by DaVidoSS
add possibility to automatically turn back vehicle on wheels once flipped
to event take place vehicle needs to be side/up flipped and empty and no units in 10m around
created for Barbolani's Antistasi
parameters:
none
return VOID
*/
if !(isServer) exitWith {};

private ["_allVehicles","_vehicle","_fnc_flipVeh"];

_fnc_flipVeh = {

	params[ ["_object",objNull,[objNull]] ];

		waitUntil {
			sleep 1;
			(_object nearEntities ["Man", 10]) isEqualTo [] || !alive _object
		};
		if (!alive _object) exitWith {};
		_object allowDamage false;
		_object setVectorUp [0,0,1];
		_object setPosATL [(getPosATL _object) select 0, (getPosATL _object) select 1, 0];
		_object allowDamage true;
};

while {true} do {

	_allVehicles = (entities [["LandVehicle"], [], false, true]) select {
		(getNumber (configFile >> "CfgVehicles" >> typeOf _x >> "hasDriver")) isEqualTo 1 &&
		 {(crew _x) isEqualTo []}
	};

	{	
		_vehicle = _x;
		(_vehicle call BIS_fnc_getPitchBank) params ["_vx","_vy"];
		if (([_vx,_vy] findIf {_x > 80 || _x < -80}) != -1 && {!canMove _vehicle}) then {
			0 = [_vehicle] spawn _fnc_flipVeh;
		};

	} forEach _allVehicles;
	sleep 20;
};