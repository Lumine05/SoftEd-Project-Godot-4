extends Area2D

#This is not use meant to delete later
@onready var Compuuter = get_node("../../CanvasLayer/TextureRect")
# Called when the node enters the scene tree for the first time.
func action()-> void:
	Compuuter.visible = !Compuuter.visible
	if Compuuter.visible:
			print("show")
			Compuuter.show()
	else:
			print("hide")

