extends Node2D
class_name State

var change_state
var animation
var persistent_state

func setup(new_state, new_animation, new_persistent_state):
	change_state = new_state
	animation = new_animation
	persistent_state = new_persistent_state
