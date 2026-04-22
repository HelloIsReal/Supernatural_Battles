extends Node3D


func _ready():
	Globals.speakerSong.connect(changeSong)
	
func changeSong(songName):
	$".".stream = load(songName)
	$".".play()

func _physics_process(_delta):
	$".".volume_db = linear_to_db(Globals.speakerVolume)
