from godot import exposed, export
from godot import *
from pydualsense import pydualsense, TriggerModes


@exposed
class PlayerV6_triggers(KinematicBody2D):

	def cross_pressed(state):
   	 print(state)

	ds = pydualsense() # open controller
	ds.init() # initialize controller
	# member variables here, example:
	def Trigger(Trigger):
		ds.triggerR.setMode(TriggerModes.Rigid)
		print("signal")
	def _ready(self):
		print("test")
		pass
