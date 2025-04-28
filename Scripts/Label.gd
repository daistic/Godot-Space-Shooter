extends RichTextLabel

func _ready() -> void:
	Game_Manager.register_score_label(self)
