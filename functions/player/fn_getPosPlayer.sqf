#include "..\component.hpp"
params ["_plane"];

private _pos = getPos _plane;
private _helperLeft = "HeliHEmpty" createVehicleLocal (_pos vectorAdd [1,0,0]);
private _helperMiddle = "HeliHEmpty" createVehicleLocal (_pos vectorAdd [1,0,0]);
private _helperRight = "HeliHEmpty" createVehicleLocal (_pos vectorAdd [1,0,0]);

private _dir = getDir _plane;
private _areaPos = _helperLeft getPos [5, (_dir +180)];
private _areaWidth = 1.5;
private _areaDistance = 10;
private _areaArray = [_areaPos, _areaWidth, _areaDistance, _dir, true, 3];

["mrk_planeTest_areaLeft", _areaPos, "Rectangle", [_areaWidth,_areaDistance], "COLOR:", "ColorRed"] call CBA_fnc_createMarker;
private _slotLeft = [_plane, _areaArray] call grad_drop_fnc_sortUnits;

_areaPos = _helperMiddle getPos [5, (_dir +180)];
_areaArray = [_areaPos, _areaWidth, _areaDistance, _dir, true, 3];

["mrk_planeTest_areaMiddle", _areaPos, "Rectangle", [_areaWidth,_areaDistance], "COLOR:", "ColorBlue"] call CBA_fnc_createMarker;

private _slotMiddle = [_plane, _areaArray] call grad_drop_fnc_sortUnits;

_areaPos = _helperRight getPos [5, (_dir +180)];
_areaArray = [_areaPos, _areaWidth, _areaDistance, _dir, true, 3];

["mrk_planeTest_areaRight", _areaPos, "Rectangle", [_areaWidth,_areaDistance], "COLOR:", "ColorGreen"] call CBA_fnc_createMarker;

private _slotRight = [_plane, _areaArray] call grad_drop_fnc_sortUnits;

diag_log format ["LeftSlots: %1", _slotLeft];
diag_log format ["MiddleSlots: %1", _slotMiddle];
diag_log format ["RightSlots: %1", _slotRight];
