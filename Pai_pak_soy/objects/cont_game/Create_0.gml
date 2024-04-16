/// @description > game controller create event
#region /// variables //
debug = false;
spawn_id = 0;
// interact
	nearest_interact = noone;
#endregion ///
#region /// debugging //
function toggle_debug_log(){
	show_debug_log(!is_debug_overlay_open());
}
toggle_debug = function(){
	// toggling debug
	if(keyboard_check(vk_lshift)){
		show_debug_message("toggling debug log");
		toggle_debug_log();
	}else{
		show_debug_message("toggling debug " + string((cont_game.debug)?"off":"on"));
		cont_game.debug = !cont_game.debug;
	}
	if(cont_game.debug){
		// debug true
		collision_visible = true;
	} else {
		// debug false
		collision_visible = false;
	}
	var _layer = layer_get_id("collision");
	layer_set_visible(_layer,collision_visible);	
}
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