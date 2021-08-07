extends Area2D

const SPEED = 150
var dir = Vector2()

func _physics_process(delta):
	translate(dir * SPEED * delta)

func _on_Timer_timeout():
	queue_free()

func _on_Bullet_body_exited(body):
	if(body.is_in_group("player")):
		queue_free()
		get_tree().reload_current_scene()
	elif(body.is_in_group("obstacle")):
		queue_free()
	elif(body.is_in_group("enemy")):
		queue_free()
