extends Node2D

onready var animatedSprite = $AnimatedSprite

func _ready():
	animatedSprite.frame = 0
	animatedSprite.play("Animate")


func _process(delta):
	
	# If collision is entered, transitions to next scene
	pass

func _on_AnimatedSprite_animation_finished():
	animatedSprite.stop()
	animatedSprite.frame = 3


func _on_Area2D_body_entered(body: PhysicsBody2D) -> void:
	if body.is_in_group("Player"):
		# do something when the player enters the collision shape
		print("ENTERD")

func _on_Area2D_body_exited(body: PhysicsBody2D) -> void:
	if body.is_in_group("Player"):
		# do something when the player exits the collision shape
		print("EXERTEID")

