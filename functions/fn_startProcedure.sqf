#include "..\component.hpp"

params ["_units","_plane","_soundPlane","_jm","_planeLights","_waitBeforeJump","_onLanding"];
_planeLights params ["_lightWhite","_lightGreen","_lightRed"];

if (!isServer) exitWith {};

sleep _waitBeforeJump;

[_units,_plane,_onLanding] remoteExec ["grad_drop_fnc_jump",0,false];

[_jm,"grad_drop_jm0",_units] remoteExec ["grad_drop_fnc_playSound",0,false];

_lightRed hideObjectGlobal false;
_lightWhite hideObjectGlobal true;

sleep 0.2;

_plane setVariable ["grad_drop_lightStatus","RED",true];

sleep 3;

[_jm,"grad_drop_jm1",_units] remoteExec ["grad_drop_fnc_playSound",0,false];

sleep 5;

[_jm,"grad_drop_jm2",_units] remoteExec ["grad_drop_fnc_playSound",0,false];

sleep 10;

[_jm,"grad_drop_jm3",_units] remoteExec ["grad_drop_fnc_playSound",0,false];

_plane animate ["ramp_top", 0];
_plane animate ["ramp_bottom", 0];

sleep 10;

[_jm,"grad_drop_jm4",_units] remoteExec ["grad_drop_fnc_playSound",0,false];


[_plane, _units] spawn {
    private _plane = _this select 0;
    private _units = _this select 1;

  
    [] remoteExec ["resetCamShake"];
    
    for "_i" from 0 to 120 do {
        private _distance = 20 + random 70;
        private _position = _plane getRelPos [_distance, ((random 30) - (random 60))];
        private _zPos = getPos _plane select 2;
        _position set [2, (_zPos + random 10 - random 20)];

        private _strength = linearConversion [90, 0, _distance, 0, 7, true];
        private _delay = 0.5 + random 2;
        [_position, _delay, _strength, _plane] remoteExec ["GRAD_drop_fnc_spawnAA", 0,false];
        sleep _delay;
    };
};

sleep 15;

[_jm,"grad_drop_rearDoor",_units] remoteExec ["grad_drop_fnc_playSound",0,false];

sleep 1.3;


[_jm,"grad_drop_jm5",_units] remoteExec ["grad_drop_fnc_playSound",0,false];

_plane animate ["ramp_top", 1];
_plane animate ["ramp_bottom", 1];

[_plane,_jm] spawn grad_drop_fnc_jumpMasterAnimation;

sleep 36;

[_jm,"grad_drop_jm0",_units] remoteExec ["grad_drop_fnc_playSound",0,false];

sleep 1;

_lightGreen hideObjectGlobal false;
_lightRed hideObjectGlobal true;

sleep 0.2;

_plane setVariable ["grad_drop_lightStatus","GREEN",true];

sleep 0.5;

[_jm,"grad_drop_jm6",_units] remoteExec ["grad_drop_fnc_playSound",0,false];

sleep 5;

waitUntil {
    sleep 2; 
    {_x distance _plane < 30} count _units == 0
};

_plane setVariable ["grad_drop_lightStatus","DELETE",true];
sleep 0.5;
private _posCache = getPos _plane;
private _dirCache = getDir _plane;

detach _plane;
deleteVehicle _jm;
{deleteVehicle _x; false} count _planeLights;
deleteVehicle _plane;

{deleteVehicle _x; false} forEach crew _soundPlane;
deleteVehicle _soundPlane;