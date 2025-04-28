extends Node

var score: int = 0
var score_label: RichTextLabel = null

func add_score(to_add):
	score += to_add
	update_score_label()

func update_score_label():
	score_label.text = "Score:\n" + str(score)

func register_score_label(label: RichTextLabel):
	score_label = label
