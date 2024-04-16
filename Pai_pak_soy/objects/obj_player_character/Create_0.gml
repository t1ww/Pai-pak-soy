/// @description > playable character create event
// set player forward
depth-=1;
#region /// variable initialization
/// private
__ = {};
/// player stats
__.max_hp		= 5;
__.max_stamina	= 10;
__.walk_speed	= 2;
__.base_speed	= 5;
__.max_speed	= 10;
// movement calculation
h_accel  = 4; // frames
grv		 = .7;
jump_spd = 12;
/// dynamic stats
hp		= __.max_hp;
stamina = __.max_stamina;
h_speed = 0;
equipments = {};// handle bonus 
facing_direction = 1; // right = 1, left = -1;

/// jumps
normal_jump = function(){
	v_speed = -jump_spd;
}
v_speed = 0;
jump_count = 0;
jump_array = [normal_jump,normal_jump];
/// dashinh
__.can_dash = true;
__.dash_speed = 12;

/// input
keyLeft   = null;
keyRight  = null;
keyJump   = { pressed : null, check : null};
keyDash	  = { pressed : null, check : null};
on_ground = null;
#endregion // var init

/// player functions
movement = function(_speed = __.base_speed) {
// moving horizontally
	if(keyboard_check(vk_lshift)){
		// running
		h_speed = (keyRight - keyLeft) * _speed;	
	}else{
		// walking
		h_speed = ((keyRight - keyLeft) * __.walk_speed);
	}
// moving vertically ( gravity )
	v_speed = v_speed + grv;
 
// other checks
	// ground check
	on_ground = place_meeting(x,y+1,obj_collision);
	if(on_ground)jump_count = 0; // reset jumps
	
	// Horizontal move & collide
	var _hColliders = move_and_collide(h_speed, 0, obj_collision, abs(h_speed));
	
	// jumping code
	if(on_ground && keyJump.check){
		// jump
	    jump_array[jump_count]();
	    jump_count++;
	} else
	if (keyJump.pressed && jump_count < array_length(jump_array)) {
		// jump
	    jump_array[jump_count]();
		h_speed *= 1.2;
	    jump_count++;
	}
	
	// Vertical move & collide
	var _vColliders = move_and_collide(0, v_speed, obj_collision, abs(v_speed) , h_speed, v_speed, h_speed, v_speed);
	// resetting jump count
	if (array_length(_vColliders) > 0){
	    if (v_speed > 0) jump_count = 0;
	    v_speed = 0;
		
	}
	
	// moving down slope
	if (on_ground) && (place_meeting(x,y + abs(h_speed) + 1 ,obj_collision)) && (v_speed >= 0) {   
	    v_speed += abs(h_speed) + 1;
	}
}
set_sprite = function(_spr) {
	if(sprite_index != _spr) {
		sprite_index = _spr;	
	}
}

/// state machine
state_idle = function() {
	movement();
	// animation
	set_sprite(spr_player);
	if(h_speed == 0) {
		if(image_index > 4) {
			image_index = 0;	
		}
	} else {
		facing_direction = sign(h_speed);
		image_xscale = facing_direction;
		if(image_index > 12 or image_index < 5) {
			image_index = 5;
		}	
	}
	// dash
	keyDash.pressed = cont_input.check_pressed(ord("C"));
	if(keyDash.pressed and __.can_dash){
		set_state(state_dash);
		__.dash_dir = sign(mouse_x - x) * 1;
		__.dash_speed = 30;
		__.dash_length = 16; // frames
		__.can_dash = false;
	}
}
state_dash = function() {
	// create trail
	var inst = instance_create_layer(x,y,layer,obj_trail);
	inst.sprite_index = self.sprite_index;
	// dash to the direction
	h_speed = (__.dash_speed--) * __.dash_dir;
	// moving vertically ( gravity )
	v_speed = v_speed + (grv/2);
	// Horizontal move & collide
	var _hColliders = move_and_collide(h_speed, 0, obj_collision, abs(h_speed));
	// Vertical move & collide
	var _vColliders = move_and_collide(0, v_speed, obj_collision, abs(v_speed)+1 , h_speed, v_speed, h_speed, v_speed);
	if(__.dash_length-- < 0) {
		set_state(state_free);
		var _t = time_source_create(time_source_game, .5, time_source_units_seconds, function(){
			__.can_dash = true;
		});
		time_source_start(_t);
	}
}

// setter
set_pos = function(_x,_y){
	x = _x;
	y = _y;
	return self;
}
set_state = function(_state){
	state = _state;
	return self;
}

//./ setup call
// set camera
if(instance_exists(cont_camera)){
	cont_camera.target = self;	
}
set_state(state_idle);