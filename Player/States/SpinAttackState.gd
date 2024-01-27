extends State
class_name SpinAttackState

var player

func _ready():
	player = get_parent()
	spin_attack_animation()
	player.velocity.x = 0
	player.velocity.z = 0

func _physics_process(delta):
	player.get_node("AnimationTree").advance(delta * 0.1)

func spin_attack_animation():
	animation.travel("AttackSpinning")

func exit():
	pass
