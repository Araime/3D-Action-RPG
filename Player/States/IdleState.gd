extends State
class_name IdleState

var player

func _ready():
	player = get_parent()
	animation.travel("Idle")

func _physics_process(_delta):
	if Input.is_action_pressed("WalkRight") or Input.is_action_pressed("WalkLeft") or Input.is_action_pressed("WalkUp") or Input.is_action_pressed("WalkDown"):
		player.change_state("move")

	if Input.is_action_just_pressed("Attack") and player.is_on_floor():
		player.change_state("attack")
	
	if Input.is_action_just_pressed("Block") and player.is_on_floor():
		player.change_state("block")
	
	if Input.is_action_just_pressed("SpinAttack") and player.is_on_floor():
		player.change_state("spin_attack")
	
	if Input.is_action_just_pressed("ComboAttack") and player.is_on_floor() and Inv.equip["LeftHand"]["Name"] != "":
		player.change_state("combo")
	
	if Game.health <= 0:
		player.change_state("defeat")

	player.velocity.x = move_toward(player.velocity.x, 0, player.SPEED)
	player.velocity.z = move_toward(player.velocity.z, 0, player.SPEED)

func exit():
	pass
