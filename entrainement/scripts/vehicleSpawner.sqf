params ["_marker","_vehicle"];

_veh = _vehicle createVehicle getMarkerPos _marker;

_veh allowDamage false;

_veh setPos (getPos _veh vectorAdd [0,0,3]);

sleep 5;

_veh allowDamage true;