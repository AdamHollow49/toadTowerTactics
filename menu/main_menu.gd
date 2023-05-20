extends Node2D

var fadeCount = 0
var faded = false


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func fade():
	if $start.visible:
		$start.visible = false
		faded = true
		fadeCount = 0
	else:
		$start.visible = true
		faded = false
		fadeCount = 0
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if fadeCount > 30 && faded == false:
		fade()

	elif fadeCount > 20 && faded == true:
		fade()
	fadeCount += 1

	if Input.is_action_just_pressed("enter"):
		get_tree().change_scene_to_file("res://levelOne.tscn")
	


func _on_audio_stream_player_finished():
	$AudioStreamPlayer.play()
