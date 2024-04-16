/// @description > player step event

/// input
if(instance_exists(cont_input)){
	keyLeft = cont_input.check_hold(vk_left,ord("A"));
	keyRight = cont_input.check_hold(vk_right,ord("D"));
	keyJump.check_hold = cont_input.check_hold(vk_space);
	keyJump.pressed = cont_input.check_pressed(vk_space);
}
/// state
state();