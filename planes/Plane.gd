extends KinematicBody2D

export (int) var min_speed = 50
export (int) var max_speed = 150
export (int) var throttle_inc = 1
export (int) var num_guns = 1
export (int) var gun_offset = 0
export (float) var gun_cooldown = 1
export (PackedScene) var Bullet

var curr_speed = 0
var rotation_speed = 1
var velocity = Vector2()
var can_shoot = true
var alive = true

func _ready():
	curr_speed = min_speed
	$GunTimer.wait_time = gun_cooldown

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
	
func shoot(delta):
	pass

func _on_GunTimer_timeout():
	can_shoot = true
	
