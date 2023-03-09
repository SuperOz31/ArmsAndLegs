extends ColorRect


export(String) var scene_to_load  


func _ready():
	print("READY!")

func _on_Button_button_up():
	print("Transition to a new scene")
	SceneTransition.change_scene(scene_to_load)

