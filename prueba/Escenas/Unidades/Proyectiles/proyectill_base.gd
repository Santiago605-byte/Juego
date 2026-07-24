extends Area2D

var target = null
var speed = 400
var damage = 20

func _process(delta):
	if target == null:
		return
