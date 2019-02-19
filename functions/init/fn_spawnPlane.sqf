#include "..\component.hpp"

params ["_pos", "_dir"];

private _plane = createVehicle ["c130j_static_ep1",[0,0,0],[], 0, "NONE"];
_plane setDir _dir;
_plane setPosASL _pos;
_plane allowDamage false;

private _pilot = (createGroup civilian) createUnit ["B_RangeMaster_F", [0,0,0], [], 0, "none"];

private _soundPlane = "rhs_c130J" createVehicle [0,0,0];
_soundPlane engineOn true;
_soundPlane allowDamage false;
_soundPlane attachTo [_plane,[ 0, 0, 100]];
_soundPlane hideObjectGlobal true;
_soundPlane flyInHeight 300;

_pilot moveInDriver _soundPlane;
_pilot assignAsDriver _soundPlane;

private _jumpmaster = [_plane] call grad_drop_fnc_spawnJumpmaster;
private _lights = [_plane] call grad_drop_fnc_spawnLights;

[_plane] remoteExec ["hideObject", [0,-2] select isDedicated];

[_plane,_soundPlane,_jumpmaster,_lights]
