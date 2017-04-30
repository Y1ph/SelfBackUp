+ Before Start:
```
-noforcemparms -novid -nojoy -highpriority -preload -console -tickrate 128 +fps_max 150 -noaafonts -perfectworld
```
+ autoexec.cfg:
```
rate "128000"
cl_updaterate "128"
cl_cmdrate "128"
//cl_interp 0
//cl_interp_ratio 1
net_graph "1"
net_graphpos "2"

bind "z" "use weapon_knife; use weapon_hegrenade"
bind "x" "use weapon_knife; use weapon_molotov; use weapon_incgrenade"
bind "c" "use weapon_knife; use weapon_smokegrenade"
bind "v" "use weapon_knife; use weapon_flashbang"
bind "n" "+voicerecord"

cl_loadout_colorweaponnames "1"
cl_crosshair_drawoutline "0"
cl_crosshair_dynamic_maxdist_splitratio "0.35"
cl_crosshair_dynamic_splitalpha_innermod "1"
cl_crosshair_dynamic_splitalpha_outermod "0.5"
cl_crosshair_dynamic_splitdist "7"
cl_crosshair_outlinethickness "1"
cl_crosshair_sniper_show_normal_inaccuracy "0"
cl_crosshair_sniper_width "1"
cl_crosshairalpha "120"
cl_crosshaircolor "5"
cl_crosshaircolor_b "-255"
cl_crosshaircolor_g "-1"
cl_crosshaircolor_r "-255"
cl_crosshairdot "0"
cl_crosshairgap "-3"
cl_crosshairgap_useweaponvalue "0"
cl_crosshairscale "0"
cl_crosshairsize "2.500000"
cl_crosshairstyle "4"
cl_crosshairthickness "1.000000"
cl_crosshairusealpha "1"
cl_fixedcrosshairgap "-4.5"

cl_hud_radar_scale "1.2"
cl_radar_scale "0.5"
cl_radar_always_centered "0"
```
