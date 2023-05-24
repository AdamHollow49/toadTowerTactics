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
			#bulletInstance.rotation = get_angle_to(target.global_position)
			bulletInstance.connect("bullet_hit", _on_bullet_hit, 1)
			bulletInstance.target = target
			if bulletInstance != null:
				add_child(bulletInstance)
				bulletInstance.global_position = $StaticBody2D/bulletSpawn.global_position
				# Compute the direction from the tower to the target (adjust this part as needed)
				var targetPosition = target.global_position  # Replace with your target position
				var direction = (targetPosition - global_position).normalized()

				bulletInstance.velocity = direction * bullet_speed
				
				

func _on_bullet_hit(bodyHit):
	bulletInstance.queue_free()
	bulletInstance = null
	print("bullet hit")
	#bodyHit.destroyed()
	var idx = $StaticBody2D/rangeBox.targetList.find(bodyHit)
	$StaticBody2D/rangeBox.targetList.remove_at(idx)


func _on_timer_timeout():
	canFire = true
	
