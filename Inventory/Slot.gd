extends Panel

@onready var itemInfo = $"../../ItemInfo"

var ItemName = ""
var ItemDes = ""
var ItemCost = 0
var ItemCount = 0
var ItemType = ""

var hasItem = false
var mouseEntered = false

func _process(_delta):
	if hasItem:
		$Icon.show()
		$Count.show()
		$Count.text = str(ItemCount)
	else:
		$Icon.hide()
		$Count.hide()

func _on_mouse_entered():
	if hasItem:
		mouseEntered = true

func _on_mouse_exited():
	mouseEntered = false

func _input(event):
	if event.is_action_pressed("LeftClick"):
		if mouseEntered:
			itemInfo.get_node("Use").show()
			itemInfo.get_node("Unequip").hide()
			itemInfo.get_node("Anim").play("TransIn")
			itemInfo.ItemName = ItemName
			itemInfo.ItemDes = ItemDes
			itemInfo.ItemCost = ItemCost
			itemInfo.ItemCount = ItemCount
			itemInfo.ItemType = ItemType
			itemInfo.get_node("Icon").texture = $Icon.texture
			itemInfo.updateInfo()
			get_node("../../").process_mode = Node.PROCESS_MODE_DISABLED
