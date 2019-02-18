#include "..\component.hpp"

params ["_pos","_dir","_height"];

private _plane = createVehicle ["c130j_static_ep1",[0,0,0],[], 0, "NONE"];
_plane setDir _dir;
_plane setPosASL [_pos select 0, _pos select 1, _height];
_plane allowDamage false;

private _group = createGroup civilian;
private _pilot = _group createUnit ["B_RangeMaster_F", [0,0,0], [], 0, "none"];

private _soundPlane = "rhs_c130J" createVehicle [0,0,0];
_soundPlane engineOn true;
_soundPlane allowDamage false;
_soundPlane attachTo [_plane,[ 0, 0, 100]];
_soundPlane hideObjectGlobal true;
_soundPlane flyInHeight 300;

_pilot moveInDriver _soundPlane;
_pilot assignAsDriver _soundPlane;

private _jm = [_plane] call grad_drop_fnc_spawnJumpmaster;
private _lights = [_plane] call grad_drop_fnc_spawnLights;

/*
{
    private _positionEngine = [_x, 0, -2];
    private _smoke = "rhs_ammo_rdg2_black" createVehicle [0,0,0];
    _smoke attachTo [_plane, _positionEngine];
} forEach [
     -12,
     -5,
     5,
     12
];
*/

// yes, indeed i dont want hideObjectGlobal!
[_plane] remoteExec ["hideObject", [0,-2] select isDedicated];

[_plane,_soundPlane,_jm,_lights]
