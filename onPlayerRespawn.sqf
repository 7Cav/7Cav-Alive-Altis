diag_log "onPlayerRespawn start";

waitUntil { not isNull player };
waitUntil { not isNil "CLIENT_InitPlayerLocalComplete" };

private _respawn = player getVariable ["CLIENT_PlayerPosition", []];
player setPosASL (_respawn select 0);
player setDir (_respawn select 1);

[player] remoteExec ["SERVER_CuratePlayer", 2];

[player, [Headquarters, Carrier], []] execVM "scripts\greenZoneInit.sqf"; // No-combat zones

player addEventHandler ["Killed", { [_this select 0] spawn { sleep 300; hideBody (_this select 0) } }];

[player, "novoice"] remoteExec ["setSpeaker", 0, true]; //JIP

if (not isNil "CLIENT_RespawnLoadout") then { player setUnitLoadout CLIENT_RespawnLoadout };

// Set camera view from the profile, and update the profile if the camera view changes
private _cameraView = profileNamespace getVariable "CLIENT_RespawnCamera";
if (not isNil "_cameraView" && { _cameraView in ["EXTERNAL", "INTERNAL"] }) then { player switchCamera _cameraView };
[] spawn {
	
	scriptName "OnPlayerRespawn-CameraView";

	private _player = player;
	private _cameraView = "";
	while { alive _player } do {
		sleep 10;
		_cameraView = profileNamespace getVariable ["CLIENT_RespawnCamera", "INTERNAL"];
		if (_cameraView != cameraView) then {
			profileNamespace setVariable ["CLIENT_RespawnCamera", cameraView];
			saveProfileNamespace;
		};
	};
};

diag_log "onPlayerRespawn end";