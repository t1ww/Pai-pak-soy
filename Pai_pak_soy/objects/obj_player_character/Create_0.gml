/// @description > playable character create event
// set player forward
depth-=1;
/// variable initialization
#region /// public
	// movement stats
	h_accel  = 4; // frames
	grv		 = .7;
	jump_spd = 12;
	
	// dynamic stats
	on_ground = null;
	h_speed = 0;
	v_speed = 0;
	facing_direction = RIGHT; // RIGHT = 1, LEFT = -1;

	// jumps
	normal_jump = function(){
		v_speed = -jump_spd;
	}
	jump_count = 0;
	jump_array = [normal_jump,normal_jump];
#endregion 

#region /// private
	__ = {};
	with __ {
		/// player stats
		base_speed = 10;
		
		/// dashing
		can_dash = true;
		dash_speed = 12;
	}	
#endregion 

#region /// debugging //
	// debug overlay setup
	global.playerCharacter_value_section = dbg_section("playerCharacter Value Section");
	ref_on_ground = ref_create(self,"on_ground");
	ref_jump_count = ref_create(self,"jump_count");
	ref_can_dash = ref_create(self.__, "can_dash");
	
	dbg_text("on_ground : ");
	dbg_same_line();
	dbg_text(ref_on_ground);
	
	dbg_text("jump_count : ");
	dbg_same_line();
	dbg_text(ref_jump_count);
	
	dbg_text("can_dash : ");
	dbg_same_line();
	dbg_text(ref_can_dash);

	//show_debug_overlay(false);
#endregion ///

/// player functions
	movement_collision = function(_hsp,_vsp, _collsion_object = obj_collision) {
	// moving vertically ( gravity )
		_vsp = _vsp + grv;
 
	// other checks
		// ground check
		on_ground = place_meeting(x,y+1,obj_collision);
		if(on_ground)jump_count = 0; // reset jumps
	
		// Horizontal move & collide
		var _hColliders = move_and_collide(h_speed, 0, obj_collision, abs(h_speed));
	
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
	jump = function(_hsp,_vsp,_extra_function = func{}) {
			
	}

/// state machine
	state_idle = func {
		// idle state
		movement_collision(0,0);
	}
	state_free = func {
		// run	
		var _hInput = parent.get_h_input();
		var _vInput = parent.get_v_input();
		// controls horizontally
			if(keyboard_check(vk_lshift)){
				// running
				h_speed = (_hInput) * __.base_speed;	
			}else{
				// walking
				h_speed = (_hInput) * (__.base_speed * .5);
			}
		// controls vertically
			if(on_ground && _vInput.check){
				// jumping on ground
			    jump_array[jump_count]();
			    jump_count++;
			} else /*jumping mid air*/
			if (_vInput.pressed && jump_count < array_length(jump_array)) {
				// jump
			    jump_array[jump_count]();
				h_speed *= 1.2;
			    jump_count++;
			}
	}
	state_midAir = func {
		
	}
	state_roll = func {
		// roll / slide
	}
	state_dying = func {
		
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

/// CREATE CALLING
// set camera
	if(instance_exists(cont_camera)){
		cont_camera.target = self;	
	}
// set state
	set_state(state_idle);