extends CanvasLayer

func _ready():
	$AnimationPlayer.play("dissolve")
	print("Dissolve")
	yield($AnimationPlayer, "animation_finished")
	print("Comeback")
	$AnimationPlayer.play_backwards("dissolve")
	yield($AnimationPlayer, "animation_finished")
	SceneTransition.change_scene("res://title_screen/TitleScreenV2.tscn")
	
