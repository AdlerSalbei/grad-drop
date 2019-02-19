params ["_plane"];

private _smoke = [];

 {
    private _selectionposition = _plane selectionPosition _x;
    private _emitter = [_plane, _selectionposition] call GRAD_drop_fnc_addSmoke;

    _smoke pushBack _emitter;
}forEach ["engine_1_prop", "engine_2_prop", "engine_3_prop" , "engine_4_prop"];

[{
    isNull (_this select 0)
},{
    {deleteVehicle _x} forEach (_this select 1);
}, [_plane, _smoke]] call CBA_fnc_waitUntilAndExecute;
