extends Control

var popePointsAchievement = Main.Achievement.new()
var popePointsSecAchievement = Main.Achievement.new()

var achievementList = [popePointsAchievement, popePointsSecAchievement]

func _ready():
	popePointsAchievement.create("2137 Points", "Achieve 2137 Points", 2137)
	popePointsSecAchievement.create("2137 Points per second", "Achieve 2137 Points per Second", 2137)

func _process(delta):
	for achievement in achievementList:
		match achievement.achievementName:
			"2137 Points":
				achievement.setPrerequisite(Main.points)
			"2137 Points per second":
				achievement.setPrerequisite(Main.pointsPerSecond)
		
		if achievement.prerequisite >= achievement.condition and not achievement.achieved:
			achievement.achieved = true
			$AchievementPanel/achievementName.bbcode_text = "[center]" + achievement.achievementName
			$AchievementPanel.show()
			$AchievementPanel/DisappearTimer.start()
			$"../pope/dancingPope/SpecialModeTimer".start()
			Main.pointsPerClick *= 2

func _on_DisappearTimer_timeout():
	$AchievementPanel.hide()
