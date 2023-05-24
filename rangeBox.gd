extends CollisionPolygon2D


var targetList = []
var hitBoxScript

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if targetList:
		get_parent().get_parent().fire(targetList[0])
		get_parent().get_parent().canFire = false

func _on_static_body_2d_body_entered(body):
	if body.get_class() == "CharacterBody2D":
		targetList.append(body)
