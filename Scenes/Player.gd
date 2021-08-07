extends KinematicBody2D

var speed = 50
var shoot_offset = 20
var bullet = preload("res://Scenes/Bullet.tscn")

func _physics_process(delta):
	var dir = (get_global_mouse_position() - position).normalized()
	rotation = dir.angle()
	
	if(Input.is_action_pressed("i_up")):
		move_and_slide(dir * speed)
	
	if(Input.is_action_just_released("i_shoot")):
		var b = bullet.instance()
		get_parent().add_child(b)
		b.dir = dir
		b.position = position + dir * shoot_offset
		b.rotation = dir.angle()
