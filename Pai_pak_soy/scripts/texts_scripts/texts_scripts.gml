  /// 
/*Scripts @ desc : 
	drawing text box, 
	x, y for where to start create
	_follow, an instance to follow
*/
// code here >
function create_text_bubble(_x,_y,_text,_follow,_timer = 120){
	var inst = create_ui_instance(obj_text_bubble,_x,_y);
	with(inst){
		text = _text; // string of text
		follow_inst = _follow ?? noone;
		timer = _timer;// time before the textbox start fading
		// get the x,y buffer from the following instance
		if(follow_inst != noone){
			x_buffer = x - follow_inst.x;
			y_buffer = y - follow_inst.y;
		}
	}
	return inst;
}