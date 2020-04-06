/*
 * Author: Sweetwater
 * Pause OPCOM SYS PROFILE
 */

_dialogResult = [
	"PAUSE ALIVE PROFILER",
	[
		["PAUSED",
			[
				"True",
				"False"
			],0]
	]
] call Ares_fnc_ShowChooseDialog;

if (count _dialogResult == 0) exitWith {};

_opcom_pause = switch (_dialogResult select 0) do {
			case 0: { true };
			case 1: { false };
	};
{
		if(_opcom_pause) then {
			["ALIVE_SYS_PROFILE"] call ALiVE_fnc_pauseModule;	
		} else {
			["ALIVE_SYS_PROFILE"] call ALiVE_fnc_unPauseModule;
		};
	};
}