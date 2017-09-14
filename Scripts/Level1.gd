extends Node2D

var level
var borderLevel
var holesLevel
var goleLevel
var powerLevel

var time_count = 0
var time_timer = 0
const ALLOWED_DELAY = 1 # Seconds

func _ready():
	set_fixed_process(true)

	get_node("Time").set_text("Score: " + str(time_timer))
	level = get_node("/root/Global").getLevel()

	if level == 1:
		borderLevel = preload ("res://Scenes/BorderLevel1.tscn")
		holesLevel = preload ("res://Scenes/HolesLevel1.tscn")
		goleLevel = preload ("res://Scenes/GoalLevel1.tscn")
	elif level == 2:
		borderLevel = preload ("res://Scenes/BorderLevel2.tscn")
		holesLevel = preload ("res://Scenes/HolesLevel2.tscn")
		goleLevel = preload ("res://Scenes/GoalLevel2.tscn")
		powerLevel = preload ("res://Scenes/PowerLevel2.tscn")
		var newPower = powerLevel.instance()
		self.add_child(newPower)
	elif level == 3:
		borderLevel = preload ("res://Scenes/BorderLevel3.tscn")
		holesLevel = preload ("res://Scenes/HolesLevel3.tscn")
		goleLevel = preload ("res://Scenes/GoalLevel3.tscn")
		powerLevel = preload ("res://Scenes/PowerLevel3.tscn")
		var newPower = powerLevel.instance()
		self.add_child(newPower)

	var newBorder = borderLevel.instance()
	var newHoles = holesLevel.instance()
	var newGole = goleLevel.instance()

	self.add_child(newBorder)
	self.add_child(newHoles)
	self.add_child(newGole)
	

func _fixed_process(delta):
	time_count += delta

	if(time_count > ALLOWED_DELAY):
		time_timer+=1
		get_node("Time").set_text("Time: " + str(time_timer))
		time_count = 0

	if (time_timer > 59):
		get_node("/root/Global").loseGame()
		var packed_scene = load("res://Scenes/SubMenu.tscn")
		get_tree().change_scene_to(packed_scene)