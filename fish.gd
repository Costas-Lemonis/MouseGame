extends Area2D

# when the player enters the fish it gets 1 coin and the coin dissapears
func _on_body_entered(body: Node2D) -> void:
	print("+1 coin")
	queue_free()
