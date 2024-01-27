extends Control

signal backed

@onready var menu_panel = $MenuPanel
@onready var display = $Display
@onready var audio = $Audio

func _on_display_pressed():
	menu_panel.hide()
	display.show()

func _on_audio_pressed():
	menu_panel.hide()
	audio.show()

func _on_back_pressed():
	backed.emit()

func _on_display_backed():
	display.hide()
	menu_panel.show()

func _on_audio_backed():
	audio.hide()
	menu_panel.show()
