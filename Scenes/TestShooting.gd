extends KinematicBody2D

var dir = Vector2()
var player
var bullet = preload("res://Scenes/EnemyBullet.tscn")
export var offset = 20
const SPEED = 50

func _ready():
	player = global.player
	dir = get_dir(player)
	$timer.wait_time = rand_range(0.5, 1.5)
	$timer.start()

func _physics_process(delta):
	dir = get_dir(player)
	look_at(player.position)
	move_and_slide(dir * SPEED)

func get_dir(target):
	var ret = (target.position - position).normalized()
	var r = rand_range(-2, 2)
	ret = Vector2(ret.x + r, ret.y + r)
	return ret

func _on_Timer_timeout():
	dir = get_dir(player)
	var b = bullet.instance()
	get_parent().add_child(b)
	b.position = position + dir * offset
	b.dir = dir
