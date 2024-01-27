extends CanvasLayer

var currItem = 0
var select = 0

func _ready():
	switchItem(0)

func _on_close_pressed():
	get_tree().paused = false
	get_node("Anim").play("TransOut")
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	switchItem(0)

func _on_next_pressed():
	switchItem(currItem + 1)

func _on_prev_pressed():
	switchItem(currItem - 1)

func _on_purchase_pressed():
	if Game.Gold >= int(Inv.items[currItem]["Cost"]):
		Inv.addItem(str($Shop/Title.text))
		Game.Gold -= int(Inv.items[currItem]["Cost"])
		$SFX.play()

func switchItem(select):
	if select == Inv.items.size():
		select = 0
	elif select == -1:
		select = Inv.items.size() - 1
	for i in range(Inv.items.size()):
		if select == i:
			currItem = select
			$Shop/ItemIcon.texture = Inv.items[currItem]["Icon"]
			$Shop/Title.text = Inv.items[currItem]["Name"]
			$Shop/Desc.text = Inv.items[currItem]["Desc"]
			$Shop/Desc.text += "\nType: " + Inv.items[currItem]["Type"]
			$Shop/Desc.text += "\nCost: " + str(Inv.items[currItem]["Cost"])
