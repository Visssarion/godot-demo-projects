extends Area2D

var window_delta: Vector2i

var held_down: bool = false

func _input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton:
		held_down = event.pressed
		if event.pressed:
			window_delta = get_window().position - DisplayServer.mouse_get_position()


func _process(_delta):
	if held_down:
		get_window().position = DisplayServer.mouse_get_position() + window_delta
		if not Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
			held_down = false
