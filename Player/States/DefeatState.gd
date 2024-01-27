extends State
class_name DefeatState

var player

func _ready():
	player = get_parent()
	defeat_animation()
	player.velocity.x = 0
	player.velocity.z = 0

func _physics_process(delta):
	player.get_node("AnimationTree").advance(delta * 0.1)

func defeat_animation():
	animation.travel("Defeat")

func exit():
	pass
