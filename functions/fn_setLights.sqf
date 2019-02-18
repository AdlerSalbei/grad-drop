#include "..\component.hpp"

params ["_light", "_lightColor", "_lightAmbi"];

if !(_light isEqualType []) then {_light = [_light]};

{
    _x setLightColor _lightColor;
    _x setLightAmbient _lightAmbi;
}forEach _light;
