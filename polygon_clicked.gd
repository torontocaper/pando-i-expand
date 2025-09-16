extends Polygon2D

func _on_tile_clicked(polygon_points : PackedVector2Array) -> void:
	polygon = polygon_points
	# queue_redraw()