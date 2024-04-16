/// @description > object event

//

check_all = function(){ 
	// all provided keys must be held down for true
	for(var i = 0; i < argument_count; i++){
		var _chk = true;
		_chk = keyboard_check(argument[i]);
		if(_chk == false) return false;
	}
	
	return true; // when all keys were being held down, return true;
}

check_pressed = function(){
	// check any of these keys being pressed (once)
	for(var i = 0; i < argument_count; i++){
		var _chk = false;
		_chk = keyboard_check_pressed(argument[i]);
		if(_chk == true) return _chk;
	}
	
	return false; // none of the keys were pressed
}

check_hold = function(){
	// check any of these keys being held down
	for(var i = 0; i < argument_count; i++){
		var _chk = false;
		_chk = keyboard_check(argument[i]);
		if(_chk == true) return _chk;
	}
	
	return false; // none of the keys were held down
}