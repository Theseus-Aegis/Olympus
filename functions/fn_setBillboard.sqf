/*
Author: Rory

Function: Handles image placement on billboard objects.
*/
#include "..\script_component.hpp"

if (!isServer) exitWith {};

params ["_billboard"];

{
    _x params ["_texture", "_position"];

    private _textureObject = createVehicle ["UserTexture_1x2_F", position _billboard, [], 0, "CAN_COLLIDE"];
    _textureObject setObjectTextureGlobal [0, _texture];
    _textureObject attachTo [_billboard, _position];

} forEach [
    [QPATHTOTACRF(images,olympus\BillBoard1.paa), [-2.5, -0.55, 1.2]],
    [QPATHTOTACRF(images,olympus\BillBoard2.paa), [-1.5, -0.55, 1.2]],
    [QPATHTOTACRF(images,olympus\BillBoard3.paa), [-0.5, -0.55, 1.2]],
    [QPATHTOTACRF(images,olympus\BillBoard4.paa), [0.5, -0.55, 1.2]],
    [QPATHTOTACRF(images,olympus\BillBoard5.paa), [1.5, -0.55, 1.2]],
    [QPATHTOTACRF(images,olympus\BillBoard6.paa), [2.5, -0.55, 1.2]]
];
