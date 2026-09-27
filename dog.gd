extends Area2D
@onready var animation_player: AnimationPlayer = $AnimationPlayer

var can_damage := true

func _on_body_entered(body):

	if body.name == "Cat" and can_damage:

		get_parent().lose_fish(3)
		
		animation_player.play("trigger")
		can_damage = false

		await get_tree().create_timer(1.0).timeout

		can_damage = true
