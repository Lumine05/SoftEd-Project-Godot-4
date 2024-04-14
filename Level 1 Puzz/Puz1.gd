extends CanvasLayer
#store correct label number for matching data
var label_number1 = "1"
var label_number2 = "2"
var label_number3 = "3"
var label_number4 = "4"
var label_number5 = "5"
var Arranged = false
#this is checking after correctly arrange flowchart
var slot1 = false
var slot2 = false
var slot3 = false
var slot4 = false
var slot5 = false

@onready var Slot1 = get_node("Start/Slot1/Slot1")
@onready var Slot2 = get_node("Start/Slot2/Slot1")
@onready var Slot3 = get_node("Start/Slot3/Slot1")
@onready var Slot4 = get_node("Start/Slot4/Slot1")
@onready var Slot5 = get_node("Start/Slot5/Slot1")
#this is for light indicator
@onready var point_light = get_node("Red")
@onready var point_light2 = get_node("Green")
#modifier for light flickering
var min_intensity = 0.5
var max_intensity = 1.5
var flicker_speed = 10.0
var flicker_enabled = false
var time_accumulator = 1.0

func _on_x_button_pressed():
	#button for exiting 
	Engine.time_scale = 1
	queue_free()
	pass
	
func _physics_process(delta):
	#storing data of every slot
	var SlotData1 = get_node("Start/Slot1/Slot1")
	var SlotDataA = SlotData1.text
	
	var SlotData2 = get_node("Start/Slot2/Slot1")
	var SlotDataB = SlotData2.text
	
	var SlotData3 = get_node("Start/Slot3/Slot1")
	var SlotDataC = SlotData3.text
	
	var SlotData4 = get_node("Start/Slot4/Slot1")
	var SlotDataD = SlotData4.text
	
	var SlotData5 = get_node("Start/Slot5/Slot1")
	var SlotDataE = SlotData5.text
	
	if flicker_enabled:
		time_accumulator += delta
		var intensity_variation =(sin(time_accumulator * flicker_speed) + 1) / 2  # Sine wave between 0 and 1
		point_light.energy = lerp(min_intensity, max_intensity, intensity_variation)
	
	#realtime checking slotdata
	if label_number1 == SlotDataA:
		#execute electric
		
		slot1 = true
		if label_number2 == SlotDataB:
		
			slot2 = true
			if label_number3 == SlotDataC:
		
				slot3 = true
				if label_number4 == SlotDataD:
		
					slot4 = true
					if  label_number5 == SlotDataE:
		
						slot5 = true
						HasBeenArranged()
						
					else:
						slot5 = false
				else:
					slot4 = false
			else:
				slot3 = false
		else:
			slot2 = false
	else:
		slot1 = false
	
	
func HasBeenArranged():
	if Slot1 || Slot2 || Slot3 || Slot4 || Slot5:
		
		Arranged = true
		
	else:
		print("Not")
		
	

func _on_button_pressed():
	
	if Arranged:
		$AnimatedSprite2D.play("On")
		flicker_enabled = false
		point_light.hide()
		point_light2.show()
		var tween = get_tree().create_tween()
		tween.tween_property($Start/ShortEnergy1, "value", 100,2 ).set_trans(Tween.TRANS_LINEAR)
		
		tween.tween_property($Start/LongEnergy1, "value", 100,2 ).set_trans(Tween.TRANS_LINEAR)
		
		tween.tween_property($Start/LongEnergy2, "value", 100,2 ).set_trans(Tween.TRANS_LINEAR)
		
		tween.tween_property($Start/LongEnergy3, "value", 100,2 ).set_trans(Tween.TRANS_LINEAR)
	else:
		$AnimatedSprite2D.play("Off")
		print("off")
		start_flicker()
func start_flicker():
	flicker_enabled = true

func stop_flicker():
	flicker_enabled = false
	
