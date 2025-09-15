extends TileMapLayer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


func _unhandled_input(event: InputEvent) -> void:
	# when the user clicks on the screen (or taps on mobile), highlight the cell under the cursor
	if event is InputEventMouseButton and event.pressed:
		var mouse_pos: Vector2 = get_global_mouse_position()
		var cell: Vector2 = local_to_map(mouse_pos)
		# print the cell coordinates to the output console
		print("Cell: ", cell)
		# highlight the cell by modulating its color
