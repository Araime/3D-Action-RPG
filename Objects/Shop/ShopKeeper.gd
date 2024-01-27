extends CharacterBody3D

var health = 1000

var chasePlayer = false
var attackPlayer = false
var greetings = false

@onready var mesh = get_node("KayKit_AnimatedCharacter_v1_2")
@onready var anim = get_node("KayKit_AnimatedCharacter_v1_2/AnimationPlayer")
@onready var light_1 = $"../OmniLight3D"
@onready var light_2 = $"../OmniLight3D2"
@onready var light_3 = $"../OmniLight3D3"

var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")
var direction

func _physics_process(delta):
	direction = Vector3.ZERO
	if not is_on_floor():
		velocity.y -= gravity * delta
	
	var player = get_node("../../Characters/Player")
	if player:
		direction = (player.position - position).normalized()
		if chasePlayer:
			if direction:
				look_at(Vector3(player.global_position.x, player.global_position.y, player.global_position.z), Vector3.UP)
			velocity.x = 0
			velocity.z = 0
			if greetings:
				light_1.show()
				light_2.show()
				light_3.show()
				anim.play("Interact")
				greetings = false
		else:
			anim.play("Idle")
			velocity.x = 0
			velocity.z = 0
	move_and_slide()

func _on_chase_player_body_entered(body):
	if "Player" in body.name:
		chasePlayer = true
		greetings = true

func _on_chase_player_body_exited(body):
	if "Player" in body.name:
		chasePlayer = false
		light_1.hide()
		light_2.hide()
		light_3.hide()

func _on_animation_player_animation_finished(anim_name):
	if anim_name == "Interact":
		anim.play("Idle")
