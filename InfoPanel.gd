extends Panel

func _process(delta):
	$Points.bbcode_text = "[center]Points: " + str(Main.points) + "[/center]"
	$PointsShop.bbcode_text = $Points.bbcode_text
	$PointsPerSec.bbcode_text = "[center]Points/Second: " + str(Main.points_per_second) + "[/center]"

func _on_ButtonShop_pressed():
	$"../Camera2D".position.x = 360

func _on_ButtonBack_pressed():
	$"../Camera2D".position.x = 0
