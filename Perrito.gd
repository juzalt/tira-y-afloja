extends Sprite2D

@onready var r: RhythmNotifier = $"../AudioStreamPlayer/RhythmNotifier"
@onready var perrito: AnimatedSprite2D = $AnimatedSprite2D

func _ready():
	_play_some_music()

func musicCallback(beat: int):
	# Determine section
	var is_chorus = (beat >= 88 and beat < 130) or \
					(beat >= 184 and beat < 255) or \
					(beat >= 280)

	# Determine frequency based on section
	var step = 2 if is_chorus else 4
	
	# Simple logic: On every 'step' beat, alternate the tug
	if beat % step == 0:
		if (beat / step) % 2 == 0:
			perrito.play("izquierda")
		else:
			perrito.play("derecha")
	
	# Logic for eye-closing (e.g., close on the "1" of every 16-beat cycle)
	if beat % 16 == 0:
		perrito.play("cierraOjos")

func _play_some_music():
	# Note: RhythmNotifier emits the current beat count. 
	# Ensure this matches your expected integer scale.
	r.beats(1).connect(func(beat): musicCallback(int(beat * 10)))
