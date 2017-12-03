//====================================================================================
//
//	fn_nametagDraw.sqf - Initializes values for WH nametags (heavily based on F3 and ST)
//
//	[_name,_nameColor,_locationData,_role,_groupName,_drawRoleAndGroup,_isCommander,
//	_cameraPositionAGL,_zoom] call f_fnc_nametagDraw;
//
//	@ /u/Whalen207 | Whale #5963
//
//====================================================================================

//------------------------------------------------------------------------------------
//	Declare variables.
//------------------------------------------------------------------------------------

params ["_unit","_vehicle","_name","_nameColor","_locationData","_role","_groupName",
		"_drawRoleAndGroup","_isPassenger","_isCommander","_cameraPositionAGL",
		"_zoom","_time","_startTime"];

// _unit (CAManBase): Unit the tag is being rendered on.
// _vehicle (Entity): Vehicle the unit is in. Possibly the unit.
// _name (string): Friendly name of tag to be rendered.
// _nameColor (color array [[],[],[],]): Original color of center nametag.
// _locationData {code}: Code that will be used to find the location to draw the tag.
// _role (string): Friendly role name to be rendered on top.
// _groupName (string): Friendly group name to be rendered on bottom.
// _drawRoleAndGroup (boolean): A flag used to point out noncursor units and prevent
//								them from having group and role tags.
// _isCommander (boolean): A flag used to point out vehicle non-commanders and prevent
//							them from being rendered as far as vehicle commanders.
// _cameraPositionAGL (positionAGL array [[],[],[]]): Current position of player camera.
// _zoom (decimal): Current zoom level of player camera.
// _time (decimal): For fading tags and displaying voice comms -- current time.
// _startTime (OPTIONAL, decimal): For fading tags -- time tag was originally rendered.

//	Get player from global player setting.
//	This is necessary for Zeus remote control support.
_player = player;


//------------------------------------------------------------------------------------
//	Get distance from player to target.
//------------------------------------------------------------------------------------

// HOTFIX: _locationData is sometimes not code. https://puu.sh/yy2QG/5a79f349f7.png
// If this happens, skip drawing the nametag
if (!(_locationData isEqualType  {})) exitWith {};

//	Find position tag will be rendered at using location data.
_targetPositionAGL = call _locationData;

//	Find the distance from the player camera to this location.
_camDistance = _cameraPositionAGL distance _targetPositionAGL;
_distance = _player distance _targetPositionAGL;


//------------------------------------------------------------------------------------
//	Change the nametag if the target is speaking.
//------------------------------------------------------------------------------------

//	If the unit is speaking, apply little carets around their name.
//	TODO: move up a few scopes. GetData? Will stick on cursor

if (_unit getVariable ["wh_nt_isSpeaking", false]) then
{
	_timeEven = ((round time) % 2 == 0);
	_nameColor set [3,0.90];
	_name =
	if _timeEven then
	{ "> " + _name + " <" }
	else
	{ ">" + _name + "<" };
};


//------------------------------------------------------------------------------------
//	Applying initial transparency to tag depending on distance and time of day.
//------------------------------------------------------------------------------------

_alpha =
if (!_drawRoleAndGroup || {!(_isCommander)})
then { 	linearConversion[F_NT_DRAWDISTANCE_NEAR/1.3,F_NT_DRAWDISTANCE_NEAR,
		(_distance / F_NT_VAR_NIGHT),1,0,true] }
else { 	linearConversion[(((F_NT_DRAWDISTANCE_CURSOR)*(_zoom))/1.3),
		(F_NT_DRAWDISTANCE_CURSOR*_zoom),(((_distance) / F_NT_VAR_NIGHT)),1,0,true] };

//	Apply the alpha coating to each color's transparency.
_nameColor set [3, (_nameColor select 3) * _alpha];


//------------------------------------------------------------------------------------
//	Adjust font size depending on player current zoom level.
//------------------------------------------------------------------------------------

//	TODO: Move up to Update scope.
//	Max out zoom at 1.67 regardless to avoid HUGE text.
_zmin = _zoom min 1.67;

//	Adjust font sizes.
_sizeMain 		= F_NT_FONT_SIZE_MAIN* _zmin;
_sizeSecondary 	= F_NT_FONT_SIZE_SEC * _zmin;
_sizeVehicle 	= F_NT_FONT_SIZE_VEH * _zmin;


//------------------------------------------------------------------------------------
//	If the tag being drawn is on cursor, render the role and group.
//------------------------------------------------------------------------------------

if (_drawRoleAndGroup && {!(_isPassenger)}) then
{
	//	Set the color for secondary tags.
	_color =+ F_NT_FONT_COLOR_OTHER;
	_color set [3, (_color select 3) * _alpha];

	//	If we're working with a fading tag, fade it out according to the difference
	//	between the start time and now.
	if (!isNil "_startTime") then
	{
		_alphaCoef = (((_startTime + F_NT_FADETIME) - _time)/F_NT_FADETIME);
		_nameColor set [3, (_namecolor select 3) * _alphaCoef];
		_color     set [3, (_color select 3)     * _alphaCoef];
	};

	//--------------------------------------------------------------------------------
	//	Use space magic to realign the tags with the player's view.
	//	IE: If the player is above the target, normally the nametags (which are stacked -
	//	- vertically) would appear scrunched inside one another.
	//	This alleviates this by realigning them vertically.
	//
	//	Special thanks to cptnnick for this idea, code, implementation, everything!
	//--------------------------------------------------------------------------------

	//	First, get vector pointing directly forward from the player's view, wherever it is.
	//	TODO: Move up to update scope.
	_vectorDir = _cameraPositionAGL vectorFromTo (positionCameraToWorld[0,0,1]);

	//	Second, and the biggest step, get the normal (magnitude 1) vector going upwards
	//		along the player's screen (visually) by taking the cross product of the player's
	//		model upward vector and the player's view vector, and then take the cross product
	//		of that and a vector going directly from the camera to the nametag.

	//	Better explanation here
	//		( forums.bistudio.com/forums/topic/206072-multi-line-text-in-drawicon3d )

	//	TODO: Simplify this code if possible.
	//	If not possible, cache what you can (vectorUp player vectorCrossProduct _vectorDir)
	//	in nametagUpdate.
	_vectorDiff = (vectorNormalized (((_vectorDir) vectorCrossProduct (vectorUp _player)) vectorCrossProduct (_targetPositionAGL vectorDiff _cameraPositionAGL)));

	//	Take that new normal vector and multiply it by the distance, then divide it by the zoom.

	_targetPositionAGLTop =    _targetPositionAGL vectorAdd (_vectorDiff vectorMultiply (F_NT_FONT_SPREAD_TOP_MULTI * _camDistance / _zoom));
	_targetPositionAGLBottom = _targetPositionAGL vectorAdd ((_vectorDiff vectorMultiply (F_NT_FONT_SPREAD_BOTTOM_MULTI * _camDistance / _zoom)) vectorMultiply -1);


	//--------------------------------------------------------------------------------
	//	Render the nametags.
	//--------------------------------------------------------------------------------

	//	Role tag (top).
	if ( !(_role isEqualTo "") && {F_NT_SHOW_ROLE} ) then
	{
		drawIcon3D ["", _color, _targetPositionAGLTop,
		0, 0, 0, _role,F_NT_FONT_SHADOW,_sizeSecondary,F_NT_FONT_FACE_SEC];
	};

	//	Group tag (bottom).
	if ( !(_groupName isEqualTo "") && {F_NT_SHOW_GROUP} ) then
	{
		drawIcon3D ["", _color, _targetPositionAGLBottom,
		0, 0, 0, _groupName,F_NT_FONT_SHADOW,_sizeSecondary,F_NT_FONT_FACE_SEC];
	};
};

//	TODO: Remove this testing thing
//	Name tag (middle).
//drawIcon3D ["\A3\ui_f\data\map\markers\flags\AAF_ca.paa", [0,0,0,1], _targetPositionAGL, 1, 1, 0, "",0,(_sizeMain+(_sizeMain*0.2)),F_NT_FONT_FACE_MAIN];

//	Name tag (middle).
drawIcon3D ["", _nameColor, _targetPositionAGL, 0,0,0, _name,F_NT_FONT_SHADOW,_sizeMain,F_NT_FONT_FACE_MAIN];
