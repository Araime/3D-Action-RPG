extends CharacterBody3D

var health = 15
var player = null
var chase_player = false
var state_machine
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")

const SPEED = 4
const CHASE_RANGE = 8
const ATTACK_RANGE = 1.3

@onready var anim_tree = $AnimationTree
@onready var nav_agent = $NavigationAgent3D

func _ready():
	player = get_node("../../Characters/Player")
	state_machine = anim_tree.get("parameters/playback")

func _physics_process(delta):
	velocity = Vector3.ZERO

	if not is_on_floor():
		velocity.y -= gravity * delta

	match state_machine.get_current_node():
		"Run":
			nav_agent.set_target_position(player.global_transform.origin)
			var next_point = nav_agent.get_next_path_position()
			velocity = (next_point - global_transform.origin).normalized() * SPEED
			look_at(Vector3(global_position.x + velocity.x, global_position.y,
							global_position.z + velocity.z), Vector3.UP)
		"Attack(1h)":
			look_at(Vector3(player.global_position.x, global_position.y,
							player.global_position.z), Vector3.UP)
		"Idle":
			pass
		"Defeat":
			pass

	# Conditions
	anim_tree.set("parameters/conditions/Idle", !_target_in_chase_range())
	anim_tree.set("parameters/conditions/Run", _target_in_chase_range())
	anim_tree.set("parameters/conditions/Attack", _target_in_attack_range())
	anim_tree.set("parameters/conditions/Defeat", health <= 0)

	if Game.health <= 0:
		chase_player = false

	move_and_slide()

func _target_in_chase_range():
	if global_position.distance_to(player.global_position) < CHASE_RANGE and Game.health > 0:
		chase_player = true
	return chase_player

func _target_in_attack_range():
	return global_position.distance_to(player.global_position) < ATTACK_RANGE

func death():
	Game.Gold += 25

func _on_animation_tree_animation_finished(anim_name):
	if anim_name == "Defeat":
		queue_free()
		death()
