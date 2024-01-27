extends CanvasLayer

@onready var anim = get_node("Anim")

func _on_close_pressed():
	anim.play("TransOut")
	get_tree().paused = false
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED

func _input(event):
	if event.is_action_pressed("Inv"):
		if $Inventory.position.y == -650:
			anim.play("TransIn")
			get_tree().paused = true
			Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
		elif $Inventory.position.y == 0:
			anim.play("TransOut")
			get_tree().paused = false
			Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
			
		$Inventory/InvContainer.fillInventorySlots()
