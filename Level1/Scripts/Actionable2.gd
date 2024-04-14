extends Area2D


const Balloon2 = preload("res://Dialogues/CustomBalloon/balloon2.tscn")

@export var dialogue_resource: DialogueResource
@export var dialogue_start: String = "Robobo"

#This is dialouge script
func action()-> void:
		var balloon: Node = Balloon2.instantiate()
		get_tree().current_scene.add_child(balloon)
		balloon.start(dialogue_resource, dialogue_start)
		print("Mag Dialouge")
