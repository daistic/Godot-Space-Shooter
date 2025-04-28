extends ParallaxLayer

@export var speed: float = 10

func _process(delta: float) -> void:
	motion_offset.y += speed * delta
