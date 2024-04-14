extends Label
#This is the first script of health for the player (for now no one owns this)
var player
var health30 = "30"
var health25 = "25"
var health20 = "20"
var health15 = "15"
var health10 = "10"
var health5 = "5"
var health0 = "0"
@onready var health = str(get_node("../../player/player").health)
@onready var Hurt = get_node("../../player/player/Node2D/AnimatedSprite2D")
@onready var anim1 = get_node("../../HEALTH_UI/Label/ThirdHeart")
@onready var anim2 = get_node("../../HEALTH_UI/Label/SecondHeart")
@onready var anim3 = get_node("../../HEALTH_UI/Label/FirstHeart")
# Called when the node enters the scene tree for the first time.
func _ready():
	
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	text ="" + str(get_node("../../player/player").health)
	if health30 == text:
		text ="" + str(get_node("../../player/player").health)
		
		anim1.play("Heart30")
		
	elif health25 == text:
		text ="" + str(get_node("../../player/player").health)
		anim1.play("Heart25")
		
		
		
	elif health20 == text:
		text ="" + str(get_node("../../player/player").health)
		anim1.play("Heart20")
		
	elif health20 == text:
		text ="" + str(get_node("../../player/player").health)
		anim2.play("Heart20")
		
	elif health15 == text:
		text ="" + str(get_node("../../player/player").health)
		anim2.play("Heart15")
		
	elif health10 == text:
		text ="" + str(get_node("../../player/player").health)
		anim2.play("Heart10")
		
	elif health10 == text:
		text ="" + str(get_node("../../player/player").health)
		anim3.play("Heart10")
		
	elif health5 == text:
		text ="" + str(get_node("../../player/player").health)
		anim3.play("Heart5")
		
	elif health0 == text:
		text ="" + str(get_node("../../player/player").health)
		anim3.play("Heart0")
		
	
	pass
	
	
