extends CharacterBody2D

@export var speed = 100

func _process(delta):
	get_parent().set_progress(get_parent().get_progress() + speed * delta)
