#ifndef MODULES_DIRECTORY
    #define MODULES_DIRECTORY node_modules
#endif

class grad_drop {
    class ai {
        file = MODULES_DIRECTORY\grad-drop\functions\ai;

        class jumpAI;
        class jumpMasterAnimation;
        class removeAllGear;
        class spawnJumpmaster;
    };
    class effects {
        file = MODULES_DIRECTORY\grad-drop\functions\effects;

        class addEngineExhausts;
        class addLightpoints;
        class addSmoke;
        class playSound;
        class setLights;
        class spawnAAEffects;
        class spawnLights;
    };
    class init {
        file = MODULES_DIRECTORY\grad-drop\functions\init;

        class initDrop;
        class jump;
        class spawnAA;
        class spawnPlane;
        class startProcedure;
    };
    class player {
        file = MODULES_DIRECTORY\grad-drop\functions\player;

        class getPosPlayer;
        class moveInPlane;
        class moveInPlaneCut;
        class moveInPlanePos;
        class moveInRemote;
        class sortUnits;
    };
};
