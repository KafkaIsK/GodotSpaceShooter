extends Area2D

const SPEED = 300
var dir = Vector2()

func _physics_process(delta):
	translate(dir * SPEED * delta)
