extends Node2D

@export var fish_scene : PackedScene
@export var max_fish := 3

var current_fish := 0

func spawn_fish():

	if current_fish >= max_fish:
		return

	var fish = fish_scene.instantiate()

	fish.position = Vector2(
		randf_range(50, 1150),
		randf_range(50, 650)
	)

	get_parent().add_child(fish)

	current_fish += 1

	fish.tree_exited.connect(_on_fish_removed)


func _on_fish_removed():
	current_fish -= 1


func _on_timer_timeout():
	spawn_fish()
