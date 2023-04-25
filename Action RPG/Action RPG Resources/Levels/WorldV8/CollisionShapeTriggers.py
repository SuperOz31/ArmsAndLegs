from godot import exposed, export
from godot import *
from pydualsense import pydualsense, TriggerModes

@exposed
class CollisionShapeTriggers(CollisionShape2D):

	# member variables here, example:
	def cross_pressed(state):
	print(state)

	ds = pydualsense() # open controller
	ds.init() # initialize controller

	def _ready(self):
		"""
		Called every time the node is added to the scene.
		Initialization here.
		"""
		pass
