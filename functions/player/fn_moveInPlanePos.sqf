params ["_plane", "_unitsOnPlane", "_positions", "_giveParachute", "_parachuteType"];

if (!isServer) exitWith {};
if ((count _unitsOnPlane) != (count _positions)) exitWith {
    diag_log "GRAD Drop Unit count higher than available positions!";
};

{
    [
        (_unitsOnPlane select _forEachIndex),
        _plane,
        _x,
        _giveParachute,
        _parachuteType
    ] call grad_drop_fnc_moveInRemote;
}forEach _positions;
