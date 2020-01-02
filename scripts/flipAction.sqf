private ["_caller","_veh"];
_caller = _this select 1;
_veh = nearestObjects [_caller, ["landVehicle"], 5] select 0;
_veh setVectorUp [0,0,1];
_veh setPosATL [(getPosATL _veh) select 0, (getPosATL _veh) select 1, 0];