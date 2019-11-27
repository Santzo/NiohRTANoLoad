//RTA No Load plugin v2.0 by B3 (updated by Santzo).
//supported game versions: 
//  - 1.21.04, 1.21.05
//last updated: 27.11.2019

state("Nioh","1.21.04"){
    byte onMap : 0x2171030;
    float missionTimer: 0x20D8588, 0x1E0AAC;
}

state("Nioh","1.21.05"){
    byte onMap : 0x2176F80, 0x90;
    float missionTimer: 0x20A7418, 0x5D8;
}

init{
    int moduleSize = modules.First().ModuleMemorySize;
    switch(moduleSize){
        case 63766528: 
            version = "1.21.04";
            break;
        case 63827968: 
            version = "1.21.05";
            break;
       default: 
            version = "1.21.04";
            break;
    }
    print("Nioh.exe version " + version + " detected\nModule size: " + moduleSize);
    refreshRate = 29;
}

isLoading{
    if(current.missionTimer==old.missionTimer && current.onMap == 0)
        return true;
    return false;
}