extends CanvasLayer

signal start_game

func update_score(value):
	$MarginContainer/score.text = str(value)
	
func update_timer(value):
	$MarginContainer/time.text = str(value)
	
func show_message(text):
	$message.text = text
	$message.show()
	$Timer.start()
	
func _on_timer_timeout():
	$message.hide()


func _on_start_button_pressed():
	$startButton.hide()
	$message.hide()
	start_game.emit()
	
func show_game_over():
	show_message("Game Over")
	await $Timer.timeout
	$startButton.show()
	$message.text = "Coin Dash!"
	$message.show()
