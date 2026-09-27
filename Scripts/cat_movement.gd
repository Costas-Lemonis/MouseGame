extends CharacterBody2D

#public speed variable can be changed in the inspector
@export var speed := 100.0

#get refference from the laser
@onready var laser = $"../Laser"

func _physics_process(_delta):
	# if the laser is visible then the cat moves towards the laser's potition
	if laser.visible:
		
		var direction = laser.global_position - global_position
		#if the distance from cat to laser > 15 the cat moves
		if direction.length() > 15:
			velocity = direction.normalized() * speed
		#if the distance from cat to laser < 15 the cat stops
		else:
			velocity = Vector2.ZERO
	else:
		velocity = Vector2.ZERO

	move_and_slide()
