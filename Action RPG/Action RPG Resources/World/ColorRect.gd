extends ColorRect

onready var ColorRect = $ColorRect
ColorRect.position = get_global_mouse_position()

func _ready():
	pass # Replace with function body.

func _process(delta):
	ColorRect.position
	print(get_global_mouse_position())
