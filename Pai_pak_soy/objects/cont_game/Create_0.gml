/// @description > game controller create event
#region /// variables //
	debug = false;
	spawn_id = 0;
	mx = mouse_x;
	my = mouse_y;
#endregion ///

#region /// debugging //
	// functions
	function toggle_debug(){
		show_debug_overlay(!is_debug_overlay_open());
	}
	// debug overlay setup
	global.value_dbgview = dbg_view("Value Debug View", true);
	global.global_value_section = dbg_section("Global Value Section");
	ref_mouse_x = ref_create(self,"mx");
	ref_mouse_y = ref_create(self,"my");
	dbg_text("mouse_x : ");
	dbg_same_line();
	dbg_text(ref_mouse_x);
	dbg_text("mouse_y : ");
	dbg_same_line();
	dbg_text(ref_mouse_y);

	//show_debug_overlay(false);
#endregion ///

/// instances creation
	controller_list = [cont_camera,cont_input,obj_player];

/// creation functions
	create_controller = function(_obj){
		return instance_create_layer(0,0,"controller",_obj);
	}
	create_entity = function(_obj, _x, _y, _config = {}){
		return instance_create_layer(_x,_y,"entity",_obj, _config);
	}

// game control scripts
	game_start = function(){
		room_goto(START_ROOM);
	}
	
/// GAME START UP SCRIPTS ///

// set config
	draw_set_default();

// create all the controllers
	for(var i = 0; i < array_length(controller_list); i++){
	create_controller(controller_list[i]);	
}

// hide collision layer
	collision_visible = false;
	var _layer = layer_get_id("collision");
	layer_set_visible(_layer,collision_visible);

// start game
	game_start();