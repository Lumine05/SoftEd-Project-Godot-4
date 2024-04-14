extends CanvasLayer
var Quest = true

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
#this is for the quest tab 

func _on_continue_pressed():
	if Quest:
		self.hide()
		$AudioStreamPlayer.play()
		Engine.time_scale = 1
	
	pass # Replace with function body.
