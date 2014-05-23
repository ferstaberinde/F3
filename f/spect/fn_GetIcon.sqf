_out = "";
_this = vehicle _this;
switch (side _this) do
{
    case blufor:
    {
    	_out = "\A3\ui_f\data\map\markers\nato\b_unknown.paa";
        if(_this isKindOf "Tank") then {_out = "\A3\ui_f\data\map\markers\nato\b_armor.paa";};
        if(_this isKindOf "Car_F") then {_out = "\A3\ui_f\data\map\markers\nato\b_motor_inf.paa";};
        if(_this isKindOf "StaticWeapon") then {_out = "\A3\ui_f\data\map\markers\nato\b_support.paa";};
        if(_this isKindOf "CAManBase") then {_out = "\A3\ui_f\data\map\markers\nato\b_inf.paa";};
        if(_this isKindOf "Helicopter_Base_F") then {_out = "\A3\ui_f\data\map\markers\nato\b_air.paa";};
        if(_this isKindOf "Plane") then {_out = "\A3\ui_f\data\map\markers\nato\b_plane.paa";};
        if(_this isKindOf "UAV" || _this isKindOf "UGV_01_base_F") then {_out = "\A3\ui_f\data\map\markers\nato\b_uav.paa";};
        if(_this isKindOf "APC_Tracked_01_base_F" || _this isKindOf "APC_Tracked_02_base_F" || _this isKindOf "APC_Tracked_03_base_F") then { _out = "\A3\ui_f\data\map\markers\nato\b_mech_inf.paa";};
        if(_this isKindOf "MBT_02_arty_base_F" || _this isKindOf "MBT_01_mlrs_base_F" || _this isKindOf "MBT_01_arty_base_F") then {_out = "\A3\ui_f\data\map\markers\nato\b_art.paa";};
        if(_this isKindOf "StaticMortar") then {_out = "\A3\ui_f\data\map\markers\nato\b_mortar.paa";};
        if(_this isKindOf "Ship_F") then {_out = "\A3\ui_f\data\map\markers\nato\b_naval.paa";};
    };

    case independent:
    {
    	_out = "\A3\ui_f\data\map\markers\nato\n_unknown.paa";
        if(_this isKindOf "Tank") then {_out = "\A3\ui_f\data\map\markers\nato\n_armor.paa";};
        if(_this isKindOf "Car_F") then {_out = "\A3\ui_f\data\map\markers\nato\n_motor_inf.paa";};
        if(_this isKindOf "StaticWeapon") then {_out = "\A3\ui_f\data\map\markers\nato\n_support.paa";};
        if(_this isKindOf "CAManBase") then {_out = "\A3\ui_f\data\map\markers\nato\n_inf.paa";};
        if(_this isKindOf "Helicopter_Base_F") then {_out = "\A3\ui_f\data\map\markers\nato\n_air.paa";};
        if(_this isKindOf "Plane") then {_out = "\A3\ui_f\data\map\markers\nato\n_plane.paa";};
        if(_this isKindOf "UAV" || _this isKindOf "UGV_01_base_F") then {_out = "\A3\ui_f\data\map\markers\nato\n_uav.paa";};
        if(_this isKindOf "APC_Tracked_01_base_F" || _this isKindOf "APC_Tracked_02_base_F" || _this isKindOf "APC_Tracked_03_base_F") then { _out = "\A3\ui_f\data\map\markers\nato\n_mech_inf.paa";};
        if(_this isKindOf "MBT_02_arty_base_F" || _this isKindOf "MBT_01_mlrs_base_F" || _this isKindOf "MBT_01_arty_base_F") then {_out = "\A3\ui_f\data\map\markers\nato\n_art.paa";};
        if(_this isKindOf "StaticMortar") then {_out = "\A3\ui_f\data\map\markers\nato\n_mortar.paa";};
        if(_this isKindOf "Ship_F") then {_out = "\A3\ui_f\data\map\markers\nato\n_naval.paa";};

	};
    case opfor:
    {
     	_out = "\A3\ui_f\data\map\markers\nato\o_unknown.paa";
        if(_this isKindOf "Tank") then {_out = "\A3\ui_f\data\map\markers\nato\o_armor.paa";};
        if(_this isKindOf "Car_F") then {_out = "\A3\ui_f\data\map\markers\nato\o_motor_inf.paa";};
        if(_this isKindOf "StaticWeapon") then {_out = "\A3\ui_f\data\map\markers\nato\o_support.paa";};
        if(_this isKindOf "CAManBase") then {_out = "\A3\ui_f\data\map\markers\nato\o_inf.paa";};
        if(_this isKindOf "Helicopter_Base_F") then {_out = "\A3\ui_f\data\map\markers\nato\o_air.paa";};
        if(_this isKindOf "Plane") then {_out = "\A3\ui_f\data\map\markers\nato\o_plane.paa";};
        if(_this isKindOf "UAV" || _this isKindOf "UGV_01_base_F") then {_out = "\A3\ui_f\data\map\markers\nato\o_uav.paa";};
        if(_this isKindOf "APC_Tracked_01_base_F" || _this isKindOf "APC_Tracked_02_base_F" || _this isKindOf "APC_Tracked_03_base_F") then { _out = "\A3\ui_f\data\map\markers\nato\o_mech_inf.paa";};
        if(_this isKindOf "MBT_02_arty_base_F" || _this isKindOf "MBT_01_mlrs_base_F" || _this isKindOf "MBT_01_arty_base_F") then {_out = "\A3\ui_f\data\map\markers\nato\o_art.paa";};
        if(_this isKindOf "StaticMortar") then {_out = "\A3\ui_f\data\map\markers\nato\o_mortar.paa";};
        if(_this isKindOf "Ship_F") then {_out = "\A3\ui_f\data\map\markers\nato\o_naval.paa";};
    };
};
_out

