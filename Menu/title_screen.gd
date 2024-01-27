extends Control

@export_file var Level_1: String

@onready var main_menu_container = $MainMenu
@onready var settings = $Settings
@onready var display = $Settings/Display
@onready var audio = $Settings/Audio

func _ready():
	if not Audio.title_bgm.is_playing():
		Audio.title_bgm.play()

func _unhandled_input(event):
	if event.is_action_pressed("ui_cancel"):
		if settings.visible:
			if display.visible:
				display.hide()
				settings.menu_panel.show()
			elif audio.visible:
				audio.hide()
				settings.menu_panel.show()
			else:
				settings.hide()
				main_menu_container.show()
		else:
			get_tree().quit()

func _on_start_pressed():
	get_tree().change_scene_to_file(Level_1)
	
	if Audio.title_bgm.is_playing():
		Audio.title_bgm.stop()

func _on_settings_pressed():
	main_menu_container.hide()
	settings.show()

func _on_quit_pressed():
	get_tree().quit()

func _on_settings_backed():
	settings.hide()
	main_menu_container.show()
