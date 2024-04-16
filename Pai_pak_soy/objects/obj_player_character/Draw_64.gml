/// @description > object event
// > code here

draw_debug_list = [
	"on ground : " + string(on_ground),
	"jump count : " + string(jump_count) + "/" + string(array_length(jump_array)),
	"can dash : " + string(__.can_dash ? "true" : "false")
];