class_name  StateFactory

var states

func _init():
	states = {
		"idle": IdleState,
		"attack": AttackState,
		"spin_attack": SpinAttackState,
		"move": MoveState,
		"block": BlockState,
		"defeat": DefeatState,
		"combo": ComboState
	}

func get_state(state_name):
	if states.has(state_name):
		return states.get(state_name)
