extends CharacterBody3D


const SPEED = 5.0
var direction

var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")

@onready var AnimTree = get_node("AnimationTree")
@onready var playback = AnimTree.get("parameters/playback")
@onready var player_mesh = get_node("KayKit_AnimatedCharacter_v1_2")
@onready var _spawn_point = global_position

# State Variables
var state
var state_factory

func _ready():
	state_factory = StateFactory.new()
	change_state("idle")
	Inv.addItem("Apple")
	Inv.addItem("Apple")
	Inv.addItem("Apple")

func _physics_process(delta):
	if not is_on_floor():
		velocity.y -= gravity * delta

	var h_rot = $CameraController.transform.basis.get_euler().y
	direction = Vector3(Input.get_action_strength("WalkLeft") - Input.get_action_strength("WalkRight"),
						0, Input.get_action_strength("WalkDown") - Input.get_action_strength("WalkUp"))
	direction = direction.rotated(Vector3.UP, h_rot).normalized()
	
	if Game.health < 0:
		Game.health = 0
	
	move_and_slide()

func change_state(new_state_name):
	if state != null:
		state.exit()
		state.queue_free()

	# Add new states
	state = state_factory.get_state(new_state_name).new()
	state.setup("change_state", playback, self)
	state.name = new_state_name
	add_child(state)

func _on_animation_tree_animation_finished(anim_name):
	if anim_name == "Attack(1h)":
		change_state("idle")
	elif anim_name == "Block":
		Game.blocking = false
		change_state("idle")
	elif anim_name == "AttackSpinning":
		change_state("idle")
	elif anim_name == "AttackCombo":
		change_state("idle")
	elif anim_name == "Defeat":
		global_position = _spawn_point
		change_state("idle")
		Game.health = 70
