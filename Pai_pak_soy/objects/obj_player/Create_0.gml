/// @description > player create
// > code here

	var _self = self;
	
	/// PUBLIC
	character_create = function(_x = 0, _y = 0, _config = {}) {
		var _inst = cont_game.create_entity(obj_player_character,_x,_y,_config);
		__.character.instance = _inst;
		return _inst;
	}
	character_destroy = func {
		if (__.character.instance != null)
		and (instance_exists(__.character.instance))
		{
			instance_destroy(__.character.instance);
			__.character.instance = null;
		}
	}
	get_h_input = func {
		var _keyLeft  = cont_input.check_hold(vk_left,ord("A"));
		var _keyRight = cont_input.check_hold(vk_right,ord("D"));
		return (_keyRight - _keyLeft);
	}	
	get_v_input = func {
		var _keyJump		= { pressed : null, check : null};
		_keyJump.check_hold = cont_input.check_hold(vk_space);
		_keyJump.pressed	= cont_input.check_pressed(vk_space);
		return _keyJump;
	}
	
	/// PRIVATE
	__ = {};
	with __ {
		// nothing currently..
	}
	// character
	__[$ "character"] ??= {};
	with(__.character){
		instance = null;
	}
	
// CREATE CALLBACK
	character_create(50,50,{parent:id});