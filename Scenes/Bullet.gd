extends Area2D

const SPEED = 300
var dir = Vector2()

func _physics_process(delta):
	translate(dir * SPEED * delta)


func _on_Timer_timeout():
	queue_free()


func _on_Bullet_body_entered(body):
	if(body.is_in_group("obstacle")):
		queue_free()
	elif(body.is_in_group("enemy")):
		queue_free()
		body.queue_free()
