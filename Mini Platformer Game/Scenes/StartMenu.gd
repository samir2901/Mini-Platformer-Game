extends Control



func _on_StartGameBtn_pressed():
	get_tree().change_scene("res://Scenes/Level1.tscn")


func _on_QuitBtn_pressed():
	get_tree().quit()
