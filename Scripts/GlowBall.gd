extends Sprite

var color
var playerMaterial

var time_count = 0
const ALLOWED_DELAY = 8 # Seconds

func _ready():
	set_fixed_process(true)
	Glow()

func _fixed_process(delta):
	if get_node("/root/Global").glow == true:
		time_count += delta
		Glow()
		if(time_count > ALLOWED_DELAY):
			get_node("/root/Global").StopGlow()
			DontGlow()
			time_count = 0

func Glow():
	var color = Color(0.000,0.500,1.000,1.000)
	var playerMaterial = self.get_material()
	playerMaterial.set_shader_param("shaderPlayer",color)
	playerMaterial.set_shader_param("glowPlayer", playerMaterial.get_shader_param("shaderPlayer"))

func DontGlow():
	var playerMaterial = self.get_material()
	playerMaterial.set_shader_param("glowPlayer", Color(0,0,0,1))