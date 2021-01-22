extends Control

var creampieUpgrade = Main.Upgrade.new()
var sculptureUpgrade = Main.Upgrade.new()
var upgradeList = [creampieUpgrade, sculptureUpgrade]

func _ready():#             name, price, bonus
	creampieUpgrade.create(  "creampie", 5, 1)
	sculptureUpgrade.create("sculpture", 8, 2)

func _process(delta):
	refresh_text()

func _on_Creampie_pressed():
	buy("creampie")
func _on_Sculpture_pressed():
	buy("sculpture")
	
func buy(upgradeNameParameter):
	for upgrade in upgradeList:
		if upgrade.upgradeName == upgradeNameParameter:
			if Main.points >= upgrade.price:
				Main.points -= upgrade.price
				Main.points_per_second += upgrade.bonus
				upgrade.price = round(upgrade.price * upgrade.priceMultiplier)
				upgrade.amount += 1

func refresh_text():
	for upgrade in upgradeList:
		match upgrade.upgradeName:
			"creampie":
				$Creampie/AmountInfo.bbcode_text = "[right]" + str(upgrade.amount)
				$Creampie/PriceInfo.text = str(upgrade.price)
			"sculpture":
				$Sculpture/AmountInfo.bbcode_text = "[right]" + str(upgrade.amount)
				$Sculpture/PriceInfo.text = str(upgrade.price)
