// user generated script
enum world_size {
	small, medium, large, extraLarge	
}
function world_generate(seed = irandom(999999), size = world_size.medium){
	var _inst = instance_create_layer(0,0,"controller",obj_world);
	with(inst){
		__ = {};
		with(__){
			self.size = size;	
		}
	}
}