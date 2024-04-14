extends CharacterBody2D
# this is for the script of the enemies
var SPEED = 120
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var player 
var chase = false
var enhealth = 10
var is_alive = true
const KNOCKBACK_DISTANCE = 50
@onready var playerhealth = get_node("../../../Player/Player")
var hasRunOnce = false
#@onready var Hurt = get_node("../../player/player/Node2D/AnimatedSprite2D")
func _ready():
	
	get_node("enemy").play("idle")
func _physics_process(delta):
	if not hasRunOnce: 
		#put here to run only once 
		if playerhealth.update_health == 0:
			print("lahh")
			var playerdie = get_node("../../../Player/Player/AnimationPlayer")
			var playerdiescreen = get_node("../../../Player/Player/Control")
			playerdiescreen.show()
			playerdie.play("Death")
			
			hasRunOnce = true
	var enemy_velocity = Vector2.ZERO
	velocity.y += gravity * delta
	if chase == true:
		# ENemy will check and will chase when player detects
		get_node("enemy").play("chase")
		if get_node("enemy").animation != ("death"):
			get_node("enemy").play("chase")
		player = get_node("../../../Player/Player")
		var direction = (player.position - self.position).normalized()
		#print("pusa", player.position)
		#print("wolf", self.position)
		
		if direction.x > 0:
			velocity.x = direction.x * SPEED 
			get_node("enemy").flip_h = true
			get_node("PointLight2Dright").show()
			get_node("PointLight2Dleft").hide()
			#print("right", direction.x)
		else:
			
			get_node("enemy").flip_h = false
			get_node("PointLight2Dright").hide()
			get_node("PointLight2Dleft").show()
			#print("left" , direction.x)
		velocity.x = direction.x * SPEED 
		
		
	else: 
		if get_node("enemy").animation != ("death"):
			get_node("enemy").play("idle")
		velocity.x = 0
	move_and_slide()
	
func _on_detection_body_entered(body):
	if body.name == "Player":
		print("ssd")
		
		chase = true

func _on_detection_body_exited(body):
	if body.name == "Player":
		chase = false


func _on_playerdeath_body_entered(body):
	if body.name == "Player":
		if PlayerData.Health >= 10:
			print("Gumana?")
			PlayerData.Health -= 10
			knockback(body)
		
			

func _on_playercollision_body_entered(body):
	if body.name == "Player":
		print("Gumana??")
		#Hurt.play("HurtRun")
		#enemy will die if player hit the collision 
		enhealth -=10
		
	if enhealth <= 0:
		print("gum")
		
		death()
		
		
		
func death():
	chase = false
	get_node("enemy").play("death")
	await get_node("enemy").animation_finished
	self.queue_free()
	
func playerdie():
	var playerdiee = get_node("../../../Player/Player/AnimationPlayer")
	var playerdiescreen = get_node("../../../Player/Player/Control")
	playerdiee.play("Death")
	print("Nmatay1 ")
	playerdiescreen.show()
	
func knockback(body):
	var direction = Vector2.RIGHT
	if global_position.x < body.global_position.x:
		direction = Vector2.LEFT
		
	global_position += direction * KNOCKBACK_DISTANCE
