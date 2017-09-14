extends Node2D

func _ready():
	pass
func _on_Area2D_body_enter( body ):
	get_node("/root/Global").levelUp()
	get_node("/root/Global").glow = false
	get_node("/root/Global").glowing = false
	if get_node("/root/Global").getLevel() == 4:
		get_node("/root/Global").wonGame()
		var packed_scene = load("res://Scenes/SubMenu.tscn")
		get_tree().change_scene_to(packed_scene)
	else:
		get_tree().reload_current_scene()