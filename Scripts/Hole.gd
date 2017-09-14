extends Node2D

func _ready():
	pass

func _on_Area2D_body_enter( body ):
	if get_node("/root/Global").glowing == false:
		get_tree().reload_current_scene()
