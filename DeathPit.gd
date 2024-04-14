extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	pass

#This is script for a collision when player detect inside of it and dies instantly
func _on_area_2d_body_entered(body):
	if body.name == "Player":
		print("Gumana?")
		if PlayerData.Health == 30:
			PlayerData.Health -= 30
		elif PlayerData.Health == 20:
			PlayerData.Health -= 20
		else:
			PlayerData.Health -= 10
	pass # Replace with function body.
