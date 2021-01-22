extends KinematicBody2D

var offset = 5
var rotation_duration = 10
var radius = Vector2(1,1)

func _process(delta):
	offset += 3 * PI * delta / float(rotation_duration)
	offset = wrapf(offset, PI, -PI)
	
	var new_pos = Vector2()
	
	new_pos.x = cos(offset) * radius.x
	new_pos.y = sin(offset) * radius.y
	position = global_position + new_pos

func _on_LifeTimer_timeout():
	queue_free()
