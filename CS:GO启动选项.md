+ Before Start:
```
-noforcemparms -novid -nojoy -high -preload -console -tickrate 128 +fps_max 150 -noaafonts -perfectworld
```
+ autoexec.cfg:
```
// removes tracers following your own fire. Other players’ tracers will not be affected.
r_drawtracers_firstperson 0
// Set your rate values to be optimal for all CS:GO servers, even 128 tick.
rate "128000"
cl_cmdrate "128"
cl_updaterate "128"
// Enable the net_graph which gives you performance information, and adjusts its position.
net_graph "1"
net_graphpos "2"
net_graphheight "0"
// disable automatically switching to a more powerful weapon when it is picked up.
cl_autowepswitch "0"
// set your preference on what downloads you allow from a server: all, none, or nosounds
cl_downloadfilter all
// Print a message in console that the autoexec.cfg was successfully executed. Useful for troubleshooting and peace of mind.
echo "Loaded autoexec!"

//cl_interp "0"
//cl_interp_ratio "1"

bind "z" "use weapon_knife; use weapon_hegrenade"
bind "x" "use weapon_knife; use weapon_molotov; use weapon_incgrenade"
bind "c" "use weapon_knife; use weapon_smokegrenade"
bind "v" "use weapon_knife; use weapon_flashbang"
bind "alt" "+voicerecord"
bind "6" "use weapon_c4; drop"
cl_teamid_overhead_always 1
alias +jthrow "+jump;-attack"
alias -jthrow "-jump"
bind "n" "+jthrow"

cl_loadout_colorweaponnames "1"

cl_hud_radar_scale "1.2"
cl_radar_scale "0.4"
cl_radar_always_centered "0"
```

+ crosshair1.cfg
```
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
```
