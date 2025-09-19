extends Line2D

@export var active_layer : TMLSquare 

func _ready() -> void:
	active_layer.hovered.connect(_on_tile_hovered)
	closed = true
	default_color = Color(1.0, 1.0, 1.0, 1.0)
	
func _on_tile_hovered(hovered_polygon_points : PackedVector2Array) -> void:
	points = hovered_polygon_points
