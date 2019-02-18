#include "..\component.hpp"

if (!isServer) exitWith {_this remoteExec ["grad_drop_fnc_initHalojump",2,false]};

params ["_units","_pos",["_dir",0],["_height",3500],["_waitBeforeJump",40],["_giveParachute",false],["_onSceneCut",{}],["_onLanding",{}], ["_identifier", "none"]];

switch (true) do {
    case (_units isEqualType WEST): {_units = (playableUnits + switchableUnits) select {side _x == _units}};
    case (_units isEqualType objNull): {_units = [_units]};
};

if (_pos isEqualType "") then {_pos = getMarkerPos _pos;};

private _unitSets = [];
private _unitCount = count _units;
private _planesNumber = ceil (_unitCount / 26);
for [{_i=0}, {_i<_planesNumber}, {_i=_i+1}] do {_unitSets pushBack []};
while {count _units > 0} do {
    for [{_i=0}, {_i<_planesNumber}, {_i=_i+1}] do {
        (_unitSets select _i) pushBack (_units deleteAt 0);
    };
};

{
    private _planeObjects = [_pos getPos [_forEachIndex * 100,_dir + 90],_dir,_height] call grad_drop_fnc_spawnPlane;
    _planeObjects params ["_plane","_soundPlane","_jm","_planeLights"];

    waitUntil { _plane distance2d [0,0,0] > 100; };
    sleep 1;

    [_x,_onSceneCut] remoteExec ["grad_drop_fnc_moveInPlaneCut",0,false];
    [_x,_plane] remoteExec ["grad_drop_fnc_addLightPoints",0,false];

    [_plane,_x,_soundPlane,_jm,_planeLights,_waitBeforeJump,_giveParachute,_onLanding] spawn {
        params ["_plane","_units","_soundPlane","_jm","_planeLights","_waitBeforeJump","_giveParachute","_onLanding"];

        sleep 4;

        [_plane,_units,_giveParachute] call grad_drop_fnc_moveInPlane;
        [_units,_plane,_soundPlane,_jm,_planeLights,_waitBeforeJump,_onLanding] spawn grad_drop_fnc_startProcedure;
    };

} forEach _unitSets;

INFO_2("%1 units moved to %2 planes for HALO jump.",_unitCount,_planesNumber);