extends Sprite2D

@onready var r: RhythmNotifier = $"../AudioStreamPlayer/RhythmNotifier"
@onready var perrito: AnimatedSprite2D = $AnimatedSprite2D

var speed = 400
var angular_speed = PI#1.14
var GLOBAL_DELTA = 0.


# Called when the node enters the scene tree for the first time.
func _ready():
	_play_some_music()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	#print(delta)
	#print(typeof(delta))
	
func count(beat): 
	print("Hello from beat %d!" % (beat))
	
func rotateDog(beat):
	prints(angular_speed, beat)
	#rotation += angular_speed / 2
	rotation += angular_speed / 2

func musicCallback(beat):
	count(beat)
	#if (beat % 2 == 0):
		#angular_speed = angular_speed * -1.
		#rotateDog(beat)
	if (beat == 0):
		perrito.play("cierraOjos")
	if (beat == 20):
		perrito.play("izquierda")
	if (beat == 30):
		perrito.stop()
		perrito.play_backwards("izquierda")
	if (beat == 40):
		perrito.stop()
		perrito.play_backwards("cierraOjos")
	#var current_progress = perrito.get_frame()
	#print(current_progress)
	
func _play_some_music():
	r.beats(.1).connect(func(beat): musicCallback(beat))
