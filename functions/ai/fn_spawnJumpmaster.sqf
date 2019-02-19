#include "..\component.hpp"

params ["_plane"];

private _jumpmaster = (createGroup west) createUnit ["B_survivor_F", getPos _plane, [], 0, "CAN_COLLIDE"];

_jumpmaster allowDamage false;
_jumpmaster setBehaviour "SAFE";
{_jumpmaster disableAI _x} forEach ["MOVE","ANIM","AUTOTARGET"];

[_jumpmaster] call grad_drop_fnc_removeAllGear;


[_jumpmaster,"HubBriefing_loop"] call grad_drop_fnc_switchMove;

[{
    _this spawn {
        params ["_plane","_jumpmaster"];

        _jumpmaster attachTo [_plane,[ -1.25, 2.5, -4.8]];
        sleep 0.5;

        detach _jumpmaster;
        _jumpmaster setFormDir (getDir _plane) + 60;
        _jumpmaster setDir (getDir _plane) + 60;
        _jumpmaster setAnimSpeedCoef 0.8;

        [_jumpmaster,"InBaseMoves_HandsBehindBack1"] call grad_drop_fnc_switchMove;
        sleep 2;
        [_jumpmaster,"InBaseMoves_HandsBehindBack1"] call grad_drop_fnc_switchMove;
    };
}, [_plane,_jumpmaster], 2] call CBA_fnc_waitAndExecute;

_jumpmaster
