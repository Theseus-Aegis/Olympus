#define PREFIX TAC
#define COMPONENT Olympus

// Version
#define MAJOR 3
#define MINOR 8
#define PATCHLVL 0

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

// Userconfig
// __has_include requires -filePatching (which also prevents clients to load their local userconfig as they can't join with file patching)
// __has_include is not supported by HEMTT preprocessing so we do it in the template
#if __has_include("\userconfig\tac\auth.hpp")
    #include "\userconfig\tac\auth.hpp" // Contents available in Tools repository
#endif
#ifndef SERVER_COMMAND_PASSWORD
    #define SERVER_COMMAND_PASSWORD ""
#endif

// Enable Debug Console and similar tools for given admins
// Primarily used in description.ext (debug console) which gets resolved locally on clients where
// userconfig is not available, so must have it hardcoded to take effect
#define DEBUG_ADMINS \
    "76561198048995566", /* Jonpas */ \
    "76561198085500182", /* Mike */ \
    "76561198040879834", /* JoramD */ \
    "76561197993041837"  /* Phil */


#define ALLOWED_MISSIONS [["icarus.altis", "Icarus"]] // Folder lower-cased
