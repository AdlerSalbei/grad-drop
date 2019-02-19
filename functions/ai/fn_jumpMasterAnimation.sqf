#include "..\component.hpp"

[{
    params ["_jumpmaster"];
    [_jumpmaster,"ACE_AmovPercMstpScapWnonDnon_AmovPercMstpSnonWnonDnon" , 2] call ace_common_fnc_doAnimation;

    [{
        params ["_jumpmaster"];
        [_jumpmaster,"AmovPercMwlkSnonWnonDfl" , 2] call ace_common_fnc_doAnimation;

        [{
            params ["_jumpmaster"];
            [_jumpmaster,"AmovPercMstpSnonWnonDnon_AmovPknlMstpSnonWnonDnon" , 2] call ace_common_fnc_doAnimation;

            _jumpmaster setFormDir (getDir _plane) + 17;
            _jumpmaster setDir (getDir _plane) + 17;

            [{
                params ["_jumpmaster"];
                [_jumpmaster,"AidlPknlMstpSnonWnonDnon_G01" , 2] call ace_common_fnc_doAnimation;

                [{
                    params ["_jumpmaster"];
                    [_jumpmaster,"AmovPknlMstpSnonWnonDnon_AmovPercMstpSnonWnonDnon" , 2] call ace_common_fnc_doAnimation;

                    [{
                        params ["_jumpmaster"];
                        [_jumpmaster,"AmovPercMwlkSnonWnonDb" , 2] call ace_common_fnc_doAnimation;

                        [{
                            params ["_jumpmaster"];
                            [_jumpmaster,"AmovPercMstpSnonWnonDnon_AmovPknlMstpSnonWnonDnon" , 2] call ace_common_fnc_doAnimation;

                            [{
                                params ["_jumpmaster"];
                                [_jumpmaster,"AidlPknlMstpSnonWnonDnon_G01" , 2] call ace_common_fnc_doAnimation;

                            },_this,2] call CBA_fnc_waitAndExecute;
                        },_this,2.33] call CBA_fnc_waitAndExecute;
                    },_this,0.7] call CBA_fnc_waitAndExecute;
                },_this,15] call CBA_fnc_waitAndExecute;
            },_this,3] call CBA_fnc_waitAndExecute;
        },_this,2] call CBA_fnc_waitAndExecute;
    },_this,2] call CBA_fnc_waitAndExecute;
},_this,3] call CBA_fnc_waitAndExecute;
