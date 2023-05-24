extends PathFollow2D
@export var UFOScene = preload("res://UFO.tscn")
var UFOInstance = null

# Called when the node enters the scene tree for the first time.
func _ready():
	spawnUFO()

func spawnUFO():
	UFOInstance = UFOScene.instantiate()
	add_child(UFOInstance)
	UFOInstance.connect("entityDestroyed", newEnemy, 0)
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func newEnemy():
	print("new enemy")
	UFOInstance = load("res://UFO.tscn").instantiate()
	add_child(UFOInstance)
	UFOInstance.connect("entityDestroyed", newEnemy, 0)
	
	
		
		
	
