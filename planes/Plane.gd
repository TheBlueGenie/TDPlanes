extends KinematicBody2D

var min_speed = 50
var max_speed = 150
var throttle_inc = 1
var curr_speed = 0
var rotation_speed = 1

var velocity = Vector2()
var can_shoot = true
var alive = true

func _ready():
	curr_speed = min_speed

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass

func _physics_process(delta):
	if not alive:
		return
	control(delta)
	move_and_slide(velocity)

func control(delta):
	pass