extends Area2D

var found_npc = false
var found_npc2 = false
const Balloon = preload("res://Dialogues/CustomBalloon/balloon.tscn")

#This is dialouge script
@export var dialogue_resource: DialogueResource
@export var dialogue_start: String = "JavaBip"


func action()-> void:
		var balloon: Node = Balloon.instantiate()
		get_tree().current_scene.add_child(balloon)
		balloon.start(dialogue_resource, dialogue_start)
		print("Mag Dialogue")
	
