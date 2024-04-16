/// @description > object event
// > code here

draw_debug_list = [
	"on ground : " + string(on_ground),
	"jump count : " + string(jump_count) + "/" + string(array_length(jump_array)),
	"can dash : " + string(__.can_dash ? "true" : "false")
];

if cont_game.debug {
	array_foreach(draw_debug_list, function(_element, _index){
		var c = c_black;
		draw_text_color(21,31 + (_index * 10), _element, c,c,c,c, 1);
		draw_text(20,30 + (_index * 10), _element);
	});
}