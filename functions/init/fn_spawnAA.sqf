params ["_plane", "_units"];

[] remoteExec ["resetCamShake"];

for "_i" from 0 to 120 do {
    private _distance = 20 + random 70;
    private _position = _plane getRelPos [_distance, ((random 30) - (random 60))];
    private _zPos = getPos _plane select 2;
    _position set [2, (_zPos + random 10 - random 20)];

    private _strength = linearConversion [90, 0, _distance, 0, 7, true];
    [
        {_this remoteExec ["GRAD_drop_fnc_spawnAAEffect", 0,false];},
        [_position, _delay, _strength, _plane],
        (_forEachIndex + 0.5 + random 2)
    ] call CBA_fnc_waitAndExecute;
};
