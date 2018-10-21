// F3 Functions

class F // Defines the "owner"
{
	class common // category
	{
		file = "f\common";
		class processParamsArray{preInit = 1; postInit=1;};
		class nearPlayer{};
	};
	class mpEnd
	{
		file = "f\mpEnd";
		class mpEnd{};
		class mpEndReceiver{};
	};
	class assignGear
	{
		file = "f\assignGear";
		class assignGear{};
	};
	class setGroupID
	{
		file = "f\setGroupID";
		class setGroupID{};
	};
	class missionConditions
	{
		file = "f\missionConditions";
		class SetTime{};
		class SetFog{};
		class SetWeather{};
		class SetWind{};
	};
	class cache
	{
		file = "f\cache";
		class cInit {};
		class cTracker {};
		class gCache {};
		class gUncache {};
	};
	class groupMarkers {
		file = "f\groupMarkers";
		class localGroupMarker{};
		class localSpecialistMarker{};
	};
	class authorisedCrew
	{
		file = "f\authorisedCrew";
		class authorisedCrewCheck {};
	};
	class FTMemberMarkers
	{
		file = "f\FTMemberMarkers";
		class SetLocalFTMemberMarkers{};
		class GetMarkerColor{};
	};
	class setAISkill
	{
		file = "f\setAISkill";
		class setAISkill{};
	};
	class mapClickTeleport
	{
		file = "f\mapClickTeleport";
		class mapClickTeleportUnit{};
		class mapClickTeleportGroup{};
		class mapClickTeleportParachute{};
	};
	class nametag
	{
		file = "f\nametag\functions";
		class nametagUpdate {};
		class nametagDraw {};
		class nametagGetData {};
		class nametagCache {};
		class nametagResetFont {};
		class getZoom {};
	};
	class preMount
	{
		file = "f\preMount";
		class mountGroups{};
	};
	class zeus
	{
		file = "f\zeus";
		class zeusInit{};
		class zeusAddAddons{};
		class zeusAddObjects{};
		class zeusInitLocal{};
	};
	class safeStart
	{
		file = "f\safeStart";
		class safety{};
	};
	class spect
	{
		file = "f\spect";
		class activateSpectator{};
		class terminateSpectator{};
	};
	class woundingsystem
	{
		file = "f\medical";
		class addDragAction {};
		class onDrag {};
	};
	class disableThermals
	{
		file = "f\disableThermals";
		class disableThermals {};
	};
	class dynamicViewDistance
	{
		file = "f\dynamicViewDistance";
		class ehSetViewDistance {};
	};
};
