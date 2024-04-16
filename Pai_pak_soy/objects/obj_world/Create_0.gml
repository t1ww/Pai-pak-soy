/// @description > setup for world generation
// > code here
{// world size setup
	var _smallest_size = 11;
	switch(__.size){
		case world_size.small : //w,h
			land_grid = array_create(_smallest_size);
			break;
		case world_size.medium : 
			land_grid = array_create(_smallest_size + 4);
			break;
		case world_size.large : 
			land_grid = array_create(_smallest_size + 8);
			break;
		case world_size.extraLarge : 
			land_grid = array_create(_smallest_size + 12);
			break;
	}
}