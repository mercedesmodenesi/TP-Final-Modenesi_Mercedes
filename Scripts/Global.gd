extends Node2D

var level = 1
var game = true
var glow = false
var glowing = false

func _ready():
	pass

func levelUp():
	level += 1

func getLevel():
	return (level)

func loseGame():
	game = false

func wonGame():
	game = true

func getGame():
	return(game)