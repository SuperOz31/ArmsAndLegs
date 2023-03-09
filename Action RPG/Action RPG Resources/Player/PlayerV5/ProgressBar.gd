extends ProgressBar


onready var progress_bar = $ProgressBar

var progress = 0.0
var fill_time = 5.0
var fill_speed = 1.0 / fill_time

func _process(delta):
	progress += fill_speed * delta
	value = progress
	if progress >= 1.0:
		progress = 1.0
		fill_speed = 0.0
