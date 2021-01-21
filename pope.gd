extends RigidBody2D

var canClick = false

func _ready():
	$"../PointPerSecondTimer".start()

func _process(delta):
	if Input.is_action_just_pressed("click") and canClick:
		Main.points += 1

func _on_pope_mouse_entered():
	canClick = true
func _on_pope_mouse_exited():
	canClick = false


func _on_PointPerSecondTimer_timeout():
	Main.points += Main.points_per_second
	$"../PointPerSecondTimer".start()
