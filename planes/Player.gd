extends "res://planes/Plane.gd"

func control(delta):
	var rot_dir = 0
	
	if Input.is_action_pressed('Turn_Right'):
		rot_dir += 1
	if Input.is_action_pressed('Turn_Left'):
		rot_dir -= 1
		
	rotation += rotation_speed * rot_dir * delta
	
	velocity = Vector2()
	var new_speed = curr_speed
	if Input.is_action_pressed('Throttle_Increase'):
		new_speed = clamp(curr_speed + throttle_inc,  min_speed, max_speed) 
	if Input.is_action_pressed('Throttle_Decrease'):
		new_speed = clamp(curr_speed - throttle_inc,  min_speed, max_speed) 
		
	velocity = Vector2(new_speed, 0).rotated(rotation)
	
	curr_speed = new_speed
	
	if Input.is_action_just_pressed('Shoot') and can_shoot:
		shoot(delta)
		

func _on_Plane_shoot():
	pass # replace with function body
