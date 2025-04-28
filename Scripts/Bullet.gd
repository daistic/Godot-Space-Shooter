extends CharacterBody2D

@export var speed: float = 200

func _ready() -> void:
	velocity = Vector2(0, -speed)
	
func _physics_process(_delta: float) -> void:
	move_and_slide()

func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.is_in_group("Enemies"):
		Game_Manager.add_score(1)
		area.get_parent().queue_free()
		queue_free()
		
	if area.is_in_group("Deadzones"):
		queue_free()
