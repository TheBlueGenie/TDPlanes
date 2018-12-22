extends KinematicBody2D

export (int) var min_speed = 25
export (int) var max_speed = 50
export (int) var throttle_inc = 1
export (float) var gun_cooldown = 1
export (PackedScene) var Bullet

var curr_speed = 0
var rotation_speed = 1
var velocity = Vector2()
var can_shoot = true
var alive = true
var guns = []

signal shoot

func _ready():
	curr_speed = min_speed
	$GunTimer.wait_time = gun_cooldown
	guns = $Guns.get_children()

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
	if guns.size() < 1:
		return
	for gun in guns:
		var dir = Vector2(1, 0).rotated(global_rotation)
		emit_signal('shoot', Bullet, gun.global_position, dir)

	can_shoot = false
	$GunTimer.start()

func _on_GunTimer_timeout():
	can_shoot = true
