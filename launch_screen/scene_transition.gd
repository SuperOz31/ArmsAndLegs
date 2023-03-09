extends CanvasLayer



func change_scene(target: String) -> void:
	$AnimationPlayer.play("dissolve")
	print("Dissolve")
	yield($AnimationPlayer, "animation_finished")
	get_tree().change_scene(target)
	print("Comeback")
	$AnimationPlayer.play_backwards("dissolve")


func _ready():
	print("Ready")

func return_to_title_screen() -> void:
		# TRANSITION TO MAIN MENU
	change_scene("res://title_screen/TitleScreenV2.tscn")
	pass


func _process(delta):
	# Point all hand sprites towards mouse position
	# Flip to the right degree
	pass
