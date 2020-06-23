#include "..\script_component.hpp"
/*
 * Author: Kresky, Jonpas, JoramD
 * Adds feature overview.
 * Call from initPlayerLocal.sqf.
 *
 * Arguments:
 * 0: Player <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player] call FUNC(featureOverview);
 */

params ["_player"];

_player createDiarySubject ["features", "Features"];

_player createDiaryRecord ["features", ["Environment Controller", "
    <br/>The main base and some courses have an additional laptop to control the environment.
"]];

_player createDiaryRecord ["features", ["Vehicle Spawner", "
    <br/><img image='x\tacr\addons\images\olympus\feature\vehicleSpawn.jpg' width='300' height='350'/>
    <br/>The main base has a <marker name = 'tac_olympus_vehicleSpawnerMarker'>vehicle spawner</marker> that allows you to spawn and delete various vehicles.
"]];

_player createDiaryRecord ["features", ["Chat Commands", "
    <br/><font color='#E3D310'>#tac-heal:</font color>
    <br/>Type `#tac-heal` in chat to heal yourself.
    <br/>If you want to heal someone else, type `#tac-heal John Doe`.
"]];

_player createDiaryRecord ["features", ["Arsenals", "
    <br/><img image='\A3\EditorPreviews_F_Orange\Data\CfgVehicles\Land_PlasticCase_01_large_gray_F.jpg' width='228' height='128'/>
    <br/><font color='#E3D310'>Personal Arsenal:</font color>
    <br/>Will only have items you can buy in the Armory (also has full arsenal).
    <br/>
    <br/><img image='\A3\EditorPreviews_F_Exp\Data\CfgVehicles\Box_NATO_Equip_F.jpg' width='228' height='128'/>
    <br/><font color='#E3D310'>Equipment Arsenal:</font color>
    <br/>Will have items applicable to the course it is at (also has full arsenal).
    <br/>
    <br/><img image='\A3\EditorPreviews_F_Enoch\Data\CfgVehicles\Land_PlasticCase_01_large_black_F.jpg' width='228' height='128'/>
    <br/><font color='#E3D310'>Full Arsenal:</font color>
    <br/>Will have every item available in the game.
"]];

_player createDiaryRecord ["features", ["Teleporters", "
    <br/><img image='x\tacr\addons\images\olympus\feature\teleporter.jpg' width='300' height='350'/>
    <br/>There are teleporters in various locations around Olympus. It will always have a personal arsenal.
"]];
