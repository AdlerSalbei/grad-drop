#include "..\component.hpp"

params ["_units"];

if (!hasInterface) exitWith {};
if !(ace_player in _units) exitWith {};

ace_player allowdamage false;

[
    {
        (toLower animationState ace_player) in ["halofreefall_non","halofreefall_f","halofreefall_b"]
    },
    {
        params ["","_plane"];
        private _v1 = (getDir _plane) + (round (random 20) - 10);

        ace_player setVariable ["GRAD_drop_dropstart", true];
        resetCamShake;
        ace_player setVelocity [_v1 * (sin _v1), _v1 * (cos _v1), -15 ];
        addCamShake [50, 25, 10];
        playSound "grad_drop_wind1";
        addCamShake [20, 10, 10];
        addCamShake [10, 20,  5];

        [{
            params ["","_plane","_onLanding"];
            private _chute = createVehicle ["rhs_d6_Parachute", getPos ace_player, [], 0, "Fly"];
            _chute setPos position ace_player;
            ace_player moveIndriver _chute;
            _chute allowDamage false;

            hideObject _plane;

            ace_player setVariable ["GRAD_drop_dropped", true];
            resetCamShake;
            playSound "grad_drop_openChute1";
            34 cutText ["", "BLACK IN", 2];
            addCamShake [75, 5, 5];

            playSound "grad_drop_grunt";
            playSound "grad_drop_openChute2";
            addCamShake [5,  5,  2];

            setAperture 0.05;
            setAperture -1;
            "DynamicBlur" ppEffectEnable true;
            "DynamicBlur" ppEffectAdjust [8.0];
            "DynamicBlur" ppEffectCommit 0.01;

            [{
                "DynamicBlur" ppEffectAdjust [0.0];
                "DynamicBlur" ppEffectCommit 3;

                [{
                    params ["","","_onLanding"];
                    "DynamicBlur" ppEffectEnable false;
                    "RadialBlur" ppEffectAdjust [0.0, 0.0, 0.0, 0.0];
                    "RadialBlur" ppEffectCommit 1.0;
                    "RadialBlur" ppEffectEnable false;

                    playSound "grad_drop_heartbeat";

                    [{
                        params ["_onLanding", "_handle"];

                        if ((getPos ace_player select 2) > 8) exitWith {
                            [_handle] call CBA_fnc_removePerFrameHandler;
                            playSound "grad_drop_openChute1";
                            resetCamShake;

                            [] call _onLanding;
                        };

                        playSound "grad_drop_paraPilot";
                        addCamShake [2, 3.5, 1];

                    },4, _this] call CBA_fnc_addPerFrameHandler;
                }, _this, 3] call CBA_fnc_waitAndExecute;
            }, _onLanding, 1] call CBA_fnc_waitAndExecute;
        }, _this, 2] call CBA_fnc_waitAndExecute;
    },
    _this,
    900,
    {
        ace_player allowDamage true
    }
] call CBA_fnc_waitUntilAndExecute;
