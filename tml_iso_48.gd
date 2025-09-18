extends TileMapLayer

signal clicked
signal hovered

var click_position_map : Vector2
var click_polygon_points : PackedVector2Array
var hover_position_map : Vector2
var hover_polygon_points : PackedVector2Array

func _process(_delta: float) -> void:
	hover_position_map = local_to_map(get_local_mouse_position())
	hover_polygon_points = _make_polygon(hover_position_map)
	hovered.emit(hover_polygon_points)

func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.is_pressed() and event.button_index == 1:
		click_position_map = local_to_map(get_local_mouse_position())
		print_debug("You clicked a tile at point " + str(click_position_map))
		var tile_id = get_cell_source_id(click_position_map)
		print_debug("Tile id: " + str(tile_id))
		click_polygon_points = _make_polygon(click_position_map)
		clicked.emit(click_polygon_points)

func _make_polygon(map_position : Vector2) -> PackedVector2Array:
	var polygon_points = PackedVector2Array([
			Vector2(map_to_local(map_position).x + 24, map_to_local(map_position).y),
			Vector2(map_to_local(map_position).x, map_to_local(map_position).y + 12),
			Vector2(map_to_local(map_position).x -24, map_to_local(map_position).y),
			Vector2(map_to_local(map_position).x, map_to_local(map_position).y - 12)
	])
	return polygon_points
