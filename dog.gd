extends Area2D

@onready var animation_player: AnimationPlayer = $AnimationPlayer
# we declare if the dog can damage the player
var can_damage := true

func _on_body_entered(body):
	
	if body.name == "Cat" and can_damage:

		get_parent().lose_fish(3)
		
		animation_player.play("trigger")
		can_damage = false
		
		#the dog waits 1sec and then can damage again the player
		await get_tree().create_timer(1.0).timeout

		can_damage = true
