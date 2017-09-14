extends Node2D

func _ready():
	pass

func _on_NewGame_pressed():
	var packed_scene = load("res://Scenes/Level1.tscn")
	get_tree().change_scene_to(packed_scene)

func _on_Exit_pressed():
	OS.get_main_loop().quit()