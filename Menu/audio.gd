extends Control

signal backed

@onready var music_slider = $MenuPanel/VBC/Music/HSlider
@onready var sfx_slider = $MenuPanel/VBC/SFX/HSlider

func _ready():
	music_slider.value = db_to_linear(AudioServer.get_bus_volume_db(Audio.music_bus))
	sfx_slider.value = db_to_linear(AudioServer.get_bus_volume_db(Audio.sfx_bus))

func _on_music_slider_value_changed(value):
	AudioServer.set_bus_volume_db(Audio.music_bus, linear_to_db(value))

func _on_sfx_slider_value_changed(value):
	AudioServer.set_bus_volume_db(Audio.sfx_bus, linear_to_db(value))

func _on_back_pressed():
	backed.emit()
