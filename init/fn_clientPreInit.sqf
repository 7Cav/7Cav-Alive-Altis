CLIENT_HostColors =
[
	["HC1", "colorred"],
	["HC2", "colorgreen"],
	["HC3", "colorblue"],
	["HC4", "coloryellow"]
];

if (not hasInterface) exitWith {};

// Automatically close the briefing screen
if (isNumber (missionConfigFile >> "briefing") && { getNumber (missionConfigFile >> "briefing") == 1 }) then
{
	[] spawn
	{
		scriptName "CloseBriefingScreen";

		waitUntil
			{
				if (getClientState == "BRIEFING READ") exitWith { true };
				if (not isNull findDisplay 53) exitWith
				{
					ctrlActivate (findDisplay 53 displayCtrl 1);
					findDisplay 53 closeDisplay 1;
					true
				};
				false
			};
	};
};

CLIENT_CuratorType = "";

TypeFilter_All =
[
	["All", true]
];

TypeFilter_TransportRotory =
[
	["ParachuteBase", false],
	["RHS_UH60M*", true],
	["B_Heli_Transport_01_F", true],
	["B_Heli_Transport_03_unarmed_F", true],
	["B_Heli_Transport_03_F", true],
	["rhsusf_CH53E_USMC*", true],
	["RHS_UH1*", true],
	["B_CTRG_Heli_Transport_01_sand_F", true],
	["B_CTRG_Heli_Transport_01_tropic_F", true],
	["rhs_uh1h_hidf_unarmed", true],
	["rhs_uh1h_hidf_gunship", true],
	["rhs_uh1h_hidf", true],
	["I_Heli_light_03_unarmed_F", true],
	["I_Heli_light_03_dynamicLoadout_F", true],
	["I_Heli_Transport_02_F", true],
	["I_Heli_light_03_dynamicLoadout_F", true],
	["LOP_IRAN_CH47F", true],
	["LOP_IRAN_UH1Y_UN", true],
	["LOP_IRAN_CH47F", true],
	["LOP_IRAN_CH47F", true],
	["RHS_MELB_MH6M", true],
	["B_Heli_Light_01_F", true],
	["rhs_uh1h_hidf", true],
	["RHS_MELB_H6M", true],
	["B_Heli_Light_01_F", true],
	["RHS_CH_47F*", true],

	// Allowing Buffalo crew to run the armed blackfish as an AC130
	["B_T_VTOL_01_armed_F", true],

	// Titan vehicles
	["RHS_C130J", true],
	["B_T_VTOL_01_vehicle_F", true],
	["B_Heli_Transport_03_unarmed_F", true],

	["All", false]
];

//Raider Only
TypeFilter_AttackRotory =
[
	["ParachuteBase", false],
	["RHS_AH64D", true],
	["B_Heli_Attack_01_dynamicLoadout_F", true],
	["RHS_AH1Z", true],
	["RHS_AH64D", true],
	["RHS_AH64D", true],
	["RHS_MELB_AH6M", true],
	["B_Heli_Light_01_dynamicLoadout_F", true],
	["RHS_UH1Y_FFAR_d", true],
	["rhs_uh1h_hidf_gunship", true],
	["All", false]
];

// Ground attack aircraft
TypeFilter_GroundAttackAircraft =
[
	["ParachuteBase", false],
	["B_Plane_*", true],
	["FIR_*", true],
	["rhsusf_f22*", true],
	["RHS_A10*", true],
	["B_T_VTOL_01_armed_F", true],
	["All", false]
];


// Armored vehicles
TypeFilter_ArmoredVehicles =
[
	["MBT_03_base_F", true], // Leopard 2
	["MBT_01_base_F", true], // Most other western tanks (Abrams, Merkava)
	["RHS_M2A3*", true], // Add Bradleys here too so Manual Drive works for all
	["B_AFV_Wheeled_01_cannon_F", true], // Rookiat tank destoryer
	["All", false]
];

// Base service vehicles
TypeFilter_BaseServiceVehicles =
[
	["rhsusf_M97*", true], // Big slow logi vics
	["All", false]
];

TypeFilter_LogisticsVehicles =
[
	["B_Truck_*", true],
	["C_IDAP_Van_02_medevac_F", true],
	["rhsusf_M108*", true], // CP SOV + more logi trucks
	["rhsusf_M107*", true], // Rearm SOV + more logi trucks
	["rhsusf_M1230A1*", true], // Medical MRAP
	["rhsusf_M109*", true], // SPG
	["rhsusf_m113_usarmy_medical", true], //Medical M113
	["B_APC_Tracked_01*", true], //Bobcat
	["All", false]
];

TypeFilter_InfantryVehicles =
[
	// Disable logistics vics since we wildcard them below
	["rhsusf_M108*", false],
	["rhsusf_M107*", false],
	["rhsusf_M97*", false],
	["rhsusf_M1230A1*", false], // Medical MRAP
	["B_Truck_01_medical_F", false], // Medical HEMTTs
	["C_IDAP_Van_02_medevac_F", false], // Ambulance
	["rhsusf_m113_usarmy_medical", false], // Medical M113
	["B_APC_Tracked_01_CRV_F", false], // Bobcat
	
	//Static weapoons
	["StaticWeapon", true],

	//Available Ao vehicles
	["LOP_US_UAZ_DshKM",true],
	["LOP_US_Ural",true],
	["LOP_US_UAZ_AGS",true],
	["LOP_US_UAZ_SPG",true],
	
	// Enable all MRAPs except medical MRAP
	["rhsusf_M1220_*", true], // MRAPs
	["rhsusf_M1230_*", true], // MRAPs
	["rhsusf_M1232_*", true], // MRAPs

	//M113 varients (Not Medical)
	["rhsusf_m113_usarmy_unarmed", true],
	["rhsusf_m113_usarmy_MK19_90", true],
	["rhsusf_m113_usarmy_MK19", true],
	["rhsusf_m113_usarmy_M240", true],
	["rhsusf_m113_usarmy_M2_90", true],
	["rhsusf_m113_usarmy", true],
	["rhsusf_m113_usarmy_supply", true],

	["Car", true],
	["O_HMG_01_*", true],
	["I_HMG_01_*", true],
	["Ship", true],
	["RHS_M2A3*", true], // Bradleys
	["LT_01_base_F", true], // Wiesel
	["I_APC_tracked_03_base_F", true], // Warrior AFV
	["B_APC_Wheeled_01_cannon_F", true], // NATO Vanilla APC (Badger IFV)
	["B_MRAP_01_F", true], // MATV
	["rhsusf_m998*", true], // Soft top HMMWV
	["rhsusf_m102*", true], //HMMWV
	["rhsusf_m104*", true], //HMMWV
	["rhsusf_mrzr*", true], // MRZR
	["All", false]
];

// Gear restrictions for various classes
GR_All =
[
	["All", true, ""]
];

// Vehicle permission conditions

VPC_UnlessLogisticsDriving =
{
	params ["_vehicle", "_player", "_type"];

	if (not ((driver _vehicle) getVariable ["JBA_LogisticsSpecialist", false])) exitWith { "" };

	private _vehicleName = [typeOf _vehicle, "CfgVehicles"] call JB_fnc_displayName;
	private _driverName = ([roleDescription driver _vehicle] call SPM_Util_CleanedRoleDescription);

	format ["You may not enter this %1 while it is driven by a %2", _vehicleName, _driverName]
};

VPC_UnlessOccupied =
{
	params ["_vehicle", "_player", "_type"];

	if (count crew _vehicle == 0) exitWith { "" };

	private _vehicleName = [typeOf _vehicle, "CfgVehicles"] call JB_fnc_displayName;

	format ["You may not drive this %1 while it is occupied", _vehicleName]
};

VPC_UnlessArmed =
{
	params ["_vehicle", "_player", "_type"];

	if ((weapons _vehicle) findIf { [_x] call JB_fnc_isOffensiveWeapon } == -1) exitWith { "" };

	private _vehicleName = [typeOf _vehicle, "CfgVehicles"] call JB_fnc_displayName;

	switch (_type) do
	{
		case "VP_Pilot" : { format ["You may not fly this %1 because it is armed", _vehicleName] };
		default { format ["You may not operate weapons on this %1", _vehicleName] };
	};
};

VPC_UnlessTurretArmed =
{
	params ["_vehicle", "_player", "_type"];

	private _turretWeapons = [];
	{ _turretWeapons append (_vehicle weaponsTurret _x) } forEach allTurrets _vehicle;

	if (_turretWeapons findIf { [_x] call JB_fnc_isOffensiveWeapon } == -1) exitWith { "" };

	private _vehicleName = [typeOf _vehicle, "CfgVehicles"] call JB_fnc_displayName;

	format ["You may not operate weapons on this %1", _vehicleName]
};

CLIENT_SetInfantryVehiclePermissions =
{
	params ["_player"];

	private _permissions = [];

	// We disallow infantry to ride in the vehicle transport chinook
	_permissions = [];
	_permissions pushBack [TypeFilter_All, [], {}];
	_permissions pushBack [TypeFilter_LogisticsVehicles, [], {}];
	_player setVariable ["VP_Cargo", _permissions];

	_permissions = [];
	_permissions pushBack [TypeFilter_InfantryVehicles, [], {}];
	_player setVariable ["VP_Driver", _permissions];

	_permissions = [];
	_permissions pushBack [TypeFilter_InfantryVehicles, [], {}];
	_permissions pushBack [TypeFilter_LogisticsVehicles, [], {}];
	_permissions pushBack [TypeFilter_All, [VPC_UnlessArmed], {}];
	_player setVariable ["VP_Gunner", _permissions];

	_permissions = [];
	_permissions pushBack [TypeFilter_InfantryVehicles, [], {}];
	_permissions pushBack [TypeFilter_LogisticsVehicles, [], {}];
	_permissions pushBack [TypeFilter_All, [VPC_UnlessTurretArmed], {}];
	_player setVariable ["VP_Commander", _permissions];

	_permissions = [];
	_permissions pushBack [TypeFilter_LogisticsVehicles, [], {}];
	_permissions pushBack [TypeFilter_InfantryVehicles, [], {}];
	_permissions pushBack [TypeFilter_TransportRotory, [], { if (player in [(_this select 0) turretUnit [0]]) then { (_this select 0) enableCopilot false } }];
	_permissions pushBack [TypeFilter_All, [VPC_UnlessTurretArmed], { if (player in [(_this select 0) turretUnit [0]]) then { (_this select 0) enableCopilot false } }];
	_player setVariable ["VP_Turret", _permissions];

	_player setVariable ["VP_Pilot", []];
	[TypeFilter_ArmoredVehicles] call JB_fnc_manualDriveInitPlayer;
};

CLIENT_SetArmorCrewVehiclePermissions =
{
	params ["_player"];

	[_player] call CLIENT_SetInfantryVehiclePermissions;

	// Add to the infantry permissions
	{
		player setVariable [_x, [[TypeFilter_ArmoredVehicles, [VPC_UnlessLogisticsDriving], {}]] + (player getVariable _x)];
	} forEach ["VP_Driver", "VP_Gunner", "VP_Commander", "VP_Turret"];
};

Repair_DefaultGetRepairProfile =
{
	private _engineer = param [0, objNull, [objNull]];
	private _vehicle = param [1, objNull, [objNull]];
	private _systemName = param [2, "", [""]];

	if (not ((toLower _systemName) find "wheel" >= 0)) exitWith { [false, 0, 0, "", false] };

	[true, 1.0, 0.4, "", true]
};

Repair_DefaultCanRepairVehicle =
{
	private _engineer = param [0, objNull, [objNull]];
	private _vehicle = param [1, objNull, [objNull]];

	private _vehicleType = typeOf _vehicle;

	_vehicleType isKindOf "Car"
};

Repair_DefaultProfile = [Repair_DefaultGetRepairProfile, Repair_DefaultCanRepairVehicle];

Repair_ArmorGetRepairProfile =
{
	private _engineer = param [0, objNull, [objNull]];
	private _vehicle = param [1, objNull, [objNull]];
	private _systemName = param [2, "", [""]];

	private _vehicleType = typeOf _vehicle;

	if (not ([_engineer, _vehicle] call Repair_ArmorCanRepairVehicle)) exitWith { [false, ""] };

	if (not ((toLower _systemName) find "wheel" >= 0) && { (not ("ToolKit" in (backpackItems player))) }) exitWith
	{
		[true, 0, 0, format ["%1 repairs require a Toolkit", _systemName], false];
	};

	private _repairPPS = 1.0;
	private _targetPC = 0.4;
	private _message = "";

	if (_vehicleType isKindOf "Tank") then
	{
		_repairPPS = 1.2;
	};

	{
		switch (_x getVariable ["REPAIR_ServiceLevel", 0]) do
		{
			case 2:
			{
				if (_targetPC > 0.0) then
				{
					_targetPC = 0.0;
					_message = format ["Using repair facilities of %1", [typeOf _x, "CfgVehicles"] call JB_fnc_displayName];
				};
			};
		};
	} forEach (nearestObjects [_engineer, ["All"], 15]);

	[true, _repairPPS, _targetPC, _message, true]
};

Repair_ArmorCanRepairVehicle =
{
	private _engineer = param [0, objNull, [objNull]];
	private _vehicle = param [1, objNull, [objNull]];

	((typeOf _vehicle) isKindOf "Tank") || { ((typeOf _vehicle) isKindOf "Car") }
};

Repair_ArmorProfile = [Repair_ArmorGetRepairProfile, Repair_ArmorCanRepairVehicle];

Parachute_Aircraft_HALO_Condition =
{
	params ["_vehicle"];

	(getPos _vehicle) select 2 > 250 && { speed _vehicle < 300 }
};

Parachute_Aircraft_StaticLine_Condition =
{
	params ["_vehicle"];

	(getPos _vehicle) select 2 > 100 && { speed _vehicle < 300 }
};

Parachute_ParadropCommanded =
{
	_this spawn
	{
		params ["_unit"];

		_unit setVariable ["Parachute_ParadropCommanded", true];
		sleep 5;
		_unit setVariable ["Parachute_ParadropCommanded", nil];
	};
};

Parachute_ParadropGetOutHandler =
{
	params ["_vehicle", "_position", "_unit", "_turret"];

	if (_unit != player) exitWith {};

	if (not (_vehicle getVariable ["Parachute_Paradrop", false])) exitWith {};

	if (_unit getVariable ["Parachute_ParadropCommanded", false]) exitWith {};

	if ([_vehicle] call Parachute_Aircraft_HALO_Condition) exitWith
	{
		[_unit, false] call JB_fnc_halo;
	};

	if ([_vehicle] call Parachute_Aircraft_StaticLine_Condition) exitWith
	{
		[_unit, true] call JB_fnc_halo;
	};
};

Parachute_SetupClient =
{
	params ["_vehicle"];

	if (not hasInterface) exitWith {};

	_vehicle setVariable ["Parachute_Paradrop", true];

	_vehicle addAction ["Paradrop - HALO", { [player] call Parachute_ParadropCommanded; [player, false] call JB_fnc_halo }, nil, 2, false, true, "", '[_target] call Parachute_Aircraft_HALO_Condition && { (assignedVehicleRole player) select 0 == "cargo" }'];
	_vehicle addAction ["Paradrop - static line", { [player] call Parachute_ParadropCommanded; [player, true] call JB_fnc_halo }, nil, 2, false, true, "", '[_target] call Parachute_Aircraft_StaticLine_Condition && { (assignedVehicleRole player) select 0 == "cargo" }'];

	_vehicle addEventHandler ["GetOut", Parachute_ParadropGetOutHandler];
};

BobcatService_SetupClient =
{
	params ["_vehicle"];

	if (not hasInterface) exitWith {};

	_vehicle addAction ["<t color='#FFFF99'>Repair/refuel aircraft</t>", { [vehicle (_this select 1), [["repair", 60, 0.0], ["refuel", 60, 1.0]]] call JB_fnc_serviceVehicle }, nil, 15, false, true, "", '((vehicle _this) isKindOf "Air") && { not ((vehicle _this) isKindOf "ParachuteBase") }'];

	[_vehicle] call Bobcat_SetupClient;
};

Billboard_ShowMessage =
{
	params ["_width", "_height", "_message"];

	disableSerialization;
	createDialog "RscDisplayEmpty";
	private _ctrl = findDisplay -1 ctrlCreate ["RscStructuredText", -1];
	_ctrl ctrlSetBackgroundColor [0, 0, 0, 0.7];
	_ctrl ctrlSetPosition [(1.0 - _width) / 2, (1.0 - _height) / 2, _width, _height];
	_ctrl ctrlCommit 0;
	_ctrl ctrlSetStructuredText _message;
};

Billboard_Rules = [];

Billboard_GetRules =
{
	params ["_ruleNumber"];

	if (_ruleNumber < 0 || _ruleNumber > 7) exitWith {};

	if (count Billboard_Rules == 0) then
	{
		Billboard_Rules pushBack "unused"; // Rule 0
		for "_i" from 1 to 7 do
		{
			Billboard_Rules pushBack (loadFile format ["media\text\billboard-rule-%1.txt", _i]);
		};
	};

	private _rules = ['<t align="center" size="1.2">SERVER RULES</t><t color="#AAAAAA">'];

	if (_ruleNumber == 0) then
	{
		_rules pushBack "<t color='#FFFFFF'>";
		_rules append (Billboard_Rules select [1,7]);
		_rules pushBack "</t>";
	}
	else
	{
		for "_i" from 1 to (_ruleNumber - 1) do
		{
			_rules pushback (Billboard_Rules select _i);
		};
		_rules pushBack "<t color='#FFFFFF'>";
		_rules pushBack (Billboard_Rules select _ruleNumber);
		_rules pushBack "</t>";
		for "_i" from (_ruleNumber + 1) to 7 do
		{
			_rules pushBack (Billboard_Rules select _i);
		};
	};

	_rules joinString ""
};

Billboard_ShowRule =
{
	params ["_ruleNumber"];

	private _ruleText = [_ruleNumber] call Billboard_GetRules;

	if (_ruleText == "") exitWith {};

	_ruleText = _ruleText + "<br/>
<br/><t color='#FFFFFF'>Press ESC to dismiss this window</t>";

	[safeZoneW * 0.95, safeZoneH * 0.95, parseText _ruleText] call Billboard_ShowMessage;
};

CLIENT_CombatTeleportCondition =
{
	params ["_trigger", "_distance"];

	private _permitTeleport = true;

	{
		if (not ((side _x) in [west, civilian])) exitWith { _permitTeleport = false };
	} forEach ((getPos _trigger) nearEntities [["LandVehicle", "Ship", "Air", "Man"], _distance]);

	_permitTeleport
};

CLIENT_DisableActionMenuLevel = 0;

CLIENT_DisableActionMenu =
{
	CLIENT_DisableActionMenuLevel = CLIENT_DisableActionMenuLevel + 1;
};

CLIENT_EnableActionMenu =
{
	CLIENT_DisableActionMenuLevel = CLIENT_DisableActionMenuLevel - 1;
};

CLIENT_ActionMenuNextHandler =
{
	CLIENT_DisableActionMenuLevel > 0
};

CLIENT_ActionMenuPrevHandler =
{
	CLIENT_DisableActionMenuLevel > 0
};

CLIENT_ActionMenuActionHandlers = [];

CLIENT_ActionMenuActionHandler =
{
	if (CLIENT_DisableActionMenuLevel > 0) exitWith { true };

	private _override = false;

	{
		_override = _override || (_this call _x);
	} forEach CLIENT_ActionMenuActionHandlers;

	_override
};

CLIENT_OverriddenActions = [];
CLIENT_OverrideActionHandler =
{
	private _name = _this select 3;
	private _index = CLIENT_OverriddenActions findIf { _x select 0 == _name };

	if (_index == -1) exitWith { false };

	_this call (CLIENT_OverriddenActions select _index select 1)
};

CLIENT_ActionMenuActionHandlers pushBack CLIENT_OverrideActionHandler;

[] spawn
{
	waitUntil { not isNull (findDisplay 46) };

	(findDisplay 46) displayAddEventHandler ["KeyDown",
		{
			private _index = CLIENT_OverriddenActions findIf { inputAction (_x select 0) > 0 };
			if (_index == -1) exitWith { false };

			_this call (CLIENT_OverriddenActions select _index select 2)
		}];

	(findDisplay 46) displayAddEventHandler ["MouseButtonDown",
		{
			private _index = CLIENT_OverriddenActions findIf { inputAction (_x select 0) > 0 };
			if (_index == -1) exitWith { false };

			_this call (CLIENT_OverriddenActions select _index select 3)
		}];
};

CLIENT_OverrideAction =
{
	params [["_name", "", [""]], ["_menuHandler", {true}, [{}]], ["_keyHandler", {true}, [{}]], ["_mouseHandler", {true}, [{}]]];

	CLIENT_OverriddenActions pushBack _this;
};

DOC_VehicleRepairs = "<font size='16'>Vehicle repairs</font><br/>
If a vehicle is damaged, you can make partial repairs to it at any time.  The repair interaction is available through the 'Inspect vehicle condition' scroll
wheel action.  You must have a repair kit in order to make repairs to any system other than a vehicle's wheels.  If you do not carry a repair kit, you may be able
to find one in the vehicle's inventory.  Repairs take time, so make allowances in a combat area.  If you make repairs while close to a repair HEMTT or a Taru
repair pod then you can completely restore the vehicle.  If a Logistics specialist makes repairs near a tool cart (found at gas stations) then those repairs will
be almost complete.  Note that full repairs can be completed automatically for any vehicle by any player at the base repair yard.<br/>";

DOC_VehicleAmmunition = "<font size='16'>Vehicle ammunition</font><br/>
To rearm a vehicle, you must interact with an ammunition HEMTT, a Taru ammunition pod, or the ammunition container in the logistics building at base.  Ammunition
is transferred manually, although Logistics specialists may use ammunition trolleys at the logistics building to move up to two tons of ammunition at a time.  Go to the
ammunition supply, use the 'Transfer ammo' scroll wheel action, select the ammunition that you want from the top list, press space
to pick up one or more magazines, and press Escape to dismiss the dialog.  then move to the vehicle you want to load, 'Transfer ammo', select from the bottom
list and press space to load ammunition into the vehicle.  Heavy rounds are transferred singly, while lighter rounds are transferred as whole magazines.<br/>";

DOC_VehicleFuel = "<font size='16'>Vehicle fuel</font><br/>
Armor uses fuel quickly, and main battle tasks especially so.  To refuel a vehicle, you must interact with a fuel HEMTT, a Taru fuel pod, or a fuel pump at an island gas station.
Go to the fuel source, use the 'Get fuel line' scroll wheel action, move to the vehicle and use the 'Fuel vehicle' scroll wheel action.  Fueling is then automatic.  When completed,
the fuel line will drop away from the vehicle and retract.  The fuel HEMTT and Taru fuel pods have an indicator on their exterior to indicate how much fuel remains onboard.<br/>";

DOC_ArmorTransport = "<font size='16'>Reaching an operation</font><br/>
You can either drive your vehicle to an operation (which is visible on the map as a crossed-swords task icon) or you can request a 'heavy lift' from
one of two Taru transport helicopters, call signs Grizzly 2 and 3.  When being lifted by helicopter, it is important that the driver is not in the driver's
seat at any time during the lift procedure.  Ideally, the driver connects the lift lines to your vehicle, then rides in the back of the vehicle during the
lift.  Once on the ground, the driver can transfer back to the driver's seat.  When at base, move your vehicle to the Heavy Lift Area for pickup.<br/>";

DOC_ArmorCapture = "<font size='16'>Capturing enemy vehicles</font><br/>
You and your crew can disable and capture enemy armored vehicles.  Those vehicles can be repaired and refueled, but the only ammunition available for them is the
ammunition that they carry.  Note that the ammunition transfer system allows you to replenish your stores from any enemy vehicle that carries compatible ammunition.
Note too that the enemy crew will dismount a disabled vehicle and attempt to make field repairs to it.<br/>";

DOC_AircraftService = "<font size='16'>Aircraft service</font><br/>
To service your aircraft, you must land at any of the available service locations which are marked on the map.  There are two types of service, automatic and manual.
To use an automatic service point, move your aircraft onto the marked service pad, initiating automatic servicing of your aircraft.  To use a manual service point, move your aicraft
close to a set of three large container objects.  Each container provides one type of service (ammunition, fuel, or repair).  Look at the container from the cockpit
of your aircraft so that you can see the icon for the provided service, press space, and that service should start.  Manual service points service all aircraft types while the automated
service points are specific to aircraft type; fixed wing aircraft use the service points marked with rectangular pads while rotary wing aircraft use those marked with
circular pads.<br/>";

DOC_ZeusBindings = "
<font face='EtelkaMonospacePro' size='10'>CTRL+SHIFT+L</font> Toggles a daylight mode visible only to you while in Zeus.<br/>";

DOC_MissionController = "<font size='16'>Mission Controller</font><br/>
As a mission controller, you have full access to Zeus as well as some additional keyboard bindings and text commands.  Note that all commands keywords can be abbreviated to as few as three letters.  For example, the command 'mc advance stop' can be shortened to 'mc adv sto'.<br/>";

DOC_MissionControllerCommands = "
<font face='EtelkaMonospacePro' size='10'>mc loyalty cavbucks (amount) (playername)</font><br/><br/>
Adds CavBucks to a player. MCC leaders should usually get 1, or 2 if it was a difficult job.<br/><br/>
<font face='EtelkaMonospacePro' size='10'>mc loyalty points (amount) (playername)</font><br/><br/>
Adds loyalty points to a player. For MCC rewards, use CavBucks instead.<br/><br/>
<font face='EtelkaMonospacePro' size='10'>mc loyalty cooldown (length) (playername)</font><br/><br/>
Sets the loyalty cooldown spawn for a player, in minutes, since their last vehicle spawn.<br/><br/>
<font face='EtelkaMonospacePro' size='10'>mc weather true/false</font><br/><br/>
Enables or disables automatic weather and time acceleration.<br/><br/>
<font face='EtelkaMonospacePro' size='10'>mc missionend get</font><br/><br/>
Returns the number of minutes until the map rolls over.<br/><br/>
<font face='EtelkaMonospacePro' size='10'>mc missionend add (minutes)</font><br/><br/>
Adds extra minutes to the mission end timer. If given a negative value, it will reduce the time.<br/><br/>
<font face='EtelkaMonospacePro' size='10'>mc fortify points (amount)</font><br/><br/>
Adds (or removes, if negative) an amount of points from the FOB fortify budget.<br/><br/>
<font face='EtelkaMonospacePro' size='10'>mc diceroll (sides)</font><br/><br/>
Roll an n-sided die.<br/><br/>
<font face='EtelkaMonospacePro' size='10'>mc operation stop</font><br/><br/>
Stops the selected operation.  To select an operation, go to the Zeus map and CTRL+SHIFT+MB1 on the operation.<br/><br/>
<font face='EtelkaMonospacePro' size='10'>mc advance stop</font><br/><br/>
Stops the advance system.<br/><br/>
<font face='EtelkaMonospacePro' size='10'>mc advance start</font><br/><br/>
Starts the advance system.  If suspended, the next operation in the advance is started.  If stopped, a new advance is created.<br/><br/>
<font face='EtelkaMonospacePro' size='10'>mc advance suspend</font><br/><br/>
Stops the current operation of the advance with a 'no verdict' result.  If the advance is later started, activities begin with the next operation in the advance.<br/><br/>
<font face='EtelkaMonospacePro' size='10'>mc specops stop</font><br/><br/>
Stop the current special operation sequence.  To stop only the current mission, CTRL+SHIFT+MB1 on it on the map and issue the command 'mc operation stop'<br/><br/>
<font face='EtelkaMonospacePro' size='10'>mc curate all</font><br/><br/>
Curates all active units and all vehicles for Zeus users.  This is provided both to deal with scripters who introduce such units and vehicles, and also to deal with the occasional missed curation by ARMA.<br/><br/>";

DOC_MilitaryPolice = "<font size='16'>Military Police</font><br/>
As a member of the military police, you have access to Zeus and can see all active units.  You also have access to additional keyboard bindings and text commands.<br/><br/>
Commands:<br/>";

DOC_MilitaryPoliceCommands = "
<font face='EtelkaMonospacePro' size='10'>mp teleport player|vehicle (name) player|marker|location (name)</font><br/><br/>
Teleport the named player to a destination described by another player, by a map marker, or by a location name (locations are villages, cities, mountains, etc).  The 'mp teleport player'
command teleports only the named player while the 'mp teleport vehicle' command will teleport the named player as well as the vehicle he is riding in along with all other players in that
vehicle.  Examples of this command are 'mp teleport player bob marker staging' and 'mp teleport vehicle bob player mary'.  The latter command would place Bob's vehicle, along with all of its
occupants, on top of player Mary.  When teleporting the player or vehicle will arrive on top of whatever is at the destination location, including on top of rocks, buildings, trees, vehicles,
etc.  Note that all names are case insensitive and any unique portion of a name may be specified.<br/><br/>
<font face='EtelkaMonospacePro' size='10'>mp eject (player)</font><br/><br/>
Force the named player to leave his current vehicle.<br/><br/>
<font face='EtelkaMonospacePro' size='10'>mp boot (player)</font><br/><br/>
Force the named player to return to the server lobby.<br/><br/>
<font face='EtelkaMonospacePro' size='10'>mp boot ALL</font><br/><br/>
Force all players to return to the server lobby. The keyword ALL must be in uppercase letters.  Once all players are in the lobby, the server will restart the mission.<br/><br/>
<font face='EtelkaMonospacePro' size='10'>mp rule (number) (player)</font><br/><br/>
Show a full screen rules list to the named player.  The specified rule number will be highlighted.  Valid rule numbers are 1 through 7.  IMPORTANT: while the list is visible,
the player cannot use any game controls.  They must first press escape to dismiss the rules list.<br/><br/>
<font face='EtelkaMonospacePro' size='10'>mp safety on/off (player)</font><br/><br/>
While on, the safety feature prevents the named player from firing any weapon.<br/>";

DOC_MedicDescription =
"Be sure to read both the Advances and Special Operations sections of the Briefing to understand the parameters and strategies of each.<br/><br/>
You are a medic.  Your responsibilities are, in order of priority, to revive incapacitated soldiers, to heal wounded soldiers, and to engage the enemy.  Incapacitated soldiers
within 500 meters will be visible to you as a red icon.  That icon will show you the class of the incapacitated soldier, the distance to that soldier, and the soldier's
name.  Active medics within 500 meters will be visible to you as a white icon carrying the same information.  Display of the icons can be turned on and off by pressing CTRL+SHIFT+U.<br/><br/>
To revive a soldier, move next to him and use the 'Revive wounded' scroll wheel option.  A revive consumes a First Aid Kit from either your inventory or the
incapacitated soldier's inventory, and restores the soldier to 100% health.  Incapacitated soldiers can also revive themselves after a delay by using the scroll wheel option 'Revive self',
which restores them to no less than 25% health.  Note that you can also carry and drag soldiers, allowing you to move them to safety before attempting to revive them.  Further, you can throw
smoke grenades to obscure your position when moving to or from the site of a medical emergency.  In general, you should only use white smoke grenades, and be sure not to confuse your smoke
grenades with your fragmentation grenades.<br/><br/>
To heal a soldier, move next to the soldier and use the 'Treat soldier' scroll wheel option.  If you are carrying a Medikit, you can perform an unlimited number of treatments.  If not, you will consume a
first aid kit.  When you treat a soldier, they are restored to full health.  When they treat themselves, they are restored to no less than 75% health at the cost of a first aid kit.  Note that injuries
will impact a soldier's effectiveness, so you should make it a priority to keep all of your soldiers healthy.<br/><br/>
Just as you can revive incapacitated soldiers, other soldiers have the ability to stabilize them at the cost of a first aid kit.  This can be of great help when you cannot reach a casualty quickly
because a stabilized patient will bleed out far more slowly, giving you more time to reach the downed man.<br/><br/>
Ambulances and medical HEMTTs can also be used to revive incapacitated soldiers.  Simply carry or drag the soldier to the vehicle and load them via a scroll wheel option.  After
a delay that is dependent on the severity of the soldier's wounds, the soldier will be revived.  Any soldier can perform this action.  When a revive is performed, one first aid
kit is consumed from the vehicle's inventory.  If no first aid kits are in inventory, the vehicle will not perform any revives.  Adding a first aid kit to an empty vehicle after
loading an incapacitated soldier will not start a revive.  The soldier must be reloaded into the vehicle.<br/>";

DOC_InfantryTransportAir = "<font size='16'>Reaching an operation by helicopter</font><br/>
Operations can be reached by helicopter transport.  These helicopters are flown by other players, and they land on the four helipads
adjacent to the area where you started.  Once aboard the aircraft, you need only wait to be taken to the main operation.  As you gain
experience, you may develop preferences for where you'd like to be dropped at a certain operation.  Use the in-game voice and chat channels to communicate with the pilot.
Note that the pilot has the final say about where the aircraft lands.  You are advised to not distract the pilot, especially during takeoffs and landings.  Once the aircraft is
safely on the ground, exit it quickly so that the aircraft can leave quickly.<br/><br/>
Certain transport aircraft also have the ability to perform a paradrop.  There are two types of paradrops; High-Altitude Low-Opening (HALO) and static line.  Both types of drop
provide parachutes for you automatically, and you will receive your backpack when you safely reach the ground.  HALO drops involve troops being dropped from at least 250 meters
and opening their own parachutes, while static line drops involve troops being dropped from at least 100 meters with the parachutes opening automatically.  On aircraft capable
of paradropping troops, there are indicators in the lower left of the screen that show whether the aircraft is in the correct flight envelope for each type of paradrop (below
300km/h).  Once the appropriate light is green, you have complete control over the timing of your paradrop.  If you eject from the aircraft above 100 meters, you will perform a
static line paradrop.  If you use the Eject option above 250 meters, you will perform a HALO paradrop.  You can start a specific type of jump by using the scroll wheel menu instead
of ejecting.<br/>";

DOC_Paradrop = "<font size='16'>Parachute drops</font><br/>When you make a paradrop, you will automatically be given a parachute.  When you reach the ground, you will be given your original backpack and all of its contents.  When you are in
free fall (as in the start of a HALO drop), you can track across the ground by using the WASD keys, allowing you a degree of control over your landing position.  The longer you free fall, the more time you
will have to track and the more control you will have over your final position.  You open your chute by either using the scroll wheel menu or by pressing SPACE-SPACE.  The first SPACE
will bring up the scroll wheel menu, and the second will select the first menu item, which is the one that opens your parachute.  It is suggested that novices open their parachute above
150 meters when performing a HALO.  Steer your parachute with the mouse by turning gently in the direction that you want to steer.  Sharp mouse movements will only cause the camera to turn.
You can use the W and S keys to increase or decrease the rate of your descent.  Press the S key just before reaching the ground to produce a gentle landing.  A parachute may be cut away using
the V key, causing you to enter free fall. You can then open a reserve chute just as you opened the main.  The reserve can also be cut away, but it is suggested that this be done only when
close to the ground because only one reserve chute is available on any given drop.<br/>";

DOC_InfantryTransportGround = "<font size='16'>Reaching an operation by ground</font><br/>
Operations can be reached by ground transport.  There is a parking lot on the northwest side of the headquarters building where you can
board a vehicle and drive yourself (and other soldiers) to the main operation.  Armored vehicles may only be used by armor drivers and crew.  The fuel, repair and ammunition
HEMTTs may only be used by logistics specialists.  Medical HEMTTs and ambulances may only be used by medical personnel.  Anyone may use the Prowlers, Striders, Hunters and Marshalls.
Note that the supplied Marshalls are downgunned so that squad-sized groups can operate together using a single vehicle.  If you should lose one or more wheels on your vehicle, you can
make repairs yourself by use of the 'Inspect vehicle condition' scroll wheel option.  All other damage can be repaired in the field only by armor crew and logistics specialists.  Any vehicle
can be driven to the repair yard at base to receive full repairs automatically.<br/><br/> If you flip your vehicle, you can unflip it by use of the 'Unflip vehicle' scroll wheel option.
If you abandon your vehicle, it will sit unused for a time, then be marked on the map as abandoned for a time, then return to base automatically, in full working condition.  The greater
the damage to the vehicle, the longer it will take for that vehicle to return.  If your vehicle is destroyed, it will reappear at base after a delay, in full working condition.<br/>";

DOC_InfantryTransportBoat = "<font size='16'>Reaching an operation by boat</font><br/>
Operations can be reached by sea.  There are two ports accessible to soldiers: North Harbor and South Harbor.  Each has a limited number of boats that can be used to
drive to a main operation - assuming that the operation is near a coastline.  Boats are treated the same as ground vehicles by the mission system. The fastest way to reach the
ports from base is to use the island teleport system.  Each flag pole on the island provides one or more teleports.  The headquarters flag pole is found in the infantry start
area.  Each port has a flag pole permitting a teleport back to headquarters.  Note that any teleport will be blocked if enemy soldiers are near the teleport destination.<br/>";

DOC_InfantryTransportHALO = "<font size='16'>Reaching an operation by HALO</font><br/>
The current operations of the advance can be reached by an automated HALO system.  To use the HALO system, enter the back of the Huron helicopter in the large green walled hangar by the infantry
start area, marked 'HALO Chopper' on the map.  Once in, you will see a message showing a countdown to your HALO jump.  When that countdown completes, you will be automatically moved to
the edge of the main operation, 2000 meters in the air.  Note that infantry in the same group will jump together, regardless of when they entered the aircraft.  The farther an operation is from
base, the longer the countdown.<br/>";

CLIENT_IsCarrying =
{
	if (count (([player, "blockThrow"] call ace_common_fnc_statusEffect_get) select 1) == 0) exitWith { false };
	(([player, "blockThrow"] call ace_common_fnc_statusEffect_get) select 1) select 0 == "ace_dragging"
};

CLIENT_ForceDryFireCondition =
{
	if (not ([] call CLIENT_DryFireIsForced)) exitWith { false };
	if ([] call CLIENT_IsCarrying) exitWith { false };

	if ([[player] call SPM_Util_CurrentWeapon] call JB_fnc_isOffensiveWeapon) exitWith { true };

	false
};

CLIENT_ForceDryFire =
{
	titleText [[] call CLIENT_DryFireMessage, "plain down", 0.1];

	private _sound = (getArray (configFile >> "CfgWeapons" >> ([player] call SPM_Util_CurrentWeapon) >> "drysound")) select 0;

	if (_sound != "") then
	{
		playSound3d [_sound + ".wss", player];
	};
};

// Prevent placing anything
CLIENT_ForceDryFireFiredHandler =
{
	if ([] call CLIENT_DryFireIsForced && { [_this select 1] call JB_fnc_isOffensiveWeapon }) then
	{
		deleteVehicle (_this select 6);
		[[] call CLIENT_DryFireMessage, 0.5, true] call JB_fnc_showBlackScreenMessage;
	};
};

// Prevent throwing anything
CLIENT_ForceDryFireInputHandler =
{
	if (inputAction "throw" > 0 && { [] call CLIENT_DryFireIsForced }) then
	{
		// If on foot or in a "person turret", block the throw
		if (vehicle player == player || { [player] call SPM_Util_UnitIsInPersonTurret }) then
		{
			[[] call CLIENT_DryFireMessage, 0.5, true] call JB_fnc_showBlackScreenMessage;

			true
		};
	};
};

CLIENT_InitForceDryFireActions =
{
	player addAction ["", CLIENT_ForceDryFire, "", 0, false, true, "DefaultAction", "[] call CLIENT_ForceDryFireCondition"];
};

CLIENT_InitForceDryFire =
{
	[] call CLIENT_InitForceDryFireActions;
	player addEventHandler ["Respawn", CLIENT_InitForceDryFireActions];

	player addEventHandler ["FiredMan", CLIENT_ForceDryFireFiredHandler];
	(findDisplay 46) displayAddEventHandler ["KeyDown", CLIENT_ForceDryFireInputHandler];
	(findDisplay 46) displayAddEventHandler ["MouseButtonDown", CLIENT_ForceDryFireInputHandler];
};

CLIENT_DryFireMessage  =
{
	private _forceDryFire = player getVariable ["CLIENT_ForceDryFire", []];

	_forceDryFire = _forceDryFire select { _x != "" };

	_forceDryFire joinString "<br/>"
};

CLIENT_DryFireIsForced =
{
	CLIENT_CuratorType != "MC" && { count (player getVariable ["CLIENT_ForceDryFire", []]) > 0 }
};

CLIENT_StartForceDryFire =
{
	params ["_message"];

	private _forceDryFire = player getVariable ["CLIENT_ForceDryFire", []];
	_forceDryFire pushback _message;

	player setVariable ["CLIENT_ForceDryFire", _forceDryFire];

	(count _forceDryFire) - 1
};

CLIENT_EndForceDryFire =
{
	params ["_dryFire"];

	if (_dryFire == -1) exitWith {};

	private _forceDryFire = player getVariable ["CLIENT_ForceDryFire", []];
	if (count _forceDryFire > _dryFire) then
	{
		_forceDryFire set [_dryFire, ""];
	};

	for "_i" from count _forceDryFire - 1 to 0 step -1 do
	{
		if (_forceDryFire select _i != "") exitWith {};

		_forceDryFire deleteAt _i;
	};
};

CLIENT_ExpandingControlAreas = []; // [_position, id] - the index of the MAP_DrawnEllipses item

CLIENT_ExpandEnemyControl =
{
	_this spawn
	{
		params ["_position", "_endingRadius", "_expansionTime"];

		private _index = CLIENT_ExpandingControlAreas findIf { (_x select 0) isEqualTo _position };

		if (_index == -1 && _endingRadius < 0.0) exitWith {};

		if (_index == -1) then
		{
			_index = MAP_DrawnEllipses pushBack [_position, 1, 1, 0, [1,0,0,0.5], "#(rgb,8,8,3)color(1.0,0.0,0.0,0.5)"];
			_index = CLIENT_ExpandingControlAreas pushBack [_position, _index];
		};

		private _wave = CLIENT_ExpandingControlAreas select _index;

		if (_endingRadius < 0.0) exitWith
		{
			MAP_DrawnEllipses set [_wave select 1, []];
			CLIENT_ExpandingControlAreas set [_index, []];
		};

		private _ellipse = MAP_DrawnEllipses select (_wave select 1);

		private _startingRadius = _ellipse select 1;
		private _startingTime = diag_tickTime;
		private _expansionRate = (_endingRadius - _startingRadius) / _expansionTime;

		private _frameNumber = 0;
		while { _ellipse select 1 != _endingRadius } do
		{
			if (diag_frameNo != _frameNumber) then
			{
				_frameNumber = diag_frameNo;
				_radius = (_startingRadius + _expansionRate * (diag_tickTime - _startingTime)) min _endingRadius;
				_ellipse set [1, _radius];
				_ellipse set [2, _radius];
			};
			sleep 0.01;
		};
	};
};

CLIENT_ECA_DirectDamage =
{
	params ["_damageInterval"];

	private _damageRate = 0.01; // Per second
	private _damageIncrement = _damageRate * _damageInterval;

	private _currentDamage = (getAllHitPointsDamage player) select 2;
	private _minimumDamage = 1e30; { _minimumDamage = _minimumDamage min _x } forEach _currentDamage;
	_minimumDamage = _minimumDamage + _damageIncrement;

	if (_minimumDamage >= 1.0) then
	{
		player setDamage 1;
	}
	else
	{
		{
			player setHitIndex [_forEachIndex, _x max _minimumDamage];
		} forEach _currentDamage;
	};
};

#define DWELL_SCALE 0.0166

// [round-type, applicable-lethality-range, minimum-proximity-range, maximum-proximity-range]
CLIENT_ProximityRounds_Ground =
[
	["SmallSecondary", [0.0, 0.9], [40, 5], [50, 10]],
	["APERSMine_Range_Ammo", [0.0, 0.9], [40, 5], [50, 10]],
	["Sh_82mm_AMOS", [0.5, 1.0], [80, 5], [120, 30]],
	["Sh_155mm_AMOS", [0.7, 1.0], [100, 5], [150, 30]],
	["Sh_155mm_AMOS", [1.0, 1.0], [0, 0], [0, 0]]
];
CLIENT_ProximityRounds_Air =
[
	["SmallSecondary", [0.0, 1.0], [40, 5], [50, 10]],
	["APERSMine_Range_Ammo", [0.0, 1.0], [40, 5], [50, 10]]
];

CLIENT_MonitorEnemyControlledAreas =
{
	[] spawn
	{
		scriptName "CLIENT_MonitorEnemyControlledAreas";

		private _notifyTime = 0;

		private _damageTime = 0;

		private _markers = [];
		private _newMarkers = [];
		private _tracking = [];
		private _newTracking = [];
		private _oldTracking = [];

		private _marker = "";
		private _elapsedTime = 0.0;
		private _penetration = 0.0;
		private _lethality = 0.0;
		private _maxLethality = 0.0;
		private _minProximity = 0.0;
		private _maxProximity = 0.0;

		while { isNil "CLIENT_MonitorEnemyControlledAreas_STOP" } do
		{
			sleep 1;

			if (player == driver vehicle player) then
			{
				if (diag_tickTime > (_notifyTime min _damageTime)) then
				{
					_markers = allMapMarkers select { _x find "ADVANCE_EHA_" == 0 };
					_markers = _markers select { player distance (getMarkerPos _x) < ((getMarkerSize _x) select 0) };

					// Delete any tracking items that no longer apply
					_oldTracking = [];
					for "_i" from (count _tracking - 1) to 0 step -1 do
					{
						_marker = _tracking select _i select 0;
						if (player distance (getMarkerPos _marker) >= ((getMarkerSize _marker) select 0)) then { _oldTracking pushBack (_tracking deleteAt _i) };
					};

					// Find out which marked areas are new
					_newMarkers = _markers select { _marker = _x; _tracking findIf { _x select 0 == _marker } == -1 };

					// Create tracking items for new areas
					_newTracking = _newMarkers apply { [_x, diag_tickTime] };

					// Update the saved tracking list with items for every area that we're still in
					_tracking append _newTracking;
				};

				if (diag_tickTime > _notifyTime) then
				{
					// If we walked into a new area, notify the player.  If inside an area that is not a border, be more emphatic.  If only inside a border marker, be less emphatic.
					if (count _newMarkers > 0) then
					{
						if (_newMarkers findIf { _x find "_BORDER" == -1 } >= 0) then
						{
							titleText ["LEAVE THIS AREA.  IT IS CONTROLLED BY ENEMY FORCES.", "plain", 0.3];
						}
						else
						{
							titleText ["Leave this area.  Enemy forces are taking control.", "plain", 0.3];
						};
					};

					_notifyTime = diag_tickTime + 4.0;
				};

				// 60 seconds to maximum lethality in the center
				// 180 seconds to maximum lethality at the rim
				if (diag_tickTime > _damageTime) then
				{
					_maxLethality = 0.0;

					{
						_marker = _x select 0;
						_penetration = linearConversion [0.0, 1.0, (player distance getMarkerPos _marker) / ((getMarkerSize _marker) select 0), 1.0, 0.33]; // 1.0 at center, 0.33 at rim
						_elapsedTime = diag_tickTime - (_x select 1);
						_lethality =  (_elapsedTime * DWELL_SCALE * _penetration) min 1.0; // Lethality rises over time, more rapidly at the center, more slowly at the rim

						_maxLethality = _lethality max _maxLethality;

						_rounds = if (vehicle player isKindOf "Air") then { CLIENT_ProximityRounds_Air } else { CLIENT_ProximityRounds_Ground };
						_rounds = _rounds select { _lethality >= (_x select 1 select 0) && _lethality <= (_x select 1 select 1) };

						if (count _rounds > 0) then
						{
							_round = selectRandom _rounds;

							_minProximity = linearConversion ((_round select 1) + [_lethality] + (_round select 2));
							_maxProximity = linearConversion ((_round select 1) + [_lethality] + (_round select 3));

							[_minProximity, _maxProximity, player getDir getMarkerPos _marker, 215, _round select 0] remoteExec ["SERVER_RequestProximityRound", 2];
						};
					} forEach (_tracking select { (_x select 0) find "_BORDER" == -1 });

					_damageTime = diag_tickTime + linearConversion [0.0, 1.0, _maxLethality, 2.0 + random 4.0, 2.0];
				};
			};
		};
	};
};

Bobcat_PlowActionCondition =
{
	params ["_vehicle"];

	if (not alive _vehicle) exitWith { false };

	if (not (lifeState player in ["HEALTHY", "INJURED"])) exitWith { false };

	if (player != driver _vehicle) exitWith { false };

	private _actions = _vehicle getVariable "Bobcat_Actions";
	_vehicle setUserActionText [_actions select 0, if (_vehicle animationPhase "moveplow" > 0.5) then { "Raise plow" } else { "Lower plow" }];

	true
};

Bobcat_PlowAction =
{
	params ["_vehicle"];

	_vehicle animate ["moveplow", if (_vehicle animationPhase "moveplow" > 0.5) then { 0.0 } else { 1.0 }];
};

Bobcat_SetupClient =
{
	params ["_vehicle"];
	
	if (not hasInterface) exitWith {};

	private _action = _vehicle addAction ["", { [_this select 0] call Bobcat_PlowAction }, nil, 0, false, true, "", '[_target] call Bobcat_PlowActionCondition'];

	_vehicle setVariable ["Bobcat_Actions", [_action]];
};

Marshall_Fortify_GetLocationCondition =
{
	params ["_vehicle"];

	if (vehicle player != _vehicle) exitWith { false };

	if (not (lifeState player in ["HEALTHY", "INJURED"])) exitWith { false };

	true
};

Marshall_Fortify_GetMarker =
{
	format ["_USER_DEFINED Marshall_Fortify/0/%1", currentChannel];
};

Marshall_Fortify_GetLocation =
{
	params ["_vehicle"];

	private _depot = (allMissionObjects "Land_RepairDepot_01_base_F") select { "RepairDepot0" in (_x getVariable ["JB_PO_Object", []]) };

	if (count _depot == 0) exitWith { systemchat "The fortification tool is not deployed" };

	private _position = getPos (_depot select 0);

	private _marker = call Marshall_Fortify_GetMarker;
	deleteMarker _marker;

	private _marker = createMarkerLocal [_marker, _position];
	_marker setMarkerType "hd_flag";
	_marker setMarkerText "Fortification";

	systemchat format ["The fortification tool has been marked at %1, %2", floor ((_position select 0) / 100), floor ((_position select 1) / 100)];
};

Marshall_Fortify_SetupClient =
{
	params ["_vehicle"];

	_vehicle addAction ["Mark location of fortification tool", { _this call Marshall_Fortify_GetLocation }, nil, 0, false, true, "", "[_target] call Marshall_Fortify_GetLocationCondition"];
};

CLIENT_NearSupply =
{
	params ["_container", "_supplyType", "_distance"];

	// 40 meters is the distance between two large object centers
	private _supplies = (_container nearObjects 40) select { _x getVariable ["SupplyType", ""] == _supplyType };

	if (count _supplies == 0) exitWith { objNull };

	_supplies = _supplies apply { [[_container, _x] call JB_fnc_distanceBetweenBoundingBoxes, _x] };
	_supplies sort true;

	if (_supplies select 0 select 0 > _distance) exitWith { objNull };

	_supplies select 0 select 1
};

CLIENT_ClearVehicleInventory =
{
	[] spawn
	{
		private _itemCount = 0; { _itemCount = _itemCount + _x } forEach ((getItemCargo vehicle player select 1) + (getWeaponCargo vehicle player select 1) + (getBackpackCargo vehicle player select 1) + (getMagazineCargo vehicle player select 1));
		private _message = format ["Clear inventory on %1? (%2 items)", [typeOf vehicle player, "CfgVehicles"] call JB_fnc_displayName, _itemCount];
		if ([_message, "CLEAR VEHICLE INVENTORY", true, true, findDisplay 46] call BIS_fnc_guiMessage) then { [vehicle player] call JB_fnc_containerClear };
	};
};

CLIENT_ClearVehicleInventoryCondition =
{
	if (vehicle player == player) exitWith { false };

	if (player != driver vehicle player && { player != commander vehicle player } && { player != gunner vehicle player }) exitWith { false };

	true
};

CLIENT_EC_ActionContinue =
{
	params ["_container", "_object"];

	if (isNil "_object") then { _object = _container getVariable ["CLIENT_EC_ParentObject", _container] };

	if (vehicle player != player) exitWith { false };
	
	if (not (lifeState player in ["HEALTHY", "INJURED"])) exitWith { false };

	if (isNull ([_object, "arsenal", 5] call CLIENT_NearSupply)) exitWith { false };

	private _contact = [ASLtoAGL eyePos player, _object] call JB_fnc_distanceToObjectSurface;
	if (_contact select 2 < 0 || _contact select 2 > 2) exitWith { false };

	true
};

CLIENT_EC_GetContainer =
{
	params ["_container"];

	if (_container isKindOf "GroundWeaponHolder") then
	{
		private _innerContainers = everyContainer _container;
		
		_container = if (count _innerContainers == 0) then { objNull } else { _innerContainers select 0 select 1 };
	};

	_container
};

CLIENT_EC_ActionCondition =
{
	params ["_container", "_object"];

	if (_container == _object && { getCursorObjectParams select 2 > 2 }) exitWith { false };

	if (_container != _object && { ASLtoAGL eyePos player distance _object > 2 }) exitWith { false };

	if (not alive _container) exitWith { false };

	if (not ([_container] call JB_fnc_containerIsContainer)) exitWith { false };

	if ([_container] call JB_fnc_containerIsLocked) exitWith { false };

	if (not ([_container, _object] call CLIENT_EC_ActionContinue)) exitWith { false };

	private _actionID = player getVariable ["CLIENT_EC_ActionID", -1];
	if (_actionID != -1) then
	{
		player setUserActionText [_actionID, format ["Edit inventory of %1", getText (configFile >> "CfgVehicles" >> typeOf _container >> "displayName")]];
	};

	true
};

CLIENT_EC_Action =
{
	params ["_container", "_object"];

	if (_object != _container) then { _container setVariable ["CLIENT_EC_ParentObject", _object] };

	[_container, { _this call CLIENT_EC_ActionContinue }] call JB_fnc_containerEdit;
};

CLIENT_EC_PlayerInit =
{
	private _actionID = player addAction ["Edit inventory of container", { [[cursorObject] call CLIENT_EC_GetContainer, cursorObject] call CLIENT_EC_Action }, nil, 5, false, true, '', '[[cursorObject] call CLIENT_EC_GetContainer, cursorObject] call CLIENT_EC_ActionCondition'];
	player setVariable ["CLIENT_EC_ActionID", _actionID];
};

Base_Supply_Drop_Ammo_C_SetupActions =
{
	params ["_container"];

	_container addAction ["Restock ammunition from Arsenal", { [_this select 0] remoteExec ["Base_Supply_Drop_Ammo_StockContainer", _this select 0] }, nil, 5, false, true, '', 'not isNull ([_target, "arsenal", 5] call CLIENT_NearSupply)', 2];
};

Base_Supply_Drop_Items_C_SetupActions =
{
	params ["_container"];

	_container addAction ["Restock miscellaneous items from Arsenal", { [_this select 0] remoteExec ["Base_Supply_Drop_Items_StockContainer", _this select 0] }, nil, 5, false, true, '', 'not isNull ([_target, "arsenal", 5] call CLIENT_NearSupply)', 2];
};

Base_Supply_Drop_Mortars_C_SetupActions =
{
	params ["_container"];

	_container addAction ["Restock mortars from Arsenal", { [_this select 0] remoteExec ["Base_Supply_Drop_Mortars_StockContainer", _this select 0] }, nil, 5, false, true, '', 'not isNull ([_target, "arsenal", 5] call CLIENT_NearSupply)', 2];
};

Base_Supply_Drop_StaticWeapons_C_SetupActions =
{
	params ["_container"];

	_container addAction ["Restock static weapons from Arsenal", { [_this select 0] remoteExec ["Base_Supply_Drop_StaticWeapons_StockContainer", _this select 0] }, nil, 5, false, true, '', 'not isNull ([_target, "arsenal", 5] call CLIENT_NearSupply)', 2];
};

Base_Supply_Drop_Weapons_C_SetupActions =
{
	params ["_container"];

	_container addAction ["Restock weapons from Arsenal", { [_this select 0] remoteExec ["Base_Supply_Drop_Weapons_StockContainer", _this select 0] }, nil, 5, false, true, '', 'not isNull ([_target, "arsenal", 5] call CLIENT_NearSupply)', 2];
};

// Rubble searching callback
CLIENT_EOD_SafeExtract =
{
	params ["_object", "_positionASL"];

	if (not (player getUnitTrait "explosiveSpecialist")) then
	{
		_object setPosASL _positionASL;
	}
	else
	{
		// If EOD, then they get one second of non-damage to anything they pull out
		private _damageIsAllowed = isDamageAllowed _object;
		if (_damageIsAllowed) then { _object allowDamage false };
		_object setPosASL _positionASL;
		if (_damageIsAllowed) then { [_object] spawn { sleep 1; (_this select 0) allowDamage true } };
	};

	true
};

CLIENT_EOD_RevealSpottedMine =
{
	if (vehicle player != player) exitWith {};

	if (player distance cursorObject > 3.0) exitWith {};

	if (not (cursorObject in allMines)) exitWith {};
	
	playerSide revealMine cursorObject;
};

Logistics_PlaceDepot =
{
	params ["_source", "_depot", "_parameters"];

	_parameters params ["_depotType", "_fuelBladderType"];

	_depot setRepairCargo 0;

	_depot allowDamage false;
	[_depot] call JB_fnc_containerClear;
	[_depot] call JB_fnc_containerLock;
	_depot setVariable ["ASL_DONOTSLING", true, true]; //JIP

	// Dampen velocity as depot tries to jump out of the terrain
	_depot spawn
	{
		private _endMonitorTime = diag_tickTime + 5;
		while { diag_tickTime < _endMonitorTime } do
		{
			_this setVelocity [0,0,0];
			sleep 0.1;
		};
	};

	if ([_depot] call JB_PO_IsTemporaryObject) exitWith {}; // Don't process the local/temporary object

	_source setMass (getMass _source - 20000);

	private _typeNames = ["HBarrier1", "HBarrier5", "HBarrierWall4", "HBarrierWall_corner", "HBarrierTower", "BagFence_Long", "BagBunker_Small", "BagBunker_Large", "CncBarrierMedium", "HelipadCircle", "PortableLight", _fuelBladderType];
	[_depot, 40, 800, _typeNames] call JB_fnc_placeObjectInitializeSource;

	private _result = [[_depotType], "Logistics_GetSourceResources", 2] call JB_fnc_remoteCall;
	if (_result select 0 == JBRC_COMPLETE) then
	{
		private _resources = _result select 1;
		if (count _resources > 0) then { [_depot, _resources] call JB_PO_SetSourceResources };
	};
};

Logistics_StoreDepot =
{
	params ["_source", "_depot", "_parameters"];

	if ([_depot] call JB_PO_IsTemporaryObject) exitWith {}; // Don't process the local/temporary object

	_source setMass (getMass _source + 20000);

	_parameters params ["_depotType"];

	private _resources = [_depot] call JB_PO_GetSourceResources;
	[_depotType, _resources] remoteExec ["Logistics_SetSourceResources", 2];
};

Logistics_PlaceFuelBladder =
{
	params ["_source", "_bladder", "_parameters"];

	_bladder setFuelCargo 0;

	if ([_bladder] call JB_PO_IsTemporaryObject) exitWith {}; // Don't process the local/temporary object

	_parameters params ["_bladderType"];

	private _fuel = 5000;

	private _result = [[_bladderType], "Logistics_GetSourceResources", 2] call JB_fnc_remoteCall;
	if (_result select 0 == JBRC_COMPLETE) then
	{
		private _resources = _result select 1;
		if (count _resources > 0) then { _fuel = _resources select 0 };
	};

	[_bladder, [[-3.36914,2.49219,0.468579]], _fuel, 60] remoteExec ["JB_fnc_fuelInitSupply", 2];
};

Logistics_StoreFuelBladder =
{
	params ["_source", "_bladder", "_parameters"];

	if ([_bladder] call JB_PO_IsTemporaryObject) exitWith {}; // Don't process the local/temporary object

	_parameters params ["_bladderType"];

	private _resources = [_bladder getVariable "JBF_SupplyRemaining"]; //TODO: Need a function in JB fuel stuff to get the remaining supply
	[_bladderType, _resources] remoteExec ["Logistics_SetSourceResources", 2];
};

Logistics_PlaceHelipad =
{
	params ["_source", "_proxy", "_parameters"];

	_parameters params ["_helipadType"];

	(_helipadType createVehicle (getPos _proxy)) attachTo [_proxy, [0,0,0]];

	// When placed, make sure simulation is off for the proxy.  Otherwise, it can be moved around,
	// dragging the helipad with it - or flipping over, hiding the helipad.

	if ([_proxy] call JB_PO_IsTemporaryObject) exitWith {};

	[_proxy] spawn
	{
		params ["_proxy"];

		sleep 0.5; // Immediate change messes with display of helipad
		[_proxy, false] remoteExec ["enableSimulationGlobal", 2];
	};
};

Logistics_StoreHelipad =
{
	params ["_source", "_proxy", "_parameters"];

	{ deleteVehicle _x } forEach attachedObjects _proxy;
};

CLIENT_GetVisibleObjects =
{
	params ["_class"];

	private _withinLimits =
	{
		params ["_position"];

		(_position select 0) >= safeZoneX && { (_position select 0) <= safeZoneX + safeZoneW } && { (_position select 1) >= safeZoneY } && { (_position select 1) <= safeZoneY + safeZoneH }
	};

	private _positionASL = [];
	if (not (getPosASL curatorCamera isEqualTo [0,0,0])) then
	{
		_positionASL = terrainIntersectAtASL [getPosASL curatorCamera, getPosASL curatorCamera vectoradd (vectorDir curatorCamera vectorMultiply 1e10)];
	}
	else
	{
		_positionASL = terrainIntersectAtASL [eyePos player, eyePos player vectoradd (eyeDirection player vectorMultiply 1e10)];
	};

	private _objects = [];
	if (not (_positionASL isEqualTo [0,0,0])) then
	{
		_objects = ((ASLtoAGL _positionASL) nearObjects [_class, 1000]) select { [worldToScreen getPosATL _x] call _withinLimits };
	};

	_objects
};

B_Soldier_Repair_F_GetRepairProfile =
{
	private _engineer = param [0, objNull, [objNull]];
	private _vehicle = param [1, objNull, [objNull]];
	private _systemName = param [2, "", [""]];

	if (not ((toLower _systemName) find "wheel" >= 0) && { (not ("ToolKit" in (backpackItems player))) }) exitWith
	{
		[true, 0, 0, format ["%1 repairs require a Toolkit", _systemName], false]
	};

	private _repairPPS = 1.0;
	private _targetPC = 0.4;
	private _message = "";

	if (_vehicle isKindOf "Air") then
	{
		_repairPPS = 0.7;
	}
	else
	{
		if (_vehicle isKindOf "Ship") then
		{
			_repairPPS = 0.4;
		};
	};

	{
		switch (_x getVariable ["REPAIR_ServiceLevel", 0]) do
		{
			case 1:
			{
				if (_targetPC > 0.2) then
				{
					_targetPC = 0.2;
					_message = format ["Using repair facilities of %1", [typeOf _x, "CfgVehicles"] call JB_fnc_displayName];
				};
			};
			case 2:
			{
				if (_targetPC > 0.0) then
				{
					_targetPC = 0.0;
					_message = format ["Using repair facilities of %1", [typeOf _x, "CfgVehicles"] call JB_fnc_displayName];
				};
			};
		};

	} forEach (nearestObjects [_engineer, ["All"], 15]);

	[true, _repairPPS, _targetPC, _message, true]
};

B_Soldier_Repair_F_CanRepairVehicle =
{
	private _engineer = param [0, objNull, [objNull]];
	private _vehicle = param [1, objNull, [objNull]];

	(_vehicle isKindOf "Car" || _vehicle isKindOf "Tank" || _vehicle isKindOf "Air" || _vehicle isKindOf "Ship")
};

CLIENT_RestrictMovement =
{
	_this spawn
	{
		params ["_player", "_trigger"];

		private _respawn = _player getVariable ["CLIENT_PlayerPosition", []];

		while { alive _player } do
		{
			if (not ([_trigger, _player] call BIS_fnc_inTrigger)) then
			{
				moveOut _player;
				waitUntil { vehicle _player == _player };
				player setVelocity [0,0,0];
				player setPosASL (_respawn select 0);
				player setDir (_respawn select 1);
				player switchMove "";
			};

			sleep 3;
		}
	};
};
