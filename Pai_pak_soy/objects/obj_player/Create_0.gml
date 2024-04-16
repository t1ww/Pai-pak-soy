/// @description > player create
// > code here

	var _self = self;
	
	// PUBLIC
	character_create = function(_x,_y,_config = {}) {
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
	
	// PRIVATE
	__ = {};
	with __ {
		// nothing currently..
	}
	// character
	__[$ "character"] ??= {};
	with(__.character){
		instance = null;
	}