extends Node

func _on_Plane_shoot(bullet, _position, _rotation):
	var b = bullet.instance()
	$Bullets.add_child(b)
	b.start(_position, _rotation)
