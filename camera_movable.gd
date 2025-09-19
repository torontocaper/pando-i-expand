extends Camera2D

var camera_move_speed : float = 10.0

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("zoom_in"):
		zoom += Vector2(0.1, 0.1)
		print_debug("Zooming in to ", zoom)
	if event.is_action_pressed("zoom_out"):
		zoom -= Vector2(0.1, 0.1)
		print_debug("Zooming out to ", zoom)

	var movement_vector := Input.get_vector("left", "right", "up", "down")
	position += movement_vector * camera_move_speed
