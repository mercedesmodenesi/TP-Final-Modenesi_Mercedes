extends RigidBody2D

var ball_velocity=6
var time_count = 0
const ALLOWED_DELAY = 8 # Seconds

var color
var playerMaterial

var mousepoint = Vector2(0,0)
var player_vector = Vector2(0,0)
const MOTION_SPEED = 4600 # Pixels/second

var type

func _ready():
	set_fixed_process(true)
	type = OS.get_name()
	DontGlow()

func _fixed_process(delta):
	if type == "Windows":
		mousepoint = get_global_mouse_pos()
		if(get_pos().distance_to(mousepoint) <= 5.0):
			player_vector = Vector2(0,0)
		else:
			player_vector = (mousepoint - get_pos()).normalized()
		player_vector = player_vector * MOTION_SPEED * delta
		set_linear_velocity(player_vector)

	var movX = Input.get_accelerometer().x
	if movX>0:
		set_linear_velocity(Vector2(get_linear_velocity().x-ball_velocity,get_linear_velocity().y))
	elif movX<0:
		set_linear_velocity(Vector2(get_linear_velocity().x+ball_velocity,get_linear_velocity().y))
	if movX==0:
		set_linear_velocity(Vector2(get_linear_velocity().x,get_linear_velocity().y))    
	var movY = Input.get_accelerometer().y
	if movY>0:
		set_linear_velocity(Vector2(get_linear_velocity().x,get_linear_velocity().y-ball_velocity))
	elif movY<0:
		set_linear_velocity(Vector2(get_linear_velocity().x,get_linear_velocity().y+ball_velocity))
	if movY==0:
		set_linear_velocity(Vector2(get_linear_velocity().x,get_linear_velocity().y))

	if get_node("/root/Global").glow == true:
		time_count += delta
		get_node("/root/Global").glowing = true
		Glow()
		if time_count > ALLOWED_DELAY:
			get_node("/root/Global").glow = false
			get_node("/root/Global").glowing = false
			DontGlow()
			time_count = 0

func Glow():
	var color = Color(0.000,0.500,1.000,1.000)
	var playerMaterial = get_node("Sprite").get_material()
	playerMaterial.set_shader_param("shaderPlayer", color)
	playerMaterial.set_shader_param("glowPlayer", playerMaterial.get_shader_param("shaderPlayer"))

func DontGlow():
	var playerMaterial = get_node("Sprite").get_material()
	playerMaterial.set_shader_param("shaderPlayer", Color(1.000,1.000,1.000,1.000))
	playerMaterial.set_shader_param("glowPlayer", Color(0,0,0,0))
