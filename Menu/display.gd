extends Control

signal backed

const RESOLUTIONS = [
	Vector2(1024, 576),
	Vector2(1280, 720),
	Vector2(1366, 768),
	Vector2(1600, 900),
	Vector2(1920, 1080)
]

@onready var option_button = $MenuPanel/VBC/Resolution/OptionButton

func _ready():
	for resolution in RESOLUTIONS:
		var str_res = "%4dx%4d" % [resolution.x, resolution.y]
		option_button.add_item(str_res)
	
	option_button.selected = 1

func _on_option_button_item_selected(index):
	get_window().size = RESOLUTIONS[index]

func _on_fullscreen_check_box_toggled(button_pressed):
	if button_pressed:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
	else:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)

func _on_borderless_check_box_toggled(button_pressed):
	if button_pressed:
		DisplayServer.window_set_flag(DisplayServer.WINDOW_FLAG_BORDERLESS, true)
	else:
		DisplayServer.window_set_flag(DisplayServer.WINDOW_FLAG_BORDERLESS, false)

func _on_back_pressed():
	backed.emit()
