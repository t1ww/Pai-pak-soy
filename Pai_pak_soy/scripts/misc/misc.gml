// user created scripted
/// macros
/// universal script
// const
#macro null pointer_null
#macro START_ROOM rm_default

/// special macros
#macro func function()
   
#region/// useful misc scripts
function draw_set_default(){
	draw_set_font(fnt_def);
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	draw_set_color(c_white);
	draw_set_alpha(1);		
}
function draw_set_all(_font = fnt_def, _halign = fa_center, _valign = fa_middle, 
						_color = c_white, _alpha = 1){
	draw_set_font(_font);
	draw_set_halign(_halign);
	draw_set_valign(_valign);
	draw_set_color(_color);
	draw_set_alpha(_alpha);	
}
// sine waves function credit > https://gm48.net/resource/33/sine-waves-make-your-game-prettier
function sine_wave(time, period, amplitude, midpoint) {
    return sin(time * 2 * pi / period) * amplitude + midpoint;
}
function sine_between(time, period, minimum, maximum) {
    var midpoint = mean(minimum, maximum);
    var amplitude = maximum - midpoint;
    return sine_wave(time, period, amplitude, midpoint);
}
#endregion

#region// creation scripts
function create_ui_instance(_obj,_x,_y,_struct = {}){
	return instance_create_layer(_x,_y,"ui",_obj,_struct);
 }
#endregion