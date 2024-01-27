extends State
class_name AttackState

var player

func _ready():
	player = get_parent()
	attack_animation()
	player.velocity.x = 0
	player.velocity.z = 0

func _physics_process(delta):
	player.get_node("AnimationTree").advance(delta * 0.1)

func attack_animation():
	animation.travel("Attack(1h)")

func exit():
	pass
