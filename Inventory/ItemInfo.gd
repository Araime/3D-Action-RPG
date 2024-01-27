extends CanvasLayer

@onready var anim = get_node("Anim")
@onready var sfx = $"../../AudioStreamPlayer"

var ItemName = ""
var ItemDes = ""
var ItemCost = 0
var ItemCount = 0
var ItemType = ""

func updateInfo():
	if ItemType == "Misc":
		get_node("Use").text = "Use"
	else:
		get_node("Use").text = "Equip"

	get_node("Title").text = str(ItemName)
	get_node("Desc").text = str(ItemDes) + "\nType: " + str(ItemType) + "\nCost: " + str(ItemCost)

func _on_close_pressed():
	get_node("../").process_mode = Node.PROCESS_MODE_ALWAYS
	anim.play("TransOut")

func _on_use_pressed():
	for i in Inv.inventory:
		if Inv.inventory[i]["Name"] == ItemName:
			var path = "../Equip/" + str(Inv.inventory[i]["Type"])
			if has_node(path):
				# equip the item
				if get_node(path).hasItem == true:
					Inv.addItem(Inv.equip[ItemType]["Name"])
				
				get_node(path).hasItem = true
				Inv.equip[Inv.inventory[i]["Type"]] = Inv.inventory[i]
				sfx.stream = load("res://Audio/sfx/chainmail1.wav")
				sfx.play()
				_on_close_pressed()
			else:
				# use misc item effect (healing, buffs, etc)
				if Inv.inventory[i]["Name"] == "Apple":
					Game.health += 40
					if Game.health > Game.maxHealth:
						Game.health = Game.maxHealth
					_on_close_pressed()

			var itemEquiped = false
			if get_node("Use").text == "Equip":
				if get_node(path).hasItem == true:
					if get_node(path).get_node("Icon").texture == get_node("Icon").texture:
						itemEquiped = true

			ItemCount -= 1
			if ItemCount == 0:
				# remove item from invetory, then update the invetory
				var tempDic = {}
				for x in Inv.inventory:
					if x > i:
						tempDic[x - 1] = Inv.inventory[x]
					elif x < i:
						tempDic[x] = Inv.inventory[x]
				Inv.inventory.clear()
				Inv.inventory = tempDic
				_on_close_pressed()
			else:
				# subtract 1 count from the inventory
				Inv.inventory[i]["Count"] -= 1
			
			if itemEquiped == true:
				Inv.addItem(Inv.equip[ItemType]["Name"])

			get_node("../").process_mode = Node.PROCESS_MODE_ALWAYS
			get_node("../InvContainer").fillInventorySlots()

func _on_unequip_pressed():
	Inv.addItem(Inv.equip[ItemType]["Name"])
	sfx.stream = load("res://Audio/sfx/chainmail1.wav")
	sfx.play()
	_on_close_pressed()
	get_node("../InvContainer").fillInventorySlots()
	
	# remove item from equip
	var path = "../Equip/" + str(ItemType)
	get_node(path).hasItem = false
	get_node(path).get_node("Icon").texture = load("res://icon.svg")
	
	Inv.equip[ItemType] = {
		"Name": "",
		"Des": "",
		"Cost": 10,
		"Type": "RightHand",
		"Icon": preload("res://Inventory/Icons/Apple.png"),
		"Count": 1
	}
