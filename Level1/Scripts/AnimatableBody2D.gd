extends CharacterBody2D

@export var distance:Vector2
@export var phasetime:float = 6.0
@export_range(0.0, 1.0) var phaseoffset:float
@export var debug:bool = true

var pivot:Vector2
var time:float

# Called when the node enters the scene tree for the first time.
func _ready()->void:
	pivot=global_position
	# Replace with function body.
func get_pos(t:float)->Vector2:
	var x:float = pivot.x + cos(TAU * (t + phaseoffset)) *distance.x
	var y:float = pivot.y + sin(TAU * t) * distance.y
	return Vector2(x,y)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta:float)->void:
	time = fmod(time + delta/phasetime, 1.0)
	global_position = get_pos(time)
	
func _process(delta):
	queue_redraw()
	
func _draw()->void:
	
	
	
