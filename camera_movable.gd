extends Camera2D

var _panning: bool = false

func _unhandled_input(event: InputEvent) -> void:
	# allow the player to zoom in and out with the mouse wheel
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_WHEEL_UP and event.pressed:
		zoom *= 1.1
		print_debug("Zoom: ", zoom)
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_WHEEL_DOWN and event.pressed:
		zoom *= 0.9
		print_debug("Zoom: ", zoom)
	# allow the player to pan the camera with middle mouse button drag
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_MIDDLE:
		if event.pressed:
			_panning = true
		else:
			_panning = false
	if event is InputEventMouseMotion and _panning:
		position -= event.relative * 1/zoom.x