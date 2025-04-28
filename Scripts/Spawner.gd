extends StaticBody2D

@export var shortest_spawn_delay: float = 0.35
@export var longest_spawn_delay: float = 0.75
@export var enemies: Array[PackedScene]
@export_range(0.0, 1.0) var enemy_noise: float

var spawnTime: float = 0
var rng = RandomNumberGenerator.new()

func _process(_delta: float) -> void:
	if Time.get_ticks_msec() / 1000.0 > spawnTime:
		spawnEnemies()
		var spawn_delay = rng.randf_range(shortest_spawn_delay, longest_spawn_delay) 
		spawnTime = Time.get_ticks_msec() / 1000.0 + spawn_delay
		
func spawnEnemies():
	var index = 0
	
	if (rng.randf() > enemy_noise):
		index = 0
	else:
		index = rng.randi_range(0, enemies.size() - 1)
		
	var instance = enemies[index].instantiate()
	get_parent().add_child(instance)
	instance.global_position = Vector2(global_position.x + rng.randf_range(-230, 230), global_position.y)
