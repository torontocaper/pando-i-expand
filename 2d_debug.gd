extends Node2D

func _ready() -> void:
	for id in Input.get_connected_joypads():
		print_rich("[b]Joypad[/b] id=%d  name='%s'  guid=%s" % [id, Input.get_joy_name(id), Input.get_joy_guid(id)])

func _input(event: InputEvent) -> void:
	if event is InputEventJoypadButton:
		if event.button_index >= 128:
			var device_name := Input.get_joy_name(event.device)
			var guid := Input.get_joy_guid(event.device)
			print("Out-of-range button from device id=%d name='%s' guid=%s index=%d pressed=%s" %
					[event.device, device_name, guid, event.button_index, event.pressed])
