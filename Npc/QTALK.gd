extends AnimatedSprite2D

func _ready():
	self.hide()
	
	#Hint if npc is talkable
func _on_area_2d_body_entered(body):
	if body.name == "Player":
		self.visible = true
		self.play("Q")
		print("EYy")
	pass
	
	


func _on_area_2d_body_exited(body):
	if body.name == "Player":
		self.visible = false
		print("Intearct")
	pass # Replace with function body.
