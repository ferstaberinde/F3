
// Default case for the _typeofUnit switch-case.

	default {
		private _msg = format ["DEBUG (assignGear.sqf): Error: Unknown type %1 in faction %2 for unit %3.", _typeofUnit, _faction, _unit];
		systemChat _msg;
		diag_log _msg;
	};
