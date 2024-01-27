extends Node

var items = {
	0: {
		"Name": "Apple",
		"Desc": "Restore 40 hp",
		"Cost": "10",
		"Type": "Misc",
		"Icon": preload("res://Inventory/Icons/Apple.png")
	},
	1: {
		"Name": "Broken Sword",
		"Desc": "Attack 4",
		"Cost": "50",
		"Type": "RightHand",
		"Icon": preload("res://Inventory/Icons/Iron_Weapon.png")
	},
	2: {
		"Name": "Bone Staff",
		"Desc": "Attack 5",
		"Cost": "75",
		"Type": "RightHand",
		"Icon": preload("res://Inventory/Icons/Iron_Weapon5.png")
	},
	3: {
		"Name": "Iron Sword",
		"Desc": "Attack 7",
		"Cost": "125",
		"Type": "RightHand",
		"Icon": preload("res://Inventory/Icons/Iron_sword.png")
	},
	4: {
		"Name": "Barbarian Axe",
		"Desc": "Attack 10",
		"Cost": "200",
		"Type": "RightHand",
		"Icon": preload("res://Inventory/Icons/Iron_axe.png")
	},
	5: {
		"Name": "Iron Helmet",
		"Desc": "Armor 1",
		"Cost": "50",
		"Type": "Head",
		"Icon": preload("res://Inventory/Icons/Helmet.png")
	},
	6: {
		"Name": "Full Helmet",
		"Desc": "Armor 2",
		"Cost": "75",
		"Type": "Head",
		"Icon": preload("res://Inventory/Icons/Iron_Helmet.png")
	},
	7: {
		"Name": "Mage Cloak",
		"Desc": "Armor 1",
		"Cost": "75",
		"Type": "Chest",
		"Icon": preload("res://Inventory/Icons/Mage_cloak.png")
	},
	8: {
		"Name": "Skeleton Armor",
		"Desc": "Armor 2",
		"Cost": "100",
		"Type": "Chest",
		"Icon": preload("res://Inventory/Icons/Armor.png")
	},
	9: {
		"Name": "Iron Shield",
		"Desc": "Armor 1",
		"Cost": "100",
		"Type": "LeftHand",
		"Icon": preload("res://Inventory/Icons/Iron_Shield3.png")
	},
	10: {
		"Name": "Elven Shield",
		"Desc": "Armor 2",
		"Cost": "125",
		"Type": "LeftHand",
		"Icon": preload("res://Inventory/Icons/Elven_shield.png")
	}
}

var inventory = {}

var equip = {
	"Head": {
		"Name": "",
		"Des": "",
		"Cost": 0,
		"Type": "Head",
		"Icon": preload("res://Inventory/Icons/Apple.png"),
		"Count": 0
	},
	"RightHand": {
		"Name": "",
		"Des": "",
		"Cost": 0,
		"Type": "RightHand",
		"Icon": preload("res://Inventory/Icons/Apple.png"),
		"Count": 0
	},
	"LeftHand": {
		"Name": "",
		"Des": "",
		"Cost": 0,
		"Type": "LeftHand",
		"Icon": preload("res://Inventory/Icons/Apple.png"),
		"Count": 0
	},
	"Chest": {
		"Name": "",
		"Des": "",
		"Cost": 0,
		"Type": "Chest",
		"Icon": preload("res://Inventory/Icons/Apple.png"),
		"Count": 0
	},
	"Legs": {
		"Name": "",
		"Des": "",
		"Cost": 0,
		"Type": "Legs",
		"Icon": preload("res://Inventory/Icons/Apple.png"),
		"Count": 0
	},
	"Feet": {
		"Name": "",
		"Des": "",
		"Cost": 0,
		"Type": "Feet",
		"Icon": preload("res://Inventory/Icons/Apple.png"),
		"Count": 0
	},
}

func addItem(itemName):
	var hasItem = false
	for slot in inventory:
		if inventory[slot]["Name"] == itemName:
			inventory[slot]["Count"] += 1
			hasItem = true
	if hasItem == false:
		for item in items:
			if items[item]["Name"] == itemName:
				var tempDic = items[item]
				tempDic["Count"] = 1
				inventory[inventory.size()] = tempDic
