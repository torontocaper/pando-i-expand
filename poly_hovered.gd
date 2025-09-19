extends Polygon2D

func _ready() -> void:
	color = Color(1.0, 1.0, 1.0, 0.5)
	
func _on_tile_hovered(hovered_polygon_points : PackedVector2Array) -> void:
	polygon = hovered_polygon_points
