extends Sprite2D

#
#var visible: bool
#var global_position: int

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#the sprite isn't visible to the player when the game begins
	visible = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	# we get the potition of the mouse and use it as the potition of the sprite 
	global_position = get_global_mouse_position()

func _input(event):
	# if we PRESS the left mouse button then the sprite IS VISIBLE to the screen
	if event.is_action_pressed("Laser"):
		visible = true

	# if we DON'T press the left mouse button then the sprite ISN'T VISIBLE to the screen
	if event.is_action_released("Laser"):
		visible = false
