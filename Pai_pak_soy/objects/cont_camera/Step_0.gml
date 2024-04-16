/// @description > object event
// > code here

// move to target
var _stiffness = .3; // ( 0 - 1 )
x = lerp(x, target.x, _stiffness);
y = lerp(y, target.y - 50, _stiffness);

// set camera
var _cam = view_get_camera(0);
var _x = x - camera_get_view_width(_cam)*.5;
var _y = y - camera_get_view_height(_cam)*.5;
camera_set_view_pos(_cam,_x,_y);
view_set_camera(0,_cam);