extends Area3D

func _ready():
	get_node("AnimationPlayer").play("Float")

func _on_body_entered(body):
	if "Player" in body.name:
		get_tree().paused = true
		get_node("Shop/Anim").play("TransIn")
		Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
