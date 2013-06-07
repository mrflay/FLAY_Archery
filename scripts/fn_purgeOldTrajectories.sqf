/* FLAY_fnc_purgeOldTrajectories */

while { alive player } do {
	sleep 10;
	[] execVM "fn_clearTrajectory.sqf";
};