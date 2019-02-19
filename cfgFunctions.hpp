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

        class addLightpoints;
        class playSound;
        class setLights;
        class spawnAA;
        class spawnLights;
    };
    class init {
        file = MODULES_DIRECTORY\grad-drop\functions\init;

        class initDrop;
        class jump;
        class spawnPlane;
        class startProcedure;
        class switchMove;
    };
    class player {
        file = MODULES_DIRECTORY\grad-drop\functions\player;

        class moveInPlane;
        class moveInPlaneCut;
        class moveInPlanePos;
        class moveInRemote;
    };
};
