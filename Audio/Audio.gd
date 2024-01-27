extends Node

@onready var level_bgm = $LevelBGM
@onready var title_bgm = $TitleBGM

const TRACKS = [
	"Action 1", "Action 2", "Action 3", "Action 4", "Action 5"
	]

var music_bus = AudioServer.get_bus_index("Music")
var sfx_bus = AudioServer.get_bus_index("SFX")
var rand_nb = null

func _ready():
	rand_nb = randi() % TRACKS.size()
	level_bgm.stream = load("res://Audio/music/" + TRACKS[rand_nb] + ".wav")

func play_random_music():
	rand_nb = randi() % TRACKS.size()
	level_bgm.stream = load("res://Audio/music/" + TRACKS[rand_nb] + ".wav")
	level_bgm.play()

func _on_level_bgm_finished():
	play_random_music()
