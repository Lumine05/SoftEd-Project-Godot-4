extends CharacterBody2D
var Gate 
#This is for the light changing when opening and closing of the gates
@onready var lightindi1 = $AnimatedSprite2D2 


func OpenGate():
		#func to open the gate but it checks if its gate are ready to open 
		if GateGlobal.Gate == true:
			get_node("CollisionShape2D").disabled = true #disable collision to pass
			print("Opening Gate....")
			$AnimatedSprite2D2.play("Green") 
			$Green.show() #light the green bulb and hide the red after opening
			$Red.hide()
			
			$AnimatedSprite2D.play("GateOpen") #gate animation will open 
			GateGlobal.Gate = false # reset the gate into false so it would not repeat 
			
		pass 
