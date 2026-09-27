extends Sprite2D

func _ready() -> void:
# we start with the laser's visibility off
	visible = false

func _process(delta: float) -> void:
	#we get the position of the mouse
	global_position = get_global_mouse_position()

func _input(event):
	#if the button is pressed then the laser is ON
	if event.is_action_pressed("Laser"):
		visible = true

	#if the button is pressed then the laser is OFF
	if event.is_action_released("Laser"):
		visible = false
