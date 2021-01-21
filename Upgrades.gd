extends Control

var upgrades_s = {
	"creampie": {
		"price": 5,
		"price_multiplier": 1.3,
		"bonus": 1,
		"amount": 0
	},
	"sculpture": {
		"price": 8,
		"price_multiplier": 1.3,
		"bonus": 2,
		"amount": 0
	}
}

func _process(delta):
	refresh_text()
	Main.points_per_second = (upgrades_s["creampie"]["bonus"] * upgrades_s["creampie"]["amount"]) + (upgrades_s["sculpture"]["bonus"] * upgrades_s["sculpture"]["amount"]) 

func _on_Creampie_pressed():
	if Main.points >= upgrades_s["creampie"]["price"]:
		Main.points -= upgrades_s["creampie"]["price"]
		upgrades_s["creampie"]["amount"] += 1
		upgrades_s["creampie"]["price"] = round(upgrades_s["creampie"]["price"] * upgrades_s["creampie"]["price_multiplier"])

func _on_Sculpture_pressed():
	if Main.points >= upgrades_s["sculpture"]["price"]:
		Main.points -= upgrades_s["sculpture"]["price"]
		upgrades_s["sculpture"]["amount"] += 1
		upgrades_s["sculpture"]["price"] = round(upgrades_s["sculpture"]["price"] * upgrades_s["sculpture"]["price_multiplier"])

func refresh_text():
	$Creampie/AmountInfo.bbcode_text = "[right]" + str(upgrades_s["creampie"]["amount"])
	$Creampie/PriceInfo.text = str(upgrades_s["creampie"]["price"])
	$Sculpture/AmountInfo.bbcode_text = "[right]" + str(upgrades_s["sculpture"]["amount"])
	$Sculpture/PriceInfo.text = str(upgrades_s["sculpture"]["price"])
