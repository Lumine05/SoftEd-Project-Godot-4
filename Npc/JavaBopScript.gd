extends Area2D
const Balloon = preload("res://Dialogues/CustomBalloon/balloon.tscn")


@export var dialogue_resource: DialogueResource
@export var dialogue_start: String = "JavaBop"

#This is dialogues too
func action()-> void:
		var balloon: Node = Balloon.instantiate()
		get_tree().current_scene.add_child(balloon)
		balloon.start(dialogue_resource, dialogue_start)
		print("Gumana?")
