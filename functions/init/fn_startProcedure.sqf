#include "..\component.hpp"

if (!isServer) exitWith {};
params ["","","","","","_waitBeforeJump",""];

[{
    params ["_units", "_plane", "", "_jumpmaster", "_planeLights", "", "_onLanding"];
    _planeLights params ["_lightWhite","","_lightRed"];
    [_units,_plane,_onLanding] remoteExec ["grad_drop_fnc_jump",0,false];

    [_jumpmaster,"grad_drop_jumpmaster0",_units] remoteExec ["grad_drop_fnc_playSound",0,false];

    _lightRed hideObjectGlobal false;
    _lightWhite hideObjectGlobal true;

    [{
        params ["","_plane"];
        _plane setVariable ["grad_drop_lightStatus","RED",true];

        [{
            params ["_units","","","_jumpmaster"];
            [_jumpmaster,"grad_drop_jumpmaster1",_units] remoteExec ["grad_drop_fnc_playSound",0,false];

            [{
                params ["_units","","","_jumpmaster"];
                [_jumpmaster,"grad_drop_jumpmaster2",_units] remoteExec ["grad_drop_fnc_playSound",0,false];

                [{
                    params ["_units","_plane","","_jumpmaster"];
                    [_jumpmaster,"grad_drop_jumpmaster3",_units] remoteExec ["grad_drop_fnc_playSound",0,false];

                    _plane animate ["ramp_top", 0];
                    _plane animate ["ramp_bottom", 0];

                    [{
                        params ["_units","_plane","","_jumpmaster"];
                        [_jumpmaster,"grad_drop_jumpmaster4",_units] remoteExec ["grad_drop_fnc_playSound",0,false];

                        //todo add missionConfig entry for parameter
                        if (false) then {
                            [_plane] call GRAD_drop_fnc_spawnAA;
                        };

                        [{
                            params ["_units","","","_jumpmaster"];
                            [_jumpmaster,"grad_drop_rearDoor",_units] remoteExec ["grad_drop_fnc_playSound",0,false];

                            [{
                                params ["_units","_plane","","_jumpmaster"];
                                [_jumpmaster,"grad_drop_jumpmaster5",_units] remoteExec ["grad_drop_fnc_playSound",0,false];

                                _plane animate ["ramp_top", 1];
                                _plane animate ["ramp_bottom", 1];

                                [_plane,_jumpmaster] spawn grad_drop_fnc_jumpMasterAnimation;

                                [{
                                    params ["_units","","","_jumpmaster"];
                                    [_jumpmaster,"grad_drop_jumpmaster0",_units] remoteExec ["grad_drop_fnc_playSound",0,false];

                                    [{
                                        params ["","","","","_planeLights"];
                                        _lightGreen hideObjectGlobal false;
                                        _lightRed hideObjectGlobal true;

                                        [{
                                            params ["","_plane"];
                                            _plane setVariable ["grad_drop_lightStatus","GREEN",true];

                                            [{
                                                params ["_units","","","_jumpmaster"];
                                                [_jumpmaster,"grad_drop_jumpmaster6",_units] remoteExec ["grad_drop_fnc_playSound",0,false];

                                                [
                                                    {
                                                        ({_x distance (_this select 1) < 30} count (_this select 0) == 0)
                                                    },{
                                                        params ["","_plane"];
                                                        _plane setVariable ["grad_drop_lightStatus","DELETE",true];
                                                        [{
                                                            params ["","_plane","_soundPlane","_jumpmaster","_planeLights"];

                                                            private _posCache = getPos _plane;
                                                            private _dirCache = getDir _plane;

                                                            detach _plane;
                                                            deleteVehicle _jumpmaster;

                                                            {
                                                                deleteVehicle _x;
                                                            } forEach _planeLights;

                                                            deleteVehicle _plane;

                                                            {
                                                                deleteVehicle _x;
                                                            } forEach crew _soundPlane;

                                                            deleteVehicle _soundPlane;
                                                        }, _this, 0.5] call CBA_fnc_waitAndExecute;
                                                    }, _this] call CBA_fnc_waitUntilAndExecute;
                                            }, _this, 10] call CBA_fnc_waitAndExecute;
                                        }, _this, 0.2] call CBA_fnc_waitAndExecute;
                                    }, _this, 1] call CBA_fnc_waitAndExecute;
                                }, _this, 36] call CBA_fnc_waitAndExecute;
                            }, _this, 1.3] call CBA_fnc_waitAndExecute;
                        }, _this, 15] call CBA_fnc_waitAndExecute;
                    }, _this, 10] call CBA_fnc_waitAndExecute;
                }, _this, 10] call CBA_fnc_waitAndExecute;
            }, _this, 5] call CBA_fnc_waitAndExecute;
        }, _this, 3] call CBA_fnc_waitAndExecute;
    }, _this, 0.2] call CBA_fnc_waitAndExecute;
}, _this, _waitBeforeJump] call CBA_fnc_waitAndExecute;
