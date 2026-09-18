extends Label

var score = 0


func on_mob_squashed() -> void:
	score += 1
	text = "Score: %s" % score
