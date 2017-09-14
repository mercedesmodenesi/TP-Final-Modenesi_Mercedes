extends StaticBody2D

func _ready():
	set_fixed_process(true)

func _fixed_process(delta):
	var color = Color(0.000,0.500,1.000,1.000)
	var playerMaterial = get_node("Sprite").get_material()
	playerMaterial.set_shader_param("shaderPlayer",color)
	playerMaterial.set_shader_param("glowPlayer", playerMaterial.get_shader_param("shaderPlayer"))

func _on_Area2D_body_enter( body ):
	get_node("/root/Global").glow = true
	self.queue_free()
