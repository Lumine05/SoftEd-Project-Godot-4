extends Area2D


# Called when the node enters the scene tree for the first time.
const Balloon = preload("res://Dialogues/CustomBalloon/balloon2.tscn")

#Script for dialogues
@export var dialogue_resource: DialogueResource
@export var dialogue_start: String = "Java"


func action()-> void:
		var balloon: Node = Balloon.instantiate()
		get_tree().current_scene.add_child(balloon)
		balloon.start(dialogue_resource, dialogue_start)
		print("Gumana?")
	
