tool
extends Node2D

export (String, "HOLE", "OTRO") var holeType = "HOLE" setget set_enemy

func set_enemy(new_value):
	holeType = new_value

func _ready():
	
	if holeType == "HOLE":
		get_node("Sprite").show()
		get_node("Area2D").show()
	if holeType == "OTRO":
		get_node("Sprite").hide()
		get_node("Area2D").show()
	
	if !(get_tree().is_editor_hint()):
		if holeType == "HOLE":
			get_node("Sprite").show()
			get_node("Area2D").show()
		elif holeType == "OTRO":
			get_node("Sprite").hide()
			get_node("Area2D").show()

func _on_Area2D_body_enter( body ):
	if get_node("/root/Global").glowing == false:
		get_tree().reload_current_scene()
