extends Sprite2D

@onready var r: RhythmNotifier = $"../AudioStreamPlayer/RhythmNotifier"

var speed = 400
var angular_speed = PI
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
	print("Hello from beat %d!" % (beat * 4))
	
func rotateDog(beat):
	rotation += angular_speed * beat

func musicCallback(beat):
	count(beat)
	rotateDog(beat)
	
func _play_some_music():
	r.beats(4).connect(func(beat): musicCallback(beat))
