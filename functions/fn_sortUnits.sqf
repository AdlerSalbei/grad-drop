params ["_plane", "_areaArray"];

private _return = [];
private _lastDistance = 0;
{
    private _unit = _x;
    private _distance = _plane distance _unit;
    if (_distance > _lastDistance) then {
        _lastDistance = _distance;
        _return pushBack _unit;
    }else{
        private _cutOff = true;
        private _index = (_forEachIndex) -1;
        while {_cutOff} do {
            if (((_plane distance (_slotLeft select _index)) < _distance) || {_index <= 0}) exitWith {
                _cutOff = false;
            };
            _index = _index -1;
        };

        private _newArray = [];

        for "_i" from 0 to (_index -1 ) do {
            _newArray pushBack (_return select _i);
        };

        _newArray pushBack _unit;
        private _count = (count _return) -1;
        if (_index == _count) then {
            _newArray pushBack (_return select _index);
        }else{
            for "_i" from _index to _count do {
                _newArray pushBack (_return select _i);
            };
        };

    };
}forEach (allUnits inAreaArray _areaArray);

_return
