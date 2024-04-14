extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_2d_body_entered(body):
	#THis is the trigger script when character pass the tutorial would show(this meant to be changed better)
	if body.name == 'Player':
		var jump = get_node("../Player/Player/CanvasLayer/Tutorial/Jump")
		var jump2 = get_node("../Player/Player/CanvasLayer/Tutorial/MarginContainer2")
		
		jump.show()
		jump2.show()
		
	pass # Replace with function body.d


func _on_area_2d_body_exited(body):
	if body.name == 'Player':
		var jump = get_node("../Player/Player/CanvasLayer/Tutorial/Jump")
		var jump2 = get_node("../Player/Player/CanvasLayer/Tutorial/MarginContainer2")
		
		jump.hide()
		jump2.hide()
		
	pass # Replace with function body.


func _on_area_2d_2_body_entered(body):
	if body.name == 'Player':
		var jump = get_node("../Player/Player/CanvasLayer/Tutorial/Move")
		var jump2 = get_node("../Player/Player/CanvasLayer/Tutorial/MarginContainer")
	
		jump.show()
		jump2.show()
		
	pass # Replace with function body.


func _on_area_2d_2_body_exited(body):
	if body.name == 'Player':
		var jump = get_node("../Player/Player/CanvasLayer/Tutorial/Move")
		var jump2 = get_node("../Player/Player/CanvasLayer/Tutorial/MarginContainer")
		
		jump.hide()
		jump2.hide()
	pass # Replace with function body.
