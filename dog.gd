extends Area2D

var can_damage := true

func _on_body_entered(body):

	if body.name == "Cat" and can_damage:

		get_parent().lose_fish(3)

		can_damage = false

		await get_tree().create_timer(1.0).timeout

		can_damage = true
