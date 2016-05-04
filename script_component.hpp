#define PREFIX TAC
#define COMPONENT Olympus

// Version
#define MAJOR 1
#define MINOR 0
#define PATCHLVL 3

// Map
#define MAP Stratis

//#define DEBUG_MODE_FULL

#include "\x\cba\addons\main\script_macros_mission.hpp"

#define PATHTOTACF(var1,var2) PATHTOF_SYS(\x\tac\addons,var1,var2)
#define QPATHTOTACF(var1,var2) QUOTE(PATHTOTACF(var1,var2))

#define TACFUNC(var1,var2) TRIPLES(DOUBLES(tac,var1),fnc,var2)
