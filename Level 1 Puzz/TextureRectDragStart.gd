extends TextureRect

#this is test script for drag and drop not complete 
func _get_drag_data(at_position):
	var drag = TextureRect.new()
	
	drag.texture = texture
	drag.expand_mode = 1
	drag.size = Vector2(30,30)
	
	var dragg = Control.new()
	dragg.add_child(drag)
	
	set_drag_preview(dragg)
	return texture
	
	
func _can_drop_data(at_position, data):
	return data is Texture2D
	
func _drop_data(at_position, data):
	texture = data
	
