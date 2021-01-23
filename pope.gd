extends RigidBody2D

var canClick = false
var particleScene = preload("res://Particle.tscn")
var rng = RandomNumberGenerator.new()

func _ready():
	$"../PointPerSecondTimer".start()

func _process(delta):
	if Input.is_action_just_pressed("click") and canClick:
		Main.points += Main.pointsPerClick
		
		
		if rng.randi_range(0,5) != -1:
			var particle = particleScene.instance()
			$"..".add_child(particle)
			particle.position = Vector2(180,400)
			
			#haha random go brrrrrrrrrrrrrrrrrrrrrrrr
			particle.offset += rng.randi_range(-2,2)
			particle.rotation_duration += rng.randi_range(-2,2)
			particle.radius.x += rng.randi_range(-2,2)
#			particle.radius.y += rng.randi_range(-2,2)

func _on_pope_mouse_entered():
	canClick = true
func _on_pope_mouse_exited():
	canClick = false


func _on_PointPerSecondTimer_timeout():
	Main.points += Main.pointsPerSecond
	$"../PointPerSecondTimer".start()
