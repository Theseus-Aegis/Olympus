class CfgFunctions {
    class ADDON {
        tag = QUOTE(ADDON);
        class functions {
            file = "functions";
            class courseDrivingTargetGroups;
            class environmentControl;
            class fastTravel;
            class initArsenalCrate;
            class initMOUT;
            class personalArsenal;
            class range40mmTargetGroups;
            class rangeAdvMarksmanGroups;
            class rangeBasicLMGTargetGroups;
            class resetDamagedObjects;
            class setBasicLoadout;
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
            class specific_applyDamage;
            class applyRandomDamage;
        };
    };
};
