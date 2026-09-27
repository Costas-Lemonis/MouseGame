extends Node2D

@export var dog_scene: PackedScene


func _ready() -> void:
	call_deferred("spawn_dogs")

func spawn_dogs() -> void:
	var dog_count := randi_range(2, 4)

	for i in range(dog_count):
		var dog = dog_scene.instantiate()

		dog.position = Vector2(
			randf_range(100, 1100),
			randf_range(100, 600)
		)

		get_parent().add_child(dog)
