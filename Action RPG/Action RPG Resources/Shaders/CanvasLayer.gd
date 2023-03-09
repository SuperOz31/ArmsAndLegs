extends CanvasLayer



func _ready():
	pass
	

func _physics_process(delta):
	if (Input.get_action_strength("ui_down")):
		$AnimationPlayer.play("Pulse")
