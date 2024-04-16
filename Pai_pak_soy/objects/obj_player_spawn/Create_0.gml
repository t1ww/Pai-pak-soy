/// @description > placeholder for player's spawn point
if(spawn_id == cont_game.spawn_id){
	var p = obj_player.character ?? null;
	if(p != null)p.set_pos(x,y);
}
// clear instances
instance_destroy();