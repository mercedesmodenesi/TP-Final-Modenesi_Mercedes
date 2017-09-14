extends Node2D

var game
var level

func _ready():
	game = get_node("/root/Global").getGame()
	level = get_node("/root/Global").getLevel()
	if game:
		get_node("BkgWon").show()
		get_node("BkgLose").hide()
	if !game:
		get_node("BkgWon").hide()
		get_node("BkgLose").show()

func _on_Retry_pressed():
	get_node("/root/Global").level = 1
	get_node("/root/Global").loseGame()
	var packed_scene = load("res://Scenes/Level1.tscn")
	get_tree().change_scene_to(packed_scene)

func _on_Exit_pressed():
	var packed_scene = load("res://Scenes/Menu.tscn")
	get_tree().change_scene_to(packed_scene)