extends Area2D

var collected := false
func _ready():
	add_to_group("fish")
func _on_body_entered(body: Node2D) -> void:

	if body.name == "Cat":
		collected = true
		get_parent().add_score()
		queue_free()
