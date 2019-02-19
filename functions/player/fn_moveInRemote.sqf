#include "..\component.hpp"

params ["_unit","_plane","_relPos","_giveParachute", "_parachuteType"];

if (!local _unit) exitWith {_this remoteExec ["grad_drop_fnc_moveInRemote",_unit,false];};

if (_giveParachute) then {
    if (isClass (configFile >> "CfgPatches" >> "zade_boc")) then {
        [_unit] call zade_boc_fnc_actionOnChest;
    };
    removeBackpack _unit;
    _unit addBackpackGlobal _parachuteType;
};

_unit allowDamage false;

_unit attachTo [_plane,_relPos];
detach _unit;

_plane hideObject false;

_unit switchMove "AidlPknlMstpSnonWnonDnon_G01";
_unit disableAI "MOVE";
_unit disableAI "ANIM";

[_unit] call ace_weaponselect_fnc_putWeaponAway;
