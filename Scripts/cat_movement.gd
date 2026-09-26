extends CharacterBody2D

@export var speed := 100.0

@onready var laser = $"../Laser"

func _physics_process(_delta):
	if laser.visible:
		var direction = laser.global_position - global_position

		if direction.length() > 15:
			velocity = direction.normalized() * speed
		else:
			velocity = Vector2.ZERO
	else:
		velocity = Vector2.ZERO

	move_and_slide()
