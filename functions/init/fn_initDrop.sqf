#include "..\component.hpp"

if (!isServer) exitWith {_this remoteExec ["grad_drop_fnc_initDrop",2,false]};

params [
    "_units",
    "_pos",
    ["_dir",0],
    ["_height",3500],
    ["_plane", objNull],
    ["_waitBeforeJump",40],
    ["_giveParachute",false],
    ["_parachuteType", "rhs_d6_Parachute"],
    ["_onSceneCut",{}],
    ["_onLanding",{}],
    ["_identifier", "none"]
];

private _return = nil;

if !(isNull _plane) then {
    if (isNil (_plane getVariable ["grad_drop_assignedUnits", nil]) then {
        _return = [_plane, _units] call grad_drop_fnc_getPosPlayer;
    }else{
        _return = _plane getVariable ["grad_drop_assignedUnits", []];
    };
}else{
    //[_units, _pos, _dir, _height, _waitBeforeJump, _giveParachute, _parachuteType, _onSceneCut, _onLanding, _identifier] call grad_drop_fnc_initHaloJump;
};

if (isNil "_return" || {_return isEqualTo []}) exitWith {};
_return params ["_unitsOnPlane", "_positions"];

if (_pos isEqualType "") then {_pos = getMarkerPos _pos;};
_pos set [2, _height];

private _planeObjects = [_pos, _dir] call grad_drop_fnc_spawnPlane;
_planeObjects params ["_plane","_soundPlane","_jumpmaster","_planeLights"];

[
    {
        params [
            "_unitsOnPlane",
            "_plane",
            "_onSceneCut"
        ];

        {
            [_x, _onSceneCut] remoteExec ["grad_drop_fnc_moveInPlaneCut", _x, false];
            [_plane] remoteExec ["grad_drop_fnc_addLightPoints", _x, false];
        }forEach _unitsOnPlane;

        [
            {
                params [
                    "_unitsOnPlane",
                    "_plane",
                    "",
                    "_positions",
                    "_giveParachute",
                    "_parachuteType",
                    "_soundPlane",
                    "_planeLights",
                    "_waitBeforeJump",
                    "_onLanding"
                ];

                [_plane, _unitsOnPlane, _positions, _giveParachute, _parachuteType] call grad_drop_fnc_moveInPlanePos;
                [_unitsOnPlane, _plane, _soundPlane, _jumpmaster, _planeLights, _waitBeforeJump, _onLanding] call grad_drop_fnc_startProcedure;
            },
            _this,
            4
        ] call CBA_fnc_waitAndExecute;

    },
    [
        _unitsOnPlane,
        _plane,
        _onSceneCut,
        _positions,
        _giveParachute,
        _parachuteType,
        _soundPlane,
        _planeLights,
        _waitBeforeJump,
        _onLanding
    ],
    1
] call CBA_fnc_waitAndExecute;
