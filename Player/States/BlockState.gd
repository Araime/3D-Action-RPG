extends State
class_name BlockState

var player

func _ready():
	player = get_parent()
	block_animation()
	player.velocity.x = 0
	player.velocity.z = 0

func _physics_process(delta):
	player.get_node("AnimationTree").advance(delta * 0.1)

func block_animation():
	animation.travel("Block")
	if Inv.equip["LeftHand"]["Name"] != "":
		Game.blocking = true

func exit():
	pass
