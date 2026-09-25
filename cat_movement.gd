extends CharacterBody2D

# we let the speed value change in the inspector
@export var speed := 250.0

# we get the status of the laser.gd script to see in the lase is visible or not
@onready var laser = $"../Laser"

func _physics_process(delta):
	#if  the laser is visible then the cat moves to laser's potition
	if laser.visible:
		var direction = laser.global_position - global_position

		if direction.length() > 15:
			velocity = direction.normalized() * speed
		else:
			velocity = Vector2.ZERO
	else:
		velocity = Vector2.ZERO

	move_and_slide()
