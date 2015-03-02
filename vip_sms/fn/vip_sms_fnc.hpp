class vip_sms {

	tag = "vip_sms";
	
	class SimpleMineSystem {
	
		file = "vip_sms\fn";
		
		class init {postInit = 1;};
		
		class cl_arm {};
		class cl_changeTimer {};
		class cl_diary {preInit = 1;};
		class cl_menuAction {};
		class cl_menuOpen {};
		class cl_menuRemotes {};
		class cl_menuUpdate {};
		class cl_place {};
		class cl_remoteTrigger {};
		class cl_remove {};
		class cl_vector {};
		
		class sv_arm {};
		class sv_armedAT {};
		class sv_armedBounding {};
		class sv_armedRemote {};
		class sv_armedSlam {};
		class sv_armedSound {};
		class sv_armedTimer {};
		class sv_armedTripwire {};
		class sv_caching {};
		class sv_createMine {};
		class sv_createTripwire {};
		class sv_detonate {};
		class sv_disarm {};
		class sv_idle {};
		class sv_remove {};		
	};
};