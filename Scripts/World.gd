extends Node3D

func _ready():
	if not Audio.level_bgm.is_playing():
		Audio.level_bgm.play()
