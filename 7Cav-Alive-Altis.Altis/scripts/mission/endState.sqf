i = 0

addEventHandler {
    addAction [addaction shit];
        if
            {
            i <=0 
                then
                {
                i + 1;
                [missionConfigFile >> CfgOrbat >> "CsatRetard#1","mil_destroy", [1,0,0,1], 1.2,1.2,45] call BIS_fnc_ORBATAddGroupOverlay;
                };
        };
};

null [] execVM "path/to/script.sqf";

terminal1 addAction ["<t color='#00ff00' font='PuristaMedium' size='1.1'>Begin Transmission.</t>", {
    [terminal1,3] call bis_fnc_dataTerminalAnimate; 
    hint parseText "<t color='#ff0011' font='PuristaMedium' size='1.1'>Countdown timer has been started... <br /> <br /> ...please wait.</t>";
    //small timer
    sleep 10;
    //scan endTrigger0/1/2/3 for blufor
    //if no blufor, break loop
    if (BLUFOR count thisList == 0) breakOut {
        scope "transFailed"
          hint parseText "<t color='#c00000' font='PuristaMedium' size='1.1'>...transmission failed!</t>";
    };
            //if blufor, continue
    hint parseText "<t color='#c00000' font='PuristaMedium' size='1.1'>...loading...</t>";
    sleep 30;
    };
        //if no blufor, break loop
            //if blufor, continueli
    hint parseText "<t color='#f0ff00' font='PuristaMedium' size='1.1'>...loading...</t>";
    sleep 30;
    //scan endMarker0/1/2/3 for blufor
        //if no blufor, break loop
            //if blufor, continue
    hint parseText "<t color='#00ff00' font='PuristaMedium' size='1.1'>...finished!</t>";
    //scan endMarker0/1/2/3 for blufor
        //if no blufor, break loop
            //if blufor, continue
    };
    //pause/deactivate strongpoint module
    //increase myNumber == myNumber + 1;
    //if myNumber >= 3; 
        //trigger endMission;
];

terminal1 addAction ["<t color='#ff0011' font='PuristaMedium' size='1.1'>10010110010100101001001001</t>", {[terminal1,3] call bis_fnc_dataTerminalAnimate; hint parseText "<t color='#ff0011' font='PuristaMedium' size='1.1'>Countdown timer has been started... <br /> <br /> ...please wait.</t>";sleep 10;hint parseText "<t color='#ff0011' font='PuristaMedium' size='1.1'>...loading...</t>";sleep 30;hint parseText "<t color='#33ff38 font='PuristaMedium' size='1.1'>...finished!</t>";}];



{if (side _x == BLUFOR) then {_x setPos [0,0,0];_x setdamage 1} } foreach thislist;
/*
*/

//NEW STUFF
//addaction
term_02 addAction ["<t color='#00ff00' font='PuristaMedium' size='1.1'>Begin Transmission.</t>", {
    //variable, animation phase, functon call
    [term_02,3] call bis_fnc_dataTerminalAnimate;
    //initial hint
    hint parseText "<t color='#ff0011' font='PuristaMedium' size='1.1'>Countdown timer has been started... <br /> <br /> ...please wait.</t>";
    //sleep
    sleep 5;
    //scan endMarker0/1/2/3 for blufor
    //if no blufor, break loop

    if (BLUFOR count thisList == 0) breakOut {
        scope "transFailed";
            hint parseText "<t color='#c00000' font='PuristaMedium' size='1.1'>...transmission failed!</t>";
    };

        //if blufor, continue
    hint parseText "<t color='#c00000' font='PuristaMedium' size='1.1'>...loading...</t>";
    sleep 5;
    hint parseText "<t color='#f0ff00' font='PuristaMedium' size='1.1'>...loading...</t>";
    sleep 5;
    hint parseText "<t color='#00ff00' font='PuristaMedium' size='1.1'>...finished!</t>";
    }
];