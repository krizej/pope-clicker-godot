extends Node2D

var points = 0
var pointsPerSecond = 0
var pointsPerClick = 1


class Upgrade:
	var upgradeName
	var price
	var bonus
	var priceMultiplier = 1.3
	var amount = 0
	
	func create(un, p, b):
		upgradeName = un
		price = p
		bonus = b
		
class Achievement:
	var achievementName
	var description
	var prerequisite
	var condition
	var achieved
	
	func create(an, d, c):
		achievementName = an
		description = d
		condition = c
		
	func setPrerequisite(p):
		prerequisite = p
	
