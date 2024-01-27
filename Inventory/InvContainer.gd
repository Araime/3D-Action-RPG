extends GridContainer

@onready var slot = preload("res://Inventory/Slot.tscn" )
var invSize = 24

func _ready():
	for i in invSize:
		var slotTemp = slot.instantiate()
		add_child(slotTemp)
	fillInventorySlots()

func fillInventorySlots():
	# Clear all slots of all information
	for i in invSize:
		get_child(i).ItemName = ""
		get_child(i).ItemDes = ""
		get_child(i).ItemCost = 0
		get_child(i).ItemCount = 0
		get_child(i).ItemType = ""
		get_child(i).hasItem = false
	# fill all the slots with inventory
	for i in Inv.inventory:
		get_child(i).ItemName = Inv.inventory[i]["Name"]
		get_child(i).ItemDes = Inv.inventory[i]["Desc"]
		get_child(i).ItemCost = Inv.inventory[i]["Cost"]
		get_child(i).ItemCount = Inv.inventory[i]["Count"]
		get_child(i).ItemType = Inv.inventory[i]["Type"]
		get_child(i).hasItem = true
		
		get_child(i).get_node("Icon").texture = (Inv.inventory[i]["Icon"])
