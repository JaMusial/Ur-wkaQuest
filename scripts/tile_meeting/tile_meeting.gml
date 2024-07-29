///@description tile_meeting(x,y,layer)
function tile_meeting(_xPos, _yPos, _layer) {
  var _tm = layer_tilemap_get_id(_layer);
 
  if(!instance_exists(objCollisionTest)) instance_create_depth(0, 0, 0, objCollisionTest);   
 
  if(_tm == -1 || layer_get_element_type(_tm) != layerelementtype_tilemap) {
    show_message("Checking collision for non existent layer / tilemap") 
    game_end();
  }
 
  var _x1 = tilemap_get_cell_x_at_pixel(_tm, bbox_left + (_xPos - x), y),
      _y1 = tilemap_get_cell_y_at_pixel(_tm, x, bbox_top + (_yPos - y)),
      _x2 = tilemap_get_cell_x_at_pixel(_tm, bbox_right + (_xPos - x), y),
      _y2 = tilemap_get_cell_y_at_pixel(_tm, x, bbox_bottom + (_yPos - y));
 
  for(var _x = _x1; _x <= _x2; _x++) {
    for(var _y = _y1; _y <= _y2; _y++) {
      var _tile = tilemap_get(_tm, _x, _y);
      if(!_tile) continue;
      
      objCollisionTest.x = _x * tilemap_get_tile_width(_tm);
      objCollisionTest.y = _y * tilemap_get_tile_height(_tm);
      objCollisionTest.image_index = _tile;
 
      if(place_meeting(_xPos,_yPos,objCollisionTest)) return true;
    }
  }
 
  return false;
}