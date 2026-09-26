extends Sprite2D

func _ready() -> void:
	visible = false


func _process(delta: float) -> void:
	global_position = get_global_mouse_position()


func _input(event):

	if event.is_action_pressed("Laser"):
		visible = true

	if event.is_action_released("Laser"):
		visible = false
