extends Node2D

@export var fish_scene : PackedScene
@export var max_fish := 3

func spawn_fish():

	if get_tree().get_nodes_in_group("fish").size() >= max_fish:
		return

	var fish = fish_scene.instantiate()

	fish.position = Vector2(
		randf_range(50, 1150),
		randf_range(50, 650)
	)

	get_parent().add_child(fish)

func _on_timer_timeout():
	spawn_fish()
