tank = ["rhs_t72ba_tv"];
ifv = ["rhs_bmp1_msv"];
apc = ["rhs_btr70_msv"];
squad = (configfile >> "CfgGroups" >> "East" >> "rhs_faction_msv" >> "rhs_group_rus_msv_infantry_emr" >> "rhs_group_rus_msv_infantry_emr_squad");
squadAT = (configfile >> "CfgGroups" >> "East" >> "rhs_faction_msv" >> "rhs_group_rus_msv_infantry_emr" >> "rhs_group_rus_msv_infantry_emr_section_AT");
squadAA = (configfile >> "CfgGroups" >> "East" >> "rhs_faction_msv" >> "rhs_group_rus_msv_infantry_emr" >> "rhs_group_rus_msv_infantry_emr_section_AA");
aa = ["rhs_zsu234_aa"];
radioTower = "Land_TTowerBig_2_F";
mortar = ["rhs_2b14_82mm_vdv"];
arty = ["rhs_2s3_Tv"];
tankaaCombined = (configfile >> "CfgGroups" >> "East" >> "OPF_F" >> "Armored" >> "OIA_TankPlatoon_AA");
enemyFlag = "rhs_flag_Russia";
bunkerMarkerClass = "n_unknown";