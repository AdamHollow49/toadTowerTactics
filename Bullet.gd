extends Node2D

@export var velocity = Vector2.ZERO
var target : Node2D

signal bullet_hit

func _ready():
	pass

func _physics_process(delta):
	var tween = create_tween()
	tween.tween_property(self, "rotation", get_angle_to(target.global_position), 0.05)
	velocity = self.global_position.direction_to(target.global_position)
	self.global_position += velocity * get_parent().bullet_speed * delta
	# Collision detection or boundary checks
	# Emit the signal when the bullet hits something or reaches a certain position



func bullet_hits_target(targetPosition) -> bool:
	var distance = global_position.distance_to(targetPosition)
	return distance < 200  # Adjust the threshold as needed


func _on_area_2d_body_entered(body):
	if body.get_class() == "CharacterBody2D":
		if bullet_hits_target(body.global_position):
			bullet_hit.emit(body)
