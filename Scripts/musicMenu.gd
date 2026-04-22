extends Control

func _on_jackpot_pressed():
	Globals.speakerSong.emit("res://songs/JACKPOT.mp3")


func _on_aizo_pressed():
	Globals.speakerSong.emit("res://songs/King Gnu - AIZO.mp3")

func _on_volume_value_changed(value):
	Globals.speakerVolume = value
