titleCut ["","BLACK FADED", 999];

["ace_killed", {
	["unconscious", false] call ace_common_fnc_setDisableUserInputStatus;
}] call CBA_fnc_addEventHandler;

["InitializePlayer", [player]] call BIS_fnc_dynamicGroups;

[player, "ck_core_insignias_commandokieffer"] call BIS_fnc_setUnitInsignia;

removeAllWeapons player;
removeAllItems player;
removeAllAssignedItems player;
removeVest player;
removeBackpack player;
removeHeadgear player;

player linkItem "ItemMap";
player linkItem "ItemCompass";

_hours = date select 3;
_minutes = date select 4;
if (_hours < 10) then {
	_hours = format["0%1", _hours];
};
if (_minutes < 10) then {
	_minutes = format["0%1", _minutes];
};
_time = format["%1:%2", _hours, _minutes];

player setDamage 1;
titleCut ["", "BLACK IN", 5];
uiSleep 5;

hint format["Bonjour %1", name player];

waitUntil {alive player};

[
	[
		["Quelque part", "<t align = 'center' color = '#0055A4' size = '1'>%1</t><br/>"], ["", ""],
		["en Bretagne", "<t align = 'center' color = '#FFFFFF' size = '0.7'>%1</t><br/>"], ["", ""],
		[_time, "<t align = 'center' color = '#EF4135' size = '0.7'>%1</t>"], ["", ""], ["", ""]
	]
] spawn BIS_fnc_typeText;

if (player isKindOf "B_soldier_UAV_F") then {
	_textMessage = format["Connexion en zeus de %1", name player];
	
	_textMessage call BIS_fnc_log;
	hint _textMessage;
};