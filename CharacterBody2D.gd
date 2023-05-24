extends CharacterBody2D
signal entityDestroyed
@export var health : int = 5
@export var maxHealth : int = 5
@export var speed = 100

func _process(delta):
	get_parent().set_progress(get_parent().get_progress() + speed * delta)
	pass
	
func destroyed():
	queue_free()
	
func damaged():
	health -= 1
	$ColorRect.damageTaken(health, maxHealth)
	if health == 0:
		destroyed()
	
