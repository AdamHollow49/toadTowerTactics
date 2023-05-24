extends CharacterBody2D
signal entityDestroyed
@export var speed = 100

func _process(delta):
	get_parent().set_progress(get_parent().get_progress() + speed * delta)

func destroyed():
	queue_free()
	
