#include "..\component.hpp"

params ["_units",["_onSceneCut",{}]];

if (!hasInterface) exitWith {};

3 fadeSound 0;

cutText ["", "BLACK OUT", 3];
[
    {
        addCamShake [2, 400, 0.7];

        [] call _onSceneCut;

        titleText ["","PLAIN"];
        titleFadeOut 12;
        [
            {
                "dynamicBlur" ppEffectEnable true;
                "dynamicBlur" ppEffectAdjust [6];
                "dynamicBlur" ppEffectCommit 0;
                "dynamicBlur" ppEffectAdjust [0.0];
                "dynamicBlur" ppEffectCommit 5;

                titleCut ["", "BLACK IN", 5];
            },
            [],
            12
        ] call CBA_fnc_waitAndExecute;
    },
    _onSceneCut,
    3
] call CBA_fnc_waitAndExecute;
