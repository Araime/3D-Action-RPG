extends Node

@onready var itemInfo = $"../../ItemInfo"

var hasItem = false
var mouseEntered = false

func _process(_delta):
	if hasItem:
		$Icon.show()
		$Icon.texture = Inv.equip[str(self.name)]["Icon"]
	else:
		$Icon.hide()

func _on_mouse_entered():
	if hasItem:
		mouseEntered = true

func _on_mouse_exited():
	mouseEntered = false
	
func _input(event):
	if event.is_action_pressed("LeftClick"):
		if mouseEntered:
			itemInfo.get_node("Use").hide()
			itemInfo.get_node("Unequip").show()
			itemInfo.get_node("Anim").play("TransIn")
			itemInfo.ItemName = Inv.equip[str(self.name)]["Name"]
			itemInfo.ItemDes = Inv.equip[str(self.name)]["Desc"]
			itemInfo.ItemCost = Inv.equip[str(self.name)]["Cost"]
			itemInfo.ItemCount = Inv.equip[str(self.name)]["Count"]
			itemInfo.ItemType = Inv.equip[str(self.name)]["Type"]
			itemInfo.get_node("Icon").texture = $Icon.texture
			itemInfo.updateInfo()
			get_node("../../").process_mode = Node.PROCESS_MODE_DISABLED
