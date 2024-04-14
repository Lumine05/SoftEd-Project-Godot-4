extends VideoStreamPlayer

func _ready():
	self.set_process(false)
	self.set_physics_process(false)
#this is for looping the title screen video

	

func _on_finished():
	play()
	pass # Replace with function body.
