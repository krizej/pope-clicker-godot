extends Node2D

var points = 0
var points_per_second = 0


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
		
