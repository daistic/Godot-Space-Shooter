extends CharacterBody2D

@export var moveSpeed: float = 315
@export var lifetime: float = 7

var death_time: float

func _ready() -> void:
	velocity = Vector2(0, moveSpeed)
	death_time = Time.get_ticks_msec() / 1000.0 + lifetime
	
func _physics_process(_delta: float) -> void:
	move_and_slide()
	
func _process(_delta: float) -> void:
	if Time.get_ticks_msec() / 1000.0 > death_time:
		queue_free()

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		body.queue_free()
