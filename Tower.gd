extends Node2D

@export var bullet_speed = 1000
@export var bulletScene = preload("res://bullet.tscn")
var bulletInstance = null
var canFire : bool = true

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func fire(target):
	if canFire:
		print("firing")
		$Timer.start()
		if bulletScene != null and bulletInstance == null:
			bulletInstance = bulletScene.instantiate()
			# Calculate the direction vector from the turret to the target
			var direction = target.global_position - self.global_position

			# Calculate the angle from the direction vector
			var angle = direction.angle()
			if angle < -1.5708 or angle > 1.5708:
				bulletInstance.scale.x = -1
				
			else:
				bulletInstance.scale.y = 1
			# Flip the bullet sprite vertically based on the angle
			bulletInstance.connect("bullet_hit", _on_bullet_hit, 1)
			bulletInstance.target = target
			if bulletInstance != null:
				add_child(bulletInstance)
				bulletInstance.global_position = $StaticBody2D/bulletSpawn.global_position
				# Compute the direction from the tower to the target (adjust this part as needed)
				bulletInstance.velocity = direction * bullet_speed
				
				

func _on_bullet_hit(bodyHit):
	bulletInstance.queue_free()
	bulletInstance = null
	print("bullet hit")
	bodyHit.damaged()
	var idx = $StaticBody2D/rangeBox.targetList.find(bodyHit)
	if bodyHit.health == 0:
		$StaticBody2D/rangeBox.targetList.remove_at(idx)


func _on_timer_timeout():
	canFire = true
	
