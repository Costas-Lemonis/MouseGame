extends Node2D

var time_left := 60
var score := 0

var lucky_fish_enabled := false

const UPGRADE_COST := 50
const SPEED_INCREASE := 50.0

@onready var timer_label = $CanvasLayer/TimerLabel
@onready var score_label = $CanvasLayer/ScoreLabel

@onready var game_over_panel = $CanvasLayer/GameOverPanel
@onready var fish_label = $CanvasLayer/GameOverPanel/FishLabel
@onready var message_label = $CanvasLayer/GameOverPanel/MessageLabel

@onready var speed_button = $CanvasLayer/GameOverPanel/SpeedButton
@onready var lucky_fish_button = $CanvasLayer/GameOverPanel/LuckyFishButton

@onready var cat = $Cat
@onready var game_timer = $GameTimer


func _ready():
	get_tree().paused = false

	time_left = 60
	score = 0

	timer_label.text = "Time: " + str(time_left)
	score_label.text = "Fish: " + str(score)

	game_over_panel.visible = false


func _on_game_timer_timeout():
	time_left -= 1

	timer_label.text = "Time: " + str(time_left)

	if time_left <= 0:
		game_over()


func add_score():
	var fish_amount := 1

	if lucky_fish_enabled:
		fish_amount = randi_range(1, 3)

	score += fish_amount
	score_label.text = "Fish: " + str(score)

	print("+", fish_amount, " Fish")


func game_over():
	game_timer.stop()

	fish_label.text = "Fish available: " + str(score)
	message_label.text = "Choose an upgrade"

	update_upgrade_buttons()

	game_over_panel.visible = true
	get_tree().paused = true


func _on_speed_button_pressed():
	if score < UPGRADE_COST:
		message_label.text = "You need 50 fish!"
		return

	score -= UPGRADE_COST
	cat.speed += SPEED_INCREASE

	print("New cat speed: ", cat.speed)

	start_new_round("Speed upgraded to " + str(cat.speed))


func _on_lucky_fish_button_pressed():
	if lucky_fish_enabled:
		message_label.text = "Lucky Fish is already active!"
		return

	if score < UPGRADE_COST:
		message_label.text = "You need 50 fish!"
		return

	score -= UPGRADE_COST
	lucky_fish_enabled = true

	start_new_round("Lucky Fish activated!")


func start_new_round(upgrade_message: String) -> void:
	get_tree().paused = false

	for dog in get_tree().get_nodes_in_group("dogs"):
		dog.queue_free()

	$DogSpawner.call_deferred("spawn_dogs")

	time_left = 60

	timer_label.text = "Time: " + str(time_left)
	score_label.text = "Fish: " + str(score)

	game_over_panel.visible = false
	game_timer.start()

	print(upgrade_message)


func update_upgrade_buttons():
	speed_button.disabled = score < UPGRADE_COST

	lucky_fish_button.disabled = (
		score < UPGRADE_COST
		or lucky_fish_enabled
	)

	if lucky_fish_enabled:
		lucky_fish_button.text = "Lucky Fish: Purchased"
	else:
		lucky_fish_button.text = "Lucky Fish 1-3 (5 Fish)"

func lose_fish(amount: int) -> void:
	score -= amount
	score = max(score, 0)

	score_label.text = "Fish: " + str(score)

	print("-", amount, " Fish")
	
func _on_restart_button_pressed():

	for fish in get_tree().get_nodes_in_group("fish"):
		fish.queue_free()

	start_new_round("New Round Started!")
