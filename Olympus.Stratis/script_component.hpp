#define PREFIX TAC
#define COMPONENT Olympus

// Version
#define MAJOR 3
#define MINOR 3
#define PATCHLVL 1

// Map
#define MAP Stratis

#define DEBUG_SYNCHRONOUS
//#define DEBUG_MODE_FULL

#include "\x\cba\addons\main\script_macros_mission.hpp"

#define PATHTOTACRF(var1,var2) PATHTOF_SYS(\x\tacr\addons,var1,var2)
#define QPATHTOTACRF(var1,var2) QUOTE(PATHTOTACRF(var1,var2))

#define TACFUNC(var1,var2) TRIPLES(DOUBLES(tac,var1),fnc,var2)

#define TACGVAR(var1,var2) TRIPLES(tac,var1,var2)
#define QTACGVAR(var1,var2) QUOTE(TACGVAR(var1,var2))

// ACE3
#define ACEFUNC(var1,var2) TRIPLES(DOUBLES(ace,var1),fnc,var2)
