/*
Addaction script for dataTerminal

#----#Add this to the INIT of the objects
this addAction ["Transmit Data",{execVM "test.sqf"; dataTerminal_A removeAction (_this select 2);}];

#----#Add This to allow zeuses to add custom INIT
<objectVariableName> addAction ["Transmit Data",{[<objectVariableName>,3] call BIS_fnc_dataTerminalAnimate; <objectVariableName> removeAction (_this select 2);}];
*/

/*
{ if activeCurator != {"%1". name Player};
	exitWith {""};
	}

//PHASE 1
hint format["The terminal has been activated! Please stand by!", name player];
[dataTerminal_A, 1] call BIS_fnc_dataTerminalAnimate;
sleep 5;
hint format["Loading..."];
sleep 30;
//PHASE 2
hint format["Connecting..."];
[dataTerminal_A, 2] call BIS_fnc_dataTerminalAnimate;
airborne infantry
sleep 150;
//PHASE 3
hint format["Transmitting..."];
[dataTerminal_A, 3] call BIS_fnc_dataTerminalAnimate;
airborne mechanized
sleep 150;
//PHASE 4
hint format["You have 2 minutes to evactuate the area!"];
call BIS_fnc_ */


//PHASE 3
[dataTerminal_A,3] call BIS_fnc_dataTerminalAnimate;
sleep 3; 
hint format["Congratulations, the strong-point is clear! Move on!"];4

//add fail condition