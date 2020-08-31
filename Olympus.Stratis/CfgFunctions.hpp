class CfgFunctions {
    class ADDON {
        tag = QUOTE(ADDON);
        class functions {
            file = "functions";
            class addChatCommands;
            class environmentControl;
            class fastTravel;
            class featureOverview;
            class initArsenalCrate;
            class initMOUT;
            class personalArsenal;
            class range40mmTargetGroups;
            class rangeMachineGunTargetGroups;
            class rangeMarksmanTargetGroups;
            class resetDamagedObjects;
            class setBasicLoadout;
            class spawnEngineerVehicle;
            class vehicleSpawner;
        };
    };
    class DOUBLES(ADDON,Medical) {
        class functions {
            file = "functions\medical";
            class init;
            class createSubject;
            class removeSubject;
            class checkSubject;
            class specific_bodyPartActions;
            class specific_projectileTypeActions;
            class specific_severityActions;
            class applyRandomDamage;
        };
    };
};
