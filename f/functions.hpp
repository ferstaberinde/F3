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
		class LocalFTMarkerSync{};
	};
	class bodyRemoval
	{
		file = "f\removeBody";
		class removeBody{};
	};
	class setAISkill
	{
		file = "f\setAISKill";
		class setAISKill{};
	};
	class mapClickTeleport
	{
		file = "f\mapClickTeleport";
		class mapClickTeleportUnit{};
		class mapClickTeleportGroup{};
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
	};
	class woundingsystem
	{
		file = "f\medical";
		class reviveEhDammaged {};
		class addDragAction {};
		class onDrag {};
		class findDeadAnim {};
		class addPullOutAction {};
		class vehicleHasWounded {};
		class pullOutUnit {};
	};
	class disableThermals
	{
		file = "f\disableThermals";
		class disableThermals {};
	};
};
