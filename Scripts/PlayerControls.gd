extends CharacterBody2D

@export var move_speed: float = 5.0
@export var bullet: PackedScene
@export var shootDelay: float = 1.5

var nextShootTime: float = 0

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("shoot") && Time.get_ticks_msec()/1000.0 > nextShootTime:
		on_shoot()
		nextShootTime = Time.get_ticks_msec()/1000.0 + shootDelay
	
func _physics_process(_delta: float) -> void:
	get_move_input()
	move_and_slide()

func get_move_input():
	var move_vector = Input.get_vector("move_left", "move_right", "null", "null", 0.0)
	velocity = move_vector * move_speed
	
func on_shoot():
	var instance = bullet.instantiate()
	get_parent().add_child(instance)
	instance.global_position = global_position
	
