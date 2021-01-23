extends Sprite


func _process(delta):
	# nie ma zadnej zmiennej ani funkcji typu $specialmodetimer.started wiec 
	# zrobilem takie gowno i nie wypominaj mi ze chujowo bo wiem ok
	# dziekuje za przyjscie no moją ted rozmowe
	if $SpecialModeTimer.time_left < 10 and $SpecialModeTimer.time_left > 9.95:
		show()
		$"../pope".hide()

func _on_AnimationTimer_timeout():
	if visible:
		if frame < 6: frame += 1
		else: frame = 0
		$AnimationTimer.start()

func _on_SpecialModeTimer_timeout():
	hide()
	$"../pope".show()
	Main.pointsPerClick /= 2
