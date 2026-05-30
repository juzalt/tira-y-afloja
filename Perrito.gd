extends Sprite2D

@onready var r: RhythmNotifier = $"../AudioStreamPlayer/RhythmNotifier"
@onready var perrito: AnimatedSprite2D = $AnimatedSprite2D

func _ready():
	_play_some_music()

func musicCallback(beat: int):
	var is_chorus = (beat >= 88 and beat < 130) or \
					(beat >= 184 and beat < 255) or \
					(beat >= 280)


	var step = 2 if is_chorus else 1

	if (beat == 0):
		perrito.play("cierraOjos")
	
	var goLeft = (beat / step) % 2

	# tira para un lado o el otro en cada beat par	
	print(beat)
	if (beat > 2):
		if beat % step == 0:
			if goLeft == 0:
				print("izquierda")
				perrito.play("izquierda")
			else:
				print("derecha")
				perrito.play("derecha")
	

	#if beat % 16 == 0:
		#perrito.play("cierraOjos")

	if (beat == 423):
		if (goLeft):
			perrito.play_backwards("izquierda")
		else:
			perrito.play_backwards("derecha")

	if (beat == 424):
		perrito.play_backwards("cierraOjos")

func _play_some_music():
	# Note: RhythmNotifier emits the current beat count. 
	r.beats(1).connect(func(beat): musicCallback(beat))
