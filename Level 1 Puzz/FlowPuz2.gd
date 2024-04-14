extends CanvasLayer
#store correct label number for matching data

var label_number1 = "1"
var label_number2 = "2"
var label_number3 = "3"
var label_number4 = "4"
var label_number5 = "5"
var label_number6 = "6"
var Arranged = false
#this is checking after correctly arrange flowchart
var slot1 = false
var slot2 = false
var slot3 = false
var slot4 = false
var slot5 = false
var slot6 = false

@onready var Slot1 = get_node("Start/Slot1/Slot1")
@onready var Slot2 = get_node("Start/Slot2/Slot1")
@onready var Slot3 = get_node("Start/Slot3/Slot1")
@onready var Slot4 = get_node("Start/Slot4/Slot1")
@onready var Slot5 = get_node("Start/Slot5/Slot1")
@onready var Slot6 = get_node("Start/Slot6/Slot1")


	
	

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
	
	var SlotData6 = get_node("Start/Slot6/Slot1")
	var SlotDataF = SlotData6.text
	
	
	
	#realtime checking slotdata
	if label_number1 == SlotDataA:
		#execute electric
		
		slot1 = true
		if label_number2 == SlotDataB:
			print(SlotDataB)
			slot2 = true
			if label_number3 == SlotDataC:
				print(SlotDataC)
				slot3 = true
				if label_number4 == SlotDataD:
					print(SlotDataD)
					slot4 = true
					if  label_number5 == SlotDataE:
						print(SlotDataE)
						slot5 = true
						HasBeenArranged()
						if  label_number6 == SlotDataF:
							print("s")
							slot6 = true
							
						else:
							slot6 = false
							return
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
	if Slot1 || Slot2 || Slot3 || Slot4 || Slot5 || Slot6:
		
		Arranged = true
	else:
		print("Not")
		
	

func _on_button_pressed():
	
	if Arranged:
		var Open = get_node("../Level1/Gate/CharacterBody2D") 
		GateGlobal.Gate = true # set Gate to true
		Open.OpenGate() # Call function from Gate.gd of the gate scene
		GateGlobal.Gate = false # reset to false 
		$AnimatedSprite2D.play("On") # animation of lever turning on
		print("Completed")
		var tween = get_tree().create_tween()
		
		# energy / electricity animation 
		tween.tween_property($Start/LongEnergy1, "value", 100,2 ).set_trans(Tween.TRANS_LINEAR)
		
		tween.tween_property($Start/ShortEnergy1, "value", 100,2 ).set_trans(Tween.TRANS_LINEAR)
		
		tween.tween_property($Start/LongEnergy2, "value", 100,2 ).set_trans(Tween.TRANS_LINEAR)
		
		tween.tween_property($Start/LongEnergy6, "value", 100,2 ).set_trans(Tween.TRANS_LINEAR)
		
		tween.tween_property($Start/LongEnergy7, "value", 100,2 ).set_trans(Tween.TRANS_LINEAR)
		
		tween.tween_property($Start/CEnergy3, "value", 100,2 ).set_trans(Tween.TRANS_LINEAR)
		
		tween.tween_property($Start/ShortEnergy2, "value", 100,2 ).set_trans(Tween.TRANS_LINEAR)
	else:
		$AnimatedSprite2D.play("Off")
	
	#ps i plan to modify the player won't move while taking the puzzle so i remove time engine stop to prevent
	#animation not playing
